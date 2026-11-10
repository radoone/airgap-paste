import type { Extension } from "@codemirror/state";

export type LanguageId = "text" | "bash" | "json" | "javascript" | "python" | "yaml" | "markdown";
export const languageOptions: { id: LanguageId; label: string }[] = [
  { id: "text", label: "Plain text" },
  { id: "bash", label: "Bash / shell" },
  { id: "json", label: "JSON" },
  { id: "javascript", label: "JavaScript / TypeScript" },
  { id: "python", label: "Python" },
  { id: "yaml", label: "YAML" },
  { id: "markdown", label: "Markdown" },
];

const loaded = new Map<LanguageId, Promise<Extension[]>>();
export function loadLanguage(id: LanguageId): Promise<Extension[]> {
  const cached = loaded.get(id);
  if (cached) return cached;
  const load = async (): Promise<Extension[]> => {
    switch (id) {
      case "text": return [];
      case "bash": {
        const [{ StreamLanguage }, { shell }] = await Promise.all([import("@codemirror/language"), import("@codemirror/legacy-modes/mode/shell")]);
        return [StreamLanguage.define(shell)];
      }
      case "json": return [(await import("@codemirror/lang-json")).json()];
      case "javascript": return [(await import("@codemirror/lang-javascript")).javascript({ typescript: true })];
      case "python": return [(await import("@codemirror/lang-python")).python()];
      case "yaml": return [(await import("@codemirror/lang-yaml")).yaml()];
      case "markdown": return [(await import("@codemirror/lang-markdown")).markdown()];
    }
  };
  const pending = load().catch(error => { loaded.delete(id); throw error; });
  loaded.set(id, pending);
  return pending;
}
