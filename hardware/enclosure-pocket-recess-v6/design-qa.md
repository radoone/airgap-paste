# v6 design and manufacturing review

Trigger: v5 physical PCB retainers broke; button halo escaped. User confirms Cherry MX latch and cap fit.

Final scope: two sidewall-supported PCB retaining webs (6 mm breadth), low broad base fences/rails and front stops; reinforced wedge shoulders with coax passage; bottom-inserted 1.4 mm halo flange with 1.3 mm overlap and clear shoulder notches; larger right-side wordmark; Complete Test 12 mm full-height XY bounding-box separation. Housing height remains 26.6 mm.

Evidence: 197 clearance checks; 9 single-solid/watertight parts; zero nonmanifold edges; separate positive upward/downward halo-stop checks; halo insertion sweep; source hashes show unchanged MX plate/keycap; all six A1 plates slice without warnings/support. Complete Test measured from final 3MF with conservative 3.7 mm remaining brim gap. Slicer cached thumbnails removed before final layout export so preview matches placement.

Actual CAD hero, underside fixture render, halo STL section, plate preview and six real G-code sections visually inspected. No force/FEA test: stronger geometry is not a certified strength claim. Wires and solder are absent from Seeed STEP and require physical mounting check; Bluetooth and optical performance remain unverified.
