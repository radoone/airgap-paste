#include <Arduino.h>
#include <NimBLEDevice.h>
#include <USB.h>
#include <USBHIDKeyboard.h>
#include <esp_system.h>
#include <mbedtls/base64.h>
#include <mbedtls/md.h>

#include <array>
#include <mutex>
#include <queue>
#include <sstream>
#include <string>
#include <vector>

#include "device_secrets.h"

namespace {

constexpr char kServiceUuid[] = "7b7d0001-7a6f-4b4d-9f71-6a14e7a1c001";
constexpr char kRxUuid[] = "7b7d0002-7a6f-4b4d-9f71-6a14e7a1c001";
constexpr char kTxUuid[] = "7b7d0003-7a6f-4b4d-9f71-6a14e7a1c001";

constexpr uint8_t kExternalSendPin = 2;  // XIAO D1/GPIO2 -> button -> GND
constexpr uint8_t kBootSendPin = 0;      // On-board BOOT button
constexpr uint8_t kLedPin = 21;          // On-board user LED, active LOW
constexpr size_t kMaxPayloadBytes = 4096;
constexpr uint32_t kAuthIdleTimeoutMs = 5 * 60 * 1000UL;
constexpr uint32_t kButtonDebounceMs = 35;
constexpr uint32_t kKeystrokeDelayMs = 5;

static_assert(sizeof(AIRGAP_DEVICE_KEY) - 1 >= 12, "AIRGAP_DEVICE_KEY must contain at least 12 characters");

enum class DeviceState { kAdvertising, kConnected, kAuthenticated, kReady, kTyping, kError };

struct Transfer {
  std::string id;
  size_t expectedLength = 0;
  std::string expectedSha256;
  std::string payload;
  bool textMode = false;
  bool ready = false;
};

struct DebouncedButton {
  uint8_t pin;
  bool raw = HIGH;
  bool stable = HIGH;
  bool armed = false;
  uint32_t changedAt = 0;

  explicit DebouncedButton(uint8_t pinNumber) : pin(pinNumber) {}
};

USBHIDKeyboard keyboard;
NimBLECharacteristic *txCharacteristic = nullptr;
std::queue<std::string> commandQueue;
std::mutex commandMutex;
DeviceState deviceState = DeviceState::kAdvertising;
Transfer transfer;
std::array<uint8_t, 16> challenge{};
bool connected = false;
bool authenticated = false;
uint32_t lastAuthenticatedActivity = 0;
DebouncedButton externalButton{kExternalSendPin};
DebouncedButton bootButton{kBootSendPin};

std::vector<std::string> split(const std::string &input) {
  std::istringstream stream(input);
  std::vector<std::string> parts;
  std::string part;
  while (stream >> part) parts.push_back(part);
  return parts;
}

std::string hexEncode(const uint8_t *data, size_t length) {
  static constexpr char kHex[] = "0123456789abcdef";
  std::string output(length * 2, '0');
  for (size_t index = 0; index < length; ++index) {
    output[index * 2] = kHex[data[index] >> 4];
    output[index * 2 + 1] = kHex[data[index] & 0x0f];
  }
  return output;
}

std::array<uint8_t, 32> sha256(const uint8_t *data, size_t length) {
  std::array<uint8_t, 32> digest{};
  const mbedtls_md_info_t *info = mbedtls_md_info_from_type(MBEDTLS_MD_SHA256);
  mbedtls_md(info, data, length, digest.data());
  return digest;
}

std::array<uint8_t, 32> hmacSha256(const uint8_t *data, size_t length) {
  std::array<uint8_t, 32> digest{};
  const mbedtls_md_info_t *info = mbedtls_md_info_from_type(MBEDTLS_MD_SHA256);
  const auto *key = reinterpret_cast<const uint8_t *>(AIRGAP_DEVICE_KEY);
  mbedtls_md_hmac(info, key, strlen(AIRGAP_DEVICE_KEY), data, length, digest.data());
  return digest;
}

bool constantTimeEqual(const std::string &left, const std::string &right) {
  if (left.size() != right.size()) return false;
  uint8_t difference = 0;
  for (size_t index = 0; index < left.size(); ++index) difference |= left[index] ^ right[index];
  return difference == 0;
}

bool isSafeAscii(const std::string &value, bool textMode) {
  if (value.empty() || value.size() > kMaxPayloadBytes) return false;
  for (const unsigned char character : value) {
    if (textMode && (character == '\n' || character == '\t')) continue;
    if (character < 0x20 || character > 0x7e) return false;
  }
  return true;
}

void notify(const std::string &message) {
  if (!connected || txCharacteristic == nullptr) return;
  txCharacteristic->setValue(message);
  txCharacteristic->notify();
}

void fail(const std::string &code, const std::string &detail) {
  transfer = {};
  deviceState = DeviceState::kError;
  notify("ERR " + code + " " + detail);
}

void resetSession() {
  authenticated = false;
  transfer = {};
  lastAuthenticatedActivity = 0;
  deviceState = connected ? DeviceState::kConnected : DeviceState::kAdvertising;
}

void enqueueCommand(const std::string &command) {
  std::lock_guard<std::mutex> lock(commandMutex);
  if (commandQueue.size() < 64) commandQueue.push(command);
}

class RxCallbacks final : public NimBLECharacteristicCallbacks {
  void onWrite(NimBLECharacteristic *characteristic, NimBLEConnInfo &) override {
    enqueueCommand(characteristic->getValue());
  }
};

class ServerCallbacks final : public NimBLEServerCallbacks {
  void onConnect(NimBLEServer *, NimBLEConnInfo &) override { enqueueCommand("__CONNECTED__"); }

