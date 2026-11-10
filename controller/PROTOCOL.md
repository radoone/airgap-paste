# AirGap Paste BLE protocol v3

The device exposes one custom service and two encrypted characteristics:

- Service: `7b7d0001-7a6f-4b4d-9f71-6a14e7a1c001`
- RX, browser to device, write with response: `7b7d0002-7a6f-4b4d-9f71-6a14e7a1c001`
- TX, device to browser, notifications: `7b7d0003-7a6f-4b4d-9f71-6a14e7a1c001`

Every GATT value contains exactly one UTF-8 protocol frame.

## 1. Initial Connection & Push-to-Pair Flow

When a new client (browser/phone) connects for the first time:

```text
client: PAIR3 <16-hex-client-id> <32-hex-client-nonce>
device: PAIR_WAIT 30
# Device enters pairing mode; LED blinks rapidly (5 Hz).
# User physically presses the BOOT or D1/GPIO2 button on AirGap Paste within 30 seconds.
device: PAIR_OK3 <32-hex-token> <32-hex-device-nonce> <64-hex-device-proof>
```

The browser generates the client nonce using Web Crypto and saves the client ID and pairing key in persistent local storage, keyed by the browser's Bluetooth device ID. The device saves the key in flash NVS (supporting up to 8 paired clients) and marks the session as authenticated after physical confirmation and successful storage.

First pairing establishes trust in the hardware selected by the user. The device has no display or factory public-key identity: BLE uses encrypted LE Secure Connections with Just Works, which does not authenticate against an active attacker during this initial enrollment. Pair deliberately in a trusted environment; a button press is not an out-of-band cryptographic identity check. Subsequent connections require mutual proof of the enrolled secret.

## 2. Reconnecting a Paired Client (Instant 1-Click)

On subsequent connections, the client reconnects automatically without requiring button confirmation:

```text
client: HELLO3 <16-hex-client-id> <32-hex-client-nonce>
device: CHALLENGE3 <32-hex-device-nonce> <64-hex-device-proof>
# Browser verifies the device proof before sending AUTH3 or any transfer text.
client: AUTH3 <64-hex-client-proof>
device: OK AUTH3
```

If the client ID is not recognized (e.g. after a factory reset):
```text
device: ERR UNPAIRED Client not recognized
```
The browser preserves the saved key and fails closed. It never automatically downgrades to pairing after a bad proof or `UNPAIRED`. Selecting a different device while a pairing is remembered is also rejected. To deliberately enroll different/reset hardware, explicitly forget the saved pairing first.

Both proofs use HMAC-SHA256 with the **32-character lowercase hexadecimal token encoded as ASCII** as the key. The authenticated UTF-8 messages, without trailing newline, are:

```text
airgap-v3 device <client-id> <client-nonce> <device-nonce>
airgap-v3 client <client-id> <client-nonce> <device-nonce>
```

Nonces are fresh 16-byte random values encoded as 32 lowercase hex characters. Including both nonces prevents replay; distinct roles prevent reflecting a device proof back as a client proof. `PAIR_OK3` uses the same device-proof transcript with the newly generated key.

Upgrade the firmware and web app together. Firmware rejects the legacy `HELLO`, `AUTH`, and `PAIR` commands. Existing NVS keys remain usable with v3; the browser migrates an old single-key storage record only after successful mutual verification.

## 3. Unpairing & Factory Reset

- **Client unpair** (requires an authenticated session for `<16-hex-client-id>`):
  ```text
  client: UNPAIR <16-hex-client-id>
  device: OK UNPAIR
  ```
- **Hardware factory reset**:
  Holding the BOOT or D1 button for **5 seconds** clears all paired clients from internal NVS storage and flashes the LED rapidly.

## 4. Transfer & Typing Session

Once authenticated (`OK AUTH3` or `PAIR_OK3`), the session operates as follows:

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
device: PROGRESS <id> <typed-codepoints> <total-codepoints>
device: DONE <id>
# Pressing BOOT or D1/GPIO2 again while typing immediately releases keys and aborts:
device: ERR ABORTED Typing cancelled on device
```

Errors use `ERR <CODE> <detail>`. An authenticated browser sends `PING` every 20 seconds and expects `PONG`; this refreshes the five-minute authentication idle timer and detects a lost GATT link. Every transfer declares a typing mode and target keyboard. `ascii` accepts printable US ASCII only; `linux`, `macos`, and `windows` accept valid printable UTF-8. Linux uses `Ctrl+Shift+U`, macOS uses Unicode Hex Input, and Windows uses the EnableHexNumpad Alt+plus sequence. The host must have the corresponding input method enabled. `text` also accepts LF line breaks and Tab, which are typed as Enter and Tab keys within the transferred text. Both modes accept at most 16 KB per transfer. Neither mode adds an automatic Enter after the payload. DATA chunks must be sequential and the complete payload must match both the declared length and SHA-256 digest.

The browser serializes uploads, sends at most 120 payload bytes per DATA frame and waits for READY before considering an upload verified. READY, TYPING and DONE may arrive before the corresponding write promise settles; the browser must never regress an advanced state. It allows five minutes for physical confirmation, then uses a 90-second inactivity timeout refreshed only by advancing, valid PROGRESS. There is no fixed ten-minute transfer cap. Timeout, upload failure and explicit disconnect close BLE, which clears the firmware session and releases pressed keys. DONE reports completion of the keyboard sequence; it cannot verify the text inside the host application.
