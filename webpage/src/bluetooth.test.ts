import { createHash, createHmac } from "node:crypto";
import { afterEach, describe, expect, it, vi } from "vitest";
import { AIRGAP_RX_UUID, WebBluetoothTransport, getOrCreateClientId, getSavedPairingToken, savePairingToken, type TransferPayload } from "./transport";

const token = "0123456789abcdef0123456789abcdef";
const deviceNonce = "11".repeat(16);
const payload = (text = "echo ready"): TransferPayload => ({ text, language: "text", byteLength: text.length, mode: "command", keyboardTarget: "ascii" });
const hmac = (role: string, id: string, nonce: string) => createHmac("sha256", token).update(`airgap-v3 ${role} ${id} ${nonce} ${deviceNonce}`).digest("hex");

class Characteristic extends EventTarget {
  value?: DataView;
  async startNotifications() { return this; }
  emit(message: string) {
    const bytes = new TextEncoder().encode(message);
    this.value = new DataView(bytes.buffer);
    this.dispatchEvent(new Event("characteristicvaluechanged"));
  }
}

function peripheral(options: { badProof?: boolean; replayProof?: string; earlyTyping?: boolean; earlyDone?: boolean; rejectQueue?: boolean; unpaired?: boolean } = {}) {
  const tx = new Characteristic();
  const frames: string[] = [];
  let clientId = "";
  let clientNonce = "";
  let id = "";
  let expectedLength = 0;
  let expectedDigest = "";
  let buffer = Buffer.alloc(0);
  const receive = async (value: BufferSource) => {
    const message = new TextDecoder().decode(value);
    frames.push(message);
    const parts = message.split(" ");
    switch (parts[0]) {
      case "HELLO3":
        [, clientId, clientNonce] = parts;
        tx.emit(options.unpaired ? "ERR UNPAIRED unknown" : `CHALLENGE3 ${deviceNonce} ${options.replayProof ?? (options.badProof ? "00".repeat(32) : hmac("device", clientId, clientNonce))}`);
        break;
      case "AUTH3":
        expect(parts[1]).toBe(hmac("client", clientId, clientNonce));
        tx.emit("OK AUTH3");
        break;
      case "PAIR3":
        [, clientId, clientNonce] = parts;
        tx.emit("PAIR_WAIT 30");
        tx.emit(`PAIR_OK3 ${token} ${deviceNonce} ${hmac("device", clientId, clientNonce)}`);
        break;
      case "QUEUE":
        if (options.rejectQueue) { tx.emit("ERR NOT_AUTHENTICATED expired"); break; }
        [, id, , expectedDigest] = parts;
        expectedLength = Number(parts[2]);
        buffer = Buffer.alloc(0);
        break;
      case "DATA":
        expect(parts[1]).toBe(id);
        expect(Number(parts[2])).toBe(buffer.length);
        buffer = Buffer.concat([buffer, Buffer.from(parts[3], "base64")]);
        break;
      case "COMMIT":
        expect(buffer.length).toBe(expectedLength);
        expect(createHash("sha256").update(buffer).digest("hex")).toBe(expectedDigest);
        tx.emit(`READY ${id}`);
        if (options.earlyTyping) tx.emit(`TYPING ${id}`);
        if (options.earlyDone) tx.emit(`DONE ${id}`);
        break;
      case "PING": tx.emit("PONG"); break;
      case "UNPAIR": tx.emit("OK UNPAIR"); break;
      default: throw new Error(`Unexpected frame ${parts[0]}`);
    }
  };
  const rx = Object.assign(new Characteristic(), { writeValueWithResponse: vi.fn(receive), writeValue: receive });
  const device = Object.assign(new EventTarget(), {
    id: "browser-device-id", name: "AirGap Paste",
    gatt: {
      connected: false,
      async connect() {
        this.connected = true;
        return { getPrimaryService: async () => ({ getCharacteristic: async (uuid: string) => uuid === AIRGAP_RX_UUID ? rx : tx }), disconnect: () => { this.connected = false; } };
      },
      disconnect() { this.connected = false; },
    },
  });
  Object.defineProperty(navigator, "bluetooth", { configurable: true, value: { requestDevice: async () => device } });
  const transport = new WebBluetoothTransport();
  active.push(transport);
  return { transport, device, tx, rx, frames, get id() { return id; } };
}

const active: WebBluetoothTransport[] = [];
afterEach(() => {
  active.splice(0).forEach(transport => transport.disconnect());
  localStorage.clear();
  vi.useRealTimers();
});

