## Design QA — AirGap Paste

**Source visual truth:** `src/assets/airgap-paste-design-reference.png` (selected third ideation direction)

**Implementation evidence:** `qa/desktop.png` at 1440 × 1024, `qa/mobile.png` at 390 × 844, and the revised-hero captures `qa/hero-revision-desktop.png` and `qa/hero-revision-mobile.png`.

**Full-view comparison evidence:** `qa/comparison.png` combines the selected direction and rendered desktop page in one image.

**State:** initial load; the first waitlist form and primary navigation are visible.

### Findings

- No actionable P0/P1/P2 mismatches.
- The implementation preserves the selected direction’s dark technical surface, orange physical-confirmation accent, left-aligned message hierarchy, right-side hardware focus, mono technical labels, and code-forward developer positioning.
- The source visual uses a very narrow condensed mono display face. The implementation uses a more readable Manrope display face so the required long-form marketing copy remains legible; this is an intentional product-content adaptation, not a fidelity defect.
- The hero now uses a dark, clearly-labelled prototype render that belongs to the black/orange system. It visibly shows the product name, the physical `SEND` control, USB-C connection, and the Online workstation → BLE text transfer → USB keyboard → Isolated computer flow. The supplied enclosure reference still informs the intended 55 × 32 × 17 mm prototype size.

### Required fidelity surfaces

- **Fonts and typography:** display hierarchy, mono labels, readable supporting copy, and responsive wrapping are consistent with the target’s engineering-led tone.
- **Spacing and layout rhythm:** the desktop hero uses the target’s broad two-column composition; mobile collapses to a single, non-overflowing flow.
- **Colors and visual tokens:** black/graphite base, off-white text, and controlled orange confirmation accent match the selected design direction.
- **Image quality and asset fidelity:** the visual uses a dedicated high-resolution, dark prototype render and is explicitly labelled as a render rather than a production photograph.
- **Copy and content:** all required safety boundaries, script warning, planned integrity checks, waitlist offer, prototype-development status, and future crowdfunding readiness content are present.

### Interaction checks

- Navigation anchors, FAQ expansion, focusable waitlist controls, privacy route, and primary CTAs were checked in the rendered page.
- Browser console: no application errors observed after adding the local favicon; the earlier missing-favicon development request is resolved.
- Form submission is wired to the Firebase endpoint. Production endpoint behaviour should be monitored after enabling App Check and conducting a controlled waitlist signup test.
- Analytics is gated with `react-cookie-consent`: no Google Analytics script is present before an affirmative choice; accepting loads the configured measurement tag, and declining keeps it disabled after reload. Cookie settings in the footer reopens the equal-choice controls.

### Follow-up polish

- Add real prototype photography and a short demonstration video once hardware validation is complete.
- Add a real Firebase project ID, App Check key, and custom domain before public launch.
- Publish the final legal controller identity, postal address, privacy-contact email, retention schedule and counsel-reviewed notices before a public commercial launch.

**final result: passed**

---

## Design QA — compact `/app` workspace

**Source visual truth:** User feedback on the Browser-captured `/app` screen: the editor workflow should be compact, easy to use, and should not separate the device panel into a long second section.

**Implementation evidence:** `qa/compact-editor-2026-07-16.png` at 779 × 806, disconnected device state with one Bash command in the editor.

**Full-view comparison evidence:** The pre-change Browser capture showed a 470 px editor and a one-column layout at this width, leaving the device controls below the editor. The revised capture keeps the review buffer and complete device connection action visible together.

**Focused-region comparison:** The editor toolbar and device panel were reviewed directly; no image assets are used in this workspace, so a separate asset crop was not needed.

### Comparison history

- [P1] The workspace split into a vertical flow too early, requiring a scroll before the user could reach the device controls.
  - Fix: narrowed the workspace, reduced the sidebar to 330 px, and moved the one-column breakpoint from 950 px to 760 px.
  - Post-fix evidence: `qa/compact-editor-2026-07-16.png` shows the review buffer, device key, and primary connection action in one viewport.
- [P2] Oversized heading, editor height, and panel spacing made the command workflow feel like a landing page instead of a utility.
  - Fix: reduced the header, intro, controls, editor height, panel padding, and row spacing.
  - Post-fix evidence: the command, transfer metadata, device key, and primary action are visible without a large empty canvas.

### Required fidelity surfaces

- **Fonts and typography:** Keeps Manrope for readable workflow hierarchy and DM Mono for operational labels; compact sizes remain legible at the checked viewport.
- **Spacing and layout rhythm:** The main grid is now compact and side-by-side through 761 px; it collapses only when controls need a single column.
- **Colors and visual tokens:** The existing black/graphite base, off-white text, orange action, and green completion token are unchanged.
- **Image quality and asset fidelity:** No images are used in the editor workspace; the existing Phosphor icon set remains appropriate.
- **Copy and content:** Hardware-specific connection, device-key, safety-profile, and local-transfer copy remain present and readable.

### Interaction checks

- Syntax selector, clear button, device-key input, hardware connection button, and simulator action remain visible and keyboard reachable in the checked state.
- Production build and unit tests pass after the compactness changes.

### Follow-up polish

- At widths below 760 px, the device panel intentionally follows the editor; keep the connection action near the top of that panel in a future mobile-specific pass.

**final result: passed**
