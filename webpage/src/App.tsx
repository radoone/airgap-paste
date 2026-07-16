import { FormEvent, lazy, Suspense, useEffect, useRef, useState } from "react";
import CookieConsent, { getCookieConsentValue, resetCookieConsentValue } from "react-cookie-consent";
import {
  ArrowDownRight,
  ArrowRight,
  CheckCircle,
  CircleNotch,
  ClipboardText,
  Code,
  Desktop,
  Fingerprint,
  Keyboard,
  LockKey,
  ShieldCheck,
  UploadSimple,
  Warning,
  X,
} from "@phosphor-icons/react";
import { getToken } from "firebase/app-check";
import { appCheck } from "./firebase";
import { disableGoogleAnalytics, enableGoogleAnalytics } from "./analytics";
import productHero from "./assets/airgap-paste-hero-dark.jpg";
import "./styles.css";

type FormStatus = "idle" | "submitting" | "success" | "error";

const waitlistEndpoint = import.meta.env.VITE_WAITLIST_ENDPOINT || "/waitlist";
const analyticsConsentCookie = "airgap-analytics-consent";
const EditorApp = lazy(() => import("./EditorApp"));

function WaitlistForm({ compact = false }: { compact?: boolean }) {
  const [status, setStatus] = useState<FormStatus>("idle");
  const [message, setMessage] = useState("");
  const emailRef = useRef<HTMLInputElement>(null);

  async function submit(event: FormEvent<HTMLFormElement>) {
    event.preventDefault();
    const form = event.currentTarget;
    const formData = new FormData(form);
    const email = String(formData.get("email") || "").trim();
    const consent = formData.get("consent") === "on";
    const website = String(formData.get("website") || "");

    if (!email || !consent) {
      setStatus("error");
      setMessage("Enter a valid email and confirm consent to join.");
      emailRef.current?.focus();
      return;
    }

    setStatus("submitting");
    setMessage("");

    try {
      let appCheckToken: string | undefined;
      if (appCheck) {
        const tokenResult = await getToken(appCheck, false);
        appCheckToken = tokenResult.token;
      }

      const response = await fetch(waitlistEndpoint, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          ...(appCheckToken ? { "X-Firebase-AppCheck": appCheckToken } : {}),
        },
        body: JSON.stringify({
          email,
          consent,
          website,
          source: "airgap-paste-landing-page",
          utm: Object.fromEntries(
            ["utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content"]
              .map((key) => [key, new URLSearchParams(window.location.search).get(key)])
              .filter(([, value]) => value),
          ),
        }),
      });

      const data = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(data.error || "Something went wrong. Please try again.");

      setStatus("success");
      setMessage(data.alreadyRegistered ? "You are already on the list." : "You’re on the list. We’ll share early access first.");
      form.reset();
    } catch (error) {
      setStatus("error");
      setMessage(error instanceof Error ? error.message : "Something went wrong. Please try again.");
    }
  }

  return (
    <form className={`waitlist-form ${compact ? "waitlist-form--compact" : ""}`} onSubmit={submit} noValidate>
      <label className="sr-only" htmlFor={compact ? "email-bottom" : "email-hero"}>Email address</label>
      <input ref={emailRef} id={compact ? "email-bottom" : "email-hero"} name="email" type="email" autoComplete="email" placeholder="you@company.com" required />
      <input className="trap-field" type="text" name="website" tabIndex={-1} autoComplete="off" aria-hidden="true" />
      <button type="submit" disabled={status === "submitting"}>
        {status === "submitting" ? <CircleNotch className="spin" size={20} /> : compact ? "Join the waitlist" : "Get prototype updates"}
        {status !== "submitting" && <ArrowRight size={18} weight="bold" />}
      </button>
      <label className="consent">
        <input name="consent" type="checkbox" required />
        <span>I agree to receive launch updates and early-bird access.</span>
      </label>
      <p className={`form-message form-message--${status}`} role="status" aria-live="polite">{message}</p>
    </form>
  );
}

