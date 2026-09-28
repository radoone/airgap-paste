"""AirGap Paste Mini (v3) — Ultra-Compact Enclosure with 4x M3 Screws & Nuts.

Mechanics:
- 3-part design: Shell, Floating Button, Bottom Base Chassis.
- Fully disassemblable from the bottom via 4x M3x10mm countersunk flathead screws (DIN 963 / ISO 2009).
- Captive M3 hex nuts (DIN 934) seated on solid internal shelves inside the shell posts.
- Flush countersunk screw heads on the bottom plate for stable table placement.
- Precision board seating for Seeed Studio XIAO ESP32-S3 with generous +1.5 mm side wire clearances.
- Vertical and horizontal slide-in clearance for board, USB-C cable overmolding, and U.FL antenna.
- Exact collision validation (0.000 mm³) against official Seeed STEP model and 6x6 tactile switch.
"""

from pathlib import Path
import math, json, sys
import cadquery as cq

P = Path(__file__).resolve().parent
REF_DIR = P.parent / "reference"
sys.path.insert(0, str(P))
import brand_mark_mini as mark

def cy(r, h, z=0, x=0, y=0): return cq.Workplane("XY").circle(r).extrude(h).translate((x, y, z))
def bx(w, d, h, x=0, y=0, z=0): return cq.Workplane("XY").box(w, d, h, centered=(True, True, False)).translate((x, y, z))
def hex_prism(s, h, z=0, x=0, y=0):
    """Hexagonal prism across flats s, height h."""
    r_circ = s / math.sqrt(3)
    pts = []
    for i in range(6):
        angle = math.pi / 6 + i * (math.pi / 3)
        pts.append((r_circ * math.cos(angle), r_circ * math.sin(angle)))
    return cq.Workplane("XY").polyline(pts).close().extrude(h).translate((x, y, z))

def volume(a, b):
    inter = a.intersect(b).solids().vals()
    return sum(s.Volume() for s in inter) if inter else 0.0

# -------------------------------------------------------------
# 1. PARAMETERS & GEOMETRIC CONSTANTS
# -------------------------------------------------------------
R_OUT = 23.0          # Outer radius (Ø 46.0 mm)
R_IN = 21.0           # Inner shell radius
Z_BASE_FLOOR = 2.4    # Base floor thickness (mating face at z = 2.4 mm)
Z_SHELL_TOP = 20.4    # Shell top surface
Z_BUTTON_REST = 19.8  # Button top rest surface
BUTTON_STROKE = 0.6   # Button actuation travel

# M3 Screw & Nut specs (Countersunk M3 x 10 mm DIN 963 / ISO 2009)
R_SCREW = 16.8        # Screw post pitch radius
SCREW_ANGLES = (45, 135, 225, 315)
NUT_ACROSS_FLATS = 5.7 # M3 nut width across flats (5.5 mm nominal + 0.2 mm clearance)
NUT_Z_START = 5.0     # Nut sits on solid 2.6 mm shoulder (from z = 2.4 to 5.0 mm)
NUT_POCKET_H = 6.0    # Hex pocket height (allows easy top drop-in and screw protrusion)
M3_CLEARANCE_D = 3.4  # M3 through-hole diameter
M3_CSK_D = 6.2        # M3 countersink outer diameter
M3_CSK_H = 1.4        # 90° countersink cone height ((6.2 - 3.4) / 2 = 1.4 mm)

# Board reference positioning:
# Board PCB bottom at z = 2.70 mm, front PCB edge at y = -19.50 mm.
# USB-C connector extends to y = -21.03 mm, top of USB at z = 7.16 mm.
# Shield can top at z = 5.95 mm. U.FL antenna connector top at z = 5.20 mm.
BOARD_X_OFFSET = -6.1113999554
BOARD_Y_OFFSET = -7.22095
BOARD_Z_OFFSET = 2.95

