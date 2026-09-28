"""AirGap Paste photo-match enclosure, based on the tested Stealth Octo geometry.

Footprint: 8-sided faceted stealth polygon with 45° corner chamfers
Top shoulder: 45° faceted chamfer leading to recessed MX switch well
Switch: Recessed MX plate (14.10x14.10 mm, 1.5 mm thick), showing upper switch housing
Carry loop: Integrated, slender faceted right-side EDC loop for split ring / carabiner
Front: USB-C port with cable relief and dual front indicator lightguide channels
Fastening: 2x M3x10 countersunk screws into captive M3 nuts
Electronics: Seeed Studio XIAO ESP32-S3 with insertion/extraction stop
"""

from pathlib import Path
import json, math, os
import cadquery as cq
import trimesh

ROOT = Path(__file__).resolve().parent
REF = ROOT.parent / "reference"

# --- Geometry Parameters (mm) ---
BODY_W = 48.0          # Total width (X) excluding carry loop (-24 to +24)
BODY_D = 48.0          # Total depth (Y) (-24 to +24)
CORNER_C = 10.5        # 45° corner chamfer size
TOP_INSET = 5.0        # 5 mm horizontal inset over 5 mm height: 45° shoulder
BASE_H = 2.4           # Bottom chassis thickness
SHOULDER_Z = 11.5      # More vertical wall, shorter 45° shoulder as in photo
TOP_Z = 16.5           # Sleeker top rim height (matches reference photo proportions)

WALL = 2.2             # Nominal wall thickness
MX_X, MX_Y = 0.0, 4.5  # MX switch center
MX_CUTOUT = 14.10      # 14.0 mm nominal + 0.1 mm FDM tolerance
MX_PLATE_THICK = 1.50  # Standard MX latch thickness
WELL_DEPTH = 2.6       # Depth of recessed well around switch
WELL_SIZE = 23.0       # Wider well exposes the translucent switch housing

BOARD_W, BOARD_L, BOARD_H = 17.78, 20.95, 4.85
BOARD_Y = -11.6        # PCB center Y
USB_W, USB_H = 11.0, 4.8

SCREWS = ((-16.0, -0.5), (16.0, -0.5))
M3_D = 3.4
M3_CSK = 6.4
NUT_AF = 5.7           # Standard M3 nut across flats

def octo_points(w, d, c):
    """Generate 8 vertices of a chamfered rectangle/square."""
    hx, hy = w / 2.0, d / 2.0
    return [
        (-hx + c, -hy),
        (hx - c, -hy),
        (hx, -hy + c),
        (hx, hy - c),
        (hx - c, hy),
        (-hx + c, hy),
        (-hx, hy - c),
        (-hx, -hy + c),
    ]

def rounded_rect_pts(w, d, r, n=6):
    hx, hy = w / 2.0 - r, d / 2.0 - r
    pts = []
    corners = [(hx, hy, 0), (-hx, hy, 90), (-hx, -hy, 180), (hx, -hy, 270)]
    for cx, cy, start_ang in corners:
        for i in range(n):
            ang = math.radians(start_ang + 90 * i / (n - 1))
            pts.append((cx + r * math.cos(ang), cy + r * math.sin(ang)))
    return pts

def intervol(a, b):
    return sum(s.Volume() for s in a.intersect(b).solids().vals())

def box(w, d, h, x=0, y=0, z=0):
    return cq.Workplane("XY").box(w, d, h, centered=(True, True, False)).translate((x, y, z))

def cyl(d, h, x=0, y=0, z=0):
    return cq.Workplane("XY").circle(d / 2).extrude(h).translate((x, y, z))

print("Generating photo-match octagonal enclosure...")

# 1. Main Upper Shell Outer Body
pts_bottom = octo_points(BODY_W, BODY_D, CORNER_C)
top_w = BODY_W - 2 * TOP_INSET
top_d = BODY_D - 2 * TOP_INSET
top_c = CORNER_C * (top_w / BODY_W)
pts_top = octo_points(top_w, top_d, top_c)

