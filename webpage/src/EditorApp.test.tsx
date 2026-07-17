import "@testing-library/jest-dom/vitest";
import { cleanup, fireEvent, render, screen } from "@testing-library/react";
import { afterEach, describe, expect, it, vi } from "vitest";

vi.mock("@uiw/react-codemirror", () => ({
  default: ({ value, onChange }: { value: string; onChange: (value: string) => void }) => (
    <textarea aria-label="Transfer text" value={value} onChange={(event) => onChange(event.target.value)} />
  ),
}));

import EditorApp from "./EditorApp";

afterEach(cleanup);

describe("EditorApp", () => {
  it("preserves the editor text when switching syntax language", () => {
    render(<EditorApp />);
    const editor = screen.getByRole("textbox", { name: "Transfer text" });
    fireEvent.change(editor, { target: { value: '{"reviewed": true}' } });
    fireEvent.change(screen.getByLabelText("Syntax language"), { target: { value: "json" } });
    expect(editor).toHaveValue('{"reviewed": true}');
    expect(screen.getByText("JSON", { selector: "dd" })).toBeInTheDocument();
  });

  it("offers separate command and text transfer types", () => {
    render(<EditorApp />);
    const format = screen.getByLabelText("Transfer type");
    expect(format).toHaveValue("command");
    expect(screen.getByText(/not automatically submitted/)).toBeInTheDocument();
    fireEvent.change(format, { target: { value: "text" } });
    expect(screen.getByText(/line breaks and tabs/)).toBeInTheDocument();
  });
});