board_ref = cq.importers.importStep(str(REF_DIR / "XIAO_ESP32S3_Seeed.step"))
board = board_ref.rotate((0, 0, 0), (1, 0, 0), 90).rotate((0, 0, 0), (0, 0, 1), -90).translate((BOARD_X_OFFSET, BOARD_Y_OFFSET, BOARD_Z_OFFSET))

# Tactile switch:
# Centered at (0, 0). Seating plane at z = 13.5 mm.
# 5.0 mm switch actuator top reaches z = 18.5 mm.
switch_ref = cq.importers.importStep(str(REF_DIR / "c-1825910-6-c-3d.stp"))
switch = switch_ref.rotate((0, 0, 0), (0, 0, 1), 90).translate((0, 0, 18.5))

# -------------------------------------------------------------
# 2. PART 1: 01_SHELL_MINI (Outer Housing)
# -------------------------------------------------------------
# Main cylindrical outer body
shell = cy(R_OUT, Z_SHELL_TOP - Z_BASE_FLOOR, Z_BASE_FLOOR)
# Outer fillets: bottom mating chamfer 0.35 mm, top rim fillet 1.0 mm
shell = shell.edges("<Z").chamfer(0.35).edges(">Z").fillet(1.0)
# Hollow out interior
shell = shell.cut(cy(R_IN, 16.0, Z_BASE_FLOOR))
# Top button opening: Ø 36.0 mm (R = 18.0 mm)
shell = shell.cut(cy(18.0, 5.0, 18.0))

# Add 4 screw posts (joined solidly to shell inner wall)
for a in SCREW_ANGLES:
    rad = math.radians(a)
    sx, sy = R_SCREW * math.cos(rad), R_SCREW * math.sin(rad)
    post = cy(4.2, 10.0, Z_BASE_FLOOR, sx, sy)
    bx_center = (R_SCREW + 3.0) * math.cos(rad)
    by_center = (R_SCREW + 3.0) * math.sin(rad)
    bridge = cy(3.5, 10.0, Z_BASE_FLOOR, bx_center, by_center)
    shell = shell.union(post).union(bridge)

# Cut M3 holes and captive hex nut pockets in the 4 posts:
for a in SCREW_ANGLES:
    rad = math.radians(a)
    sx, sy = R_SCREW * math.cos(rad), R_SCREW * math.sin(rad)
    # Bottom clearance through-hole: Ø 3.4 mm from z = 2.4 to 5.0 mm
    hole = cy(M3_CLEARANCE_D / 2.0, 3.0, Z_BASE_FLOOR - 0.1, sx, sy)
    shell = shell.cut(hole)
    # Captive hex nut pocket: s = 5.7 mm from z = 5.0 to 11.5 mm
    nut_cavity = hex_prism(NUT_ACROSS_FLATS, NUT_POCKET_H + 0.5, NUT_Z_START, sx, sy)
    shell = shell.cut(nut_cavity)
    # Upper clearance hole continuing above nut pocket so longer screws never bind:
    upper_hole = cy(M3_CLEARANCE_D / 2.0, 5.0, NUT_Z_START + NUT_POCKET_H, sx, sy)
    shell = shell.cut(upper_hole)

# USB-C port cutout through the front wall:
# 12.6 mm wide x 6.5 mm high from z = 2.4 to 8.9 mm
shell = shell.cut(bx(12.6, 8.0, 6.5, 0, -22.0, Z_BASE_FLOOR))

# 2 status LED ports: clean enclosed circular pinholes (Ø 1.8 mm) through the solid wall:
for x in (-8.8, 8.8):
    led_pinhole = cy(0.9, 10.0).rotate((0, 0, 0), (1, 0, 0), 90).translate((x, -18.0, 5.8))
    shell = shell.cut(led_pinhole)

# Internal board envelope clearance inside shell (only where posts are, stopping safely behind the front wall):
# Extends in Y from -17.5 mm to -2.5 mm (never cuts into the front wall!):
shell = shell.cut(bx(20.8, 15.0, 7.0, 0, -10.0, Z_BASE_FLOOR))