# Vertical lower section (compact 6.2 mm tall)
lower_shell = (cq.Workplane("XY")
               .polyline(pts_bottom).close()
               .extrude(SHOULDER_Z - BASE_H)
               .translate((0, 0, BASE_H)))

# Sloped shoulder (starts right above USB-C, 45° angle)
shoulder = (cq.Workplane("XY").workplane(offset=SHOULDER_Z)
            .polyline(pts_bottom).close()
            .workplane(offset=TOP_Z - SHOULDER_Z)
            .polyline(pts_top).close().loft(combine=True))

outer_body = lower_shell.union(shoulder)

# 2. Integrated Slender Carry Loop on Right Side (+X)
# Slender, lightweight faceted D-loop matching reference photo:
# 3.2 mm outer bar thickness, large open window for split ring
lug_h = SHOULDER_Z - BASE_H + 1.2  # 7.4 mm height

outer_pts = [
    (20.0, 15.5), (28.5, 14.0), (37.8, 8.5), (37.8, -8.5),
    (28.5, -14.0), (20.0, -15.5)
]
hole_pts = [
    (24.4, 11.5), (34.6, 6.8), (34.6, -6.8), (24.4, -11.5)
]

lug = (cq.Workplane("XY").polyline(outer_pts).close().extrude(lug_h).translate((0, 0, BASE_H))
       .cut(cq.Workplane("XY").polyline(hole_pts).close().extrude(lug_h + 4.0).translate((0, 0, BASE_H - 2.0))))

sel_inner_z = cq.selectors.BoxSelector((24.0, -12.0, 1.0), (35.5, 12.0, 12.0)) & cq.selectors.ParallelDirSelector(cq.Vector(0, 0, 1))
lug = lug.edges(sel_inner_z).fillet(1.8)
lug = lug.edges("|Z and >X").fillet(2.2)
lug = lug.edges(">Z and >X").chamfer(1.2)
lug = lug.edges("<Z and >X").chamfer(0.8)

outer_body = outer_body.union(lug)

# Hollow interior tapering with the shoulder
in_w, in_d, in_c = BODY_W - 2 * WALL, BODY_D - 2 * WALL, CORNER_C - WALL
in_top_w, in_top_d, in_top_c = top_w - 2 * WALL, top_d - 2 * WALL, top_c - WALL
in_pts_bottom = octo_points(in_w, in_d, in_c)
in_pts_top = octo_points(in_top_w, in_top_d, in_top_c)

inner_lower = (cq.Workplane("XY").polyline(in_pts_bottom).close()
               .extrude(SHOULDER_Z - BASE_H).translate((0, 0, BASE_H)))
inner_upper = (cq.Workplane("XY").workplane(offset=SHOULDER_Z)
               .polyline(in_pts_bottom).close()
               .workplane(offset=TOP_Z - 2.8 - SHOULDER_Z)
               .polyline(in_pts_top).close().loft(combine=True))
inner_void = inner_lower.union(inner_upper)

shell = outer_body.cut(inner_void)

# 3. Recessed Switch Well & 1.5mm MX Mounting Plate
well_floor_z = TOP_Z - WELL_DEPTH
plate_bottom_z = well_floor_z - MX_PLATE_THICK

shell = shell.cut(box(WELL_SIZE, WELL_SIZE, WELL_DEPTH + 1.0, MX_X, MX_Y, well_floor_z))
shell = shell.cut(box(MX_CUTOUT, MX_CUTOUT, MX_PLATE_THICK + 2.0, MX_X, MX_Y, plate_bottom_z - 0.5))
shell = shell.cut(box(16.5, 16.5, 4.5, MX_X, MX_Y, plate_bottom_z - 4.5))

