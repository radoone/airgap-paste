# AirGap Paste controller prototype

Firmware for the Seeed Studio XIAO ESP32S3. It receives an authenticated text buffer over BLE, verifies it, waits for a physical button press, and types it into the USB host as a standard US keyboard.

## Wiring

The on-board BOOT button works as SEND while the firmware is running. For the enclosure, add a normally-open momentary button:

```text
XIAO D1 / GPIO2 ---- button ---- GND
```

Do not hold BOOT while powering or resetting the board; that intentionally enters the ESP32-S3 bootloader. The external D1 button avoids that issue and is the recommended product control.

The on-board orange user LED indicates state: slow pulse while advertising, faster pulse while connected, double-speed blink when text is ready, solid while typing, and fast blink on an error.

## Build and flash

1. Run `./setup-platformio` once. It creates an ignored project-local environment and keeps the ESP32 toolchain in `controller/.platformio-core` for future builds.
2. Connect the XIAO with a data-capable USB-C cable.
3. Run `./pio run -t upload` in this directory. If upload cannot find the device, hold BOOT, tap RESET, release BOOT, and upload again.
4. Open the web app in Chrome or Edge from HTTPS or `localhost` and select **Connect AirGap Paste**.
5. When connecting a new browser for the first time, the LED blinks rapidly (5 Hz); tap the BOOT or D1 button within 30 seconds to pair. The device and browser remember each other automatically.
6. To clear all paired browsers from the device, hold the button for 5 seconds.

The USB port becomes a HID keyboard after firmware startup. Uploading a later build can require manually entering bootloader mode because the same native USB connection is being used for HID.

## Safety profile

- Dynamic Push-to-Pair: physical button confirmation required to authorize new connections.
- Persistent token exchange with HMAC-SHA256 challenge-response for remembered connections.
- Hardware factory reset (hold button for 5 seconds) to revoke all paired devices.
- BLE pairing/bonding with encryption and LE Secure Connections.
- Full payload length and SHA-256 verification before it becomes ready.
- Physical confirmation through BOOT or D1/GPIO2 before typing.
- Five-minute authentication idle timeout.
- Command mode: one line of printable text (US ASCII or valid UTF-8 if Linux, macOS, or Windows target is selected), maximum 16 KB.
- Text mode: printable text (US ASCII or valid UTF-8 if Linux, macOS, or Windows target is selected) plus line breaks and Tab, maximum 16 KB.
- Keyboard targets: `ascii` (printable US ASCII), `linux` (`Ctrl+Shift+U`), `macos` (Unicode Hex Input), and `windows` (`EnableHexNumpad`).

The target computer must use a US keyboard layout for ASCII symbols to match. See [PROTOCOL.md](./PROTOCOL.md) for the wire protocol.
