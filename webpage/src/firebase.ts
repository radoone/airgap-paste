import { initializeApp } from "@firebase/app";
import { getLimitedUseToken, initializeAppCheck, ReCaptchaEnterpriseProvider } from "@firebase/app-check";

const firebaseConfig = {
  apiKey: import.meta.env.VITE_FIREBASE_API_KEY,
  authDomain: import.meta.env.VITE_FIREBASE_AUTH_DOMAIN,
  projectId: import.meta.env.VITE_FIREBASE_PROJECT_ID,
  appId: import.meta.env.VITE_FIREBASE_APP_ID,
};

const configured = Object.values(firebaseConfig).every(Boolean);
const app = configured ? initializeApp(firebaseConfig) : null;

const appCheck = app && import.meta.env.VITE_RECAPTCHA_ENTERPRISE_SITE_KEY
  ? initializeAppCheck(app, {
      provider: new ReCaptchaEnterpriseProvider(import.meta.env.VITE_RECAPTCHA_ENTERPRISE_SITE_KEY),
      isTokenAutoRefreshEnabled: true,
    })
  : null;

export async function getWaitlistToken(): Promise<string | undefined> {
  return appCheck ? (await getLimitedUseToken(appCheck)).token : undefined;
}