# 4. Screw Towers with Captive M3 Nut Pockets
for sx, sy in SCREWS:
    tower = cyl(7.2, TOP_Z - BASE_H - 3.2, sx, sy, BASE_H)
    rib = box(4.0, 3.0, TOP_Z - BASE_H - 4.5, sx + (-1.5 if sx > 0 else 1.5), sy, BASE_H)
    shell = shell.union(tower).union(rib)
    shell = shell.cut(cyl(M3_D, 8.5, sx, sy, BASE_H - 0.1))
    n_r = NUT_AF / math.sqrt(3)
    hex_pts = [(n_r * math.cos(math.radians(30 + 60 * i)), n_r * math.sin(math.radians(30 + 60 * i))) for i in range(6)]
    nut_pocket = (cq.Workplane("XY").polyline(hex_pts).close().extrude(4.4).translate((sx, sy, BASE_H + 2.0)))
    shell = shell.cut(nut_pocket)

# 5. USB-C Opening & Front Dual Lightguide Holes
usb_cut = box(USB_W, 6.0, USB_H, 0, -24.0, 2.9).edges("|Y").fillet(1.8)
usb_bevel = box(12.6, 1.4, 6.0, 0, -23.4, 2.3).edges("|Y").fillet(2.0)
shell = shell.cut(usb_cut).cut(usb_bevel)

for lx in (-8.5, 8.5):
    led_hole = (cq.Workplane("XY").circle(1.0).extrude(7.0)
                .rotate((0, 0, 0), (1, 0, 0), 90)
                .translate((lx, -20.5, 5.2)))
    shell = shell.cut(led_hole)

# The shell clamps four narrow PCB-edge zones once the M3 case screws close.
# The 0.20 mm nominal gap to the STEP PCB top accepts a thin compressible shim
# and avoids loading the RF shield or the USB connector directly.
PCB_TOP_Z = 4.25
HOLD_DOWN_Z = 4.45
retention_features = []
for tx in (-7.7, 7.7):
    for ty in (-14.0, -9.0):
        tab = box(1.5, 2.0, TOP_Z - HOLD_DOWN_Z, tx, ty, HOLD_DOWN_Z)
        retention_features.append(tab)
        shell = shell.union(tab)

# Front PCB edge bears against two shoulders, away from the USB connector.
# Their inner faces are 0.14 mm ahead of the official STEP PCB front edge.
for tx in (-7.8, 7.8):
    stop = box(1.4, 0.55, 1.70, tx, -21.725, BASE_H)
    retention_features.append(stop)
    shell = shell.union(stop)


# ==========================================
# 6. Bottom Chassis (Base)
# ==========================================
base = (cq.Workplane("XY").polyline(pts_bottom).close().extrude(BASE_H))

# Alignment rim into shell
rim_pts = octo_points(BODY_W - 2 * WALL - 0.4, BODY_D - 2 * WALL - 0.4, CORNER_C - WALL)
rim_cut_pts = octo_points(BODY_W - 2 * WALL - 2.8, BODY_D - 2 * WALL - 2.8, CORNER_C - WALL - 1.0)
rim = (cq.Workplane("XY").polyline(rim_pts).close().extrude(1.4).translate((0, 0, BASE_H))
       .cut(cq.Workplane("XY").polyline(rim_cut_pts).close().extrude(1.6).translate((0, 0, BASE_H - 0.1))))

rim = rim.cut(box(20.0, 8.0, 3.0, 0, -22.0, BASE_H - 0.1))
for sx, sy in SCREWS:
    rim = rim.cut(cyl(16.0, 2.0, sx, sy, BASE_H - 0.1))
base = base.union(rim)

for sx, sy in SCREWS:
    base = base.cut(cyl(M3_D, BASE_H + 2.0, sx, sy, -0.1))
    csk = (cq.Workplane("XY").circle(M3_CSK / 2.0)
           .workplane(offset=1.5).circle(M3_D / 2.0)
           .loft(combine=False).translate((sx, sy, -0.01)))
    base = base.cut(csk)

# Continuous edge ledges support the PCB bottom at Z=3.00. Short side fences
# leave the long-edge solder pads accessible for pre-attached switch wires.
for side in (-1, 1):
    ledge = box(1.4, 20.5, 0.6, side * 8.15, -10.7, BASE_H)
    retention_features.append(ledge)
    base = base.union(ledge)
    for fy in (-14.5, -3.5):
        fence = box(1.2, 3.0, 2.5, side * 9.7, fy, BASE_H)
        retention_features.append(fence)
        base = base.union(fence)

