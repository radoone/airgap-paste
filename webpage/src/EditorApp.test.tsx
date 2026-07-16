import "@testing-library/jest-dom/vitest";
import { fireEvent, render, screen } from "@testing-library/react";
import { describe, expect, it, vi } from "vitest";

vi.mock("@uiw/react-codemirror", () => ({
  default: ({ value, onChange }: { value: string; onChange: (value: string) => void }) => (
    <textarea aria-label="Transfer text" value={value} onChange={(event) => onChange(event.target.value)} />
  ),
}));

import EditorApp from "./EditorApp";

describe("EditorApp", () => {
  it("preserves the editor text when switching syntax language", () => {
    render(<EditorApp />);
    const editor = screen.getByRole("textbox", { name: "Transfer text" });
    fireEvent.change(editor, { target: { value: '{"reviewed": true}' } });
    fireEvent.change(screen.getByLabelText("Syntax language"), { target: { value: "json" } });
    expect(editor).toHaveValue('{"reviewed": true}');
    expect(screen.getByText("JSON", { selector: "dd" })).toBeInTheDocument();
  });
});
