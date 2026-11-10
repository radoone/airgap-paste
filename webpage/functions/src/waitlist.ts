import { hash, RateLimitError } from "./rate-limit.js";

type WaitlistRequest = {
  method: string;
  body?: unknown;
  ip?: string;
  rawBody?: Uint8Array;
  header(name: string): string | undefined;
};
type WaitlistResponse = {
  status(code: number): WaitlistResponse;
  set(name: string, value: string): unknown;
  json(value: Record<string, unknown>): unknown;
};
export type WaitlistRecord = { email: string; consentVersion: string; source: string; utm: Record<string, string> };
export type WaitlistDependencies = {
  enforceAppCheck: boolean;
  verifyToken(token: string): Promise<{ exp: number }>;
  reserveQuota(input: { ip: string; token?: string; tokenExpiresAt?: number }): Promise<void>;
  register(id: string, record: WaitlistRecord): Promise<void>;
  logError(error: unknown): void;
};

const allowedUtmKeys = ["utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content"];
function sanitizeUtm(raw: unknown): Record<string, string> {
  if (!raw || typeof raw !== "object" || Array.isArray(raw)) return {};
  const result: Record<string, string> = {};
  for (const key of allowedUtmKeys) {
    const value = (raw as Record<string, unknown>)[key];
    if (typeof value === "string" && value.trim()) result[key] = value.trim().slice(0, 100);
  }
  return result;
}

export function createWaitlistHandler(deps: WaitlistDependencies) {
  return async (request: WaitlistRequest, response: WaitlistResponse): Promise<void> => {
    response.set("Cache-Control", "no-store");
    if (request.method !== "POST") {
      response.set("Allow", "POST");
      response.status(405).json({ error: "Method not allowed." });
      return;
    }
    if (request.header("Content-Type")?.split(";", 1)[0].trim().toLowerCase() !== "application/json") {
      response.status(415).json({ error: "Send a JSON request." });
      return;
    }
    const body = request.body;
    if (!body || typeof body !== "object" || Array.isArray(body)) {
      response.status(400).json({ error: "Enter a valid email and confirm consent." });
      return;
    }
    if ((request.rawBody?.byteLength ?? Buffer.byteLength(JSON.stringify(body))) > 4096) {
      response.status(413).json({ error: "Request is too large." });
      return;
    }
    const { email, consent, website, source, utm } = body as Record<string, unknown>;
    if (website) {
      response.status(200).json({ ok: true });
      return;
    }
    const normalizedEmail = typeof email === "string" ? email.trim().toLowerCase() : "";
    if (!normalizedEmail || normalizedEmail.length > 254 || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(normalizedEmail) || consent !== true) {
      response.status(400).json({ error: "Enter a valid email and confirm consent." });
      return;
    }
    let token: string | undefined;
    let tokenExpiresAt: number | undefined;
    if (deps.enforceAppCheck) {
      token = request.header("X-Firebase-AppCheck");
      if (!token) {
        response.status(401).json({ error: "Verification is required. Please try again." });
        return;
      }
      try { tokenExpiresAt = (await deps.verifyToken(token)).exp; }
      catch {
        response.status(401).json({ error: "Verification failed. Please try again." });
        return;
      }
    }
    try {
      // request.ip comes from the managed runtime; do not trust a header parsed here.
      await deps.reserveQuota({ ip: request.ip ?? "unknown", token, tokenExpiresAt });
      try {
        await deps.register(hash(normalizedEmail), {
          email: normalizedEmail,
          consentVersion: "2026-07-15",
          source: typeof source === "string" && source.trim() ? source.trim().slice(0, 80) : "landing-page",
          utm: sanitizeUtm(utm),
        });
      } catch (error) {
        const code = (error as { code?: number | string })?.code;
        if (code !== 6 && code !== "already-exists") throw error;
      }
      // Identical responses prevent checking whether an address is registered.
      response.status(200).json({ ok: true });
    } catch (error) {
      if (error instanceof RateLimitError) {
        if (!error.replay) response.set("Retry-After", String(error.retryAfter));
        response.status(error.replay ? 401 : 429).json({ error: error.message });
      } else {
        deps.logError(error);
        response.status(503).json({ error: "The waitlist is temporarily unavailable. Please try again." });
      }
    }
  };
}
