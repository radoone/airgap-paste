import { describe, expect, it } from "vitest";
import { MAX_TRANSFER_BYTES, SimulatedTransport, validateTransferText } from "./transport";

describe("SimulatedTransport", () => {
  it("requires a connection and progresses through queue and confirmation", async () => {
    const transport = new SimulatedTransport();
    await expect(transport.queue({ text: "echo ready", language: "Bash / shell", byteLength: 10, mode: "command" })).rejects.toThrow("Connect");
    await transport.connect();
    expect(transport.getState()).toBe("connected");
    await transport.queue({ text: "echo ready", language: "Bash / shell", byteLength: 10, mode: "command" });
    expect(transport.getState()).toBe("queued");
    await transport.awaitConfirmation();
    expect(transport.getState()).toBe("awaiting-confirmation");
    await transport.confirm();
    expect(transport.getState()).toBe("transferred");
  });

  it("rejects blank payloads and premature confirmations", async () => {
    const transport = new SimulatedTransport();
    await transport.connect();
    await expect(transport.queue({ text: "  ", language: "Plain text", byteLength: 2, mode: "command" })).rejects.toThrow("Add text");
    await expect(transport.confirm()).rejects.toThrow("not awaiting");
  });

  it("uses a strict command mode and a multiline text mode", () => {
    expect(Array.from(validateTransferText("docker compose up -d", "command"))).toEqual(Array.from(new TextEncoder().encode("docker compose up -d")));
    expect(() => validateTransferText("echo ready\n./deploy", "command")).toThrow("one line");
    expect(Array.from(validateTransferText("First line\n\tSecond line", "text"))).toEqual(Array.from(new TextEncoder().encode("First line\n\tSecond line")));
    expect(() => validateTransferText("príliš", "text")).toThrow("US-ASCII");
    expect(() => validateTransferText("x".repeat(MAX_TRANSFER_BYTES + 1), "text")).toThrow("at most");
  });
});