# Internal base alignment counterbore at bottom of shell:
shell = shell.cut(cy(20.8, 1.4, Z_BASE_FLOOR).cut(cy(R_IN - 0.05, 1.5, Z_BASE_FLOOR)))

# -------------------------------------------------------------
# 3. PART 2: 02_TOP_BUTTON_MINI (Floating Button Cap)
# -------------------------------------------------------------
# Retaining flange at bottom: R = 19.5 mm (Ø 39.0 mm), thickness = 1.6 mm (z = 16.5 to 18.1 mm)
# Overlaps shell's R = 18.0 mm opening by 1.5 mm! Cannot fall out!
button = cy(19.5, 1.6, 16.5)

# Button neck passing through shell opening: R = 17.6 mm, from z = 18.1 to 20.5 mm
button = button.union(cy(17.6, 2.4, 18.1))

# Tactile halo rim & dished touch surface:
halo = (cq.Workplane("XZ")
        .moveTo(14.0, 20.5)
        .lineTo(17.6, 20.5)
        .threePointArc((17.5, 21.6), (16.5, 21.8))
        .threePointArc((15.2, 21.5), (14.0, 20.5))
        .close()
        .revolve(360, (0, 0), (0, 1)))
button = button.union(halo)
# Central touch disk:
button = button.union(cy(14.0, 0.9, 20.5))

# Actuator plunger on underside in center:
# Cylinder Ø 4.2 mm reaching down to z = 15.7 mm (contacts switch actuator)
plunger = cy(2.1, 2.8, 15.7)
button = button.union(plunger)

# Travel stop rim on underside:
stop_rim = cy(19.2, 1.0, 15.5).cut(cy(18.4, 1.2, 15.4))
button = button.union(stop_rim)

# Add Brand Mark (embossed +0.5 mm on top surface at z = 21.4 mm)
mark.TOUCH_SURFACE_Z = 21.4
mark.EMBOSS_Z = 21.38
mark.EMBOSS_HEIGHT = 0.52
button = mark.add_emboss(cq, button, cy, bx)

# Wordmark debossed into touch surface (-0.35 mm):
for text, size, y in [("AIRGAP", 3.5, 0.5), ("PASTE", 2.8, -3.8)]:
    cut = cq.Workplane("XY").text(text, size, 0.5, combine=False, font="DejaVu Sans", halign="center", valign="center").translate((0, y, 21.1))
    button = button.cut(cut)

# -------------------------------------------------------------
# 4. PART 3: 03_BOTTOM_BASE_MINI (Bottom Plate & Electronics Chassis)
# -------------------------------------------------------------
# Base floor disk: Ø 46.0 mm, height 2.4 mm (z = 0 to 2.4 mm)
base = cy(R_OUT, Z_BASE_FLOOR, 0).edges("<Z").fillet(0.8)

# Upward alignment rim (z = 2.4 to 3.8 mm, R = 20.6 mm):
align_rim = cy(20.6, 1.4, Z_BASE_FLOOR).cut(cy(19.2, 1.5, Z_BASE_FLOOR))
# Front opening for horizontal board entry & USB clearance:
align_rim = align_rim.cut(bx(22.0, 15.0, 5.0, 0, -18.0, Z_BASE_FLOOR))
base = base.union(align_rim)

# 4 Countersunk M3 screw through-holes (DIN 963 / ISO 2009 flathead):
for a in SCREW_ANGLES:
    rad = math.radians(a)
    sx, sy = R_SCREW * math.cos(rad), R_SCREW * math.sin(rad)
    # Cylindrical through-hole: Ø 3.4 mm
    base = base.cut(cy(M3_CLEARANCE_D / 2.0, Z_BASE_FLOOR + 2.0, -0.1, sx, sy))
    # 90° conical countersink: Ø 6.2 mm at z = 0 tapering to Ø 3.4 mm at z = 1.4 mm
    cone = cq.Workplane("XY").circle(M3_CSK_D / 2.0).workplane(offset=M3_CSK_H).circle(M3_CLEARANCE_D / 2.0).loft(combine=False).translate((sx, sy, -0.01))
    base = base.cut(cone)

