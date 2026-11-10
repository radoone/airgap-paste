import { randomHex } from "./transfer-protocol";

export const CLIENT_ID_KEY = "airgap_client_id";
export const PAIRED_TOKEN_KEY = "airgap_pairing_token";
type Pairing = { id: string; token: string };
type SavedPairings = { version: 3; devices: Pairing[]; legacyToken?: string };
const validToken = (token: unknown): token is string => typeof token === "string" && /^[0-9a-f]{32}$/.test(token);
let fallbackClientId = "";

export function getOrCreateClientId(): string {
  try {
    let id = localStorage.getItem(CLIENT_ID_KEY);
    if (!id || !/^[0-9a-f]{16}$/.test(id)) {
      id = randomHex(8);
      localStorage.setItem(CLIENT_ID_KEY, id);
    }
    return id;
  } catch {
    fallbackClientId ||= randomHex(8);
    return fallbackClientId;
  }
}

function readPairings(): SavedPairings {
  const empty: SavedPairings = { version: 3, devices: [] };
  try {
    const raw = localStorage.getItem(PAIRED_TOKEN_KEY);
    if (validToken(raw)) return { ...empty, legacyToken: raw };
    const value: unknown = JSON.parse(raw ?? "null");
    if (!value || typeof value !== "object" || !("version" in value) || value.version !== 3 || !("devices" in value) || !Array.isArray(value.devices)) return empty;
    return {
      version: 3,
      devices: value.devices.filter((entry): entry is Pairing => Boolean(entry && typeof entry.id === "string" && entry.id.length <= 512 && validToken(entry.token))).slice(-8),
    };
  } catch { return empty; }
}

export function getSavedPairingToken(deviceId?: string): string | null {
  const saved = readPairings();
  return (deviceId ? saved.devices.find(entry => entry.id === deviceId)?.token : saved.devices[0]?.token) ?? saved.legacyToken ?? null;
}

export function savePairingToken(token: string, deviceId: string): void {
  if (!validToken(token) || !deviceId || deviceId.length > 512) throw new Error("The device returned an invalid pairing key.");
  const saved = readPairings();
  saved.devices = [...saved.devices.filter(entry => entry.id !== deviceId), { id: deviceId, token }].slice(-8);
  delete saved.legacyToken;
  try { localStorage.setItem(PAIRED_TOKEN_KEY, JSON.stringify(saved)); } catch { /* This connection remains usable if storage is disabled. */ }
}

export function clearSavedPairing(deviceId?: string): void {
  try {
    if (!deviceId) localStorage.removeItem(PAIRED_TOKEN_KEY);
    else {
      const saved = readPairings();
      saved.devices = saved.devices.filter(entry => entry.id !== deviceId);
      delete saved.legacyToken;
      if (saved.devices.length) localStorage.setItem(PAIRED_TOKEN_KEY, JSON.stringify(saved));
      else localStorage.removeItem(PAIRED_TOKEN_KEY);
    }
  } catch { /* Storage can be disabled by the browser. */ }
}
