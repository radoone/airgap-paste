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
import { SimulatedTransport, WebBluetoothTransport, type TransferMode, type TransferStage, type TransferTransport } from "./transport";

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
  disconnected: { label: "Start here", title: "Connect AirGap Paste", detail: "Enter the device key and connect over Bluetooth." },
  connecting: { label: "Connecting", title: "Keep the device nearby", detail: "The browser is opening and authenticating the Bluetooth link." },
  connected: { label: "Next step", title: "Review, then queue the text", detail: "Nothing will be typed until you confirm it on the device." },
  queued: { label: "Preparing transfer", title: "Sending text to the device", detail: "Keep this tab open while AirGap Paste verifies the complete buffer." },
  "awaiting-confirmation": { label: "Action required", title: "Press SEND on AirGap Paste", detail: "Choose where the text should appear, then confirm it physically." },
  transferred: { label: "Completed", title: "Text transfer finished", detail: "The reviewed text was typed. It remains in the editor for review." },
  error: { label: "Needs attention", title: "The connection needs your help", detail: "Check the message and try the connection again." },
};

const deviceStateLabel: Record<TransferStage, string> = {
  disconnected: "Not connected",
  connecting: "Connecting…",
  connected: "Connected",
  queued: "Preparing transfer",
  "awaiting-confirmation": "Press SEND now",
  transferred: "Transfer completed",
  error: "Connection error",
};

export function byteLength(text: string) { return new TextEncoder().encode(text).byteLength; }

