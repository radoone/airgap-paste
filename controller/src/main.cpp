#include <Arduino.h>
#include <NimBLEDevice.h>
#include <Preferences.h>
#include <USB.h>
#include <USBHIDKeyboard.h>
#include <esp_system.h>
#include <soc/rtc_cntl_reg.h>
#include <mbedtls/base64.h>
#include <mbedtls/md.h>
#include "halo_indicator.h"
#include "authentication.h"

#include <array>
#include <mutex>
#include <queue>
#include <sstream>
#include <string>
#include <vector>

namespace {

constexpr char kServiceUuid[] = "7b7d0001-7a6f-4b4d-9f71-6a14e7a1c001";
constexpr char kRxUuid[] = "7b7d0002-7a6f-4b4d-9f71-6a14e7a1c001";
constexpr char kTxUuid[] = "7b7d0003-7a6f-4b4d-9f71-6a14e7a1c001";
constexpr char kDeviceName[] = "AirGap Paste";
// Fits alongside the 128-bit service UUID in the primary 31-byte BLE advertisement.
constexpr char kAdvertisedDeviceName[] = "AirGap";

constexpr uint8_t kExternalSendPin = 2;  // XIAO D1/GPIO2 -> button -> GND
constexpr uint8_t kBootSendPin = 0;      // On-board BOOT button
constexpr uint8_t kLedPin = 21;          // On-board user LED, active LOW
constexpr uint8_t kExternalHaloPin = 1;  // XIAO D0/GPIO1 -> 330 ohm -> LED -> GND
constexpr size_t kMaxPayloadBytes = 16 * 1024;
constexpr uint32_t kAuthIdleTimeoutMs = 5 * 60 * 1000UL;
constexpr uint32_t kPairingTimeoutMs = 30 * 1000UL;
constexpr uint32_t kButtonDebounceMs = 35;
constexpr uint32_t kKeystrokeDelayMinMs = 11;
constexpr uint32_t kKeystrokeDelayJitterMs = 16;
constexpr size_t kMaxPairedClients = 8;

enum class DeviceState { kAdvertising, kConnected, kPairing, kAuthenticated, kReady, kTyping, kError };
enum class KeyboardTarget { kAscii, kLinux, kMacOS, kWindows };

struct Transfer {
  std::string id;
  size_t expectedLength = 0;
  std::string expectedSha256;
  std::string payload;
  bool textMode = false;
  KeyboardTarget keyboardTarget = KeyboardTarget::kAscii;
  bool ready = false;
};

Preferences preferences;
std::string activeClientId;
std::string activeAuthToken;
std::string clientNonce;
std::string pendingPairClientId;
uint32_t pairingStartedAt = 0;
bool challengePending = false;

struct DebouncedButton {
  uint8_t pin;
  bool raw = HIGH;
  bool stable = HIGH;
  bool armed = false;
  uint32_t changedAt = 0;
  uint32_t pressedAt = 0;
  bool longPressHandled = false;

