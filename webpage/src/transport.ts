export type TransferStage = "disconnected" | "connecting" | "connected" | "queued" | "awaiting-confirmation" | "transferred" | "error";

export type TransferPayload = { text: string; language: string; byteLength: number };
export type DeviceInfo = { name: string; simulated: boolean };

export interface TransferTransport {
  connect(): Promise<DeviceInfo>;
  queue(payload: TransferPayload): Promise<void>;
  awaitConfirmation(): Promise<void>;
  confirm(): Promise<void>;
  disconnect(): void;
  getState(): TransferStage;
}

export class SimulatedTransport implements TransferTransport {
  private stage: TransferStage = "disconnected";
  async connect(): Promise<DeviceInfo> { this.stage = "connected"; return { name: "AirGap Paste · Simulator", simulated: true }; }
  async queue(payload: TransferPayload): Promise<void> {
    if (this.stage !== "connected" && this.stage !== "transferred") throw new Error("Connect a device before queuing a transfer.");
    if (!payload.text.trim()) throw new Error("Add text before queuing a transfer.");
    this.stage = "queued";
  }
  async awaitConfirmation(): Promise<void> {
    if (this.stage !== "queued") throw new Error("No transfer is queued.");
    this.stage = "awaiting-confirmation";
  }
  async confirm(): Promise<void> {
    if (this.stage !== "awaiting-confirmation") throw new Error("The device is not awaiting confirmation.");
    this.stage = "transferred";
  }
  disconnect() { this.stage = "disconnected"; }
  getState() { return this.stage; }
}

// Deliberately not wired to navigator.bluetooth until the hardware GATT protocol is defined.
export class WebBluetoothTransport implements TransferTransport {
  private unsupported(): never { throw new Error("Web Bluetooth requires the AirGap Paste GATT protocol before it can be enabled."); }
  async connect(): Promise<DeviceInfo> { return this.unsupported(); }
  async queue(): Promise<void> { return this.unsupported(); }
  async awaitConfirmation(): Promise<void> { return this.unsupported(); }
  async confirm(): Promise<void> { return this.unsupported(); }
  disconnect() {}
  getState(): TransferStage { return "disconnected"; }
}
