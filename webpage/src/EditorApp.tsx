import { useEffect, useMemo, useRef, useState } from "react";
import CodeMirror from "@uiw/react-codemirror";
import { javascript } from "@codemirror/lang-javascript";
import { json } from "@codemirror/lang-json";
import { markdown } from "@codemirror/lang-markdown";
import { python } from "@codemirror/lang-python";
import { yaml } from "@codemirror/lang-yaml";
import { StreamLanguage } from "@codemirror/language";
import { shell } from "@codemirror/legacy-modes/mode/shell";
import { oneDark } from "@codemirror/theme-one-dark";
import type { Extension } from "@codemirror/state";
import { ArrowLeft, ArrowRight, CheckCircle, CircleNotch, ClipboardText, Code, CursorClick, Fingerprint, HandTap, PaperPlaneTilt, ShieldCheck, Trash, WarningCircle } from "@phosphor-icons/react";
import { SimulatedTransport, WebBluetoothTransport, clearSavedPairing, getSavedPairingToken, validateTransferText, type KeyboardTarget, type TransferMode, type TransferStage, type TransferTransport } from "./transport";

type LanguageId = "text" | "bash" | "json" | "javascript" | "python" | "yaml" | "markdown";
type LanguageOption = { id: LanguageId; label: string; extensions: Extension[] };

export const languageOptions: LanguageOption[] = [
  { id: "text", label: "Plain text", extensions: [] },
  { id: "bash", label: "Bash / shell", extensions: [StreamLanguage.define(shell)] },
  { id: "json", label: "JSON", extensions: [json()] },
  { id: "javascript", label: "JavaScript / TypeScript", extensions: [javascript({ typescript: true })] },
  { id: "python", label: "Python", extensions: [python()] },
  { id: "yaml", label: "YAML", extensions: [yaml()] },
  { id: "markdown", label: "Markdown", extensions: [markdown()] },
];

const stageCopy: Record<TransferStage, { label: string; title: string; detail: string }> = {
  disconnected: { label: "Start here", title: "Connect AirGap Paste", detail: "Connect over Bluetooth. First-time connection requires pressing the button on the device." },
  connecting: { label: "Connecting", title: "Keep the device nearby", detail: "The browser is opening and authenticating the Bluetooth link." },
  pairing: { label: "Action required", title: "Press button on AirGap Paste", detail: "Press the BOOT or SEND button on your device within 30 seconds to authorize." },
  connected: { label: "Next step", title: "Review, then queue the text", detail: "Nothing will be typed until you confirm it on the device." },
  queued: { label: "Preparing transfer", title: "Sending text to the device", detail: "Keep this tab open while AirGap Paste verifies the complete buffer." },
  "awaiting-confirmation": { label: "Action required", title: "Press SEND on AirGap Paste", detail: "Choose where the text should appear, then confirm it physically." },
  typing: { label: "In progress", title: "AirGap Paste is typing…", detail: "Keystrokes are being typed into the focused host window." },
  transferred: { label: "Completed", title: "Text transfer finished", detail: "The reviewed text was typed. It remains in the editor for review." },
  error: { label: "Needs attention", title: "The connection needs your help", detail: "Check the message and try the connection again." },
};

const deviceStateLabel: Record<TransferStage, string> = {
  disconnected: "Not connected",
  connecting: "Connecting…",
  pairing: "Press button to pair",
  connected: "Connected",
  queued: "Preparing transfer",
  "awaiting-confirmation": "Press SEND now",
  typing: "Typing into host…",
  transferred: "Transfer completed",
  error: "Connection error",
};

export function byteLength(text: string) { return new TextEncoder().encode(text).byteLength; }

