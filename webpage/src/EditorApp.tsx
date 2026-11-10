import { useEffect, useMemo, useRef, useState } from "react";
import CodeMirror from "@uiw/react-codemirror";
import { oneDark } from "@codemirror/theme-one-dark";
import type { Extension } from "@codemirror/state";
import { ArrowLeft, ArrowRight, CheckCircle, CircleNotch, ClipboardText, Code, CursorClick, Fingerprint, HandTap, Lightning, PaperPlaneTilt, ShieldCheck, Trash, WarningCircle } from "@phosphor-icons/react";
import { SimulatedTransport, WebBluetoothTransport, clearSavedPairing, getSavedPairingToken, validateTransferText, type KeyboardTarget, type TransferMode, type TransferStage, type TransferTransport } from "./transport";
import { brand } from "./brand";
import { languageOptions, loadLanguage, type LanguageId } from "./languages";
import transferMark from "./assets/airgap-transfer-mark.webp";

type QueuedReview = { firstLine: string; lines: number; bytes: number };

const stageCopy: Record<TransferStage, { label: string; title: string; detail: string }> = {
  disconnected: { label: "Start here", title: "Connect AirGap Paste", detail: "Connect over Bluetooth. First-time connection requires pressing the button on the device." },
  connecting: { label: "Connecting", title: "Keep the device nearby", detail: "The browser is opening and authenticating the Bluetooth link." },
  pairing: { label: "Action required", title: "Press button on AirGap Paste", detail: "Press the BOOT or SEND button on your device within 30 seconds to authorize." },
  connected: { label: "Next step", title: "Review, then queue the text", detail: "Nothing will be typed until you confirm it on the device." },
  queued: { label: "Preparing transfer", title: "Sending text to the device", detail: "Keep this tab open while AirGap Paste verifies the complete buffer." },
  "awaiting-confirmation": { label: "Action required", title: "Press blinking halo on AirGap Paste", detail: "The green halo is blinking. Choose where the text should appear, then press the halo button physically." },
  typing: { label: "In progress", title: "AirGap Paste is typing…", detail: "Keystrokes are being typed into the focused host window. Press the device button again to stop immediately." },
  transferred: { label: "Completed", title: "Text transfer finished", detail: "The reviewed text was typed. It remains in the editor for review." },
  error: { label: "Needs attention", title: "The connection needs your help", detail: "Check the message and try the connection again." },
};

const deviceStateLabel: Record<TransferStage, string> = {
  disconnected: "Not connected",
  connecting: "Connecting…",
  pairing: "Press button to pair",
  connected: "Connected",
  queued: "Preparing transfer",
  "awaiting-confirmation": "Halo blinking · Press now",
  typing: "Typing into host…",
  transferred: "Transfer completed",
  error: "Connection error",
};

export function byteLength(text: string) { return new TextEncoder().encode(text).byteLength; }