# Insertion pushes the board toward +Y; the stop face lies at Y=-0.15,
# 0.21 mm behind the STEP PCB rear edge before the small shim is fitted.
rear_stop = box(13.0, 1.6, 2.8, 0, 0.65, BASE_H)
retention_features.append(rear_stop)
base = base.union(rear_stop)
base = base.cut(box(15.0, 10.0, 1.4, 0, BOARD_Y, 1.0))

# ==========================================
# 7. Sculpted 1U OEM/Cherry Keycap
# ==========================================
cap_base_z = 15.0
cap_h = 7.2
cap_b_pts = rounded_rect_pts(18.2, 18.2, 2.0)
cap_t_pts = rounded_rect_pts(15.2, 15.2, 1.4)

w = (cq.Workplane("XY").polyline(cap_b_pts).close()
     .workplane(offset=cap_h).polyline(cap_t_pts).close().loft(combine=True))

keycap = w.translate((MX_X, MX_Y, cap_base_z))

in_b_pts = rounded_rect_pts(15.4, 15.4, 1.6)
in_t_pts = rounded_rect_pts(12.2, 12.2, 1.1)
hollow = (cq.Workplane("XY").polyline(in_b_pts).close()
          .workplane(offset=5.5).polyline(in_t_pts).close().loft(combine=True)
          .translate((MX_X, MX_Y, cap_base_z - 0.1)))
keycap = keycap.cut(hollow)

stem_boss = cyl(5.8, 6.4, MX_X, MX_Y, cap_base_z)
cross_cut = (box(4.25, 1.35, 5.2, MX_X, MX_Y, cap_base_z - 0.2)
             .union(box(1.35, 4.25, 5.2, MX_X, MX_Y, cap_base_z - 0.2)))
keycap = keycap.union(stem_boss).cut(cross_cut)

# ==========================================
# 8. Dual Lightguide Pins
# ==========================================
lg1 = (cq.Workplane("XY").circle(0.95).extrude(6.0)
       .rotate((0, 0, 0), (1, 0, 0), 90)
       .translate((-8.5, -18.5, 5.2)))
lg2 = (cq.Workplane("XY").circle(0.95).extrude(6.0)
       .rotate((0, 0, 0), (1, 0, 0), 90)
       .translate((8.5, -18.5, 5.2)))
bridge = box(19.0, 2.0, 2.0, 0, -18.5, 4.2)
lightguides = bridge.union(lg1).union(lg2)

# ==========================================
# QA, Validation & Export
# ==========================================
parts = {
    "01_upper_shell_octo": shell,
    "02_bottom_chassis_octo": base,
    "03_mx_keycap_octo": keycap,
    "04_lightguides_octo": lightguides,
}

checks = {
    "shell_vs_base_mm3": intervol(shell, base),
    "keycap_vs_shell_mm3": intervol(keycap, shell),
    "lightguides_vs_shell_mm3": intervol(lightguides, shell),
    "lightguides_vs_base_mm3": intervol(lightguides, base),
}

board_step_path = REF / "XIAO_ESP32S3_Seeed.step"
if board_step_path.exists():
    board = cq.importers.importStep(str(board_step_path)).rotate((0, 0, 0), (1, 0, 0), 90).rotate((0, 0, 0), (0, 0, 1), -90)
    bb = board.val().BoundingBox()
    board = board.translate((-((bb.xmin + bb.xmax) / 2), BOARD_Y - ((bb.ymin + bb.ymax) / 2), 3.0 - bb.zmin))
    checks["official_xiao_vs_retention_mm3"] = sum(intervol(board, f) for f in retention_features)
    cq.exporters.export(board, str(ROOT / "XIAO_reference_position.stl"),
                        tolerance=0.05, angularTolerance=0.3)
    pcb = max(board.solids().vals(), key=lambda s: s.Volume())
    pcb_bb = pcb.BoundingBox()
    fixture_clearances = {
        "front_stop_mm": round(pcb_bb.ymin - (-21.45), 3),
        "rear_stop_mm": round(-0.15 - pcb_bb.ymax, 3),
        "side_fence_each_mm": round(9.1 - pcb_bb.xmax, 3),
        "top_tab_above_pcb_mm": round(HOLD_DOWN_Z - pcb_bb.zmax, 3),
        "ledge_top_vs_pcb_bottom_mm": round(BASE_H + 0.6 - pcb_bb.zmin, 3),
        "usb_face_recess_from_front_mm": round(board.val().BoundingBox().ymin + BODY_D / 2, 3),
    }
    if os.environ.get("AIRGAP_FULL_BOARD_CHECK") == "1":
        checks["official_xiao_vs_shell_mm3"] = intervol(board, shell)
        checks["official_xiao_vs_base_mm3"] = intervol(board, base)

