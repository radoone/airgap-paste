# AirGap Paste landing page

English pre-launch marketing site and private Firebase waitlist for the AirGap Paste concept. The site intentionally labels the product as concept hardware and does not promise price, shipment, certification, or error-free transfer.

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
4. In the Functions runtime, set `ENFORCE_APPCHECK=true` before production deploy.
5. Keep `firestore.rules` deployed: browser clients have no direct Firestore access.

## Emulator and deployment

```bash
npm run build
npm --prefix functions run build
firebase emulators:start --only functions,firestore,hosting
firebase deploy --only firestore:rules,functions,hosting
```

Firebase Hosting rewrites `POST /waitlist` to the EU (`europe-west1`) Cloud Function. The function validates the email and consent, rejects the honeypot, optionally validates an App Check token, hashes the email for the document ID, and stores only the agreed waitlist fields.

## Production notes

- Configure an authorized custom domain before public launch.
- Add a transactional email provider and double opt-in before sending campaigns; this v1 stores signups only.
- Do not put Firebase Admin credentials or production configuration in `.env.local` or source control.
