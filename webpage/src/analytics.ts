const measurementId = "G-E17GFB6MYY";

declare global {
  interface Window {
    dataLayer?: unknown[];
    gtag?: (...args: unknown[]) => void;
    [key: `ga-disable-${string}`]: boolean | undefined;
  }
}

export function enableGoogleAnalytics() {
  window[`ga-disable-${measurementId}`] = false;

  window.dataLayer = window.dataLayer || [];
  window.gtag = (...args) => window.dataLayer?.push(args);
  const configure = () => {
    window.gtag?.("js", new Date());
    window.gtag?.("config", measurementId, {
      anonymize_ip: true,
      allow_google_signals: false,
      allow_ad_personalization_signals: false,
    });
  };

  if (document.getElementById("google-analytics")) {
    configure();
    return;
  }

  const script = document.createElement("script");
  script.id = "google-analytics";
  script.async = true;
  script.src = `https://www.googletagmanager.com/gtag/js?id=${measurementId}`;
  script.onload = configure;
  document.head.appendChild(script);
}

export function disableGoogleAnalytics() {
  window[`ga-disable-${measurementId}`] = true;
  document.cookie.split(";").forEach((cookie) => {
    const name = cookie.trim().split("=")[0];
    if (name === "_ga" || name.startsWith("_ga_")) {
      document.cookie = `${name}=; Max-Age=0; path=/; SameSite=Lax`;
    }
  });
}
