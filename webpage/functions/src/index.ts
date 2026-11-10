import { getAppCheck } from "firebase-admin/app-check";
import { initializeApp } from "firebase-admin/app";
import { FieldValue, getFirestore } from "firebase-admin/firestore";
import { logger } from "firebase-functions";
import { onRequest } from "firebase-functions/v2/https";
import { reserveQuota, type QuotaStore } from "./rate-limit.js";
import { createWaitlistHandler } from "./waitlist.js";

initializeApp();
const db = getFirestore();
const quotaCollection = db.collection("waitlistRateLimits");
const quotaStore: QuotaStore = {
  run: work => db.runTransaction(transaction => work({
    counts: async keys => {
      const snapshots = await transaction.getAll(...keys.map(key => quotaCollection.doc(key)));
      return snapshots.map(snapshot => snapshot.exists ? snapshot.get("count") as number : 0);
    },
    write: (key, record) => { transaction.set(quotaCollection.doc(key), record); },
  })),
};

export const joinWaitlist = onRequest({ region: "europe-west1", cors: false, maxInstances: 3, concurrency: 20, timeoutSeconds: 15 }, createWaitlistHandler({
  enforceAppCheck: process.env.FUNCTIONS_EMULATOR !== "true" || process.env.ENFORCE_APPCHECK === "true",
  verifyToken: async token => ({ exp: (await getAppCheck().verifyToken(token)).token.exp }),
  reserveQuota: input => reserveQuota(quotaStore, input),
  register: async (id, record) => { await db.collection("waitlist").doc(id).create({ ...record, createdAt: FieldValue.serverTimestamp() }); },
  logError: error => logger.error("Waitlist request failed", error),
}));
