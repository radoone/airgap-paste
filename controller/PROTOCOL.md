# AirGap Paste BLE protocol v1

The device exposes one custom service and two encrypted characteristics:

- Service: `7b7d0001-7a6f-4b4d-9f71-6a14e7a1c001`
- RX, browser to device, write with response: `7b7d0002-7a6f-4b4d-9f71-6a14e7a1c001`
- TX, device to browser, notifications: `7b7d0003-7a6f-4b4d-9f71-6a14e7a1c001`

Every GATT value contains exactly one UTF-8 protocol frame. A normal session is:

```text
client: HELLO
device: CHALLENGE <32 lowercase hex characters>
client: AUTH <HMAC-SHA256(device-key, raw-challenge-bytes) as lowercase hex>
device: OK AUTH
# The browser keeps the authenticated BLE link active while it is open.
client: PING
device: PONG
client: QUEUE <8-hex-id> <byte-length> <sha256-hex> <command|text>
client: DATA <id> <zero-based-byte-offset> <base64-data>
client: COMMIT <id>
device: READY <id>
# User presses BOOT or the D1/GPIO2 SEND button.
device: TYPING <id>
device: DONE <id>
```

Errors use `ERR <CODE> <detail>`. An authenticated browser sends `PING` every 20 seconds and expects `PONG`; this refreshes the five-minute authentication idle timer and detects a lost GATT link. Every transfer must declare its mode: `command` accepts one line of printable US ASCII (`0x20`–`0x7e`), while `text` also accepts LF line breaks and Tab, which are typed as Enter and Tab keys within the transferred text. Both modes accept at most 16 KB per transfer. Neither mode adds an automatic Enter after the payload. DATA chunks must be sequential and the complete payload must match both the declared length and SHA-256 digest.
