import { webcrypto } from "node:crypto";
import { vi } from "vitest";

// Node 24 exposes an optional global localStorage; use the browser storage
// belonging to jsdom's origin instead of depending on a Node command-line flag.
const browserStorage = (globalThis as unknown as { jsdom: { window: { localStorage: Storage } } }).jsdom.window.localStorage;
Object.defineProperty(globalThis, "localStorage", { configurable: true, value: browserStorage });
vi.stubGlobal("crypto", webcrypto);
