import { createHash } from "node:crypto";

export const IP_LIMIT = 5;
export const IP_WINDOW_MS = 10 * 60_000;
export const GLOBAL_LIMIT = 100;
const GLOBAL_WINDOW_MS = 60_000;
export const hash = (value: string) => createHash("sha256").update(value).digest("hex");

export interface QuotaTransaction {
  counts(keys: string[]): Promise<number[]>;
  write(key: string, record: { count: number; expiresAt: Date }): void;
}
export interface QuotaStore {
  run(work: (transaction: QuotaTransaction) => Promise<void>): Promise<void>;
}
export class RateLimitError extends Error {
  constructor(public readonly retryAfter: number, public readonly replay = false) {
    super(replay ? "Verification was already used. Please try again." : "Too many requests. Please try again later.");
  }
}

// Commit all counters and the token's one-time use together across instances.
export async function reserveQuota(store: QuotaStore, input: { ip: string; token?: string; tokenExpiresAt?: number }, now = Date.now()): Promise<void> {
  const ipBucket = Math.floor(now / IP_WINDOW_MS);
  const globalBucket = Math.floor(now / GLOBAL_WINDOW_MS);
  const quotas = [
    { key: `ip_${hash(`${ipBucket}:${input.ip}`)}`, limit: IP_LIMIT, expiresAt: (ipBucket + 1) * IP_WINDOW_MS, replay: false },
    { key: `global_${globalBucket}`, limit: GLOBAL_LIMIT, expiresAt: (globalBucket + 1) * GLOBAL_WINDOW_MS, replay: false },
  ];
  if (input.token) {
    if (!input.tokenExpiresAt || input.tokenExpiresAt * 1000 <= now) throw new RateLimitError(1, true);
    quotas.push({ key: `token_${hash(input.token)}`, limit: 1, expiresAt: input.tokenExpiresAt * 1000, replay: true });
  }
  await store.run(async transaction => {
    const counts = await transaction.counts(quotas.map(quota => quota.key));
    for (const [index, quota] of quotas.entries()) {
      const count = counts[index];
      if (!Number.isSafeInteger(count) || count < 0 || count >= quota.limit) {
        throw new RateLimitError(Math.max(1, Math.ceil((quota.expiresAt - now) / 1000)), quota.replay);
      }
    }
    quotas.forEach((quota, index) => transaction.write(quota.key, { count: counts[index] + 1, expiresAt: new Date(quota.expiresAt) }));
  });
}