  void onDisconnect(NimBLEServer *, NimBLEConnInfo &, int) override {
    enqueueCommand("__DISCONNECTED__");
    NimBLEDevice::startAdvertising();
  }
};

bool decodeBase64(const std::string &encoded, std::string &decoded) {
  size_t required = 0;
  int result = mbedtls_base64_decode(nullptr, 0, &required,
                                     reinterpret_cast<const uint8_t *>(encoded.data()), encoded.size());
  if (result != MBEDTLS_ERR_BASE64_BUFFER_TOO_SMALL || required == 0) return false;
  std::vector<uint8_t> buffer(required);
  size_t written = 0;
  result = mbedtls_base64_decode(buffer.data(), buffer.size(), &written,
                                 reinterpret_cast<const uint8_t *>(encoded.data()), encoded.size());
  if (result != 0) return false;
  decoded.assign(reinterpret_cast<const char *>(buffer.data()), written);
  return true;
}

void handleHello() {
  esp_fill_random(challenge.data(), challenge.size());
  authenticated = false;
  transfer = {};
  notify("CHALLENGE " + hexEncode(challenge.data(), challenge.size()));
}

void handleAuth(const std::vector<std::string> &parts) {
  if (parts.size() != 2 || parts[1].size() != 64) {
    fail("AUTH_FORMAT", "Invalid authentication response");
    return;
  }
  const auto expected = hmacSha256(challenge.data(), challenge.size());
  if (!constantTimeEqual(parts[1], hexEncode(expected.data(), expected.size()))) {
    fail("AUTH_FAILED", "Device key rejected");
    return;
  }
  authenticated = true;
  lastAuthenticatedActivity = millis();
  deviceState = DeviceState::kAuthenticated;
  notify("OK AUTH");
}

bool requireAuthentication() {
  if (authenticated) {
    lastAuthenticatedActivity = millis();
    return true;
  }
  fail("NOT_AUTHENTICATED", "Authenticate before transferring text");
  return false;
}

void handleQueue(const std::vector<std::string> &parts) {
  if (!requireAuthentication()) return;
  if ((parts.size() != 4 && parts.size() != 5) || parts[1].size() != 8 || parts[3].size() != 64 ||
      (parts.size() == 5 && parts[4] != "command" && parts[4] != "text")) {
    fail("QUEUE_FORMAT", "Expected QUEUE id length sha256 [command|text]");
    return;
  }
  char *end = nullptr;
  const unsigned long requestedLength = strtoul(parts[2].c_str(), &end, 10);
  if (*end != '\0' || requestedLength == 0 || requestedLength > kMaxPayloadBytes) {
    fail("QUEUE_LENGTH", "Payload length is outside the supported range");
    return;
  }
  transfer = {};
  transfer.id = parts[1];
  transfer.expectedLength = requestedLength;
  transfer.expectedSha256 = parts[3];
  transfer.textMode = parts.size() == 5 && parts[4] == "text";
  transfer.payload.reserve(requestedLength);
  deviceState = DeviceState::kAuthenticated;
}

void handleData(const std::vector<std::string> &parts) {
  if (!requireAuthentication()) return;
  if (parts.size() != 4 || parts[1] != transfer.id) {
    fail("DATA_FORMAT", "Transfer id or DATA frame is invalid");
    return;
  }
  char *end = nullptr;
  const unsigned long offset = strtoul(parts[2].c_str(), &end, 10);
  std::string decoded;
  if (*end != '\0' || offset != transfer.payload.size() || !decodeBase64(parts[3], decoded) ||
      transfer.payload.size() + decoded.size() > transfer.expectedLength) {
    fail("DATA_INVALID", "Chunk offset, encoding, or size is invalid");
    return;
  }
  transfer.payload += decoded;
}

void handleCommit(const std::vector<std::string> &parts) {
  if (!requireAuthentication()) return;
  if (parts.size() != 2 || parts[1] != transfer.id || transfer.payload.size() != transfer.expectedLength) {
    fail("COMMIT_INVALID", "Transfer is incomplete");
    return;
  }
  const auto digest = sha256(reinterpret_cast<const uint8_t *>(transfer.payload.data()), transfer.payload.size());
  if (!constantTimeEqual(transfer.expectedSha256, hexEncode(digest.data(), digest.size()))) {
    fail("HASH_MISMATCH", "Payload integrity check failed");
    return;
  }
  if (!isSafeAscii(transfer.payload, transfer.textMode)) {
    fail("UNSUPPORTED_TEXT", transfer.textMode ? "Text supports US ASCII, line breaks, and tabs" : "Commands must be one line of printable US ASCII");
    return;
  }
  transfer.ready = true;
  deviceState = DeviceState::kReady;
  notify("READY " + transfer.id);
}

void processCommand(const std::string &command) {
  if (command == "__CONNECTED__") {
    connected = true;
    resetSession();
    return;
  }
  if (command == "__DISCONNECTED__") {
    connected = false;
    resetSession();
    return;
  }
  if (command == "HELLO") {
    handleHello();
    return;
  }
  const auto parts = split(command);
  if (parts.empty()) return;
  if (parts[0] == "AUTH") handleAuth(parts);
  else if (parts[0] == "QUEUE") handleQueue(parts);
  else if (parts[0] == "DATA") handleData(parts);
  else if (parts[0] == "COMMIT") handleCommit(parts);
  else fail("UNKNOWN_COMMAND", "Unsupported protocol command");
}

bool buttonPressed(DebouncedButton &button) {
  const bool raw = digitalRead(button.pin);
  const uint32_t now = millis();
  if (raw != button.raw) {
    button.raw = raw;
    button.changedAt = now;
  }
  if (!button.armed && raw == HIGH && now - button.changedAt >= kButtonDebounceMs) button.armed = true;
  if (now - button.changedAt < kButtonDebounceMs || raw == button.stable) return false;
  button.stable = raw;
  if (button.stable == HIGH) {
    button.armed = true;
    return false;
  }
  return button.armed;
}

void typeReadyTransfer() {
  if (!transfer.ready) return;
  const std::string id = transfer.id;
  const std::string payload = transfer.payload;
  const bool textMode = transfer.textMode;
  transfer.ready = false;
  deviceState = DeviceState::kTyping;
  notify("TYPING " + id);
  for (const unsigned char character : payload) {
    if (textMode && character == '\n') keyboard.write(KEY_RETURN);
    else if (textMode && character == '\t') keyboard.write(KEY_TAB);
    else keyboard.write(character);
    delay(kKeystrokeDelayMs);
  }
  keyboard.releaseAll();
  transfer = {};
  deviceState = DeviceState::kAuthenticated;
  lastAuthenticatedActivity = millis();
  notify("DONE " + id);
}

void updateLed() {
  const uint32_t now = millis();
  bool on = false;
  switch (deviceState) {
    case DeviceState::kAdvertising: on = (now % 1200) < 80; break;
    case DeviceState::kConnected: on = (now % 800) < 80; break;
    case DeviceState::kAuthenticated: on = (now % 2000) < 40; break;
    case DeviceState::kReady: on = (now % 400) < 200; break;
    case DeviceState::kTyping: on = true; break;
    case DeviceState::kError: on = (now % 180) < 90; break;
  }
  digitalWrite(kLedPin, on ? LOW : HIGH);
}

void setupBle() {
  NimBLEDevice::init("AirGap Paste");
  NimBLEDevice::setMTU(247);
  NimBLEDevice::setSecurityAuth(true, false, true);  // Bonding + LE Secure Connections.
  NimBLEDevice::setSecurityIOCap(BLE_HS_IO_NO_INPUT_OUTPUT);

  NimBLEServer *server = NimBLEDevice::createServer();
  server->setCallbacks(new ServerCallbacks());
  NimBLEService *service = server->createService(kServiceUuid);
  NimBLECharacteristic *rx = service->createCharacteristic(
      kRxUuid, NIMBLE_PROPERTY::WRITE | NIMBLE_PROPERTY::WRITE_ENC, 220);
  txCharacteristic = service->createCharacteristic(
      kTxUuid, NIMBLE_PROPERTY::NOTIFY | NIMBLE_PROPERTY::READ_ENC, 220);
  rx->setCallbacks(new RxCallbacks());
  server->start();

  NimBLEAdvertising *advertising = NimBLEDevice::getAdvertising();
  advertising->addServiceUUID(kServiceUuid);
  advertising->setName("AirGap Paste");
  advertising->enableScanResponse(true);
  advertising->start();
}

}  // namespace

void setup() {
  pinMode(kExternalSendPin, INPUT_PULLUP);
  pinMode(kBootSendPin, INPUT_PULLUP);
  pinMode(kLedPin, OUTPUT);
  digitalWrite(kLedPin, HIGH);

  USB.manufacturerName("AirGap Paste");
  USB.productName("AirGap Paste Prototype");
  keyboard.begin();
  USB.begin();
  setupBle();
}

void loop() {
  {
    std::lock_guard<std::mutex> lock(commandMutex);
    if (!commandQueue.empty()) {
      const std::string command = commandQueue.front();
      commandQueue.pop();
      processCommand(command);
    }
  }

  if (authenticated && millis() - lastAuthenticatedActivity > kAuthIdleTimeoutMs) resetSession();
  if (deviceState == DeviceState::kReady && (buttonPressed(externalButton) || buttonPressed(bootButton))) {
    typeReadyTransfer();
  } else {
    buttonPressed(externalButton);
    buttonPressed(bootButton);
  }
  updateLed();
  delay(2);
}