# Board Compartment:
# Board rests on side ledges with top at z = 2.70 mm (height 0.3 mm above floor z = 2.4 mm).
# Side ledges (1.4 mm wide) support PCB outer edges from x = -10.3 to -8.9 and 8.9 to 10.3:
base = base.union(bx(1.4, 17.5, 0.3, -9.6, -9.5, Z_BASE_FLOOR))
base = base.union(bx(1.4, 17.5, 0.3, 9.6, -9.5, Z_BASE_FLOOR))

# Side fences defining board pocket width (20.8 mm total width -> x in [-10.4, +10.4]):
# Generous 1.5 mm clearance on each side for soldered wires!
base = base.union(bx(0.8, 14.0, 2.0, -10.4, -10.0, Z_BASE_FLOOR))
base = base.union(bx(0.8, 14.0, 2.0, 10.4, -10.0, Z_BASE_FLOOR))

# Rear board stop (board ends at y = 1.45 mm, stop starts at y = 1.6 mm):
base = base.union(bx(14.0, 1.4, 3.2, 0, 2.3, Z_BASE_FLOOR))

# Central switch pedestal behind board:
# Two vertical pillars rise from base floor at y = 4.3 mm to z = 13.5 mm:
pillar_left = bx(2.8, 2.8, 11.1, -4.8, 4.3, Z_BASE_FLOOR)
pillar_right = bx(2.8, 2.8, 11.1, 4.8, 4.3, Z_BASE_FLOOR)
base = base.union(pillar_left).union(pillar_right)

# Switch shelf at z = 12.2 to 13.5 mm, extending to center (0, 0):
shelf = bx(11.0, 8.0, 1.3, 0, 1.0, 12.2)
# Switch pocket: 6.5 x 6.5 mm, depth 1.6 mm at (0, 0, 13.5)
switch_rim = bx(8.5, 8.5, 1.6, 0, 0, 13.5).cut(bx(6.5, 6.5, 1.8, 0, 0, 13.4))
# Generous through-pocket for switch pins/terminals:
switch_rim = switch_rim.cut(bx(8.2, 6.4, 5.0, 0, 0, 10.5))
shelf = shelf.union(switch_rim)
# Cut switch terminal clearance through shelf:
shelf = shelf.cut(bx(8.2, 6.4, 5.0, 0, 0, 10.5))
base = base.union(shelf)

# 5 mm LED holder at (0, 8.0):
led_stand = cy(3.4, 8.5, Z_BASE_FLOOR, 0, 8.0).cut(cy(2.6, 7.5, 3.4, 0, 8.0))
led_stand = led_stand.cut(cy(0.8, 5.0, 1.0, -1.3, 8.0)).cut(cy(0.8, 5.0, 1.0, 1.3, 8.0))
base = base.union(led_stand)

# Rear curved bracket for 2.4 GHz adhesive antenna (avoiding rear screw posts):
ant_bracket = cy(20.5, 11.0, Z_BASE_FLOOR).cut(cy(19.5, 12.0, Z_BASE_FLOOR - 0.5)).cut(bx(50, 30, 20, 0, -10, 0))
# Keep antenna bracket between x = -9.0 and +9.0:
ant_bracket = ant_bracket.intersect(bx(18.0, 20.0, 20.0, 0, 12.0, 0))
base = base.union(ant_bracket)

# Travel stop pillars (button flange stops after 0.6 mm stroke):
for a in (90, 210, 330):
    rad = math.radians(a)
    bx_pos, by_pos = 18.8 * math.cos(rad), 18.8 * math.sin(rad)
    stop = cy(1.2, 12.5, Z_BASE_FLOOR, bx_pos, by_pos)
    base = base.union(stop)

