import assert from "node:assert/strict";
import { test } from "node:test";
import { GLOBAL_LIMIT, IP_LIMIT, IP_WINDOW_MS, RateLimitError, reserveQuota, type QuotaStore, type QuotaTransaction } from "./rate-limit.js";
import { createWaitlistHandler, type WaitlistRecord } from "./waitlist.js";

class TransactionStore implements QuotaStore {
  records = new Map<string, { count: number; expiresAt: Date }>();
  private chain = Promise.resolve();
  run(work: (transaction: QuotaTransaction) => Promise<void>): Promise<void> {
    const result = this.chain.then(async () => {
      const pending = new Map(this.records);
      await work({ counts: async keys => keys.map(key => pending.get(key)?.count ?? 0), write: (key, value) => { pending.set(key, value); } });
      this.records = pending;
    });
    this.chain = result.catch(() => {});
    return result;
  }
}

function fixture() {
  const store = new TransactionStore();
  const records = new Map<string, WaitlistRecord>();
  const errors: unknown[] = [];
  let calls = 0;
  let verified = 0;
  const handler = createWaitlistHandler({
    enforceAppCheck: true,
    verifyToken: async token => { verified++; if (!token.startsWith("valid")) throw new Error("bad token"); return { exp: Math.floor(Date.now() / 1000) + 3600 }; },
    reserveQuota: input => reserveQuota(store, input),
    register: async (id, record) => { if (records.has(id)) throw { code: 6 }; records.set(id, record); },
    logError: error => { errors.push(error); },
  });
  const invoke = async (options: { method?: string; body?: unknown; token?: string | null; ip?: string; contentType?: string } = {}) => {
    const headers: Record<string, string> = { "Content-Type": options.contentType ?? "application/json" };
    if (options.token !== null) headers["X-Firebase-AppCheck"] = options.token ?? `valid-${++calls}`;
    const result = {
      code: 200, headers: {} as Record<string, string>, payload: {} as Record<string, unknown>,
      status(code: number) { this.code = code; return this; },
      set(name: string, value: string) { this.headers[name] = value; return this; },
      json(value: Record<string, unknown>) { this.payload = value; return this; },
    };
    await handler({ method: options.method ?? "POST", ip: options.ip ?? "192.0.2.1", body: "body" in options ? options.body : { email: "user@example.com", consent: true }, header: name => headers[name] }, result);
    return result;
  };
  return { invoke, store, records, errors, get verified() { return verified; } };
}

test("rejects methods, invalid JSON shapes, invalid consent and oversized requests before verification", async () => {
  const f = fixture();
  assert.equal((await f.invoke({ method: "GET" })).code, 405);
  assert.equal((await f.invoke({ contentType: "text/plain" })).code, 415);
  for (const body of [null, [], "value", { email: "bad", consent: true }, { email: "a@b.com", consent: "true" }]) {
    assert.equal((await f.invoke({ body })).code, 400);
  }
  assert.equal((await f.invoke({ body: { email: "a@b.com", consent: true, source: "x".repeat(4096) } })).code, 413);
  assert.equal(f.verified, 0);
  assert.equal(f.store.records.size, 0);
});

test("rejects missing and invalid App Check tokens without writes", async () => {
  const f = fixture();
  assert.equal((await f.invoke({ token: null })).code, 401);
  assert.equal((await f.invoke({ token: "invalid" })).code, 401);
  assert.equal(f.store.records.size, 0);
  assert.equal(f.records.size, 0);
});

test("normalizes addresses and bounds allowlisted UTM fields", async () => {
  const f = fixture();
  assert.equal((await f.invoke({ body: { email: " User@Example.COM ", consent: true, source: "x".repeat(200), utm: { utm_source: "y".repeat(200), arbitrary: "ignored" } } })).code, 200);
  const record = [...f.records.values()][0];
  assert.equal(record.email, "user@example.com");
  assert.equal(record.source.length, 80);
  assert.deepEqual(record.utm, { utm_source: "y".repeat(100) });
});

test("returns identical success for a new address, a duplicate and a honeypot", async () => {
  const f = fixture();
  const first = await f.invoke();
  const duplicate = await f.invoke();
  const honeypot = await f.invoke({ body: { website: "bot" }, token: null });
  for (const result of [first, duplicate, honeypot]) {
    assert.equal(result.code, 200);
    assert.deepEqual(result.payload, { ok: true });
    assert.equal(result.headers["Cache-Control"], "no-store");
  }
  assert.equal(f.records.size, 1);
});

test("atomically rejects reuse of a verified token, even from a different IP", async () => {
  const f = fixture();
  assert.equal((await f.invoke({ token: "valid-once" })).code, 200);
  assert.equal((await f.invoke({ token: "valid-once", ip: "192.0.2.2" })).code, 401);
  assert.equal(f.records.size, 1);
});

test("concurrent requests cannot exceed the per-IP limit", async () => {
  const f = fixture();
  const results = await Promise.all(Array.from({ length: 15 }, (_, index) => f.invoke({ body: { email: `user${index}@example.com`, consent: true } })));
  assert.equal(results.filter(result => result.code === 200).length, IP_LIMIT);
  assert.equal(results.filter(result => result.code === 429).length, 15 - IP_LIMIT);
  assert(results.find(result => result.code === 429)!.headers["Retry-After"]);
  assert.equal(f.records.size, IP_LIMIT);
});

test("global capacity bounds requests from different IPs", async () => {
  const f = fixture();
  const results = await Promise.all(Array.from({ length: GLOBAL_LIMIT + 1 }, (_, index) => f.invoke({ ip: `198.51.100.${index}`, body: { email: `user${index}@example.com`, consent: true } })));
  assert.equal(results.filter(result => result.code === 200).length, GLOBAL_LIMIT);
  assert.equal(results.filter(result => result.code === 429).length, 1);
});

test("rate windows reset and stored quota records have expiry without raw IPs or tokens", async () => {
  const store = new TransactionStore();
  const now = IP_WINDOW_MS * 100;
  for (let i = 0; i < IP_LIMIT; i++) await reserveQuota(store, { ip: "192.0.2.1" }, now);
  await assert.rejects(reserveQuota(store, { ip: "192.0.2.1" }, now), RateLimitError);
  await reserveQuota(store, { ip: "192.0.2.1", token: "secret-token", tokenExpiresAt: (now + IP_WINDOW_MS * 3) / 1000 }, now + IP_WINDOW_MS);
  assert([...store.records.values()].every(record => record.expiresAt instanceof Date));
  assert(!JSON.stringify([...store.records]).includes("192.0.2.1"));
  assert(!JSON.stringify([...store.records]).includes("secret-token"));
});

test("fails closed when durable quota storage is unavailable", async () => {
  let writes = 0;
  const handler = createWaitlistHandler({ enforceAppCheck: false, verifyToken: async () => ({ exp: 1 }), reserveQuota: async () => { throw new Error("database unavailable"); }, register: async () => { writes++; }, logError: () => {} });
  const result = { code: 200, status(code: number) { this.code = code; return this; }, set() {}, json() {} };
  await handler({ method: "POST", body: { email: "a@b.com", consent: true }, header: () => "application/json" }, result);
  assert.equal(result.code, 503);
  assert.equal(writes, 0);
});
