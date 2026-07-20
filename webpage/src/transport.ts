export type TransferStage = "disconnected" | "connecting" | "connected" | "queued" | "awaiting-confirmation" | "transferred" | "error";

export type TransferMode = "command" | "text";
export type TransferPayload = { text: string; language: string; byteLength: number; mode: TransferMode };
export type DeviceInfo = { name: string; simulated: boolean };

export interface TransferTransport {
  connect(secret?: string): Promise<DeviceInfo>;
  queue(payload: TransferPayload): Promise<void>;
  awaitConfirmation(): Promise<void>;
  confirm(): Promise<void>;
  disconnect(): void;
  getState(): TransferStage;
  setStateListener?(listener?: (stage: TransferStage, message?: string) => void): void;
}

export const AIRGAP_SERVICE_UUID = "7b7d0001-7a6f-4b4d-9f71-6a14e7a1c001";
export const AIRGAP_RX_UUID = "7b7d0002-7a6f-4b4d-9f71-6a14e7a1c001";
export const AIRGAP_TX_UUID = "7b7d0003-7a6f-4b4d-9f71-6a14e7a1c001";
export const MAX_TRANSFER_BYTES = 16 * 1024;
const HEARTBEAT_INTERVAL_MS = 20_000;
const HEARTBEAT_TIMEOUT_MS = 10_000;

const encoder = new TextEncoder();
const decoder = new TextDecoder();

function withTimeout<T>(operation: Promise<T>, timeoutMs: number, message: string): Promise<T> {
  return new Promise((resolve, reject) => {
    const timer = window.setTimeout(() => reject(new Error(message)), timeoutMs);
    operation.then(
      (value) => { window.clearTimeout(timer); resolve(value); },
      (error) => { window.clearTimeout(timer); reject(error); },
    );
  });
}

type BluetoothCharacteristicLike = {
  value?: DataView;
  startNotifications(): Promise<BluetoothCharacteristicLike>;
  addEventListener(type: "characteristicvaluechanged", listener: EventListener): void;
  writeValueWithResponse?(value: BufferSource): Promise<void>;
  writeValue(value: BufferSource): Promise<void>;
};

type BluetoothServiceLike = {
  getCharacteristic(uuid: string): Promise<BluetoothCharacteristicLike>;
};

type BluetoothGattServerLike = {
  getPrimaryService(uuid: string): Promise<BluetoothServiceLike>;
  disconnect(): void;
};

type BluetoothDeviceLike = EventTarget & {
  name?: string;
  gatt?: {
    connected: boolean;
    connect(): Promise<BluetoothGattServerLike>;
    disconnect(): void;
  };
};

type BluetoothNavigatorLike = {
  requestDevice(options: { filters: Array<{ services: string[] }> }): Promise<BluetoothDeviceLike>;
};

function bluetoothApi(): BluetoothNavigatorLike | undefined {
  return (navigator as Navigator & { bluetooth?: BluetoothNavigatorLike }).bluetooth;
}

function bytesToHex(bytes: Uint8Array): string {
  return Array.from(bytes, (byte) => byte.toString(16).padStart(2, "0")).join("");
}

function bytesToBase64(bytes: Uint8Array): string {
  let binary = "";
  for (const byte of bytes) binary += String.fromCharCode(byte);
  return btoa(binary);
}

async function sha256Hex(bytes: Uint8Array): Promise<string> {
  return bytesToHex(new Uint8Array(await crypto.subtle.digest("SHA-256", bytes)));
}

async function hmacHex(secret: string, challengeHex: string): Promise<string> {
  const key = await crypto.subtle.importKey("raw", encoder.encode(secret), { name: "HMAC", hash: "SHA-256" }, false, ["sign"]);
  const challenge = Uint8Array.from(challengeHex.match(/.{2}/g) ?? [], (pair) => Number.parseInt(pair, 16));
  return bytesToHex(new Uint8Array(await crypto.subtle.sign("HMAC", key, challenge)));
}