describe("Web Bluetooth protocol", () => {
  it("requires a device proof before sending AUTH or sensitive text", async () => {
    const fake = peripheral({ badProof: true });
    savePairingToken(token, fake.device.id);
    await expect(fake.transport.connect()).rejects.toThrow("identity verification failed");
    expect(fake.frames.map(frame => frame.split(" ")[0])).toEqual(["HELLO3"]);
    expect(getSavedPairingToken(fake.device.id)).toBe(token);
    expect(fake.device.gatt.connected).toBe(false);
  });

  it("never silently re-pairs when a saved device says UNPAIRED", async () => {
    const fake = peripheral({ unpaired: true });
    savePairingToken(token, fake.device.id);
    await expect(fake.transport.connect()).rejects.toThrow();
    expect(fake.frames.some(frame => frame.startsWith("PAIR3 "))).toBe(false);
    expect(getSavedPairingToken(fake.device.id)).toBe(token);
  });

  it("rejects a different peripheral instead of silently treating it as first-time hardware", async () => {
    const fake = peripheral();
    savePairingToken(token, "original-device");
    await expect(fake.transport.connect()).rejects.toThrow("not your remembered");
    expect(fake.frames).toEqual([]);
  });

  it("supports first pairing and mutually authenticated reconnection", async () => {
    const fake = peripheral();
    await fake.transport.connect();
    expect(getSavedPairingToken(fake.device.id)).toBe(token);
    fake.transport.disconnect();
    await fake.transport.connect();
    const hello = fake.frames.find(frame => frame.startsWith("HELLO3 "))!;
    expect(hello.split(" ")[1]).toBe(getOrCreateClientId());
    expect(fake.frames.some(frame => frame.startsWith("AUTH3 "))).toBe(true);
  });

  it("rejects a previously valid device proof replayed against a fresh client nonce", async () => {
    const options: { replayProof?: string } = {};
    const fake = peripheral(options);
    await fake.transport.connect();
    const [, clientId, originalNonce] = fake.frames[0].split(" ");
    options.replayProof = hmac("device", clientId, originalNonce);
    fake.transport.disconnect();
    await expect(fake.transport.connect()).rejects.toThrow("identity verification failed");
    expect(fake.frames.some(frame => frame.startsWith("AUTH3 "))).toBe(false);
  });

  it("rejects a second upload synchronously and preserves ordered frames", async () => {
    const fake = peripheral();
    await fake.transport.connect();
    const first = fake.transport.queue(payload("first"));
    await expect(fake.transport.queue(payload("second"))).rejects.toThrow("current transfer");
    await first;
    expect(fake.frames.filter(frame => frame.startsWith("QUEUE "))).toHaveLength(1);
    expect(fake.transport.getState()).toBe("awaiting-confirmation");
  });

  it.each([false, true])("does not roll back early physical confirmation (early DONE: %s)", async earlyDone => {
    const fake = peripheral({ earlyTyping: true, earlyDone });
    await fake.transport.connect();
    await fake.transport.queue(payload());
    await fake.transport.awaitConfirmation();
    expect(fake.transport.getState()).toBe(earlyDone ? "transferred" : "typing");
    const done = fake.transport.confirm();
    if (!earlyDone) fake.tx.emit(`DONE ${fake.id}`);
    await done;
    expect(fake.transport.getState()).toBe("transferred");
  });

  it("stops upload immediately if firmware rejects QUEUE", async () => {
    const fake = peripheral({ rejectQueue: true });
    await fake.transport.connect();
    await expect(fake.transport.queue(payload())).rejects.toThrow("NOT_AUTHENTICATED");
    expect(fake.frames.some(frame => frame.startsWith("DATA ") || frame.startsWith("COMMIT "))).toBe(false);
    expect(fake.device.gatt.connected).toBe(false);
    expect(fake.transport.getState()).toBe("error");
  });

  it("does not resume an upload after disconnect during hashing", async () => {
    const fake = peripheral();
    await fake.transport.connect();
    const queued = fake.transport.queue(payload());
    fake.transport.disconnect();
    await expect(queued).rejects.toThrow("cancelled");
    expect(fake.frames.some(frame => frame.startsWith("QUEUE "))).toBe(false);
    expect(fake.transport.getState()).toBe("disconnected");
  });

  it("closes BLE when a GATT write never settles", async () => {
    vi.useFakeTimers();
    const fake = peripheral();
    await fake.transport.connect();
    let markStarted!: () => void;
    const started = new Promise<void>(resolve => { markStarted = resolve; });
    fake.rx.writeValueWithResponse.mockImplementationOnce(() => {
      markStarted();
      return new Promise<void>(() => {});
    });
    const rejected = expect(fake.transport.queue(payload())).rejects.toThrow("write timed out");
    await started;
    await vi.advanceTimersByTimeAsync(10_001);
    await rejected;
    expect(fake.device.gatt.connected).toBe(false);
    expect(fake.transport.getState()).toBe("error");
    expect(fake.frames.some(frame => frame.startsWith("DATA "))).toBe(false);
  });

  it("allows typing for more than ten minutes while valid progress arrives", async () => {
    vi.useFakeTimers();
    const fake = peripheral({ earlyTyping: true });
    await fake.transport.connect();
    await fake.transport.queue({ ...payload("é".repeat(1000)), keyboardTarget: "linux" });
    const done = fake.transport.confirm();
    for (let i = 1; i <= 12; i++) {
      await vi.advanceTimersByTimeAsync(60_000);
      fake.tx.emit(`PROGRESS ${fake.id} ${i * 40} 1000`);
    }
    fake.tx.emit(`DONE ${fake.id}`);
    await done;
    expect(fake.transport.getState()).toBe("transferred");
  });

  it("disconnects the device on stalled typing; duplicate progress cannot extend the timeout", async () => {
    vi.useFakeTimers();
    const fake = peripheral({ earlyTyping: true });
    await fake.transport.connect();
    await fake.transport.queue(payload("a".repeat(1000)));
    const rejected = expect(fake.transport.confirm()).rejects.toThrow("timeout");
    fake.tx.emit(`PROGRESS ${fake.id} 40 1000`);
    await vi.advanceTimersByTimeAsync(60_000);
    fake.tx.emit(`PROGRESS ${fake.id} 40 1000`);
    await vi.advanceTimersByTimeAsync(30_001);
    await rejected;
    expect(fake.device.gatt.connected).toBe(false);
    expect(fake.transport.getState()).toBe("error");
  });
});