function LandingPage() {
  const [isProductPreviewOpen, setIsProductPreviewOpen] = useState(false);
  const [cookieBannerRevision, setCookieBannerRevision] = useState(0);
  const closePreviewRef = useRef<HTMLButtonElement>(null);

  useEffect(() => {
    const onHashChange = () => document.querySelector(window.location.hash)?.scrollIntoView({ behavior: "smooth" });
    window.addEventListener("hashchange", onHashChange);
    return () => window.removeEventListener("hashchange", onHashChange);
  }, []);

  useEffect(() => {
    if (getCookieConsentValue(analyticsConsentCookie) === "accepted") enableGoogleAnalytics();
    else disableGoogleAnalytics();
  }, []);

  useEffect(() => {
    if (!isProductPreviewOpen) return;
    closePreviewRef.current?.focus();
    const onKeyDown = (event: KeyboardEvent) => {
      if (event.key === "Escape") setIsProductPreviewOpen(false);
    };
    window.addEventListener("keydown", onKeyDown);
    return () => window.removeEventListener("keydown", onKeyDown);
  }, [isProductPreviewOpen]);

  function openCookieSettings() {
    disableGoogleAnalytics();
    resetCookieConsentValue(analyticsConsentCookie);
    setCookieBannerRevision((revision) => revision + 1);
  }

  return (
    <main>
      <header className="nav-shell">
        <a className="wordmark" href="#top" aria-label="AirGap Paste home">AirGap <span>Paste</span></a>
        <nav aria-label="Primary navigation">
          <a href="#workflow">How it works</a>
          <a href="#safety">Safety</a>
          <a href="#faq">FAQ</a>
        </nav>
        <a className="nav-cta" href="/app">Try the prototype <ArrowDownRight size={16} /></a>
      </header>

      <section id="top" className="hero section-shell">
        <div className="hero-copy">
          <p className="eyebrow"><span /> Prototype in development for isolated systems</p>
          <h1>Send text to air‑gapped computers. No retyping.</h1>
          <p className="hero-lede">AirGap Paste is a pocket-size hardware bridge. Send reviewed text from a phone or online workstation, then press SEND; it types into the isolated computer as a USB keyboard.</p>
        </div>
        <button className="hero-visual" type="button" aria-label="Open an enlarged AirGap Paste prototype render" onClick={() => setIsProductPreviewOpen(true)}>
          <img src={productHero} alt="Prototype render: AirGap Paste, with a labelled SEND button, transfers reviewed text by Bluetooth from an online workstation or phone and appears as a USB keyboard to an isolated computer." />
          <div className="visual-label visual-label--top">Prototype enclosure<br /><strong>55 × 32 × 17 mm</strong></div>
          <div className="visual-label visual-label--bottom"><span className="status-dot" /> Review. Queue. Confirm physically.</div>
          <span className="visual-expand">Click to enlarge</span>
        </button>
        <div className="hero-conversion">
          <ul className="hero-signals" aria-label="Key product principles">
            <li><LockKey size={17} /> No target network</li>
            <li><Keyboard size={17} /> USB keyboard output</li>
            <li><Fingerprint size={17} /> Physical confirmation</li>
          </ul>
          <p className="hero-conversion__label">Get the first working-demo updates</p>
          <WaitlistForm />
          <p className="fine-print">Early access and future crowdfunding launch updates. No price or ship date announced yet.</p>
        </div>
      </section>

      {isProductPreviewOpen && (
        <div className="product-preview" role="dialog" aria-modal="true" aria-label="Enlarged AirGap Paste prototype render" onMouseDown={() => setIsProductPreviewOpen(false)}>
          <div className="product-preview__content" onMouseDown={(event) => event.stopPropagation()}>
            <button ref={closePreviewRef} className="product-preview__close" type="button" onClick={() => setIsProductPreviewOpen(false)} aria-label="Close enlarged render"><X size={22} /></button>
            <img src={productHero} alt="Enlarged prototype render of AirGap Paste and its transfer workflow." />
            <p>Prototype render · 55 × 32 × 17 mm target enclosure</p>
          </div>
        </div>
      )}

      <section className="proof-bar" aria-label="Product principles">
        <p><LockKey size={20} /> No network path to the target machine</p>
        <p><Keyboard size={20} /> Appears as a standard USB keyboard</p>
        <p><Fingerprint size={20} /> Manual action before typing starts</p>
      </section>

      <section className="problem section-shell" aria-labelledby="problem-heading">
        <div><p className="section-kicker">The problem</p><h2 id="problem-heading">A long command is not a copy/paste problem when paste does not exist.</h2></div>
        <div className="problem-copy"><p>Isolated workstations protect critical environments. They also turn an AI-generated command, a configuration block, or a small script into a slow, error-prone retyping task.</p><p>AirGap Paste is being designed to keep the familiar keyboard workflow—while putting a deliberate physical decision between the source text and the focused window.</p></div>
      </section>

      <section id="workflow" className="workflow section-shell" aria-labelledby="workflow-heading">
        <div className="section-heading"><p className="section-kicker">Three deliberate steps</p><h2 id="workflow-heading">Review before the text reaches the target.</h2></div>
        <div className="steps">
          <article><span>01</span><ClipboardText size={38} weight="thin" /><h3>Queue</h3><p>Send reviewed text from an online workstation or phone to the device buffer.</p></article>
          <article><span>02</span><ShieldCheck size={38} weight="thin" /><h3>Position</h3><p>Choose the intended window on the isolated machine before anything types.</p></article>
          <article><span>03</span><Fingerprint size={38} weight="thin" /><h3>Confirm</h3><p>Press the physical SEND button to start keyboard input—never automatically.</p></article>
        </div>
        <div className="flow-line" aria-hidden="true"><span>Online workstation or phone</span><ArrowRight /><span>AirGap Paste</span><ArrowRight /><span>Isolated computer</span></div>
      </section>

      <section className="command section-shell" aria-labelledby="command-heading">
        <div className="command-copy"><p className="section-kicker">Built for the awkward part</p><h2 id="command-heading">Long commands. Config blocks. Reviewed scripts.</h2><p>Move the exact text you have reviewed, not an approximation you have retyped under pressure. The initial keyboard-layout target is US; additional layouts are a planned expansion.</p><a href="#safety" className="text-link">See safety boundaries <ArrowRight size={17} /></a></div>
        <pre aria-label="Example reviewed deployment script"><code><em>01</em> # reviewed-deploy.sh{`\n`}<em>02</em> set -euo pipefail{`\n`}<em>03</em>{`\n`}<em>04</em> export TARGET_ENV=staging{`\n`}<em>05</em> ./deploy --verify --no-input{`\n`}<em>06</em> printf "Deployment prepared\n"</code></pre>
      </section>

      <section id="safety" className="safety section-shell" aria-labelledby="safety-heading">
        <div className="safety-title"><p className="section-kicker">Safety and fidelity, by design</p><h2 id="safety-heading">Designed to make intent visible.</h2></div>
        <div className="safety-grid">
          <article><Code size={27} /><h3>Queued, not immediate</h3><p>Text should remain buffered until you are ready at the target computer.</p></article>
          <article><Keyboard size={27} /><h3>No automatic Enter</h3><p>Single-line commands type without appending Enter. You remain in control of execution.</p></article>
          <article><Warning size={27} /><h3>Scripts need context</h3><p>Line breaks can execute commands in a terminal. Use a text editor or a reviewed shell workflow.</p></article>
          <article><CheckCircle size={27} /><h3>Planned integrity signals</h3><p>Character counts, SHA-256 fingerprints, packet sequencing, and device-ready/error states are planned for validation.</p></article>
        </div>
      </section>

      <section className="roadmap section-shell" aria-labelledby="roadmap-heading">
        <div><p className="section-kicker">What happens next</p><h2 id="roadmap-heading">From prototype enclosure to a credible hardware launch.</h2></div>
        <ol><li><span>Now</span><strong>Prototype validation</strong><p>Confirm USB HID, Bluetooth transfer, physical confirmation, and layout behavior.</p></li><li><span>Next</span><strong>Field feedback</strong><p>Put the workflow in front of developers, sysadmins, and lab operators.</p></li><li><span>Then</span><strong>Crowdfunding pre-launch</strong><p>Publish transparent build status, reward details, and a realistic production plan.</p></li></ol>
      </section>

      <section id="faq" className="faq section-shell" aria-labelledby="faq-heading">
        <div><p className="section-kicker">FAQ</p><h2 id="faq-heading">The useful constraints.</h2></div>
        <div className="faq-list">
          <details><summary>Is AirGap Paste a finished product?</summary><p>Not yet. AirGap Paste is in prototype development and this is a pre-launch waitlist. The enclosure shown is a prototype render for the intended 55 × 32 × 17 mm form factor.</p></details>
          <details><summary>Does it automatically run a command?</summary><p>No. The intended default is text-only input. A physical confirmation starts typing, and the device does not append Enter to single-line commands.</p></details>
          <details><summary>Can it transfer multi-line scripts?</summary><p>That is an intended workflow for text editors and reviewed shell inputs. Because a line break may execute a terminal command, the focused application and process remain your responsibility.</p></details>
        </div>
      </section>

      <section id="waitlist" className="waitlist section-shell" aria-labelledby="waitlist-heading">
        <div><p className="section-kicker">Be early, not noisy</p><h2 id="waitlist-heading">Get the first working-demo updates and future crowdfunding launch access.</h2></div>
        <WaitlistForm compact />
      </section>

      <footer>
        <a className="wordmark" href="#top">AirGap <span>Paste</span></a>
        <p>Prototype hardware for deliberate offline text transfer.</p>
        <a href="/privacy.html">Privacy</a>
        <button className="footer-button" type="button" onClick={openCookieSettings}>Cookie settings</button>
        <p>© {new Date().getFullYear()} AirGap Paste</p>
      </footer>

      <CookieConsent
        key={cookieBannerRevision}
        cookieName={analyticsConsentCookie}
        cookieValue="accepted"
        declineCookieValue="rejected"
        setDeclineCookie
        enableDeclineButton
        buttonText="Accept analytics"
        declineButtonText="Decline analytics"
        onAccept={() => enableGoogleAnalytics()}
        onDecline={() => disableGoogleAnalytics()}
        disableStyles
        location="bottom"
        expires={180}
        sameSite="Lax"
        containerClasses="airgap-cookie-banner"
        contentClasses="airgap-cookie-content"
        buttonWrapperClasses="airgap-cookie-actions"
        buttonClasses="airgap-cookie-accept"
        declineButtonClasses="airgap-cookie-decline"
        ariaAcceptLabel="Accept analytics cookies"
        ariaDeclineLabel="Decline analytics cookies"
      >
        <span className="section-kicker">Privacy choice</span>
        <strong>Allow anonymous analytics?</strong>
        <span>Analytics is off by default. With permission, we measure aggregate visits only—no ads or personalised signals. <a href="/privacy.html">Privacy &amp; cookies</a></span>
      </CookieConsent>
    </main>
  );
}

function App() {
  return window.location.pathname.replace(/\/+$/, "") === "/app"
    ? <Suspense fallback={<main className="app-loading">Loading the editor…</main>}><EditorApp /></Suspense>
    : <LandingPage />;
}

export default App;