export function validateTransferText(text: string, mode: TransferMode = "command"): Uint8Array {
  const bytes = encoder.encode(text);
  if (!text.trim()) throw new Error("Add text before queuing a transfer.");
  if (bytes.length > MAX_TRANSFER_BYTES) throw new Error(`The prototype accepts at most ${MAX_TRANSFER_BYTES} bytes per transfer.`);
  for (const byte of bytes) {
    const isTextWhitespace = mode === "text" && (byte === 0x09 || byte === 0x0a);
    if (!isTextWhitespace && (byte < 0x20 || byte > 0x7e)) {
      if (mode === "command") throw new Error("Commands must be one line of printable US-ASCII text.");
      throw new Error("Text supports printable US-ASCII characters, line breaks, and tabs only.");
    }
  }
  return bytes;
}

export class SimulatedTransport implements TransferTransport {
  private stage: TransferStage = "disconnected";
  private stateListener?: (stage: TransferStage, message?: string) => void;
  async connect(): Promise<DeviceInfo> { this.updateStage("connected"); return { name: "AirGap Paste · Simulator", simulated: true }; }
  async queue(payload: TransferPayload): Promise<void> {
    if (this.stage !== "connected" && this.stage !== "transferred") throw new Error("Connect a device before queuing a transfer.");
    validateTransferText(payload.text, payload.mode);
    this.updateStage("queued");
  }
  async awaitConfirmation(): Promise<void> {
    if (this.stage !== "queued") throw new Error("No transfer is queued.");
    this.updateStage("awaiting-confirmation");
  }
  async confirm(): Promise<void> {
    if (this.stage !== "awaiting-confirmation") throw new Error("The device is not awaiting confirmation.");
    this.updateStage("transferred");
  }
  disconnect() { this.updateStage("disconnected"); }
  getState() { return this.stage; }
  setStateListener(listener?: (stage: TransferStage, message?: string) => void) { this.stateListener = listener; }
  private updateStage(stage: TransferStage, message?: string) { this.stage = stage; this.stateListener?.(stage, message); }
}

type MessageWaiter = {
  predicate: (message: string) => boolean;
  resolve: (message: string) => void;
  reject: (error: Error) => void;
  timer: number;
};

export class WebBluetoothTransport implements TransferTransport {
  private stage: TransferStage = "disconnected";
  private device?: BluetoothDeviceLike;
  private rx?: BluetoothCharacteristicLike;
  private tx?: BluetoothCharacteristicLike;
  private transferId = "";
  private inbox: string[] = [];
  private waiters: MessageWaiter[] = [];
  private pendingError?: Error;
  private stateListener?: (stage: TransferStage, message?: string) => void;
  private heartbeatTimer?: number;
  private heartbeatInFlight = false;

  async connect(secret = ""): Promise<DeviceInfo> {
    const bluetooth = bluetoothApi();
    if (!bluetooth) throw new Error("Web Bluetooth is unavailable. Use Chrome or Edge on HTTPS or localhost.");
    if (secret.length < 12) throw new Error("Enter the device key (at least 12 characters) before connecting.");
    this.stage = "connecting";
    try {
      this.device = await bluetooth.requestDevice({ filters: [{ services: [AIRGAP_SERVICE_UUID] }] });
      const service = await this.openAirGapService();
      this.rx = await withTimeout(
        service.getCharacteristic(AIRGAP_RX_UUID),
        10_000,
        "The AirGap Paste command channel was not found.",
      );
      this.tx = await withTimeout(
        service.getCharacteristic(AIRGAP_TX_UUID),
        10_000,
        "The AirGap Paste response channel was not found.",
      );
      await withTimeout(
        this.tx.startNotifications(),
        10_000,
        "AirGap Paste notifications could not be enabled. Reset the device and reconnect it.",
      );
      this.tx.addEventListener("characteristicvaluechanged", this.onNotification);
      this.device.addEventListener("gattserverdisconnected", this.onDisconnected);

      await this.write("HELLO");
      const challengeMessage = await this.waitFor((message) => message.startsWith("CHALLENGE "), 10_000);
      const challenge = challengeMessage.slice("CHALLENGE ".length);
      if (!/^[0-9a-f]{32}$/.test(challenge)) throw new Error("The device returned an invalid authentication challenge.");
      await this.write(`AUTH ${await hmacHex(secret, challenge)}`);
      await this.waitFor((message) => message === "OK AUTH", 10_000);
      this.stage = "connected";
      this.startHeartbeat();
      return { name: this.device.name || "AirGap Paste", simulated: false };
    } catch (error) {
      this.stage = "error";
      this.device?.gatt?.disconnect();
      if (this.isGattDisconnected(error)) {
        throw new Error("AirGap Paste is paired, but its Bluetooth link is asleep or disconnected. Wake the device, then connect again.");
      }
      throw error;
    }
  }