for k, v in checks.items():
    if v > 0.05:
        raise RuntimeError(f"Part collision detected {k}: {v:.4f} mm³")

print("Collision checks passed!")

manifest = {
    "version": "AirGap Paste Photo Match v2 board retained",
    "units": "mm",
    "dimensions_mm": {
        "width_no_lug": BODY_W,
        "width_with_lug": None,
        "depth": BODY_D,
        "height_shell": TOP_Z,
        "total_height_with_cap": round(cap_base_z + cap_h, 1),
    },
    "checks": checks,
    "fixture_clearances_mm": fixture_clearances if board_step_path.exists() else None,
    "parts": {},
}
manifest["dimensions_mm"]["width_with_lug"] = round(shell.val().BoundingBox().xlen, 1)

for name, obj in parts.items():
    s = obj.val()
    bb = s.BoundingBox()
    dx = round(bb.xmax - bb.xmin, 1)
    dy = round(bb.ymax - bb.ymin, 1)
    dz = round(bb.zmax - bb.zmin, 1)
    manifest["parts"][name] = {
        "valid": s.isValid(),
        "solids": len(obj.solids().vals()),
        "bbox_mm": [dx, dy, dz],
        "volume_mm3": round(s.Volume(), 2),
    }
    cq.exporters.export(obj, str(ROOT / f"{name}.step"))
    cq.exporters.export(obj, str(ROOT / f"{name}.stl"), tolerance=0.03, angularTolerance=0.25)
    # Remove any zero-area OCC triangles so slicers see one watertight part.
    stl_path = ROOT / f"{name}.stl"
    mesh = trimesh.load(stl_path, force="mesh")
    mesh.update_faces(mesh.nondegenerate_faces())
    mesh.remove_unreferenced_vertices()
    mesh.export(stl_path)

print(json.dumps(manifest, indent=2))

assembly = (cq.Assembly()
            .add(shell, name="upper_shell", color=cq.Color(0.12, 0.12, 0.14, 1.0))
            .add(base, name="bottom_chassis", color=cq.Color(0.12, 0.12, 0.14, 1.0))
            .add(keycap, name="keycap_oem", color=cq.Color(0.95, 0.45, 0.05, 1.0))
            .add(lightguides, name="lightguides", color=cq.Color(0.9, 0.95, 1.0, 0.7)))
assembly.save(str(ROOT / "photo_match_assembly.step"))
if board_step_path.exists():
    fitted_assembly = (cq.Assembly()
                       .add(shell, name="upper_shell", color=cq.Color(0.12, 0.12, 0.14, 1.0))
                       .add(base, name="bottom_chassis", color=cq.Color(0.12, 0.12, 0.14, 1.0))
                       .add(keycap, name="keycap", color=cq.Color(0.95, 0.45, 0.05, 1.0))
                       .add(lightguides, name="lightguides", color=cq.Color(0.9, 0.95, 1.0, 0.7))
                       .add(board, name="Seeed_XIAO_ESP32S3_reference", color=cq.Color(0.05, 0.4, 0.15, 1.0)))
    fitted_assembly.save(str(ROOT / "photo_match_with_xiao_reference.step"))

with open(ROOT / "validation_summary.json", "w") as f:
    json.dump(manifest, f, indent=2)

print("Export completed successfully.")
