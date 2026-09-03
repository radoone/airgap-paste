import { FormEvent, lazy, Suspense, useEffect, useRef, useState } from "react";
import CookieConsent, { getCookieConsentValue, resetCookieConsentValue } from "react-cookie-consent";
import {
  ArrowDownRight,
  ArrowRight,
  Bluetooth,
  CheckCircle,
  CircleNotch,
  ClipboardText,
  Code,
  Cpu,
  Desktop,
  Fingerprint,
  Flask,
  Factory,
  HardDrives,
  Keyboard,
  Lifebuoy,
  Lightning,
  LockKey,
  ShieldCheck,
  Terminal,
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
        {status === "submitting" ? <CircleNotch className="spin" size={20} /> : compact ? "Join Batch 1 Waitlist" : "Get Early Access"}
        {status !== "submitting" && <ArrowRight size={18} weight="bold" />}
      </button>
      <label className="consent">
        <input name="consent" type="checkbox" required />
        <span>I agree to receive Batch 1 production updates and early-bird discount access.</span>
      </label>
      <p className={`form-message form-message--${status}`} role="status" aria-live="polite">{message}</p>
    </form>
  );
}

function LandingPage() {
  const [isProductPreviewOpen, setIsProductPreviewOpen] = useState(false);
  const [cookieBannerRevision, setCookieBannerRevision] = useState(0);
  const [interactiveStep, setInteractiveStep] = useState<0 | 1 | 2 | 3>(0);
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
          <a href="#use-cases">Use cases</a>
          <a href="#specs">Specs</a>
          <a href="#safety">Safety</a>
          <a href="#faq">FAQ</a>
        </nav>
        <a className="nav-cta" href="/app">Try the prototype <ArrowDownRight size={16} /></a>
      </header>

      <section id="top" className="hero section-shell">
        <div className="hero-copy">
          <p className="eyebrow"><span /> Production Batch 1 · Early Access</p>
          <h1>Send text to any isolated computer. No retyping.</h1>
          <p className="hero-lede">AirGap Paste is a pocket-sized Bluetooth hardware bridge. Review commands, keys, or scripts on your phone or laptop, then press SEND; it types into any computer, VM console, or terminal as a standard USB keyboard.</p>
        </div>
        <button className="hero-visual" type="button" aria-label="Open an enlarged AirGap Paste prototype render" onClick={() => setIsProductPreviewOpen(true)}>
          <img src={productHero} alt="AirGap Paste precision 3D-printed desktop controller on a wooden desk with illuminated green halo SEND button, connected via braided USB-C cable to a laptop." />
          <div className="visual-label visual-label--top">Desktop enclosure<br /><strong>Ø 75 × 24 mm · Precision 3D Printed</strong></div>
          <div className="visual-label visual-label--bottom"><span className="status-dot status-dot--green status-dot--pulse" /> Green Halo · Blinks when ready to press</div>
          <span className="visual-expand">Click to enlarge</span>
        </button>
        <div className="hero-conversion">
          <ul className="hero-signals" aria-label="Key product principles">
            <li><LockKey size={17} /> No target network</li>
            <li><Keyboard size={17} /> Genuine USB keyboard · zero drivers</li>
            <li><Fingerprint size={17} /> Physical SEND confirmation</li>
          </ul>
          <p className="hero-conversion__label">Get Batch 1 priority access & early discount</p>
          <WaitlistForm />
          <p className="fine-print">Be first in line for the first production run and early-bird discount. No spam, ever.</p>
        </div>
      </section>

      {isProductPreviewOpen && (
        <div className="product-preview" role="dialog" aria-modal="true" aria-label="Enlarged AirGap Paste prototype render" onMouseDown={() => setIsProductPreviewOpen(false)}>
          <div className="product-preview__content" onMouseDown={(event) => event.stopPropagation()}>
            <button ref={closePreviewRef} className="product-preview__close" type="button" onClick={() => setIsProductPreviewOpen(false)} aria-label="Close enlarged render"><X size={22} /></button>
            <img src={productHero} alt="Enlarged render of AirGap Paste circular 3D-printed desktop button with green halo ring." />
            <p>AirGap Paste desktop controller · Ø 75 × 24 mm precision 3D-printed enclosure with illuminated halo SEND button</p>
          </div>
        </div>
      )}

      <section className="proof-bar" aria-label="Product principles">
        <p><LockKey size={20} /> True physical gap · isolated machine stays offline</p>
        <p><Keyboard size={20} /> Universal USB keyboard · works in BIOS, Linux, macOS & Windows</p>
        <p><Fingerprint size={20} /> Zero automatic execution · physical SEND button required</p>
      </section>

      <section className="transfer-story section-shell" aria-labelledby="transfer-story-heading">
        <div className="transfer-story__heading">
          <div><p className="section-kicker">Interactive Architecture</p><h2 id="transfer-story-heading">Online text in. Genuine keystrokes out.</h2></div>
          <p>The isolated computer never receives a Bluetooth connection or driver installation. It only sees AirGap Paste as a standard USB keyboard after you confirm the transfer physically.</p>
        </div>

        <div className="transfer-interactive-bar">
          <button
            type="button"
            className={`transfer-demo-btn ${interactiveStep > 0 ? "transfer-demo-btn--active" : ""}`}
            onClick={() => setInteractiveStep(((interactiveStep + 1) % 4) as 0 | 1 | 2 | 3)}
          >
            {interactiveStep === 0 && <><Lightning size={16} weight="fill" /> Simulate Transfer · Step 1: Queue text</>}
            {interactiveStep === 1 && <><Fingerprint size={16} weight="fill" /> Step 2: Press blinking SEND button</>}
            {interactiveStep === 2 && <><CircleNotch className="spin" size={16} /> Step 3: Typing keystrokes into host...</>}
            {interactiveStep === 3 && <><CheckCircle size={16} weight="fill" /> Done! Click to replay</>}
          </button>
          <span className="transfer-interactive-hint">
            {interactiveStep === 0 && "1. Text is buffered securely into the dongle's SRAM over encrypted Bluetooth."}
            {interactiveStep === 1 && "2. Green halo ring pulses/blinks. Focus target window, then tap button to type."}
            {interactiveStep === 2 && "3. Keystrokes are paced and typed cleanly into the target terminal/editor."}
            {interactiveStep === 3 && "Verified keystroke injection with zero network bridge to target."}
          </span>
        </div>

        <figure className={`transfer-map transfer-map--step-${interactiveStep}`}>
          <article className="transfer-node transfer-node--source">
            <div className="transfer-node__top"><Code size={24} weight="thin" /><span>ONLINE + AI</span></div>
            <strong>Review the script</strong>
            <div className="transfer-code" aria-hidden="true"><i>#!/bin/sh</i><i>systemctl restart app</i><i>printf "ready\n"</i></div>
            <small>Phone or workstation</small>
          </article>

          <div className="transfer-link transfer-link--bluetooth" aria-hidden="true">
            <span className="transfer-link__track"><i className="transfer-packet" /></span>
            <Bluetooth size={24} weight="thin" />
            <small>Bluetooth text</small>
          </div>

          <article className="transfer-node transfer-node--device">
            <div className="transfer-device-image"><img src={productHero} alt="AirGap Paste prototype render between an online source and an isolated computer." /></div>
            <div className="transfer-node__top"><span>AIRGAP PASTE</span><em>Queued</em></div>
            <strong>Press SEND</strong>
            <span className="transfer-confirm"><Fingerprint size={18} /> Physical confirmation</span>
          </article>

          <div className="transfer-link transfer-link--usb" aria-hidden="true">
            <span className="transfer-link__track"><i className="transfer-packet" /></span>
            <Keyboard size={24} weight="thin" />
            <small>USB keyboard</small>
          </div>

          <article className="transfer-node transfer-node--target">
            <div className="transfer-node__top"><Desktop size={24} weight="thin" /><span>ISOLATED PC</span></div>
            <strong>Text appears here</strong>
            <div className="transfer-terminal" aria-hidden="true"><i>$ systemctl restart app</i><i>ready</i><b /></div>
            <small>No internet required</small>
          </article>
          <figcaption>Reviewed text only · no cloud path to the target · no custom driver</figcaption>
        </figure>
      </section>

      <section className="problem section-shell" aria-labelledby="problem-heading">
        <div><p className="section-kicker">The problem</p><h2 id="problem-heading">A long command is not a copy/paste problem when paste does not exist.</h2></div>
        <div className="problem-copy"><p>Isolated workstations protect critical environments. They also turn an AI-generated command, a configuration block, or a small script into a slow, error-prone retyping task.</p><p>AirGap Paste is being designed to keep the familiar keyboard workflow—while putting a deliberate physical decision between the source text and the focused window.</p></div>
      </section>

      <section id="use-cases" className="use-cases section-shell" aria-labelledby="use-cases-heading">
        <div className="use-cases__intro">
          <div><p className="section-kicker">Everyday Utility</p><h2 id="use-cases-heading">Built for every screen where copy-paste stops.</h2></div>
          <p>Whether you manage homelabs, troubleshoot remote servers, work in air-gapped security labs, or navigate locked-down enterprise laptops—AirGap Paste types your text accurately without network exposure.</p>
        </div>
        <div className="use-cases__grid">
          <article>
            <HardDrives size={30} weight="thin" />
            <span>01</span>
            <h3>Homelabs & Headless Servers</h3>
            <p>Paste initial Wi-Fi passwords, SSH keys, and network configs into fresh Raspberry Pis, mini-PCs, or NAS appliances without hunting for a spare monitor and keyboard.</p>
          </article>
          <article>
            <Terminal size={30} weight="thin" />
            <span>02</span>
            <h3>Hypervisors, VMs & Remote KVMs</h3>
            <p>Type directly into Proxmox, VMware ESXi, iLO/iDRAC, and out-of-band VNC management consoles where clipboard redirection is notoriously broken or disabled.</p>
          </article>
          <article>
            <LockKey size={30} weight="thin" />
            <span>03</span>
            <h3>Locked Enterprise & Bastion Laptops</h3>
            <p>Safely transfer complex AI prompts, code blocks, or tokens from your phone or personal device into corporate workstations that block USB storage and cloud clipboard sync.</p>
          </article>
          <article>
            <ShieldCheck size={30} weight="thin" />
            <span>04</span>
            <h3>Air-Gapped Systems & Crypto Wallets</h3>
            <p>Move signed offline transactions, recovery seed verification scripts, and isolated forensic commands with absolute zero network bridge and zero clipboard telemetry.</p>
          </article>
        </div>
        <p className="use-cases__policy"><ShieldCheck size={18} /> Compatible with any computer or appliance that accepts a standard USB HID keyboard.</p>
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

      <section id="specs" className="specs section-shell" aria-labelledby="specs-heading">
        <div className="specs__heading">
          <div>
            <p className="section-kicker">Hardware Specifications</p>
            <h2 id="specs-heading">Open silicon. Zero host drivers.</h2>
          </div>
          <p>Engineered around reliable, field-tested components. AirGap Paste appears strictly as a generic USB keyboard to the target machine—no special drivers, no mass storage risk, and zero host network access.</p>
        </div>
        <div className="specs-grid">
          <article>
            <Cpu size={26} />
            <h4>Controller MCU</h4>
            <p>Espressif ESP32-S3 (Dual-Core Xtensa LX7 @ 240 MHz) with native USB OTG.</p>
          </article>
          <article>
            <Keyboard size={26} />
            <h4>Host USB Output</h4>
            <p>Standard USB HID Keyboard. Compatible with BIOS/UEFI, Linux, macOS, Windows, FreeBSD, and Android.</p>
          </article>
          <article>
            <Bluetooth size={26} />
            <h4>Wireless Input</h4>
            <p>Bluetooth 5.0 Low Energy with LE Secure Connections and AES-128 encryption.</p>
          </article>
          <article>
            <Fingerprint size={26} />
            <h4>Physical Confirmation</h4>
            <p>Tactile microswitch SEND button. Keystrokes are physically held in buffer until pressed.</p>
          </article>
          <article>
            <ShieldCheck size={26} />
            <h4>Security Architecture</h4>
            <p>Dynamic Push-to-Pair confirmation, HMAC-SHA256 challenge-response, and SHA-256 integrity validation.</p>
          </article>
          <article>
            <Code size={26} />
            <h4>Buffer & Pacing</h4>
            <p>16 KB protected SRAM review buffer with controlled debounce and typing pacing.</p>
          </article>
        </div>
      </section>

      <section className="command section-shell" aria-labelledby="command-heading">
        <div className="command-copy"><p className="section-kicker">Built for the awkward part</p><h2 id="command-heading">Long commands. Config blocks. Reviewed scripts.</h2><p>Move the exact text you have reviewed, not an approximation you have retyped under pressure. US ASCII is automatic; the working prototype also supports tested Unicode input on Linux and macOS.</p><a href="#safety" className="text-link">See safety boundaries <ArrowRight size={17} /></a></div>
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
        <ol><li><span>Now</span><strong>Prototype validation</strong><p>Confirm USB HID, Bluetooth transfer, physical confirmation, and layout behavior.</p></li><li><span>Next</span><strong>Field feedback</strong><p>Put the workflow in front of developers, sysadmins, and lab operators.</p></li><li><span>Then</span><strong>Production pre-launch</strong><p>Publish transparent build status, reward details, and a realistic production plan.</p></li></ol>
      </section>

      <section id="build-update" className="build-update section-shell" aria-labelledby="build-update-heading">
        <div className="build-update__heading"><p className="section-kicker">Build update · July 2026</p><h2 id="build-update-heading">The hardware prototype works. The enclosure is being made.</h2><p>We are sharing the current state before crowdfunding: proven behavior, the physical work still in progress, and no promises beyond what has been tested.</p></div>
        <div className="build-update__grid">
          <article><CheckCircle size={28} weight="thin" /><p>Validated now</p><h3>End-to-end transfer</h3><span>Bluetooth pairing, encrypted text transfer, a physical SEND action, and USB keyboard output work on the prototype.</span></article>
          <article><Keyboard size={28} weight="thin" /><p>Tested now</p><h3>Unicode on Linux + macOS</h3><span>US ASCII is automatic. Unicode typing has been tested on Linux and on macOS when Unicode Hex Input is selected.</span></article>
          <article><Factory size={28} weight="thin" /><p>In progress</p><h3>Prototype enclosure</h3><span>The electronics work; the first physical enclosure is currently being produced for fit, feel, and field testing.</span></article>
        </div>
        <p className="build-update__note"><strong>What this is not yet:</strong> a finished retail product. Pricing, delivery timing, and final production specifications will be published only after enclosure and field validation.</p>
      </section>

      <section id="faq" className="faq section-shell" aria-labelledby="faq-heading">
        <div><p className="section-kicker">FAQ</p><h2 id="faq-heading">The useful constraints.</h2></div>
        <div className="faq-list">
          <details><summary>Is AirGap Paste a finished product?</summary><p>Not yet. AirGap Paste is in active prototype testing and this is a pre-launch waitlist. The enclosure shown is the intended Ø 75 × 24 mm precision 3D-printed desktop puck with illuminated tactile halo SEND button.</p></details>
          <details><summary>Does it automatically run a command?</summary><p>No. The intended default is text-only input. A physical confirmation starts typing, and the device does not append Enter to single-line commands.</p></details>
          <details><summary>Does the target computer need a driver?</summary><p>No custom driver is intended on the target computer. AirGap Paste is being designed to appear as a standard USB HID keyboard, using the keyboard support already built into the operating system.</p></details>
          <details><summary>Can it transfer multi-line scripts?</summary><p>That is an intended workflow for text editors and reviewed shell inputs. Because a line break may execute a terminal command, the focused application and process remain your responsibility.</p></details>
          <details><summary>Can it type accented or other Unicode characters?</summary><p>The current prototype has been tested on Linux and macOS. For macOS, add and select the Unicode Hex Input source before transferring Unicode text; the app shows this setup hint when macOS is selected.</p></details>
        </div>
      </section>

      <section id="waitlist" className="waitlist section-shell" aria-labelledby="waitlist-heading">
        <div><p className="section-kicker">First Production Run</p><h2 id="waitlist-heading">Join the Batch 1 early access list for priority pre-order pricing.</h2></div>
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
