import { describe, expect, it } from "vitest";
import { SimulatedTransport } from "./transport";

describe("SimulatedTransport", () => {
  it("requires a connection and progresses through queue and confirmation", async () => {
    const transport = new SimulatedTransport();
    await expect(transport.queue({ text: "echo ready", language: "Bash / shell", byteLength: 10 })).rejects.toThrow("Connect");
    await transport.connect();
    expect(transport.getState()).toBe("connected");
    await transport.queue({ text: "echo ready", language: "Bash / shell", byteLength: 10 });
    expect(transport.getState()).toBe("queued");
    await transport.awaitConfirmation();
    expect(transport.getState()).toBe("awaiting-confirmation");
    await transport.confirm();
    expect(transport.getState()).toBe("transferred");
  });

  it("rejects blank payloads and premature confirmations", async () => {
    const transport = new SimulatedTransport();
    await transport.connect();
    await expect(transport.queue({ text: "  ", language: "Plain text", byteLength: 2 })).rejects.toThrow("Add text");
    await expect(transport.confirm()).rejects.toThrow("not awaiting");
  });
});