  async queue(payload: TransferPayload): Promise<void> {
    if (this.stage !== "connected" && this.stage !== "transferred") throw new Error("Connect a device before queuing a transfer.");
    const bytes = validateTransferText(payload.text, payload.mode);
    this.transferId = bytesToHex(crypto.getRandomValues(new Uint8Array(4)));
    const digest = await sha256Hex(bytes);
    await this.write(`QUEUE ${this.transferId} ${bytes.length} ${digest} ${payload.mode}`);
    for (let offset = 0; offset < bytes.length; offset += 120) {
      const chunk = bytes.slice(offset, offset + 120);
      await this.write(`DATA ${this.transferId} ${offset} ${bytesToBase64(chunk)}`);
    }
    await this.write(`COMMIT ${this.transferId}`);
    this.stage = "queued";
  }

  async awaitConfirmation(): Promise<void> {
    if (this.stage !== "queued") throw new Error("No transfer is queued.");
    await this.waitFor((message) => message === `READY ${this.transferId}`, 15_000);
    this.stage = "awaiting-confirmation";
  }

  async confirm(): Promise<void> {
    if (this.stage !== "awaiting-confirmation") throw new Error("The device is not awaiting confirmation.");
    await this.waitFor((message) => message === `DONE ${this.transferId}`, 180_000);
    this.stage = "transferred";
  }

  disconnect() {
    this.device?.removeEventListener("gattserverdisconnected", this.onDisconnected);
    this.device?.gatt?.disconnect();
    this.reset(new Error("Bluetooth device disconnected."));
  }

  getState() { return this.stage; }
  setStateListener(listener?: (stage: TransferStage, message?: string) => void) { this.stateListener = listener; }

  private async openAirGapService(): Promise<BluetoothServiceLike> {
    let server = await this.connectGatt();
    try {
      return await this.getAirGapService(server);
    } catch (error) {
      // Chrome can return a previously paired device before its GATT channel has
      // resumed. Reopen the channel once instead of trying to query services on a
      // disconnected server object.
      if (!this.isGattDisconnected(error)) throw error;
      server = await this.connectGatt();
      try {
        return await this.getAirGapService(server);
      } catch (retryError) {
        if (this.isGattDisconnected(retryError)) {
          throw new Error("AirGap Paste did not keep its Bluetooth connection open. Wake or reset the device, then connect again.");
        }
        throw retryError;
      }
    }
  }

  private async connectGatt(): Promise<BluetoothGattServerLike> {
    const gatt = this.device?.gatt;
    if (!gatt) throw new Error("The selected Bluetooth device has no GATT server.");
    // A previously paired device may still expose an old connected GATT object.
    // Start each explicit connection attempt from a fresh server session.
    if (gatt.connected) gatt.disconnect();
    const server = await withTimeout(
      gatt.connect(),
      15_000,
      "Bluetooth connection timed out. Make sure AirGap Paste is powered, then reset it and try again.",
    );
    if (!gatt.connected) throw new Error("AirGap Paste disconnected before Bluetooth services could be opened. Wake it and try again.");
    return server;
  }

