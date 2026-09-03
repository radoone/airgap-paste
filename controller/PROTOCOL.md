# AirGap Paste BLE protocol v2

The device exposes one custom service and two encrypted characteristics:

- Service: `7b7d0001-7a6f-4b4d-9f71-6a14e7a1c001`
- RX, browser to device, write with response: `7b7d0002-7a6f-4b4d-9f71-6a14e7a1c001`
- TX, device to browser, notifications: `7b7d0003-7a6f-4b4d-9f71-6a14e7a1c001`

Every GATT value contains exactly one UTF-8 protocol frame.

## 1. Initial Connection & Push-to-Pair Flow

When a new client (browser/phone) connects for the first time:

```text
client: PAIR <16-hex-client-id>
device: PAIR_WAIT 30
# Device enters pairing mode; LED blinks rapidly (5 Hz).
# User physically presses the BOOT or D1/GPIO2 button on AirGap Paste within 30 seconds.
device: PAIR_OK <32-hex-token>
device: OK AUTH
```

The browser saves `<16-hex-client-id>` and `<32-hex-token>` in persistent local storage. The device saves them in flash NVS (supporting up to 8 paired clients).

## 2. Reconnecting a Paired Client (Instant 1-Click)

On subsequent connections, the client reconnects automatically without requiring button confirmation:

```text
client: HELLO <16-hex-client-id>
device: CHALLENGE <32 lowercase hex characters>
client: AUTH <HMAC-SHA256(paired-token, raw-challenge-bytes) as lowercase hex>
device: OK AUTH
```

If the client ID is not recognized (e.g. after a factory reset):
```text
device: ERR UNPAIRED Client not recognized
```
The client can then immediately fall back to the `PAIR` command.

## 3. Unpairing & Factory Reset

- **Client unpair**:
  ```text
  client: UNPAIR <16-hex-client-id>
  device: OK UNPAIR
  ```
- **Hardware factory reset**:
  Holding the BOOT or D1 button for **5 seconds** clears all paired clients from internal NVS storage and flashes the LED rapidly.

## 4. Transfer & Typing Session

Once authenticated (`OK AUTH`), the session operates as follows:

```text
# The browser keeps the authenticated BLE link active while it is open.
client: PING
device: PONG
client: QUEUE <8-hex-id> <byte-length> <sha256-hex> <command|text> <ascii|linux|macos|windows>
client: DATA <id> <zero-based-byte-offset> <base64-data>
client: COMMIT <id>
device: READY <id>
# User presses BOOT or the D1/GPIO2 SEND button to initiate typing.
device: TYPING <id>
device: DONE <id>
```

Errors use `ERR <CODE> <detail>`. An authenticated browser sends `PING` every 20 seconds and expects `PONG`; this refreshes the five-minute authentication idle timer and detects a lost GATT link. Every transfer declares a typing mode and target keyboard. `ascii` accepts printable US ASCII only; `linux`, `macos`, and `windows` accept valid printable UTF-8. Linux uses `Ctrl+Shift+U`, macOS uses Unicode Hex Input, and Windows uses the EnableHexNumpad Alt+plus sequence. The host must have the corresponding input method enabled. `text` also accepts LF line breaks and Tab, which are typed as Enter and Tab keys within the transferred text. Both modes accept at most 16 KB per transfer. Neither mode adds an automatic Enter after the payload. DATA chunks must be sequential and the complete payload must match both the declared length and SHA-256 digest.
