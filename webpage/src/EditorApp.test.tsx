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
    const language = screen.getByLabelText("Syntax language");
    fireEvent.change(language, { target: { value: "json" } });
    expect(editor).toHaveValue('{"reviewed": true}');
    expect(language).toHaveValue("json");
  });

  it("offers separate command and text transfer types", () => {
    render(<EditorApp />);
    const format = screen.getByLabelText("Transfer type");
    expect(format).toHaveValue("command");
    expect(screen.getByText(/not automatically submitted/)).toBeInTheDocument();
    fireEvent.change(format, { target: { value: "text" } });
    expect(screen.getByText(/line breaks and tabs/)).toBeInTheDocument();
  });

  it("displays validation error without resetting connected state", async () => {
    render(<EditorApp />);
    const connectSimBtn = screen.getByRole("button", { name: "Run simulator" });
    fireEvent.click(connectSimBtn);
    expect(await screen.findByRole("button", { name: "Queue transfer" })).toBeInTheDocument();

    const editor = screen.getByRole("textbox", { name: "Transfer text" });
    fireEvent.change(editor, { target: { value: "echo hello\necho world" } });

    const queueBtn = screen.getByRole("button", { name: "Queue transfer" });
    fireEvent.click(queueBtn);

    expect(await screen.findByText(/Commands must be one line of printable text/)).toBeInTheDocument();
    // Device is still connected and queue button remains accessible:
    expect(screen.getByRole("button", { name: "Queue transfer" })).toBeInTheDocument();
    expect(screen.queryByRole("button", { name: "Connect AirGap Paste" })).not.toBeInTheDocument();
  });

  it("disconnects cleanly without triggering an error", async () => {
    render(<EditorApp />);
    const connectSimBtn = screen.getByRole("button", { name: "Run simulator" });
    fireEvent.click(connectSimBtn);
    expect(await screen.findByRole("button", { name: "Disconnect device" })).toBeInTheDocument();

    const disconnectBtn = screen.getByRole("button", { name: "Disconnect device" });
    fireEvent.click(disconnectBtn);

    expect(await screen.findByRole("button", { name: "Connect AirGap Paste" })).toBeInTheDocument();
    expect(screen.queryByRole("alert")).not.toBeInTheDocument();
  });
});
