import { authenticationMessage, bytesToBase64, encoder, randomHex, sha256Hex, signAuthentication, verifyAuthentication, validateTransferText, AIRGAP_SERVICE_UUID, AIRGAP_RX_UUID, AIRGAP_TX_UUID, type DeviceInfo, type TransferPayload, type TransferStage } from "./transfer-protocol";
import { clearSavedPairing, getOrCreateClientId, getSavedPairingToken, savePairingToken } from "./pairing";
export * from "./transfer-protocol";
export * from "./pairing";

export interface TransferTransport {
  connect(): Promise<DeviceInfo>;
  unpair?(): Promise<void>;
  queue(payload: TransferPayload): Promise<void>;
  awaitConfirmation(): Promise<void>;
  confirm(): Promise<void>;
  disconnect(): void;
  getState(): TransferStage;
  setStateListener?(listener?: (stage: TransferStage, message?: string) => void): void;
}

const HEARTBEAT_INTERVAL_MS = 20_000;
const HEARTBEAT_TIMEOUT_MS = 10_000;
const CONFIRMATION_TIMEOUT_MS = 5 * 60_000;
const TYPING_INACTIVITY_MS = 90_000;
const decoder = new TextDecoder();

function withTimeout<T>(operation: Promise<T>, timeoutMs: number, message: string): Promise<T> {
  return new Promise((resolve, reject) => {
    const timer = window.setTimeout(() => reject(new Error(message)), timeoutMs);
    operation.then(
      value => { window.clearTimeout(timer); resolve(value); },
      error => { window.clearTimeout(timer); reject(error); },
    );
  });
}

type BluetoothCharacteristicLike = EventTarget & {
  value?: DataView;
  startNotifications(): Promise<BluetoothCharacteristicLike>;
  writeValueWithResponse?(value: BufferSource): Promise<void>;
  writeValue(value: BufferSource): Promise<void>;
};
type BluetoothServiceLike = { getCharacteristic(uuid: string): Promise<BluetoothCharacteristicLike> };
type BluetoothGattServerLike = { getPrimaryService(uuid: string): Promise<BluetoothServiceLike>; disconnect(): void };
type BluetoothDeviceLike = EventTarget & {
  id: string;
  name?: string;
  gatt?: { connected: boolean; connect(): Promise<BluetoothGattServerLike>; disconnect(): void };
};
type BluetoothNavigatorLike = {
  requestDevice(options: { filters: Array<{ services?: string[]; namePrefix?: string }>; optionalServices: string[] }): Promise<BluetoothDeviceLike>;
};
function bluetoothApi(): BluetoothNavigatorLike | undefined {
  return (navigator as Navigator & { bluetooth?: BluetoothNavigatorLike }).bluetooth;
}

export class SimulatedTransport implements TransferTransport {
  private stage: TransferStage = "disconnected";
  private generation = 0;
  private stateListener?: (stage: TransferStage, message?: string) => void;
  async connect(): Promise<DeviceInfo> { this.updateStage("connected"); return { name: "AirGap Paste · Simulator", simulated: true }; }
  async unpair(): Promise<void> { clearSavedPairing(); }
  async queue(payload: TransferPayload): Promise<void> {
    if (this.stage !== "connected" && this.stage !== "transferred") throw new Error("Connect a device before queuing a transfer.");
    validateTransferText(payload.text, payload.mode, payload.keyboardTarget);
    this.updateStage("queued");
  }
  async awaitConfirmation(): Promise<void> {
    if (this.stage !== "queued") throw new Error("No transfer is queued.");
    this.updateStage("awaiting-confirmation");
  }
  async confirm(): Promise<void> {
    if (this.stage !== "awaiting-confirmation") throw new Error("The device is not awaiting confirmation.");
    this.updateStage("typing");
    const generation = this.generation;
    await new Promise((resolve) => window.setTimeout(resolve, 300));
    if (generation !== this.generation) throw new Error("Transfer cancelled.");
    this.updateStage("transferred");
  }
  disconnect() { this.generation++; this.updateStage("disconnected"); }
  getState() { return this.stage; }
  setStateListener(listener?: (stage: TransferStage, message?: string) => void) { this.stateListener = listener; }
  private updateStage(stage: TransferStage, message?: string) { this.stage = stage; this.stateListener?.(stage, message); }
}