export default function EditorApp({ transport: suppliedTransport }: { transport?: TransferTransport }) {
  const [initialTransport] = useState(() => suppliedTransport ?? new WebBluetoothTransport());
  const transportRef = useRef<TransferTransport>(initialTransport);
  const [text, setText] = useState("docker compose up -d --build");
  const [language, setLanguage] = useState<LanguageId>("bash");
  const [extensions, setExtensions] = useState<Extension[]>([]);
  const [transferMode, setTransferMode] = useState<TransferMode>("command");
  const [unicodeTarget, setUnicodeTarget] = useState<Exclude<KeyboardTarget, "ascii"> | "">("");
  const [stage, setStage] = useState<TransferStage>(transportRef.current.getState());
  const [hasPairedDevice, setHasPairedDevice] = useState(() => Boolean(getSavedPairingToken()));
  const [deviceName, setDeviceName] = useState("");
  const [isSimulated, setIsSimulated] = useState(false);
  const [message, setMessage] = useState("");
  const [validationError, setValidationError] = useState("");
  const [queuedReview, setQueuedReview] = useState<QueuedReview | null>(null);
  const operationRef = useRef(0);
  const queueBusyRef = useRef(false);
  const selectedLanguage = languageOptions.find((option) => option.id === language) ?? languageOptions[0];
  const stats = useMemo(() => ({ lines: text ? text.split("\n").length : 0, bytes: byteLength(text) }), [text]);
  const hasUnicode = useMemo(() => Array.from(text).some((character) => (character.codePointAt(0) ?? 0) > 0x7e), [text]);
  const keyboardTarget: KeyboardTarget = hasUnicode && unicodeTarget ? unicodeTarget : "ascii";

  useEffect(() => {
    let cancelled = false;
    setExtensions([]);
    loadLanguage(language).then(value => { if (!cancelled) setExtensions(value); }).catch(() => { /* Plain text editing remains available if a syntax chunk fails to load. */ });
    return () => { cancelled = true; };
  }, [language]);

  const listenToTransport = (transport: TransferTransport) => {
    transport.setStateListener?.((nextStage, nextMessage) => {
      setStage(nextStage);
      setMessage(nextMessage ?? "");
      if (nextStage === "error") setIsSimulated(false);
    });
    return transport;
  };

  useEffect(() => {
    listenToTransport(transportRef.current);
    return () => {
      operationRef.current++;
      transportRef.current.setStateListener?.();
      transportRef.current.disconnect();
    };
  }, []);
  const fail = (error: unknown) => { setStage("error"); setMessage(error instanceof Error ? error.message : "The transfer could not be completed."); };

  async function connectHardware() {
    const operation = ++operationRef.current;
    queueBusyRef.current = false;
    transportRef.current.setStateListener?.();
    transportRef.current.disconnect();
    setMessage(""); setValidationError(""); setQueuedReview(null); setStage("connecting");
    try {
      if (!suppliedTransport) transportRef.current = new WebBluetoothTransport();
      listenToTransport(transportRef.current);
      const device = await transportRef.current.connect();
      if (operation !== operationRef.current) return;
      setDeviceName(device.name); setIsSimulated(device.simulated); setStage(transportRef.current.getState());
      setHasPairedDevice(Boolean(getSavedPairingToken()));
    } catch (error) { if (operation === operationRef.current) fail(error); }
  }

  async function forgetDevice() {
    if (transportRef.current.unpair) {
      await transportRef.current.unpair();
    } else {
      clearSavedPairing();
    }
    if (stage !== "disconnected" && stage !== "error") {
      disconnect();
    }
    setHasPairedDevice(Boolean(getSavedPairingToken()));
    setMessage("Paired device forgotten from this browser.");
  }

  async function connectSimulator() {
    const operation = ++operationRef.current;
    queueBusyRef.current = false;
    transportRef.current.setStateListener?.();
    transportRef.current.disconnect();
    setMessage(""); setValidationError(""); setQueuedReview(null); setStage("connecting");
    try {
      if (!suppliedTransport) transportRef.current = new SimulatedTransport();
      listenToTransport(transportRef.current);
      const device = await transportRef.current.connect();
      if (operation !== operationRef.current) return;
      setDeviceName(device.name); setIsSimulated(device.simulated); setStage(transportRef.current.getState());
    } catch (error) { if (operation === operationRef.current) fail(error); }
  }
  async function queue() {
    if (queueBusyRef.current) return;
    setMessage("");
    setValidationError("");
    if (hasUnicode && !unicodeTarget) {
      setValidationError("Unicode characters were found. Choose the target keyboard system before queuing this transfer.");
      return;
    }
    let reviewedBytes: Uint8Array<ArrayBuffer>;
    try {
      reviewedBytes = validateTransferText(text, transferMode, keyboardTarget);
    } catch (err) {
      setValidationError(err instanceof Error ? err.message : "Invalid transfer text.");
      return;
    }
    const operation = operationRef.current;
    const transport = transportRef.current;
    const reviewedText = new TextDecoder().decode(reviewedBytes);
    queueBusyRef.current = true;
    setStage("queued");
    setQueuedReview({ firstLine: reviewedText.split("\n", 1)[0], lines: reviewedText.split("\n").length, bytes: reviewedBytes.byteLength });
    try {
      await transport.queue({ text: reviewedText, language: selectedLanguage.label, byteLength: reviewedBytes.byteLength, mode: transferMode, keyboardTarget });
      if (operation !== operationRef.current) return;
      await transport.awaitConfirmation();
      if (operation !== operationRef.current) return;
      setStage(transport.getState());
      if (!isSimulated) {
        await transport.confirm();
        if (operation === operationRef.current) setStage(transport.getState());
      }
    } catch (error) {
      if (operation === operationRef.current) {
        fail(error);
      }
    } finally {
      if (operation === operationRef.current) queueBusyRef.current = false;
    }
  }
  async function confirm() {
    const operation = operationRef.current;
    const transport = transportRef.current;
    setMessage("");
    setValidationError("");
    try {
      await transport.confirm();
      if (operation === operationRef.current) {
        setStage(transport.getState());
      }
    } catch (error) {
      if (operation === operationRef.current) {
        fail(error);
      }
    }
  }
  function disconnect() {
    operationRef.current++;
    queueBusyRef.current = false;
    transportRef.current.disconnect();
    setDeviceName("");
    setIsSimulated(false);
    setMessage("");
    setValidationError("");
    setQueuedReview(null);
    setStage("disconnected");
  }

  const statusCopy = stageCopy[stage];
  const canQueue = stage === "connected" || stage === "transferred";
  const canConfirm = stage === "awaiting-confirmation";
  const statusIcon = stage === "connecting" || stage === "queued" || stage === "typing"
    ? <CircleNotch className="spin" size={25} />
    : stage === "pairing"
      ? <HandTap size={27} weight="duotone" />
      : stage === "awaiting-confirmation"
        ? <Fingerprint size={27} />
        : stage === "connected"
          ? <PaperPlaneTilt size={25} />
          : stage === "error"
            ? <WarningCircle size={25} />
            : stage === "disconnected"
              ? <ClipboardText size={25} />
              : <CheckCircle size={25} />;

  return (
    <main className="editor-page">
      <header className="editor-nav">
        <a className="wordmark" href="/" aria-label="Back to AirGap Paste home"><img src={transferMark} alt="" />AirGap <span>Paste</span></a>
        <p><span className="editor-nav__dot" /> Prototype case in progress · Web Bluetooth</p>
        <a className="editor-nav__back" href="/"><ArrowLeft size={16} /> Back to landing page</a>
      </header>
      <section className="editor-intro">
        <div><p className="section-kicker">Reviewed text transfer</p><h1>Queue it. Confirm it. Keep control.</h1><p>Review text, send it over encrypted Bluetooth, then confirm typing physically on AirGap Paste.</p></div>
        <div className="editor-intro__note"><ShieldCheck size={21} /><span><strong>Local transfer</strong> · text stays in this tab. Pairing keys are saved in this browser until forgotten.</span></div>
      </section>
      <section className={`editor-workspace editor-workspace--${stage}`} aria-label="AirGap Paste transfer workspace">
        <div className="editor-surface">
          <div className="editor-toolbar">
            <div><label htmlFor="syntax-language">Syntax language</label><select id="syntax-language" value={language} onChange={(event) => setLanguage(event.target.value as LanguageId)}>{languageOptions.map((option) => <option value={option.id} key={option.id}>{option.label}</option>)}</select></div>
            <div className="editor-toolbar__stats" aria-label={`${stats.lines} lines and ${stats.bytes} UTF-8 bytes`}><span>{stats.lines} lines</span><span>{stats.bytes} bytes</span><button type="button" onClick={() => setText("")} disabled={!text}><Trash size={16} /> Clear</button></div>
          </div>
          <div className="editor-code" aria-labelledby="editor-heading">
            <div className="editor-code__heading"><Code size={17} /><strong id="editor-heading">Review buffer</strong><span>{selectedLanguage.label}</span></div>
            <CodeMirror aria-label="Transfer text" value={text} height="min(45vh, 400px)" theme={oneDark} extensions={extensions} onChange={(value) => { setText(value); if (validationError) setValidationError(""); }} basicSetup={{ lineNumbers: true, highlightActiveLineGutter: true, bracketMatching: true, foldGutter: true }} />
          </div>
          <p className="editor-privacy"><ShieldCheck size={16} /> Text is held in this tab only. Clearing or refreshing removes it.</p>
        </div>
        <aside className="transfer-panel" aria-label="AirGap Paste device transfer">
          <div className={`transfer-panel__top transfer-panel__top--${stage}`}>
            <p><span className="transfer-panel__status-dot" aria-hidden="true" /> Device status</p>
            <strong>{deviceStateLabel[stage]}</strong>
          </div>
          <div className="transfer-device"><img src={transferMark} alt={brand.markAlt} /><div><strong>{deviceName || "AirGap Paste"}</strong><span>BLE input · USB keyboard output</span>{isSimulated && <span className="transfer-device__simulator-badge">Simulation mode</span>}</div></div>
          {stage === "disconnected" && !isSimulated && (
            <div className="simulator-callout">
              <div className="simulator-callout__badge">
                <Lightning size={14} weight="fill" />
                <span>Try it without hardware</span>
              </div>
              <p>Experience Bluetooth queuing, review buffer safety, and USB keyboard typing simulation in your browser.</p>
              <button
                type="button"
                className="simulator-callout__btn"
                onClick={connectSimulator}
              >
                Launch interactive simulator <ArrowRight size={14} weight="bold" />
              </button>
            </div>
          )}
          <div className={`transfer-panel__status transfer-panel__status--${stage}`} role={stage === "error" || validationError ? "alert" : "status"} aria-live={stage === "error" || validationError ? "assertive" : "polite"}>
            <span className="transfer-panel__status-icon" aria-hidden="true">{statusIcon}</span>
            <div>
              <span className="transfer-panel__status-label">{statusCopy.label}</span>
              <strong>{statusCopy.title}</strong>
              <p>{statusCopy.detail}</p>
              {stage === "awaiting-confirmation" && <ol className="confirmation-steps">
                <li><span className="confirmation-step__number">1</span><CursorClick size={27} weight="duotone" /><strong>Click target</strong><small>Where text should appear</small></li>
                <li className="confirmation-step__arrow" aria-hidden="true"><ArrowRight size={17} /></li>
                <li><span className="confirmation-step__number">2</span><HandTap size={27} weight="duotone" /><strong>Press blinking halo</strong><small>Illuminated SEND button</small></li>
              </ol>}
              {message && <p className={stage === "error" ? "transfer-error" : "transfer-progress"}>{message}</p>}
              {validationError && <p className="transfer-error" role="alert">{validationError}</p>}
            </div>
          </div>
          <div className="transfer-settings">
            <label className="transfer-format"><span>Transfer type</span><select aria-label="Transfer type" value={transferMode} onChange={(event) => { setTransferMode(event.target.value as TransferMode); if (validationError) setValidationError(""); }}><option value="command">Command — one line</option><option value="text">Text — lines allowed</option></select><small>{transferMode === "command" ? "For a single command or short value. It is typed but not automatically submitted." : "For reviewed text with line breaks and tabs. It is typed exactly after confirmation."}</small></label>
            {hasUnicode ? <><label className="transfer-format transfer-format--unicode"><span>Unicode detected · choose target keyboard</span><select aria-label="Target keyboard" value={unicodeTarget} onChange={(event) => { setUnicodeTarget(event.target.value as Exclude<KeyboardTarget, "ascii"> | ""); if (validationError) setValidationError(""); }}><option value="">Choose target system…</option><option value="linux">Linux — Unicode input</option><option value="macos">macOS — Unicode Hex Input</option><option value="windows">Windows — Unicode Alt code</option></select><small>{unicodeTarget === "linux" ? "Tested on Linux with Ctrl + Shift + U Unicode input." : unicodeTarget === "macos" ? "Requires Unicode Hex Input on the target Mac." : unicodeTarget === "windows" ? "Requires EnableHexNumpad and a numeric keypad on the target Windows system." : "Select the operating system that will receive the text."}</small></label>{unicodeTarget === "macos" && <details className="macos-unicode-hint"><summary>macOS setup hint</summary><p>On the target Mac: System Settings → Keyboard → Text Input → Edit → <strong>+</strong> → add <strong>Unicode Hex Input</strong>. Select it from the Input menu before pressing SEND.</p></details>}</> : <p className="ascii-output-note">US ASCII selected automatically (target host must use US QWERTY keyboard layout).</p>}
          </div>
          <div className="transfer-actions">
            {(stage === "disconnected" || stage === "error") && (
              <>
                <button className="action-button" type="button" onClick={connectHardware}>
                  <ClipboardText size={18} /> Connect AirGap Paste
                </button>
                {hasPairedDevice && (
                  <button className="secondary-button" type="button" onClick={forgetDevice}>
                    Forget paired device
                  </button>
                )}
                <button className="secondary-button" type="button" onClick={connectSimulator}>
                  Run simulator
                </button>
              </>
            )}
            {stage === "pairing" && (
              <button className="secondary-button" type="button" onClick={disconnect}>
                Cancel pairing
              </button>
            )}
            {canQueue && <button className="action-button" type="button" onClick={queue} disabled={hasUnicode && !unicodeTarget} title={hasUnicode && !unicodeTarget ? "Choose a target keyboard system for Unicode text first." : undefined}><PaperPlaneTilt size={18} /> Queue transfer</button>}
            {canConfirm && queuedReview && (
              <section className="queued-review" aria-label="Reviewed transfer summary">
                <div className="queued-review__heading"><strong>Review text</strong><span>Queued copy · locked</span></div>
                <code title={queuedReview.firstLine}>{queuedReview.firstLine}</code>
                <dl><div><dt>Lines</dt><dd>{queuedReview.lines}</dd></div><div><dt>Size</dt><dd>{queuedReview.bytes} UTF-8 bytes</dd></div></dl>
              </section>
            )}
            {canConfirm && isSimulated && <div className="simulated-confirmation"><p><strong>Simulation only.</strong> This will simulate typing the reviewed text into the target you choose.</p><button className="action-button action-button--confirm" type="button" onClick={confirm}><Fingerprint size={18} /> Simulate physical confirmation</button></div>}
            {stage !== "disconnected" && stage !== "connecting" && stage !== "pairing" && (
              <>
                <button className="secondary-button" type="button" onClick={disconnect}>Disconnect device</button>
                {hasPairedDevice && !isSimulated && (stage === "connected" || stage === "transferred") && (
                  <button className="secondary-button" type="button" onClick={forgetDevice}>
                    Forget paired device
                  </button>
                )}
              </>
            )}
          </div>
          <dl className="transfer-meta"><div><dt>Transfer size</dt><dd>{stats.bytes} UTF-8 bytes</dd></div><div><dt>Confirmation</dt><dd>{canConfirm ? "Required now" : "Not requested"}</dd></div></dl>
          <p className="transfer-disclaimer">Check the text carefully. After physical confirmation, AirGap Paste types it into the active window. Keystrokes are paced for reliable USB keyboard input; the reviewed text is never changed.</p>
        </aside>
      </section>
    </main>
  );
}