export default function EditorApp({ transport: suppliedTransport }: { transport?: TransferTransport }) {
  const transportRef = useRef<TransferTransport>(suppliedTransport ?? new WebBluetoothTransport());
  const [text, setText] = useState("docker compose up -d --build");
  const [language, setLanguage] = useState<LanguageId>("bash");
  const [transferMode, setTransferMode] = useState<TransferMode>("command");
  const [deviceKey, setDeviceKey] = useState("");
  const [stage, setStage] = useState<TransferStage>(transportRef.current.getState());
  const [deviceName, setDeviceName] = useState("");
  const [isSimulated, setIsSimulated] = useState(false);
  const [message, setMessage] = useState("");
  const queuedTimer = useRef<number | undefined>();
  const selectedLanguage = languageOptions.find((option) => option.id === language) ?? languageOptions[0];
  const stats = useMemo(() => ({ lines: text ? text.split("\n").length : 0, bytes: byteLength(text) }), [text]);

  useEffect(() => () => window.clearTimeout(queuedTimer.current), []);
  const fail = (error: unknown) => { setStage("error"); setMessage(error instanceof Error ? error.message : "The transfer could not be completed."); };

  async function connectHardware() {
    setMessage(""); setStage("connecting");
    try {
      if (!suppliedTransport) transportRef.current = new WebBluetoothTransport();
      const device = await transportRef.current.connect(deviceKey);
      setDeviceName(device.name); setIsSimulated(device.simulated); setStage(transportRef.current.getState());
    } catch (error) { fail(error); }
  }
  async function connectSimulator() {
    setMessage(""); setStage("connecting");
    try {
      if (!suppliedTransport) transportRef.current = new SimulatedTransport();
      const device = await transportRef.current.connect();
      setDeviceName(device.name); setIsSimulated(device.simulated); setStage(transportRef.current.getState());
    } catch (error) { fail(error); }
  }
  async function queue() {
    setMessage("");
    try {
      await transportRef.current.queue({ text, language: selectedLanguage.label, byteLength: stats.bytes, mode: transferMode });
      setStage("queued");
      window.clearTimeout(queuedTimer.current);
      queuedTimer.current = window.setTimeout(async () => {
        try {
          await transportRef.current.awaitConfirmation();
          setStage(transportRef.current.getState());
          if (!isSimulated) {
            await transportRef.current.confirm();
            setStage(transportRef.current.getState());
          }
        } catch (error) { fail(error); }
      }, 500);
    } catch (error) { fail(error); }
  }
  async function confirm() { setMessage(""); try { await transportRef.current.confirm(); setStage(transportRef.current.getState()); } catch (error) { fail(error); } }
  function disconnect() { window.clearTimeout(queuedTimer.current); transportRef.current.disconnect(); setDeviceName(""); setIsSimulated(false); setMessage(""); setStage("disconnected"); }

  const statusCopy = stageCopy[stage];
  const canQueue = stage === "connected" || stage === "transferred";
  const canConfirm = stage === "awaiting-confirmation";
  const statusIcon = stage === "connecting" || stage === "queued"
    ? <CircleNotch className="spin" size={25} />
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
            <CodeMirror aria-label="Transfer text" value={text} height="min(45vh, 400px)" theme={oneDark} extensions={selectedLanguage.extensions} onChange={setText} basicSetup={{ lineNumbers: true, highlightActiveLineGutter: true, bracketMatching: true, foldGutter: true }} />
          </div>
          <p className="editor-privacy"><ShieldCheck size={16} /> Text is held in this tab only. Clearing or refreshing removes it.</p>
        </div>
        <aside className="transfer-panel" aria-label="AirGap Paste device transfer">
          <div className={`transfer-panel__top transfer-panel__top--${stage}`}>
            <p><span className="transfer-panel__status-dot" aria-hidden="true" /> Device status</p>
            <strong>{deviceStateLabel[stage]}</strong>
          </div>
          <div className="transfer-device"><Fingerprint size={35} weight="thin" /><div><strong>{deviceName || "AirGap Paste"}</strong><span>BLE input · USB keyboard output</span></div></div>
          <div className={`transfer-panel__status transfer-panel__status--${stage}`} role={stage === "error" ? "alert" : "status"} aria-live={stage === "error" ? "assertive" : "polite"}>
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
            </div>
          </div>
          <label className="transfer-format"><span>Transfer type</span><select aria-label="Transfer type" value={transferMode} onChange={(event) => setTransferMode(event.target.value as TransferMode)}><option value="command">Command — one line</option><option value="text">Text — lines allowed</option></select><small>{transferMode === "command" ? "For a single command or short value. It is typed but not automatically submitted." : "For reviewed text with line breaks and tabs. It is typed exactly after confirmation."}</small></label>
          <div className="transfer-actions">
            {(stage === "disconnected" || stage === "error") && <label className="device-key-field"><span>Device key</span><input type="password" value={deviceKey} onChange={(event) => setDeviceKey(event.target.value)} autoComplete="off" placeholder="From controller/include/device_secrets.h" /></label>}
            {(stage === "disconnected" || stage === "error") && <button className="action-button" type="button" onClick={connectHardware} disabled={stage === "connecting"}>{stage === "connecting" ? <><CircleNotch className="spin" size={18} /> Connecting</> : <><ClipboardText size={18} /> Connect AirGap Paste</>}</button>}
            {(stage === "disconnected" || stage === "error") && <button className="secondary-button" type="button" onClick={connectSimulator}>Run simulator</button>}
            {canQueue && <button className="action-button" type="button" onClick={queue}><PaperPlaneTilt size={18} /> Queue transfer</button>}
            {canConfirm && isSimulated && <button className="action-button action-button--confirm" type="button" onClick={confirm}><Fingerprint size={18} /> Confirm simulated device</button>}
            {stage !== "disconnected" && stage !== "connecting" && <button className="secondary-button" type="button" onClick={disconnect}>Disconnect device</button>}
          </div>
          <dl className="transfer-meta"><div><dt>Transfer size</dt><dd>{stats.bytes} UTF-8 bytes</dd></div><div><dt>Confirmation</dt><dd>{canConfirm ? "Required now" : "Not requested"}</dd></div></dl>
          <p className="transfer-disclaimer">Check the text carefully. After physical confirmation, AirGap Paste types it into the active window.</p>
        </aside>
      </section>
    </main>
  );
}