type MessageWaiter = {
  predicate: (message: string) => boolean;
  resolve: (message: string) => void;
  reject: (error: Error) => void;
  timer: number;
  refresh?: () => void;
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
  private transferInFlight = false;
  private session = 0;
  private totalCodepoints = 0;
  private typedCodepoints = 0;
  private writeChain: Promise<void> = Promise.resolve();

  async connect(): Promise<DeviceInfo> {
    const bluetooth = bluetoothApi();
    if (!bluetooth) throw new Error("Web Bluetooth is unavailable. Use Chrome or Edge on HTTPS or localhost.");
    this.disconnect();
    const session = this.session;
    this.updateStage("connecting");
    try {
      const device = await bluetooth.requestDevice({
        filters: [
          { services: [AIRGAP_SERVICE_UUID] },
          { namePrefix: "AirGap" },
        ],
        optionalServices: [AIRGAP_SERVICE_UUID],
      });
      this.assertSession(session);
      this.device = device;
      if (!device.id) throw new Error("The browser did not provide a Bluetooth device identity.");
      const service = await this.openAirGapService(device);
      this.assertSession(session);
      const rx = await withTimeout(
        service.getCharacteristic(AIRGAP_RX_UUID),
        10_000,
        "The AirGap Paste command channel was not found.",
      );
      this.assertSession(session);
      const tx = await withTimeout(
        service.getCharacteristic(AIRGAP_TX_UUID),
        10_000,
        "The AirGap Paste response channel was not found.",
      );
      this.assertSession(session);
      await withTimeout(
        tx.startNotifications(),
        10_000,
        "AirGap Paste notifications could not be enabled. Reset the device and reconnect it.",
      );
      this.assertSession(session);
      this.rx = rx;
      this.tx = tx;
      tx.addEventListener("characteristicvaluechanged", this.onNotification);
      device.addEventListener("gattserverdisconnected", this.onDisconnected);

      await this.authenticate(session);
      this.assertSession(session);
      this.updateStage("connected");
      this.startHeartbeat();
      return { name: this.device.name || "AirGap Paste", simulated: false };
    } catch (error) {
      if (session === this.session) this.close(error instanceof Error ? error : new Error("Bluetooth connection failed."), "error");
      if (this.isGattDisconnected(error)) {
        throw new Error("AirGap Paste is paired, but its Bluetooth link is asleep or disconnected. Wake the device, then connect again.");
      }
      throw error;
    }
  }

  private async authenticate(session: number): Promise<void> {
    const clientId = getOrCreateClientId();
    const clientNonce = randomHex(16);
    const deviceId = this.device!.id;
    const savedToken = getSavedPairingToken(deviceId);
    if (!savedToken && getSavedPairingToken()) {
      throw new Error("The selected device is not your remembered AirGap Paste. Select the original device, or explicitly forget the saved pairing before authorizing different hardware.");
    }
    if (savedToken) {
      await this.write(`HELLO3 ${clientId} ${clientNonce}`);
      const response = await this.waitFor(msg => msg.startsWith("CHALLENGE3 ") || msg.startsWith("ERR UNPAIRED"), 10_000);
      if (response.startsWith("ERR ")) {
        throw new Error("This device no longer recognizes its saved key. Update its firmware if needed, then explicitly forget the pairing before pairing again.");
      }
      const [, deviceNonce, proof, extra] = response.split(" ");
      if (extra || !await verifyAuthentication(savedToken, authenticationMessage("device", clientId, clientNonce, deviceNonce), proof)) {
        throw new Error("Device identity verification failed. No text was sent. Check that you selected your AirGap Paste.");
      }
      this.assertSession(session);
      const clientProof = await signAuthentication(savedToken, authenticationMessage("client", clientId, clientNonce, deviceNonce));
      await this.write(`AUTH3 ${clientProof}`);
      await this.waitFor(msg => msg === "OK AUTH3", 10_000);
      this.assertSession(session);
      // A legacy v2 token is pinned only after successful mutual verification.
      savePairingToken(savedToken, deviceId);
      return;
    }
    await this.write(`PAIR3 ${clientId} ${clientNonce}`);
    await this.waitFor(msg => msg === "PAIR_WAIT 30", 10_000);
    this.assertSession(session);
    this.updateStage("pairing", "Press the button on your AirGap Paste to authorize first-time pairing.");
    const response = await this.waitFor(msg => msg.startsWith("PAIR_OK3 "), 35_000);
    const [, token, deviceNonce, proof, extra] = response.split(" ");
    if (extra || !/^[0-9a-f]{32}$/.test(token) || !await verifyAuthentication(token, authenticationMessage("device", clientId, clientNonce, deviceNonce), proof)) {
      throw new Error("Invalid pairing response. Update the device firmware and reconnect.");
    }
    this.assertSession(session);
    savePairingToken(token, deviceId);
  }

  async unpair(): Promise<void> {
    const clientId = getOrCreateClientId();
    clearSavedPairing(this.device?.id);
    if (this.rx && ["connected", "queued", "awaiting-confirmation", "transferred"].includes(this.stage)) {
      try {
        await this.write(`UNPAIR ${clientId}`);
        await this.waitFor((msg) => msg === "OK UNPAIR", 3000);
      } catch {
        // Best effort
      }
    }
  }

  async queue(payload: TransferPayload): Promise<void> {
    if (this.transferInFlight || (this.stage !== "connected" && this.stage !== "transferred")) throw new Error("Connect a device and finish the current transfer before queuing another.");
    const bytes = validateTransferText(payload.text, payload.mode, payload.keyboardTarget);
    const transferId = randomHex(4);
    const session = this.session;
    this.transferId = transferId;
    this.totalCodepoints = Array.from(decoder.decode(bytes)).length;
    this.typedCodepoints = 0;
    this.inbox = [];
    this.pendingError = undefined;
    this.transferInFlight = true;
    this.updateStage("queued");
    try {
      const digest = await sha256Hex(bytes);
      this.assertSession(session);
      await this.write(`QUEUE ${transferId} ${bytes.length} ${digest} ${payload.mode} ${payload.keyboardTarget}`);
      const totalChunks = Math.ceil(bytes.length / 120);
      for (let offset = 0, chunkIndex = 1; offset < bytes.length; offset += 120, chunkIndex += 1) {
        const chunk = bytes.slice(offset, offset + 120);
        await this.write(`DATA ${transferId} ${offset} ${bytesToBase64(chunk)}`);
        if (totalChunks > 2) {
          const pct = Math.round((Math.min(offset + 120, bytes.length) / bytes.length) * 100);
          this.stateListener?.("queued", `Uploading buffer… ${pct}% (${chunkIndex}/${totalChunks} chunks)`);
        }
      }
      await this.write(`COMMIT ${transferId}`);
      await this.waitFor(message => message === `READY ${transferId}`, 15_000);
      this.assertSession(session);
      // A physical press can already have advanced the device to TYPING/DONE.
      if (this.getState() === "queued") this.updateStage("awaiting-confirmation");
    } catch (error) {
      if (session === this.session) this.close(error instanceof Error ? error : new Error("Transfer failed."), "error");
      throw error;
    } finally {
      if (session === this.session) this.transferInFlight = false;
    }
  }

  async awaitConfirmation(): Promise<void> {
    if (!["awaiting-confirmation", "typing", "transferred"].includes(this.stage)) throw new Error("No verified transfer is queued.");
  }

  async confirm(): Promise<void> {
    if (!["awaiting-confirmation", "typing", "transferred"].includes(this.stage)) throw new Error("The device is not awaiting confirmation.");
    const session = this.session;
    const transferId = this.transferId;
    try {
      await this.waitFor(message => message === `DONE ${transferId}`, this.stage === "typing" ? TYPING_INACTIVITY_MS : CONFIRMATION_TIMEOUT_MS, true);
      this.assertSession(session);
      this.updateStage("transferred");
    } catch (error) {
      // Disconnecting also stops the firmware: never leave it typing after a UI timeout.
      if (session === this.session) this.close(error instanceof Error ? error : new Error("Transfer stopped responding."), "error");
      throw error;
    }
  }

  disconnect() {
    this.close(new Error("Bluetooth device disconnected."));
  }

  getState() { return this.stage; }
  setStateListener(listener?: (stage: TransferStage, message?: string) => void) { this.stateListener = listener; }

  private async openAirGapService(device: BluetoothDeviceLike): Promise<BluetoothServiceLike> {
    let server = await this.connectGatt(device);
    try {
      return await this.getAirGapService(server);
    } catch (error) {
      // Chrome can return a previously paired device before its GATT channel has
      // resumed. Reopen the channel once instead of trying to query services on a
      // disconnected server object.
      if (!this.isGattDisconnected(error)) throw error;
      server = await this.connectGatt(device);
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

  private async connectGatt(device: BluetoothDeviceLike): Promise<BluetoothGattServerLike> {
    const gatt = device.gatt;
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
    if (
      this.heartbeatInFlight ||
      this.transferInFlight ||
      !["connected", "queued", "awaiting-confirmation", "typing", "transferred"].includes(this.stage)
    ) {
      return;
    }
    this.heartbeatInFlight = true;
    const session = this.session;
    try {
      await this.write("PING");
      await this.waitFor((message) => message === "PONG", HEARTBEAT_TIMEOUT_MS);
    } catch {
      if (session === this.session) this.close(new Error("AirGap Paste stopped responding to its Bluetooth heartbeat. Reconnect the device before continuing."), "error");
    } finally {
      if (session === this.session) this.heartbeatInFlight = false;
    }
  }

  private onNotification = (event: Event) => {
    const characteristic = event.target as BluetoothCharacteristicLike;
    if (!characteristic.value) return;
    this.deliver(decoder.decode(characteristic.value));
  };

  private onDisconnected = () => this.close(
    new Error("Bluetooth connection was lost. Reconnect AirGap Paste before queuing a transfer."),
    "error",
  );

  private deliver(message: string) {
    if (message.startsWith("ERR ")) {
      const waiterIndex = this.waiters.findIndex((waiter) => waiter.predicate(message));
      if (waiterIndex >= 0) {
        const [waiter] = this.waiters.splice(waiterIndex, 1);
        window.clearTimeout(waiter.timer);
        waiter.resolve(message);
        return;
      }
      const error = new Error(message.slice(4));
      const waiters = this.waiters.splice(0);
      for (const waiter of waiters) { window.clearTimeout(waiter.timer); waiter.reject(error); }
      this.pendingError = error;
      return;
    }
    if (message.startsWith("TYPING ")) {
      const typingId = message.slice("TYPING ".length).trim();
      if (typingId === this.transferId && ["queued", "awaiting-confirmation"].includes(this.stage)) {
        this.updateStage("typing");
        for (const waiter of this.waiters) waiter.refresh?.();
      }
      return;
    }
    if (message.startsWith("PROGRESS ")) {
      const [, progressId, typedRaw, totalRaw] = message.trim().split(/\s+/);
      if (progressId === this.transferId && this.stage === "typing") {
        const typed = Number(typedRaw);
        const total = Number(totalRaw);
        if (Number.isInteger(typed) && total === this.totalCodepoints && typed > this.typedCodepoints && typed <= total) {
          this.typedCodepoints = typed;
          for (const waiter of this.waiters) waiter.refresh?.();
          const pct = Math.round((typed / total) * 100);
          this.stateListener?.("typing", `Typing progress: ${pct}% (${typed}/${total} chars)`);
        }
      }
      return;
    }
    if (message === `DONE ${this.transferId}` && this.transferId) this.updateStage("transferred");
    const waiterIndex = this.waiters.findIndex((waiter) => waiter.predicate(message));
    if (waiterIndex >= 0) {
      const [waiter] = this.waiters.splice(waiterIndex, 1);
      window.clearTimeout(waiter.timer);
      waiter.resolve(message);
    } else {
      if (this.inbox.length >= 64) {
        this.close(new Error("The device sent too many unexpected responses."), "error");
        return;
      }
      this.inbox.push(message);
    }
  }

  private waitFor(predicate: (message: string) => boolean, timeoutMs: number, refreshOnProgress = false): Promise<string> {
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
        timer: 0,
      };
      const armTimer = (duration: number) => {
        window.clearTimeout(waiter.timer);
        waiter.timer = window.setTimeout(() => {
          this.waiters = this.waiters.filter((candidate) => candidate !== waiter);
          reject(new Error("The device did not respond before the timeout."));
        }, duration);
      };
      if (refreshOnProgress) waiter.refresh = () => armTimer(TYPING_INACTIVITY_MS);
      armTimer(timeoutMs);
      this.waiters.push(waiter);
    });
  }

  private write(message: string): Promise<void> {
    const session = this.session;
    const rx = this.rx;
    const nextWrite = this.writeChain.then(async () => {
      this.assertSession(session);
      if (this.pendingError) throw this.pendingError;
      if (!rx) throw new Error("Bluetooth command channel is unavailable.");
      const value = encoder.encode(message);
      await withTimeout(rx.writeValueWithResponse ? rx.writeValueWithResponse(value) : rx.writeValue(value), 10_000, "The Bluetooth write timed out. Reconnect the device.");
      this.assertSession(session);
      if (this.pendingError) throw this.pendingError;
    });
    this.writeChain = nextWrite.catch(() => {});
    return nextWrite;
  }

  private updateStage(stage: TransferStage, message?: string) {
    this.stage = stage;
    this.stateListener?.(stage, message);
  }

  private assertSession(session: number) {
    if (session !== this.session) throw new Error("Bluetooth operation cancelled.");
  }

  private close(error: Error, nextStage: TransferStage = "disconnected") {
    this.session++;
    this.tx?.removeEventListener("characteristicvaluechanged", this.onNotification);
    this.device?.removeEventListener("gattserverdisconnected", this.onDisconnected);
    try { this.device?.gatt?.disconnect(); } catch { /* The link may already be gone. */ }
    window.clearInterval(this.heartbeatTimer);
    this.heartbeatTimer = undefined;
    this.heartbeatInFlight = false;
    this.transferInFlight = false;
    this.writeChain = Promise.resolve();
    this.stage = nextStage;
    this.rx = undefined;
    this.tx = undefined;
    this.transferId = "";
    this.inbox = [];
    this.pendingError = undefined;
    const waiters = this.waiters.splice(0);
    for (const waiter of waiters) { window.clearTimeout(waiter.timer); waiter.reject(error); }
    this.stateListener?.(nextStage, nextStage === "error" ? error.message : undefined);
  }
}
