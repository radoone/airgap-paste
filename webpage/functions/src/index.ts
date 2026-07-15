import { createHash } from "node:crypto";
import { getAppCheck } from "firebase-admin/app-check";
import { initializeApp } from "firebase-admin/app";
import { FieldValue, getFirestore } from "firebase-admin/firestore";
import { logger } from "firebase-functions";
import { onRequest } from "firebase-functions/v2/https";

initializeApp();
const db = getFirestore();
const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

function hashEmail(email: string) { return createHash("sha256").update(email).digest("hex"); }

export const joinWaitlist = onRequest({ region: "europe-west1", cors: false }, async (request, response) => {
  if (request.method !== "POST") {
    response.status(405).json({ error: "Method not allowed." });
    return;
  }
  const { email, consent, website, source, utm } = request.body ?? {};
  const normalizedEmail = typeof email === "string" ? email.trim().toLowerCase() : "";

  if (website) {
    response.status(200).json({ ok: true });
    return;
  }
  if (!emailPattern.test(normalizedEmail) || consent !== true) {
    response.status(400).json({ error: "Enter a valid email and confirm consent." });
    return;
  }

  if (process.env.ENFORCE_APPCHECK === "true") {
    const token = request.header("X-Firebase-AppCheck");
    if (!token) {
      response.status(401).json({ error: "Verification is required. Please try again." });
      return;
    }
    try { await getAppCheck().verifyToken(token); }
    catch {
      response.status(401).json({ error: "Verification failed. Please try again." });
      return;
    }
  }

  const id = hashEmail(normalizedEmail);
  const record = db.collection("waitlist").doc(id);
  const existing = await record.get();
  if (existing.exists) {
    response.status(200).json({ ok: true, alreadyRegistered: true });
    return;
  }

  await record.set({
    email: normalizedEmail,
    consentVersion: "2026-07-15",
    source: typeof source === "string" ? source.slice(0, 80) : "landing-page",
    utm: typeof utm === "object" && utm ? utm : {},
    createdAt: FieldValue.serverTimestamp(),
  });
  logger.info("Waitlist signup accepted", { source, id: id.slice(0, 12) });
  response.status(201).json({ ok: true, alreadyRegistered: false });
});