export default function EditorApp({ transport: suppliedTransport }: { transport?: TransferTransport }) {
  const transportRef = useRef<TransferTransport>(suppliedTransport ?? new WebBluetoothTransport());
  const [text, setText] = useState("docker compose up -d --build");
  const [language, setLanguage] = useState<LanguageId>("bash");
  const [transferMode, setTransferMode] = useState<TransferMode>("command");
  const [unicodeTarget, setUnicodeTarget] = useState<Exclude<KeyboardTarget, "ascii"> | "">("");
  const [stage, setStage] = useState<TransferStage>(transportRef.current.getState());
  const [hasPairedDevice, setHasPairedDevice] = useState(() => Boolean(getSavedPairingToken()));
  const [deviceName, setDeviceName] = useState("");
  const [isSimulated, setIsSimulated] = useState(false);
  const [message, setMessage] = useState("");
  const [validationError, setValidationError] = useState("");
  const queuedTimer = useRef<number | undefined>();
  const isDisconnectingRef = useRef(false);
  const selectedLanguage = languageOptions.find((option) => option.id === language) ?? languageOptions[0];
  const stats = useMemo(() => ({ lines: text ? text.split("\n").length : 0, bytes: byteLength(text) }), [text]);
  const hasUnicode = useMemo(() => Array.from(text).some((character) => (character.codePointAt(0) ?? 0) > 0x7e), [text]);
  const keyboardTarget: KeyboardTarget = hasUnicode && unicodeTarget ? unicodeTarget : "ascii";

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
      window.clearTimeout(queuedTimer.current);
      transportRef.current.setStateListener?.();
    };
  }, []);
  const fail = (error: unknown) => { setStage("error"); setMessage(error instanceof Error ? error.message : "The transfer could not be completed."); };

  async function connectHardware() {
    isDisconnectingRef.current = false;
    setMessage(""); setValidationError(""); setStage("connecting");
    try {
      if (!suppliedTransport) transportRef.current = listenToTransport(new WebBluetoothTransport());
      const device = await transportRef.current.connect();
      setDeviceName(device.name); setIsSimulated(device.simulated); setStage(transportRef.current.getState());
      setHasPairedDevice(Boolean(getSavedPairingToken()));
    } catch (error) { fail(error); }
  }

  async function forgetDevice() {
    clearSavedPairing();
    if (transportRef.current.unpair) {
      await transportRef.current.unpair();
    }
    setHasPairedDevice(false);
    setMessage("Paired device forgotten from this browser.");
  }

  async function connectSimulator() {
    isDisconnectingRef.current = false;
    setMessage(""); setValidationError(""); setStage("connecting");
    try {
      if (!suppliedTransport) transportRef.current = listenToTransport(new SimulatedTransport());
      const device = await transportRef.current.connect();
      setDeviceName(device.name); setIsSimulated(device.simulated); setStage(transportRef.current.getState());
    } catch (error) { fail(error); }
  }
  async function queue() {
    setMessage("");
    setValidationError("");
    if (hasUnicode && !unicodeTarget) {
      setValidationError("Unicode characters were found. Choose the target keyboard system before queuing this transfer.");
      return;
    }
    try {
      validateTransferText(text, transferMode, keyboardTarget);
    } catch (err) {
      setValidationError(err instanceof Error ? err.message : "Invalid transfer text.");
      return;
    }
    try {
      await transportRef.current.queue({ text, language: selectedLanguage.label, byteLength: stats.bytes, mode: transferMode, keyboardTarget });
      setStage("queued");
      window.clearTimeout(queuedTimer.current);
      queuedTimer.current = window.setTimeout(async () => {
        try {
          await transportRef.current.awaitConfirmation();
          setStage(transportRef.current.getState());
          if (!isSimulated) {
            await transportRef.current.confirm();
            if (!isDisconnectingRef.current) {
              setStage(transportRef.current.getState());
            }
          }
        } catch (error) {
          if (!isDisconnectingRef.current) {
            fail(error);
          }
        }
      }, 500);
    } catch (error) {
      if (!isDisconnectingRef.current) {
        fail(error);
      }
    }
  }
  async function confirm() {
    setMessage("");
    setValidationError("");
    try {
      await transportRef.current.confirm();
      if (!isDisconnectingRef.current) {
        setStage(transportRef.current.getState());
      }
    } catch (error) {
      if (!isDisconnectingRef.current) {
        fail(error);
      }
    }
  }
  function disconnect() {
    isDisconnectingRef.current = true;
    window.clearTimeout(queuedTimer.current);
    transportRef.current.disconnect();
    setDeviceName("");
    setIsSimulated(false);
    setMessage("");
    setValidationError("");
    setStage("disconnected");
    window.setTimeout(() => { isDisconnectingRef.current = false; }, 100);
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
        <a className="wordmark" href="/" aria-label="Back to AirGap Paste home">AirGap <span>Paste</span></a>
        <p><span className="editor-nav__dot" /> Hardware prototype · Web Bluetooth</p>
        <a className="editor-nav__back" href="/"><ArrowLeft size={16} /> Back to landing page</a>
      </header>
      <section className="editor-intro">
        <div><p className="section-kicker">Reviewed text transfer</p><h1>Queue it. Confirm it. Keep control.</h1><p>Review text, send it over encrypted Bluetooth, then confirm typing physically on AirGap Paste.</p></div>
        <div className="editor-intro__note"><ShieldCheck size={21} /><span><strong>Local transfer</strong> · the device key and text stay in this browser tab and are never sent to a backend.</span></div>
      </section>
      <section className={`editor-workspace editor-workspace--${stage}`} aria-label="AirGap Paste transfer workspace">
        <div className="editor-surface">
          <div className="editor-toolbar">
            <div><label htmlFor="syntax-language">Syntax language</label><select id="syntax-language" value={language} onChange={(event) => setLanguage(event.target.value as LanguageId)}>{languageOptions.map((option) => <option value={option.id} key={option.id}>{option.label}</option>)}</select></div>
            <div className="editor-toolbar__stats" aria-label={`${stats.lines} lines and ${stats.bytes} UTF-8 bytes`}><span>{stats.lines} lines</span><span>{stats.bytes} bytes</span><button type="button" onClick={() => setText("")} disabled={!text}><Trash size={16} /> Clear</button></div>
          </div>
          <div className="editor-code" aria-labelledby="editor-heading">
            <div className="editor-code__heading"><Code size={17} /><strong id="editor-heading">Review buffer</strong><span>{selectedLanguage.label}</span></div>
            <CodeMirror aria-label="Transfer text" value={text} height="min(45vh, 400px)" theme={oneDark} extensions={selectedLanguage.extensions} onChange={(value) => { setText(value); if (validationError) setValidationError(""); }} basicSetup={{ lineNumbers: true, highlightActiveLineGutter: true, bracketMatching: true, foldGutter: true }} />
          </div>
          <p className="editor-privacy"><ShieldCheck size={16} /> Text is held in this tab only. Clearing or refreshing removes it.</p>
        </div>
        <aside className="transfer-panel" aria-label="AirGap Paste device transfer">
          <div className={`transfer-panel__top transfer-panel__top--${stage}`}>
            <p><span className="transfer-panel__status-dot" aria-hidden="true" /> Device status</p>
            <strong>{deviceStateLabel[stage]}</strong>
          </div>
          <div className="transfer-device"><Fingerprint size={35} weight="thin" /><div><strong>{deviceName || "AirGap Paste"}</strong><span>BLE input · USB keyboard output</span></div></div>
          <div className={`transfer-panel__status transfer-panel__status--${stage}`} role={stage === "error" || validationError ? "alert" : "status"} aria-live={stage === "error" || validationError ? "assertive" : "polite"}>
            <span className="transfer-panel__status-icon" aria-hidden="true">{statusIcon}</span>
            <div>
              <span className="transfer-panel__status-label">{statusCopy.label}</span>
              <strong>{statusCopy.title}</strong>
              <p>{statusCopy.detail}</p>
              {stage === "awaiting-confirmation" && <ol className="confirmation-steps">
                <li><span className="confirmation-step__number">1</span><CursorClick size={27} weight="duotone" /><strong>Click target</strong><small>Where text should appear</small></li>
                <li className="confirmation-step__arrow" aria-hidden="true"><ArrowRight size={17} /></li>
                <li><span className="confirmation-step__number">2</span><HandTap size={27} weight="duotone" /><strong>Press SEND</strong><small>BOOT or SEND button</small></li>
              </ol>}
              {message && <p className="transfer-error">{message}</p>}
              {validationError && <p className="transfer-error" role="alert">{validationError}</p>}
            </div>
          </div>
          <div className="transfer-settings">
            <label className="transfer-format"><span>Transfer type</span><select aria-label="Transfer type" value={transferMode} onChange={(event) => { setTransferMode(event.target.value as TransferMode); if (validationError) setValidationError(""); }}><option value="command">Command — one line</option><option value="text">Text — lines allowed</option></select><small>{transferMode === "command" ? "For a single command or short value. It is typed but not automatically submitted." : "For reviewed text with line breaks and tabs. It is typed exactly after confirmation."}</small></label>
            {hasUnicode ? <><label className="transfer-format transfer-format--unicode"><span>Unicode detected · choose target keyboard</span><select aria-label="Target keyboard" value={unicodeTarget} onChange={(event) => { setUnicodeTarget(event.target.value as Exclude<KeyboardTarget, "ascii"> | ""); if (validationError) setValidationError(""); }}><option value="">Choose target system…</option><option value="linux">Linux — Unicode input</option><option value="macos">macOS — Unicode Hex Input</option><option value="windows">Windows — Unicode Alt code</option></select><small>{unicodeTarget === "linux" ? "Tested on Linux with Ctrl + Shift + U Unicode input." : unicodeTarget === "macos" ? "Requires Unicode Hex Input on the target Mac." : unicodeTarget === "windows" ? "Requires EnableHexNumpad and a numeric keypad on the target Windows system." : "Select the operating system that will receive the text."}</small></label>{unicodeTarget === "macos" && <details className="macos-unicode-hint"><summary>macOS setup hint</summary><p>On the target Mac: System Settings → Keyboard → Text Input → Edit → <strong>+</strong> → add <strong>Unicode Hex Input</strong>. Select it from the Input menu before pressing SEND.</p></details>}</> : <p className="ascii-output-note">US ASCII selected automatically for this text.</p>}
          </div>
          <div className="transfer-actions">
            {(stage === "disconnected" || stage === "error") && (
              <>
                <button
                  className="action-button"
                  type="button"
                  onClick={connectHardware}
                  disabled={stage === "connecting" || stage === "pairing"}
                >
                  {stage === "connecting" ? (
                    <><CircleNotch className="spin" size={18} /> Connecting</>
                  ) : stage === "pairing" ? (
                    <><HandTap size={18} /> Press button to pair</>
                  ) : (
                    <><ClipboardText size={18} /> Connect AirGap Paste</>
                  )}
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
            {canConfirm && isSimulated && <button className="action-button action-button--confirm" type="button" onClick={confirm}><Fingerprint size={18} /> Confirm simulated device</button>}
            {stage !== "disconnected" && stage !== "connecting" && stage !== "pairing" && <button className="secondary-button" type="button" onClick={disconnect}>Disconnect device</button>}
          </div>
          <dl className="transfer-meta"><div><dt>Transfer size</dt><dd>{stats.bytes} UTF-8 bytes</dd></div><div><dt>Confirmation</dt><dd>{canConfirm ? "Required now" : "Not requested"}</dd></div></dl>
          <p className="transfer-disclaimer">Check the text carefully. After physical confirmation, AirGap Paste types it into the active window. Keystrokes are paced for reliable USB keyboard input; the reviewed text is never changed.</p>
        </aside>
      </section>
    </main>
  );
}
