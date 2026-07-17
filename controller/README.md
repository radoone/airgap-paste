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
2. Copy `include/device_secrets.example.h` to `include/device_secrets.h` and replace the key with a unique random value of at least 12 characters. A local prototype key is already present in this workspace and is ignored by git.
3. Connect the XIAO with a data-capable USB-C cable.
4. Run `./pio run -t upload` in this directory. If upload cannot find the device, hold BOOT, tap RESET, release BOOT, and upload again.
5. Open the web app in Chrome or Edge from HTTPS or `localhost`, enter the same device key, and select **Connect AirGap Paste**.

The USB port becomes a HID keyboard after firmware startup. Uploading a later build can require manually entering bootloader mode because the same native USB connection is being used for HID.

## Safety profile

- BLE pairing/bonding with encryption and LE Secure Connections.
- HMAC-SHA256 challenge-response; the device key is never transmitted.
- Full payload length and SHA-256 verification before it becomes ready.
- Physical confirmation through BOOT or D1/GPIO2.
- Five-minute authentication idle timeout.
- Command mode: one line of printable US ASCII, maximum 4096 bytes.
- Text mode: printable US ASCII plus line breaks and Tab; Unicode and other control characters are rejected because the current USB HID implementation targets a US keyboard layout.

The target computer must use a US keyboard layout for symbols to match. See [PROTOCOL.md](./PROTOCOL.md) for the wire protocol.