  explicit DebouncedButton(uint8_t pinNumber) : pin(pinNumber) {}
};

struct HidAction {
  uint8_t modifiers;
  uint8_t usage;
  uint32_t waitMs;
};

struct TypingEngine {
  bool active = false;
  std::string id;
  std::vector<uint32_t> codepoints;
  size_t index = 0;
  bool textMode = false;
  KeyboardTarget keyboardTarget = KeyboardTarget::kAscii;
  uint32_t nextActionAt = 0;
  std::queue<HidAction> pendingHidActions;
};

USBHIDKeyboard keyboard;
NimBLECharacteristic *txCharacteristic = nullptr;
std::queue<std::string> commandQueue;
std::mutex commandMutex;
DeviceState deviceState = DeviceState::kAdvertising;
Transfer transfer;
TypingEngine typingEngine;
std::array<uint8_t, 16> challenge{};
bool connected = false;
bool authenticated = false;
uint32_t lastAuthenticatedActivity = 0;
DebouncedButton externalButton{kExternalSendPin};
DebouncedButton bootButton{kBootSendPin};

bool getPairedToken(const std::string &clientId, std::string &outToken) {
  if (clientId.empty()) return false;
  const uint8_t count = preferences.getUChar("count", 0);
  for (uint8_t i = 0; i < count; ++i) {
    char keyId[16];
    snprintf(keyId, sizeof(keyId), "id_%u", i);
    String id = preferences.getString(keyId, "");
    if (id.c_str() == clientId) {
      char keyTok[16];
      snprintf(keyTok, sizeof(keyTok), "tok_%u", i);
      String tok = preferences.getString(keyTok, "");
      if (tok.length() > 0) {
        outToken = tok.c_str();
        return true;
      }
    }
  }
  return false;
}

bool savePairedToken(const std::string &clientId, const std::string &token) {
  if (clientId.empty() || token.empty()) return false;
  const uint8_t count = preferences.getUChar("count", 0);
  for (uint8_t i = 0; i < count; ++i) {
    char keyId[16];
    snprintf(keyId, sizeof(keyId), "id_%u", i);
    if (preferences.getString(keyId, "").c_str() == clientId) {
      char keyTok[16];
      snprintf(keyTok, sizeof(keyTok), "tok_%u", i);
      return preferences.putString(keyTok, token.c_str()) == token.size();
    }
  }
  uint8_t slot = count;
  if (slot >= kMaxPairedClients) {
    for (uint8_t j = 0; j + 1 < kMaxPairedClients; ++j) {
      char curId[16], curTok[16], nextId[16], nextTok[16];
      snprintf(curId, sizeof(curId), "id_%u", j);
      snprintf(curTok, sizeof(curTok), "tok_%u", j);
      snprintf(nextId, sizeof(nextId), "id_%u", j + 1);
      snprintf(nextTok, sizeof(nextTok), "tok_%u", j + 1);
      preferences.putString(curId, preferences.getString(nextId, ""));
      preferences.putString(curTok, preferences.getString(nextTok, ""));
    }
    slot = kMaxPairedClients - 1;
  }
  char keyId[16], keyTok[16];
  snprintf(keyId, sizeof(keyId), "id_%u", slot);
  snprintf(keyTok, sizeof(keyTok), "tok_%u", slot);
  if (preferences.putString(keyId, clientId.c_str()) != clientId.size() ||
      preferences.putString(keyTok, token.c_str()) != token.size()) return false;
  return count >= kMaxPairedClients || preferences.putUChar("count", count + 1) == 1;
}

bool removePairedToken(const std::string &clientId) {
  const uint8_t count = preferences.getUChar("count", 0);
  for (uint8_t i = 0; i < count; ++i) {
    char keyId[16];
    snprintf(keyId, sizeof(keyId), "id_%u", i);
    if (preferences.getString(keyId, "").c_str() == clientId) {
      for (uint8_t j = i; j + 1 < count; ++j) {
        char curId[16], curTok[16], nextId[16], nextTok[16];
        snprintf(curId, sizeof(curId), "id_%u", j);
        snprintf(curTok, sizeof(curTok), "tok_%u", j);
        snprintf(nextId, sizeof(nextId), "id_%u", j + 1);
        snprintf(nextTok, sizeof(nextTok), "tok_%u", j + 1);
        preferences.putString(curId, preferences.getString(nextId, ""));
        preferences.putString(curTok, preferences.getString(nextTok, ""));
      }
      preferences.putUChar("count", count - 1);
      return true;
    }
  }
  return false;
}

void clearAllPairings() {
  preferences.clear();
  preferences.putUChar("count", 0);
}

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

std::array<uint8_t, 32> hmacSha256(const std::string &key, const uint8_t *data, size_t length) {
  std::array<uint8_t, 32> digest{};
  const mbedtls_md_info_t *info = mbedtls_md_info_from_type(MBEDTLS_MD_SHA256);
  const auto *rawKey = reinterpret_cast<const uint8_t *>(key.data());
  mbedtls_md_hmac(info, rawKey, key.size(), data, length, digest.data());
  return digest;
}

bool constantTimeEqual(const std::string &left, const std::string &right) {
  if (left.size() != right.size()) return false;
  uint8_t difference = 0;
  for (size_t index = 0; index < left.size(); ++index) difference |= left[index] ^ right[index];
  return difference == 0;
}

bool decodeUtf8(const std::string &value, std::vector<uint32_t> &codepoints) {
  codepoints.clear();
  for (size_t index = 0; index < value.size();) {
    const uint8_t first = static_cast<uint8_t>(value[index]);
    uint32_t codepoint = 0;
    size_t length = 0;
    if (first <= 0x7f) { codepoint = first; length = 1; }
    else if ((first & 0xe0) == 0xc0) { codepoint = first & 0x1f; length = 2; }
    else if ((first & 0xf0) == 0xe0) { codepoint = first & 0x0f; length = 3; }
    else if ((first & 0xf8) == 0xf0) { codepoint = first & 0x07; length = 4; }
    else return false;
    if (index + length > value.size()) return false;
    for (size_t offset = 1; offset < length; ++offset) {
      const uint8_t next = static_cast<uint8_t>(value[index + offset]);
      if ((next & 0xc0) != 0x80) return false;
      codepoint = (codepoint << 6) | (next & 0x3f);
    }
    if ((length == 2 && codepoint < 0x80) || (length == 3 && codepoint < 0x800) ||
        (length == 4 && codepoint < 0x10000) || codepoint > 0x10ffff ||
        (codepoint >= 0xd800 && codepoint <= 0xdfff)) return false;
    codepoints.push_back(codepoint);
    index += length;
  }
  return true;
}

bool isSafePayload(const std::string &value, bool textMode, KeyboardTarget keyboardTarget) {
  if (value.empty() || value.size() > kMaxPayloadBytes) return false;
  std::vector<uint32_t> codepoints;
  if (!decodeUtf8(value, codepoints)) return false;
  for (const uint32_t codepoint : codepoints) {
    if (textMode && (codepoint == '\n' || codepoint == '\r' || codepoint == '\t')) continue;
    if (codepoint < 0x20 || (codepoint >= 0x7f && codepoint <= 0x9f)) return false;
    if (keyboardTarget == KeyboardTarget::kAscii && codepoint > 0x7e) return false;
  }
  return true;
}

void notify(const std::string &message) {
  if (!connected || txCharacteristic == nullptr) return;
  txCharacteristic->setValue(message);
  txCharacteristic->notify();
}

void fail(const std::string &code, const std::string &detail) {
  if (typingEngine.active) {
    keyboard.releaseAll();
    typingEngine = {};
  }
  transfer = {};
  deviceState = DeviceState::kError;
  notify("ERR " + code + " " + detail);
}

void resetSession() {
  if (typingEngine.active) {
    keyboard.releaseAll();
    typingEngine = {};
  }
  authenticated = false;
  challengePending = false;
  challenge.fill(0);
  activeClientId.clear();
  activeAuthToken.clear();
  clientNonce.clear();
  pendingPairClientId.clear();
  transfer = {};
  lastAuthenticatedActivity = 0;
  deviceState = connected ? DeviceState::kConnected : DeviceState::kAdvertising;
}

void enqueueCommand(const std::string &command) {
  std::lock_guard<std::mutex> lock(commandMutex);
  if (commandQueue.size() < 64) {
    commandQueue.push(command);
  } else {
    while (!commandQueue.empty()) commandQueue.pop();
    commandQueue.push("__OVERFLOW__");
  }
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

bool requireAuthentication() {
  if (authenticated) {
    lastAuthenticatedActivity = millis();
    return true;
  }
  fail("NOT_AUTHENTICATED", "Authenticate before transferring text");
  return false;
}

void handleHello(const std::vector<std::string> &parts) {
  if (deviceState == DeviceState::kTyping) {
    notify("ERR BUSY Device is currently typing");
    return;
  }
  if (parts.size() != 3 || !isLowerHex(parts[1], 16) || !isLowerHex(parts[2], 32)) {
    fail("HELLO_FORMAT", "Expected HELLO3 <client-id> <client-nonce>");
    return;
  }
  const std::string &clientId = parts[1];
  std::string token;
  resetSession();
  if (!getPairedToken(clientId, token)) {
    notify("ERR UNPAIRED Client not recognized");
    return;
  }
  esp_fill_random(challenge.data(), challenge.size());
  challengePending = true;
  activeClientId = clientId;
  activeAuthToken = token;
  clientNonce = parts[2];
  const std::string deviceNonce = hexEncode(challenge.data(), challenge.size());
  const std::string message = authenticationMessage("device", activeClientId, clientNonce, deviceNonce);
  const auto proof = hmacSha256(token, reinterpret_cast<const uint8_t *>(message.data()), message.size());
  notify("CHALLENGE3 " + deviceNonce + " " + hexEncode(proof.data(), proof.size()));
}

void handlePair(const std::vector<std::string> &parts) {
  if (deviceState == DeviceState::kTyping) {
    notify("ERR BUSY Device is currently typing");
    return;
  }
  if (parts.size() != 3 || !isLowerHex(parts[1], 16) || !isLowerHex(parts[2], 32)) {
    fail("PAIR_FORMAT", "Expected PAIR3 <client-id> <client-nonce>");
    return;
  }
  resetSession();
  pendingPairClientId = parts[1];
  clientNonce = parts[2];
  pairingStartedAt = millis();
  deviceState = DeviceState::kPairing;
  notify("PAIR_WAIT 30");
}

void handleUnpair(const std::vector<std::string> &parts) {
  if (!requireAuthentication()) return;
  if (parts.size() != 2 || parts[1].empty() || parts[1] != activeClientId) {
    fail("UNPAIR_FORMAT", "Expected UNPAIR <authenticated-client-id>");
    return;
  }
  removePairedToken(parts[1]);
  resetSession();
  notify("OK UNPAIR");
}

void handleAuth(const std::vector<std::string> &parts) {
  if (deviceState == DeviceState::kTyping) {
    notify("ERR BUSY Device is currently typing");
    return;
  }
  if (parts.size() != 2 || !isLowerHex(parts[1], 64)) {
    fail("AUTH_FORMAT", "Invalid authentication response");
    return;
  }
  if (!challengePending || activeAuthToken.empty()) {
    fail("NOT_INITIALIZED", "Initiate HELLO3 first");
    return;
  }
  challengePending = false;
  const std::string message = authenticationMessage("client", activeClientId, clientNonce, hexEncode(challenge.data(), challenge.size()));
  const auto expected = hmacSha256(activeAuthToken, reinterpret_cast<const uint8_t *>(message.data()), message.size());
  challenge.fill(0);
  clientNonce.clear();
  if (!constantTimeEqual(parts[1], hexEncode(expected.data(), expected.size()))) {
    activeClientId.clear();
    activeAuthToken.clear();
    fail("AUTH_FAILED", "Authentication response rejected");
    return;
  }
  authenticated = true;
  lastAuthenticatedActivity = millis();
  deviceState = DeviceState::kAuthenticated;
  notify("OK AUTH3");
}

void handlePing() {
  if (!requireAuthentication()) return;
  notify("PONG");
}

void handleQueue(const std::vector<std::string> &parts) {
  if (!requireAuthentication()) return;
  if (deviceState == DeviceState::kTyping) {
    notify("ERR BUSY Device is currently typing");
    return;
  }
  if (parts.size() != 6 || parts[1].size() != 8 || parts[3].size() != 64 ||
      (parts[4] != "command" && parts[4] != "text") ||
      (parts[5] != "ascii" && parts[5] != "linux" && parts[5] != "macos" && parts[5] != "windows")) {
    fail("QUEUE_FORMAT", "Expected QUEUE id length sha256 [command|text] [ascii|linux|macos|windows]");
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
  transfer.textMode = parts[4] == "text";
  transfer.keyboardTarget = parts[5] == "linux" ? KeyboardTarget::kLinux : parts[5] == "macos" ? KeyboardTarget::kMacOS : parts[5] == "windows" ? KeyboardTarget::kWindows : KeyboardTarget::kAscii;
  transfer.payload.reserve(requestedLength);
  deviceState = DeviceState::kAuthenticated;
}

void handleData(const std::vector<std::string> &parts) {
  if (!requireAuthentication()) return;
  if (deviceState == DeviceState::kTyping) {
    notify("ERR BUSY Device is currently typing");
    return;
  }
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
  if (deviceState == DeviceState::kTyping) {
    notify("ERR BUSY Device is currently typing");
    return;
  }
  if (parts.size() != 2 || parts[1] != transfer.id || transfer.payload.size() != transfer.expectedLength) {
    fail("COMMIT_INVALID", "Transfer is incomplete");
    return;
  }
  const auto digest = sha256(reinterpret_cast<const uint8_t *>(transfer.payload.data()), transfer.payload.size());
  if (!constantTimeEqual(transfer.expectedSha256, hexEncode(digest.data(), digest.size()))) {
    fail("HASH_MISMATCH", "Payload integrity check failed");
    return;
  }
  if (!isSafePayload(transfer.payload, transfer.textMode, transfer.keyboardTarget)) {
    fail("UNSUPPORTED_TEXT", transfer.keyboardTarget == KeyboardTarget::kAscii ? "US ASCII output cannot type Unicode characters" : "Text contains invalid Unicode or control characters");
    return;
  }
  transfer.ready = true;
  deviceState = DeviceState::kReady;
  notify("READY " + transfer.id);
}

void processCommand(const std::string &command) {
  if (command == "__OVERFLOW__") {
    fail("QUEUE_OVERFLOW", "Command buffer overflow");
    return;
  }
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
  const auto parts = split(command);
  if (parts.empty()) return;
  if (parts[0] == "HELLO3") handleHello(parts);
  else if (parts[0] == "PAIR3") handlePair(parts);
  else if (parts[0] == "UNPAIR") handleUnpair(parts);
  else if (parts[0] == "AUTH3") handleAuth(parts);
  else if (parts[0] == "HELLO" || parts[0] == "PAIR" || parts[0] == "AUTH") fail("PROTOCOL_VERSION", "Update the web app and firmware to protocol v3");
  else if (parts[0] == "PING") handlePing();
  else if (parts[0] == "QUEUE") handleQueue(parts);
  else if (parts[0] == "DATA") handleData(parts);
  else if (parts[0] == "COMMIT") handleCommit(parts);
  else fail("UNKNOWN_COMMAND", "Unsupported protocol command");
}

struct ButtonEvents {
  bool pressedDown = false;
  bool shortReleased = false;
  bool held5s = false;
};

ButtonEvents pollButton(DebouncedButton &button) {
  ButtonEvents events{};
  const bool raw = digitalRead(button.pin);
  const uint32_t now = millis();
  if (raw != button.raw) {
    button.raw = raw;
    button.changedAt = now;
  }
  if (!button.armed && raw == HIGH && now - button.changedAt >= kButtonDebounceMs) {
    button.armed = true;
    button.longPressHandled = false;
  }
  if (button.armed && button.stable == LOW && !button.longPressHandled &&
      now - button.pressedAt >= 5000) {
    button.longPressHandled = true;
    events.held5s = true;
  }
  if (now - button.changedAt < kButtonDebounceMs || raw == button.stable) return events;
  button.stable = raw;
  if (button.stable == HIGH) {
    if (button.armed && !button.longPressHandled) {
      events.shortReleased = true;
    }
    button.armed = true;
    button.longPressHandled = false;
    return events;
  }
  button.pressedAt = now;
  button.longPressHandled = false;
  if (button.armed) {
    events.pressedDown = true;
  }
  return events;
}

uint32_t humanKeystrokeDelayMs(unsigned char character) {
  // Keep each transfer comfortably fast while avoiding a perfectly mechanical
  // cadence. Whitespace naturally gets a little more thinking time.
  uint32_t delayMs = kKeystrokeDelayMinMs + (esp_random() % kKeystrokeDelayJitterMs);
  if (character == ' ' || character == '\n' || character == '\t') delayMs += 16 + (esp_random() % 18);
  if ((esp_random() % 100) < 6) delayMs += 35 + (esp_random() % 55);
  return delayMs;
}

std::string unicodeHex(uint32_t codepoint) {
  static constexpr char kHex[] = "0123456789abcdef";
  std::string value;
  do {
    value.insert(value.begin(), kHex[codepoint & 0x0f]);
    codepoint >>= 4;
  } while (codepoint != 0 || value.size() < 4);
  return value;
}

uint8_t hidUsageForAscii(char character) {
  if (character >= 'a' && character <= 'z') return 0x04 + (character - 'a');
  if (character >= '1' && character <= '9') return 0x1e + (character - '1');
  if (character == '0') return 0x27;
  return 0;
}

void enqueueHidKey(uint8_t modifiers, uint8_t usage, uint32_t holdMs, uint32_t settleMs, uint8_t settleModifiers = 0) {
  typingEngine.pendingHidActions.push({modifiers, usage, holdMs});
  typingEngine.pendingHidActions.push({settleModifiers, 0, settleMs});
}

void enqueueAltHexSequence(uint32_t unit16, bool includeNumpadPlus) {
  constexpr uint8_t kLeftAlt = 0x04;
  if (includeNumpadPlus) {
    enqueueHidKey(kLeftAlt, 0x57, 14, 14, kLeftAlt);
  }
  for (const char character : unicodeHex(unit16)) {
    enqueueHidKey(kLeftAlt, hidUsageForAscii(character), 14, 14, kLeftAlt);
  }
  typingEngine.pendingHidActions.push({0, 0, 18});
}

void typeUnicodeCodepoint(uint32_t codepoint, KeyboardTarget target) {
  if (target == KeyboardTarget::kLinux) {
    // Queue each step as a complete non-blocking HID report so the main loop,
    // BLE heartbeats, and emergency stop button remain responsive.
    const std::string hex = unicodeHex(codepoint);
    constexpr uint8_t kCtrlShift = 0x03;
    enqueueHidKey(kCtrlShift, hidUsageForAscii('u'), 35, 120);
    for (const char character : hex) {
      enqueueHidKey(0, hidUsageForAscii(character), 22, 38);
    }
    enqueueHidKey(0, 0x28, 35, 120);  // Enter commits the Unicode input sequence.
  } else if (target == KeyboardTarget::kMacOS || target == KeyboardTarget::kWindows) {
    const bool isWindows = (target == KeyboardTarget::kWindows);
    if (codepoint <= 0xffff) {
      enqueueAltHexSequence(codepoint, isWindows);
    } else {
      // macOS Unicode Hex Input and Windows EnableHexNumpad require UTF-16 surrogate pairs outside BMP.
      const uint32_t highSurrogate = 0xd800 + ((codepoint - 0x10000) >> 10);
      const uint32_t lowSurrogate = 0xdc00 + ((codepoint - 0x10000) & 0x3ff);
      enqueueAltHexSequence(highSurrogate, isWindows);
      enqueueAltHexSequence(lowSurrogate, isWindows);
    }
  }
}

void startTyping() {
  if (!transfer.ready) return;
  std::vector<uint32_t> codepoints;
  if (!decodeUtf8(transfer.payload, codepoints)) {
    fail("UNSUPPORTED_TEXT", "Text is not valid UTF-8");
    return;
  }
  typingEngine = {};
  typingEngine.active = true;
  typingEngine.id = transfer.id;
  typingEngine.codepoints = std::move(codepoints);
  typingEngine.index = 0;
  typingEngine.textMode = transfer.textMode;
  typingEngine.keyboardTarget = transfer.keyboardTarget;
  typingEngine.nextActionAt = millis();
  transfer.ready = false;
  deviceState = DeviceState::kTyping;
  notify("TYPING " + typingEngine.id);
}

void stepTyping() {
  if (!typingEngine.active) return;
  const uint32_t now = millis();
  if (static_cast<int32_t>(now - typingEngine.nextActionAt) < 0) return;
  lastAuthenticatedActivity = now;

  if (!typingEngine.pendingHidActions.empty()) {
    const HidAction action = typingEngine.pendingHidActions.front();
    typingEngine.pendingHidActions.pop();
    KeyReport report{};
    report.modifiers = action.modifiers;
    report.keys[0] = action.usage;
    keyboard.sendReport(&report);
    typingEngine.nextActionAt = millis() + action.waitMs;
    return;
  }

  if (typingEngine.index >= typingEngine.codepoints.size()) {
    keyboard.releaseAll();
    const std::string finishedId = typingEngine.id;
    typingEngine = {};
    transfer = {};
    deviceState = DeviceState::kAuthenticated;
    notify("DONE " + finishedId);
    return;
  }

  const uint32_t codepoint = typingEngine.codepoints[typingEngine.index++];
  if (typingEngine.textMode && codepoint == '\r') {
    typingEngine.nextActionAt = now;
    return;
  }
  if (typingEngine.textMode && codepoint == '\n') keyboard.write(KEY_RETURN);
  else if (typingEngine.textMode && codepoint == '\t') keyboard.write(KEY_TAB);
  else if (codepoint <= 0x7e) keyboard.write(static_cast<uint8_t>(codepoint));
  else typeUnicodeCodepoint(codepoint, typingEngine.keyboardTarget);

  if (typingEngine.index % 40 == 0 && typingEngine.index < typingEngine.codepoints.size()) {
    notify("PROGRESS " + typingEngine.id + " " + std::to_string(typingEngine.index) + " " +
           std::to_string(typingEngine.codepoints.size()));
  }

  if (typingEngine.pendingHidActions.empty()) {
    typingEngine.nextActionAt = millis() + humanKeystrokeDelayMs(codepoint <= 0x7f ? static_cast<unsigned char>(codepoint) : ' ');
  } else {
    typingEngine.nextActionAt = millis();
  }
}

void updateLed() {
  const uint32_t now = millis();
  bool on = false;
  switch (deviceState) {
    case DeviceState::kAdvertising: on = (now % 1200) < 80; break;
    case DeviceState::kConnected: on = (now % 800) < 80; break;
    case DeviceState::kPairing: on = (now % 200) < 100; break;
    case DeviceState::kAuthenticated: on = (now % 2000) < 40; break;
    case DeviceState::kReady: on = (now % 400) < 200; break;
    case DeviceState::kTyping: on = true; break;
    case DeviceState::kError: on = (now % 180) < 90; break;
  }
  digitalWrite(kLedPin, on ? LOW : HIGH);
  HaloState halo = HaloState::kOff;
  switch (deviceState) {
    case DeviceState::kPairing: halo = HaloState::kPairing; break;
    case DeviceState::kReady: halo = HaloState::kReady; break;
    case DeviceState::kTyping: halo = HaloState::kTyping; break;
    case DeviceState::kError: halo = HaloState::kError; break;
    default: break;
  }
  digitalWrite(kExternalHaloPin, haloIndicatorOn(halo, now) ? HIGH : LOW);
}

void setupBle() {
  static ServerCallbacks serverCallbacks;
  static RxCallbacks rxCallbacks;

  NimBLEDevice::init(kDeviceName);
  NimBLEDevice::setMTU(247);
  NimBLEDevice::setSecurityAuth(true, false, true);  // Bonding + LE Secure Connections.
  NimBLEDevice::setSecurityIOCap(BLE_HS_IO_NO_INPUT_OUTPUT);

  NimBLEServer *server = NimBLEDevice::createServer();
  server->setCallbacks(&serverCallbacks);
  NimBLEService *service = server->createService(kServiceUuid);
  NimBLECharacteristic *rx = service->createCharacteristic(
      kRxUuid, NIMBLE_PROPERTY::WRITE | NIMBLE_PROPERTY::WRITE_ENC, 220);
  txCharacteristic = service->createCharacteristic(
      kTxUuid, NIMBLE_PROPERTY::NOTIFY | NIMBLE_PROPERTY::READ_ENC, 220);
  rx->setCallbacks(&rxCallbacks);
  server->start();

  NimBLEAdvertising *advertising = NimBLEDevice::getAdvertising();
  advertising->addServiceUUID(kServiceUuid);
  advertising->setName(kAdvertisedDeviceName);
  advertising->enableScanResponse(false);
  advertising->start();
}

}  // namespace

void setup() {
  pinMode(kExternalSendPin, INPUT_PULLUP);
  pinMode(kBootSendPin, INPUT_PULLUP);
  pinMode(kLedPin, OUTPUT);
  digitalWrite(kLedPin, HIGH);
  digitalWrite(kExternalHaloPin, LOW);
  pinMode(kExternalHaloPin, OUTPUT);

  // Allow entering ROM USB bootloader without opening the enclosure:
  // hold the external SEND button (D1/GPIO2) while plugging in the USB cable.
  delay(20);
  if (digitalRead(kExternalSendPin) == LOW) {
    delay(40);
    if (digitalRead(kExternalSendPin) == LOW) {
      REG_WRITE(RTC_CNTL_OPTION1_REG, RTC_CNTL_FORCE_DOWNLOAD_BOOT);
      esp_restart();
    }
  }

  preferences.begin("airgap", false);

  USB.manufacturerName("AirGap Paste");
  USB.productName("AirGap Paste Prototype");
  keyboard.begin();
  USB.begin();
  setupBle();
}

void loop() {
  std::string command;
  {
    std::lock_guard<std::mutex> lock(commandMutex);
    if (!commandQueue.empty()) {
      command = std::move(commandQueue.front());
      commandQueue.pop();
    }
  }
  // Flash writes and crypto must not hold the BLE callback queue's mutex.
  if (!command.empty()) processCommand(command);

  const ButtonEvents extEvents = pollButton(externalButton);
  const ButtonEvents bootEvents = pollButton(bootButton);
  const bool anyPressedDown = extEvents.pressedDown || bootEvents.pressedDown;
  const bool anyShortReleased = extEvents.shortReleased || bootEvents.shortReleased;
  const bool anyHeld5s = extEvents.held5s || bootEvents.held5s;

  if (anyHeld5s) {
    clearAllPairings();
    resetSession();
    digitalWrite(kExternalHaloPin, LOW);
    for (int i = 0; i < 6; ++i) {
      digitalWrite(kLedPin, LOW);
      delay(40);
      digitalWrite(kLedPin, HIGH);
      delay(40);
    }
    notify("ERR RESET All paired devices cleared");
    return;
  }

  if (deviceState == DeviceState::kPairing) {
    if (millis() - pairingStartedAt > kPairingTimeoutMs) {
      pendingPairClientId.clear();
      deviceState = connected ? DeviceState::kConnected : DeviceState::kAdvertising;
      fail("PAIR_TIMEOUT", "Pairing timed out without button confirmation");
    } else if (anyShortReleased) {
      std::array<uint8_t, 16> tokenBytes{};
      esp_fill_random(tokenBytes.data(), tokenBytes.size());
      const std::string token = hexEncode(tokenBytes.data(), tokenBytes.size());
      if (!savePairedToken(pendingPairClientId, token)) {
        resetSession();
        fail("PAIR_STORAGE", "Could not save the pairing key");
        return;
      }
      activeClientId = pendingPairClientId;
      activeAuthToken = token;
      pendingPairClientId.clear();
      authenticated = true;
      lastAuthenticatedActivity = millis();
      deviceState = DeviceState::kAuthenticated;
      esp_fill_random(challenge.data(), challenge.size());
      const std::string deviceNonce = hexEncode(challenge.data(), challenge.size());
      const std::string message = authenticationMessage("device", activeClientId, clientNonce, deviceNonce);
      const auto proof = hmacSha256(token, reinterpret_cast<const uint8_t *>(message.data()), message.size());
      challenge.fill(0);
      clientNonce.clear();
      notify("PAIR_OK3 " + token + " " + deviceNonce + " " + hexEncode(proof.data(), proof.size()));
    }
  } else if (deviceState == DeviceState::kReady && anyShortReleased) {
    startTyping();
  } else if (deviceState == DeviceState::kTyping) {
    if (anyPressedDown) {
      fail("ABORTED", "Typing cancelled on device");
    } else {
      stepTyping();
    }
  }

  if (authenticated && millis() - lastAuthenticatedActivity > kAuthIdleTimeoutMs) resetSession();
  updateLed();
  delay(2);
}