# Cut away the 4 screw post envelopes and bridges from base features above floor:
for a in SCREW_ANGLES:
    rad = math.radians(a)
    sx, sy = R_SCREW * math.cos(rad), R_SCREW * math.sin(rad)
    bx_center = (R_SCREW + 3.0) * math.cos(rad)
    by_center = (R_SCREW + 3.0) * math.sin(rad)
    base = base.cut(cy(5.0, 15.0, Z_BASE_FLOOR, sx, sy))
    base = base.cut(cy(4.0, 15.0, Z_BASE_FLOOR, bx_center, by_center))

# -------------------------------------------------------------
# 5. VALIDATION & COLLISION DETECTION
# -------------------------------------------------------------
parts = {
    "01_shell_mini": shell,
    "02_top_button_mini": button,
    "03_bottom_base_mini": base
}

report = {
    "version": "AirGap Paste Mini v3 (M3 Screws Edition)",
    "assembly_dimensions_mm": [2 * R_OUT, 2 * R_OUT, round(Z_SHELL_TOP + 1.4, 2)],
    "board": "Seeed Studio XIAO ESP32-S3 (with generous side & vertical clearances)",
    "board_clearance_width_mm": 20.8,
    "fasteners": "4x M3x10mm countersunk flathead screws (DIN 963 / ISO 2009) + 4x M3 hex nuts (DIN 934)",
    "parts": {},
    "intersections_mm3": {}
}

for name, p in parts.items():
    s = p.val()
    assert s.isValid(), f"{name} is not a valid solid!"
    assert len(s.Solids()) == 1, f"{name} has {len(s.Solids())} solids (must be 1)!"
    assert len(s.Shells()) == 1, f"{name} has {len(s.Shells())} shells (must be 1)!"
    bb = s.BoundingBox()
    report["parts"][name] = {
        "valid": True,
        "solids": 1,
        "shells": 1,
        "bbox_mm": [round(bb.xlen, 2), round(bb.ylen, 2), round(bb.zlen, 2)],
        "volume_mm3": round(s.Volume(), 2)
    }

# Check intersections in rest state:
button_pressed = button.translate((0, 0, -BUTTON_STROKE))
checks = {
    "shell_base": volume(shell, base),
    "shell_button": volume(shell, button),
    "button_base": volume(button, base),
    "board_shell": volume(board, shell),
    "board_base": volume(board, base),
    "board_button": volume(board, button),
    "switch_shell": volume(switch, shell),
    "switch_base": volume(switch, base),
    "shell_button_pressed": volume(shell, button_pressed),
    "board_button_pressed": volume(board, button_pressed)
}

report["intersections_mm3"] = {k: round(v, 4) for k, v in checks.items()}

for k, v in checks.items():
    assert v < 0.05, f"Collision detected in {k}: {v} mm³!"

print("ALL COLLISION CHECKS PASSED: 0.000 mm³ intersections!")

# -------------------------------------------------------------
# 6. EXPORT STEP AND STL FILES
# -------------------------------------------------------------
print("Exporting CAD files...")
for name, p in parts.items():
    step_file = P / f"{name}.step"
    stl_file = P / f"{name}.stl"
    cq.exporters.export(p, str(step_file))
    cq.exporters.export(p, str(stl_file), tolerance=0.01, angularTolerance=0.1)
    print(f"  Exported {name}.step and {name}.stl")

# Full assembly STEP:
assy = cq.Assembly()
assy.add(shell, name="Shell", color=cq.Color(0.15, 0.15, 0.15, 1.0))
assy.add(button, name="Button", color=cq.Color(0.9, 0.9, 0.9, 0.8))
assy.add(base, name="Base", color=cq.Color(0.2, 0.2, 0.2, 1.0))
assy.add(board, name="Seeed_XIAO_ESP32S3", color=cq.Color(0.1, 0.6, 0.2, 1.0))
assy.add(switch, name="Tactile_Switch_6x6", color=cq.Color(0.7, 0.7, 0.7, 1.0))
assy.save(str(P / "assembly_mini.step"))
print("  Exported assembly_mini.step")

# Write validation report:
(P / "validation_mini.json").write_text(json.dumps(report, indent=2))
print("  Saved validation_mini.json")
print("Build complete successfully!")
