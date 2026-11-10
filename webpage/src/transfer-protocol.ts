export type TransferStage = "disconnected" | "connecting" | "pairing" | "connected" | "queued" | "awaiting-confirmation" | "typing" | "transferred" | "error";
export type TransferMode = "command" | "text";
export type KeyboardTarget = "ascii" | "linux" | "macos" | "windows";
export type TransferPayload = { text: string; language: string; byteLength: number; mode: TransferMode; keyboardTarget: KeyboardTarget };
export type DeviceInfo = { name: string; simulated: boolean };

export const AIRGAP_SERVICE_UUID = "7b7d0001-7a6f-4b4d-9f71-6a14e7a1c001";
export const AIRGAP_RX_UUID = "7b7d0002-7a6f-4b4d-9f71-6a14e7a1c001";
export const AIRGAP_TX_UUID = "7b7d0003-7a6f-4b4d-9f71-6a14e7a1c001";
export const MAX_TRANSFER_BYTES = 16 * 1024;
export const encoder = new TextEncoder();

export function bytesToHex(bytes: Uint8Array): string {
  return Array.from(bytes, byte => byte.toString(16).padStart(2, "0")).join("");
}

export function randomHex(byteLength: number): string {
  return bytesToHex(crypto.getRandomValues(new Uint8Array(byteLength)));
}

export function bytesToBase64(bytes: Uint8Array): string {
  let binary = "";
  for (const byte of bytes) binary += String.fromCharCode(byte);
  return btoa(binary);
}

export async function sha256Hex(bytes: Uint8Array<ArrayBuffer>): Promise<string> {
  return bytesToHex(new Uint8Array(await crypto.subtle.digest("SHA-256", bytes)));
}

// Domain separation prevents reflecting a device proof back as a client proof.
// Both nonces and the client identity are authenticated in both directions.
export function authenticationMessage(role: "device" | "client", clientId: string, clientNonce: string, deviceNonce: string): string {
  if (!/^[0-9a-f]{16}$/.test(clientId) || !/^[0-9a-f]{32}$/.test(clientNonce) || !/^[0-9a-f]{32}$/.test(deviceNonce)) {
    throw new Error("Invalid authentication challenge. Update the device firmware and reconnect.");
  }
  return `airgap-v3 ${role} ${clientId} ${clientNonce} ${deviceNonce}`;
}

export async function signAuthentication(token: string, message: string): Promise<string> {
  const key = await crypto.subtle.importKey("raw", encoder.encode(token), { name: "HMAC", hash: "SHA-256" }, false, ["sign"]);
  return bytesToHex(new Uint8Array(await crypto.subtle.sign("HMAC", key, encoder.encode(message))));
}

export async function verifyAuthentication(token: string, message: string, proof: string): Promise<boolean> {
  if (!/^[0-9a-f]{64}$/.test(proof)) return false;
  const signature = Uint8Array.from(proof.match(/../g)!, pair => Number.parseInt(pair, 16));
  const key = await crypto.subtle.importKey("raw", encoder.encode(token), { name: "HMAC", hash: "SHA-256" }, false, ["verify"]);
  return crypto.subtle.verify("HMAC", key, signature, encoder.encode(message));
}

export function validateTransferText(text: string, mode: TransferMode = "command", keyboardTarget: KeyboardTarget = "ascii"): Uint8Array<ArrayBuffer> {
  const normalized = text.replace(/\r\n?/g, "\n");
  const bytes = encoder.encode(normalized);
  if (!normalized.trim()) throw new Error("Add text before queuing a transfer.");
  if (bytes.length > MAX_TRANSFER_BYTES) throw new Error(`The prototype accepts at most ${MAX_TRANSFER_BYTES} bytes per transfer.`);
  for (const symbol of normalized) {
    const codePoint = symbol.codePointAt(0)!;
    const isTextWhitespace = mode === "text" && (codePoint === 0x09 || codePoint === 0x0a);
    const isControl = codePoint < 0x20 || (codePoint >= 0x7f && codePoint <= 0x9f);
    if (isControl && !isTextWhitespace) {
      if (mode === "command") throw new Error("Commands must be one line of printable text.");
      throw new Error("Text supports printable characters, line breaks, and tabs only.");
    }
    if (codePoint >= 0xd800 && codePoint <= 0xdfff) throw new Error("Text contains an incomplete Unicode character.");
    if (keyboardTarget === "ascii" && codePoint > 0x7e) {
      throw new Error("US ASCII output cannot type Unicode characters. Choose Linux, macOS, or Windows Unicode output.");
    }
  }
  return bytes;
}
