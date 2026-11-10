# AirGap Paste landing page

English pre-launch marketing site and private Firebase waitlist for AirGap Paste, currently in prototype development. The site does not promise price, shipment, certification, or error-free transfer.

## Local development

```bash
cp .env.example .env.local
npm run dev
```

The landing page is available from Vite. Without Firebase configuration, the form intentionally shows a network error rather than storing data anywhere else.

## Firebase configuration

1. Create a Firebase project and copy `.firebaserc.example` to `.firebaserc` with its project ID.
2. Enable Firestore (Native mode) in an EU location and App Check with reCAPTCHA Enterprise for the web app.
3. Copy `.env.example` to `.env.local`, adding the Firebase web config and the reCAPTCHA Enterprise site key.
4. App Check is always enforced outside the Firebase emulator. Only the emulator can skip it; `ENFORCE_APPCHECK=true` enforces it there too.
5. Deploy Firestore rules and indexes: browser clients have no direct Firestore access, and `waitlistRateLimits.expiresAt` has a TTL cleanup policy.

## Emulator and deployment

```bash
npm run build
npm --prefix functions run build
firebase emulators:start --only functions,firestore,hosting
firebase deploy --only firestore,functions,hosting
```

Firebase Hosting rewrites `POST /waitlist` to the EU (`europe-west1`) Cloud Function. The function accepts JSON bodies up to 4 KB, validates email and consent, rejects the honeypot, verifies App Check, and stores agreed waitlist fields. New and duplicate registrations return the same response.

Each submission requests a fresh limited-use App Check token. A Firestore transaction reserves that token for one use, enforces five accepted requests per source IP per ten-minute bucket, and caps accepted traffic at 100 requests per minute globally. The limit applies across function instances. Quota records store hashes instead of raw IPs/tokens and expire through Firestore TTL. Limits use fixed windows, and clients behind one NAT share the per-IP quota. The function has at most three instances, concurrency 20 and a 15-second request timeout; quota/storage failures fail closed.

`npm test` runs browser-unit and real transport regression tests, frontend type checking, the production build and backend handler/security tests. Backend tests inject a transactional store and do not contact production Firestore.

The `/app` editor uses protocol v3 and must be released with matching firmware. Firebase/App Check loads only when a waitlist form is submitted, so the editor does not initialize those third-party scripts. Syntax support loads on demand. Hero images use responsive WebP variants; the original PNGs remain source assets.

## Production notes

- Configure an authorized custom domain before public launch.
- Add a transactional email provider and double opt-in before sending campaigns; this v1 stores signups only.
- Keep Firebase Admin credentials out of browser environment variables and source control. `.env.local` contains only public Firebase web configuration and the public reCAPTCHA site key, and is ignored by Git.
