import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  optimizeDeps: {
    include: ["react", "react-dom/client"],
  },
  server: {
    host: "0.0.0.0",
    allowedHosts: ["terminal.local"],
    warmup: {
      clientFiles: ["./src/main.tsx"],
    },
  },
  build: {
    rolldownOptions: {
      output: {
        manualChunks(id) {
          if (id.includes("node_modules/@codemirror/lang-") || id.includes("node_modules/@codemirror/legacy-modes") || id.includes("node_modules/@lezer")) {
            return "codemirror-langs";
          }
          if (id.includes("node_modules/@codemirror") || id.includes("node_modules/@uiw") || id.includes("node_modules/codemirror")) {
            return "codemirror-core";
          }
          if (id.includes("node_modules/firebase") || id.includes("node_modules/@firebase")) {
            return "firebase";
          }
        },
      },
    },
  },
  plugins: [react()],
});