  private getAirGapService(server: BluetoothGattServerLike): Promise<BluetoothServiceLike> {
    return withTimeout(
      server.getPrimaryService(AIRGAP_SERVICE_UUID),
      10_000,
      "AirGap Paste connected, but its BLE service was not found. Reset the device and reconnect it.",
    );
  }

  private isGattDisconnected(error: unknown): boolean {
    return error instanceof Error && /GATT Server is disconnected|GATT.*disconnected/i.test(error.message);
  }

  private startHeartbeat() {
    window.clearInterval(this.heartbeatTimer);
    this.heartbeatTimer = window.setInterval(() => { void this.sendHeartbeat(); }, HEARTBEAT_INTERVAL_MS);
  }

  private async sendHeartbeat() {
    if (this.heartbeatInFlight || !["connected", "queued", "awaiting-confirmation", "transferred"].includes(this.stage)) return;
    this.heartbeatInFlight = true;
    try {
      await this.write("PING");
      await this.waitFor((message) => message === "PONG", HEARTBEAT_TIMEOUT_MS);
    } catch {
      this.device?.gatt?.disconnect();
      this.reset(new Error("AirGap Paste stopped responding to its Bluetooth heartbeat. Reconnect the device before continuing."), "error");
    } finally {
      this.heartbeatInFlight = false;
    }
  }

  private onNotification = (event: Event) => {
    const characteristic = event.target as BluetoothCharacteristicLike;
    if (!characteristic.value) return;
    this.deliver(decoder.decode(characteristic.value.buffer.slice(characteristic.value.byteOffset, characteristic.value.byteOffset + characteristic.value.byteLength)));
  };

  private onDisconnected = () => this.reset(
    new Error("Bluetooth connection was lost. Reconnect AirGap Paste before queuing a transfer."),
    "error",
  );

  private deliver(message: string) {
    if (message.startsWith("ERR ")) {
      const error = new Error(message.slice(4));
      const waiters = this.waiters.splice(0);
      for (const waiter of waiters) { window.clearTimeout(waiter.timer); waiter.reject(error); }
      if (!waiters.length) this.pendingError = error;
      return;
    }
    const waiterIndex = this.waiters.findIndex((waiter) => waiter.predicate(message));
    if (waiterIndex >= 0) {
      const [waiter] = this.waiters.splice(waiterIndex, 1);
      window.clearTimeout(waiter.timer);
      waiter.resolve(message);
    } else {
      this.inbox.push(message);
    }
  }

  private waitFor(predicate: (message: string) => boolean, timeoutMs: number): Promise<string> {
    if (this.pendingError) {
      const error = this.pendingError;
      this.pendingError = undefined;
      return Promise.reject(error);
    }
    const existingIndex = this.inbox.findIndex(predicate);
    if (existingIndex >= 0) return Promise.resolve(this.inbox.splice(existingIndex, 1)[0]);
    return new Promise((resolve, reject) => {
      const waiter: MessageWaiter = {
        predicate,
        resolve,
        reject,
        timer: window.setTimeout(() => {
          this.waiters = this.waiters.filter((candidate) => candidate !== waiter);
          reject(new Error("The device did not respond before the timeout."));
        }, timeoutMs),
      };
      this.waiters.push(waiter);
    });
  }

  private async write(message: string) {
    if (!this.rx) throw new Error("Bluetooth command channel is unavailable.");
    const value = encoder.encode(message);
    if (this.rx.writeValueWithResponse) await this.rx.writeValueWithResponse(value);
    else await this.rx.writeValue(value);
  }

  private reset(error: Error, nextStage: TransferStage = "disconnected") {
    window.clearInterval(this.heartbeatTimer);
    this.heartbeatTimer = undefined;
    this.heartbeatInFlight = false;
    this.stage = nextStage;
    this.rx = undefined;
    this.tx = undefined;
    this.inbox = [];
    this.pendingError = undefined;
    const waiters = this.waiters.splice(0);
    for (const waiter of waiters) { window.clearTimeout(waiter.timer); waiter.reject(error); }
    this.stateListener?.(nextStage, nextStage === "error" ? error.message : undefined);
  }
}
