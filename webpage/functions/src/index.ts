import { createHash } from "node:crypto";
import { getAppCheck } from "firebase-admin/app-check";
import { initializeApp } from "firebase-admin/app";
import { FieldValue, getFirestore } from "firebase-admin/firestore";
import { logger } from "firebase-functions";
import { onRequest } from "firebase-functions/v2/https";

initializeApp();
const db = getFirestore();
const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const allowedUtmKeys = ["utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content"] as const;

function hashEmail(email: string) { return createHash("sha256").update(email).digest("hex"); }

function sanitizeUtm(raw: unknown): Record<string, string> {
  if (!raw || typeof raw !== "object" || Array.isArray(raw)) return {};
  const record = raw as Record<string, unknown>;
  const sanitized: Record<string, string> = {};
  for (const key of allowedUtmKeys) {
    const value = record[key];
    if (typeof value === "string" && value.trim()) {
      sanitized[key] = value.trim().slice(0, 100);
    }
  }
  return sanitized;
}

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
  if (!normalizedEmail || normalizedEmail.length > 254 || !emailPattern.test(normalizedEmail) || consent !== true) {
    response.status(400).json({ error: "Enter a valid email and confirm consent." });
    return;
  }

  const enforceAppCheck = process.env.ENFORCE_APPCHECK
    ? process.env.ENFORCE_APPCHECK === "true"
    : process.env.FUNCTIONS_EMULATOR !== "true";

  if (enforceAppCheck) {
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
  const safeSource = typeof source === "string" && source.trim() ? source.trim().slice(0, 80) : "landing-page";

  try {
    await record.create({
      email: normalizedEmail,
      consentVersion: "2026-07-15",
      source: safeSource,
      utm: sanitizeUtm(utm),
      createdAt: FieldValue.serverTimestamp(),
    });
  } catch (error: unknown) {
    const code = (error as { code?: number | string })?.code;
    if (code === 6 || code === "already-exists") {
      response.status(200).json({ ok: true, alreadyRegistered: true });
      return;
    }
    throw error;
  }

  logger.info("Waitlist signup accepted", { source: safeSource, id: id.slice(0, 12) });
  response.status(201).json({ ok: true, alreadyRegistered: false });
});
