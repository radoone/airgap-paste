"""AirGap Paste Flip Vault: pocket controller with a hinged transport shield.

The cover prevents accidental MX presses in a pocket. It pivots on an ordinary
piece of 1.75 mm printer filament, and two pairs of 3 x 1 mm magnets retain it
closed. The XIAO PCB is positively located against repeated cable insertion.
"""

from pathlib import Path
import json, math, os
import cadquery as cq
import trimesh

ROOT = Path(__file__).resolve().parent
REF = ROOT.parent / "reference"

# --- Geometry Parameters (mm) ---
BODY_W = 54.0          # Total width (X) excluding carry loop (-24 to +24)
BODY_D = 48.0          # Total depth (Y) (-24 to +24)
CORNER_C = 7.0        # 45° corner chamfer size
TOP_INSET = 4.0        # 5 mm horizontal inset over 5 mm height: 45° shoulder
BASE_H = 2.4           # Bottom chassis thickness
SHOULDER_Z = 12.5      # More vertical wall, shorter 45° shoulder as in photo
TOP_Z = 16.5           # Sleeker top rim height (matches reference photo proportions)

WALL = 2.2             # Nominal wall thickness
MX_X, MX_Y = 0.0, 4.5  # MX switch center
MX_CUTOUT = 14.10      # 14.0 mm nominal + 0.1 mm FDM tolerance
MX_PLATE_THICK = 1.50  # Standard MX latch thickness
WELL_DEPTH = 2.6       # Depth of recessed well around switch
WELL_SIZE = 23.0       # Wider well exposes the translucent switch housing

BOARD_W, BOARD_L, BOARD_H = 17.78, 20.95, 4.85
# Final seated position: the board's front PCB edge bears on the front stops.
BOARD_Y = -11.73       # PCB center Y in the locked, cable-loaded state
USB_W, USB_H = 11.0, 4.8
WEDGE_FACE_Y = -0.48  # rear PCB edge ~ -0.489 mm when front is seated

SCREWS = ((-18.0, -0.5), (18.0, -0.5))
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

print("Generating portable Flip Vault...")

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

# 2. Integral rear lanyard loop: wide, continuous throat into the body.
lug_h = 10.1
outer_pts = [(-16, 19), (16, 19), (16, 29), (12, 38), (-12, 38), (-16, 29)]
hole_pts = [(-10, 25.5), (10, 25.5), (10, 32), (-10, 32)]
lug = (cq.Workplane("XY").polyline(outer_pts).close().extrude(lug_h).translate((0, 0, BASE_H))
       .cut(cq.Workplane("XY").polyline(hole_pts).close().extrude(lug_h + 0.4).translate((0, 0, BASE_H - 0.2))))
lug = lug.edges("|Z").fillet(1.0)
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

# Rear hinge pillars are part of the case, outside the button well. Their bore
# accepts a 1.75 mm filament pin with 0.35 mm nominal diametral clearance.
HINGE_Y, HINGE_Z = 20.5, 21.2
HINGE_BORE_D = 2.10
for hx in (-19.2, 19.2):
    pillar = box(3.0, 6.0, 11.4, hx, 20.0, 11.7)
    pillar = pillar.edges("|Z").fillet(0.9)
    shell = shell.union(pillar)

# Raised front landings bring the magnet faces 0.3 mm below the shield.
# They sit outside the MX well and away from the XIAO/antenna zone.
MAGNET_X, MAGNET_Y = 15.8, -10.2
for mx in (-MAGNET_X, MAGNET_X):
    landing = box(4.5, 4.5, 6.6, mx, MAGNET_Y, TOP_Z)
    landing = landing.edges("|Z").fillet(0.8)
    shell = shell.union(landing)
    shell = shell.cut(cyl(3.15, 1.25, mx, MAGNET_Y, 21.95))

hinge_bore = (cq.Workplane("YZ").center(HINGE_Y, HINGE_Z)
              .circle(HINGE_BORE_D / 2).extrude(52).translate((-26, 0, 0)))
shell = shell.cut(hinge_bore)

# 4. Screw Towers with Captive M3 Nut Pockets
for sx, sy in SCREWS:
    tower = cyl(7.2, TOP_Z - BASE_H - 1.6, sx, sy, BASE_H)
    rib = box(4.0, 3.0, TOP_Z - BASE_H - 4.5, sx + (-1.5 if sx > 0 else 1.5), sy, BASE_H)
    shell = shell.union(tower).union(rib)
    shell = shell.cut(cyl(M3_D, 8.5, sx, sy, BASE_H - 0.1))
    n_r = NUT_AF / math.sqrt(3)
    hex_pts = [(n_r * math.cos(math.radians(30 + 60 * i)), n_r * math.sin(math.radians(30 + 60 * i))) for i in range(6)]
    nut_pocket = (cq.Workplane("XY").polyline(hex_pts).close().extrude(4.4).translate((sx, sy, BASE_H + 2.0)))
    shell = shell.cut(nut_pocket)

# 5. USB-C Opening & Front Dual Lightguide Holes
usb_cut = box(USB_W, 6.0, USB_H, 0, -24.0, 2.9).edges("|Y").fillet(1.8)
usb_bevel = box(12.6, 1.4, 6.5, 0, -23.4, 2.05).edges("|Y").fillet(2.0)
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

# The front PCB edge bears against two broad shoulders, independently of the
# USB connector solder joints. Their inner faces coincide with the seated
# official STEP PCB front edge within 0.01 mm.
for tx in (-7.8, 7.8):
    stop = box(2.4, 1.40, 1.70, tx, -22.15, BASE_H)
    retention_features.append(stop)
    shell = shell.union(stop)

# The upper shell traps the adjustable rear wedge so it cannot work loose in
# a pocket. These two posts land beyond the PCB and outside the MX cutout.
for tx in (-12.5, 12.5):
    wedge_keeper = box(2.0, 1.4, 9.3, tx, 0.0, 4.9)
    retention_features.append(wedge_keeper)
    shell = shell.union(wedge_keeper)


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

# A full-width solid rear anvil takes cable insertion loads through a small
# replaceable wedge. It is separated from the board for top-down assembly.
rear_stop = box(28.0, 1.6, 2.8, 0, 1.8, BASE_H)
retention_features.append(rear_stop)
base = base.union(rear_stop)
base = base.cut(box(15.0, 10.0, 1.4, 0, BOARD_Y, 1.0))

def make_board_wedge(face_y):
    """A lead-in ramp seats the PCB against the front shoulders on insertion."""
    section = [(1.0, 2.4), (-0.20, 2.4), (face_y, 3.0),
               (face_y, 4.4), (1.0, 4.4)]
    return (cq.Workplane("YZ").polyline(section).close()
            .extrude(27.0).translate((-13.5, 0, 0)))

board_wedge = make_board_wedge(WEDGE_FACE_Y)
wedge_fit_options = {
    "07_xiao_wedge_looser": make_board_wedge(WEDGE_FACE_Y + 0.10),
    "07_xiao_wedge_tighter": make_board_wedge(WEDGE_FACE_Y - 0.10),
}

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

# A separate orange accent halo rests on the floor of the recessed switch
# well. The 0.2 mm side clearance is for a test fit and a tiny adhesive dot.
accent_halo = box(22.6, 22.6, 2.7, MX_X, MX_Y, well_floor_z)
accent_halo = accent_halo.edges("|Z").fillet(1.4)
halo_inner = box(19.4, 19.4, 3.0, MX_X, MX_Y, well_floor_z - 0.1)
halo_inner = halo_inner.edges("|Z").fillet(1.0)
accent_halo = accent_halo.cut(halo_inner)

# ==========================================
# 8. Faceted flip shield
# ==========================================
# The underside is 1.2 mm above the unpressed keycap. A thick, low roof and
# exterior hinge cheeks make a functional guard without touching the switch.
cover_bottom_z, cover_top_z = 23.4, 26.5
cover_bottom = octo_points(42.0, 30.0, 4.0)
cover_top = octo_points(40.2, 28.2, 3.9)
cover = (cq.Workplane("XY").workplane(offset=cover_bottom_z)
         .polyline(cover_bottom).close()
         .workplane(offset=cover_top_z - cover_bottom_z)
         .polyline(cover_top).close().loft(combine=True)
         .translate((0, 4.0, 0)))

# Thumb ledge is integral with the shield. The front edge is still above the
# USB opening and lights, so they remain reachable with the lid closed.
thumb_ledge = box(13.0, 2.8, 2.7, 0, -11.3, cover_bottom_z)
thumb_ledge = thumb_ledge.edges("|Z").fillet(0.9)
cover = cover.union(thumb_ledge)

# Three low walls turn the roof into a proper pocket shield. They hide the
# keycap sides while leaving 0.8 mm above the enclosure top and enough space
# around the switch well for the 4 mm key travel.
front_skirt = box(22.0, 1.8, cover_bottom_z - 17.3,
                  0, -6.8, 17.3)
cover = cover.union(front_skirt)
for sx in (-13.0, 13.0):
    side_skirt = box(2.0, 22.0, cover_bottom_z - 17.3,
                     sx, 4.0, 17.3)
    cover = cover.union(side_skirt)

# Side cheeks straddle the case pillars with 0.45 mm nominal lateral gap.
for hx in (-22.35, 22.35):
    # Keep the inboard bridge at the roof level. Its underside must clear the
    # rear of the case pillar throughout the opening arc.
    bridge = box(7.6, 3.4, cover_top_z - 24.7,
                 -19.8 if hx < 0 else 19.8, 17.6, 24.7)
    cover = cover.union(bridge)
    cheek = box(2.4, 5.0, cover_top_z - 19.4, hx, 20.5, 19.4)
    cheek = cheek.edges("|X").chamfer(0.5)
    cover = cover.union(cheek)

# Narrow roof slots let the orange cap show while still preventing a finger
# from operating it through the shut cover.
for sx in (-5.0, 0.0, 5.0):
    slot = box(1.8, 10.5, 4.0, sx, 4.2, cover_bottom_z - 0.2)
    slot = slot.rotate((sx, 4.2, 0), (sx, 4.2, 1), -23)
    cover = cover.cut(slot)

for mx in (-MAGNET_X, MAGNET_X):
    cover = cover.cut(cyl(3.15, 1.25, mx, MAGNET_Y, cover_bottom_z - 0.1))
cover = cover.cut(hinge_bore)

# A standard 1.75 mm FDM filament offcut is the hinge pin. It is exported as
# an assembly reference only, not a printable part.
hinge_pin = (cq.Workplane("YZ").center(HINGE_Y, HINGE_Z)
             .circle(0.875).extrude(50.0).translate((-25.0, 0, 0)))
cover_open = cover.rotate((0, HINGE_Y, HINGE_Z), (1, HINGE_Y, HINGE_Z), -105)

# ==========================================
# 9. Dual Lightguide Pins
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
    "01_upper_shell_vault": shell,
    "02_bottom_chassis_vault": base,
    "03_mx_keycap_vault": keycap,
    "04_lightguides_vault": lightguides,
    "05_accent_halo_vault": accent_halo,
    "06_flip_shield_vault": cover,
    "07_xiao_locking_wedge": board_wedge,
}

checks = {
    "shell_vs_base_mm3": intervol(shell, base),
    "keycap_vs_shell_mm3": intervol(keycap, shell),
    "lightguides_vs_shell_mm3": intervol(lightguides, shell),
    "lightguides_vs_base_mm3": intervol(lightguides, base),
    "halo_vs_shell_mm3": intervol(accent_halo, shell),
    "halo_vs_keycap_mm3": intervol(accent_halo, keycap),
    "closed_shield_vs_shell_mm3": intervol(cover, shell),
    "closed_shield_vs_keycap_mm3": intervol(cover, keycap),
    "open_shield_vs_shell_mm3": intervol(cover_open, shell),
    "open_shield_vs_keycap_mm3": intervol(cover_open, keycap),
    "board_wedge_vs_shell_mm3": intervol(board_wedge, shell),
    "board_wedge_vs_base_mm3": intervol(board_wedge, base),
}

# A closed and fully open pose alone can hide an interference mid-swing.
motion_sweep = {}
for angle in range(0, -111, -10):
    pose = cover.rotate((0, HINGE_Y, HINGE_Z),
                        (1, HINGE_Y, HINGE_Z), angle)
    motion_sweep[str(angle)] = {
        "shell_mm3": round(intervol(pose, shell), 5),
        "keycap_mm3": round(intervol(pose, keycap), 5),
    }
if any(v > 0.05 for data in motion_sweep.values() for v in data.values()):
    raise RuntimeError(f"Flip shield collides during opening: {motion_sweep}")

board_step_path = REF / "XIAO_ESP32S3_Seeed.step"
if board_step_path.exists():
    board = cq.importers.importStep(str(board_step_path)).rotate((0, 0, 0), (1, 0, 0), 90).rotate((0, 0, 0), (0, 0, 1), -90)
    bb = board.val().BoundingBox()
    board = board.translate((-((bb.xmin + bb.xmax) / 2), BOARD_Y - ((bb.ymin + bb.ymax) / 2), 3.0 - bb.zmin))
    checks["official_xiao_vs_retention_mm3"] = sum(intervol(board, f) for f in retention_features)
    checks["official_xiao_vs_board_wedge_mm3"] = intervol(board, board_wedge)
    cq.exporters.export(board, str(ROOT / "XIAO_reference_position.stl"),
                        tolerance=0.05, angularTolerance=0.3)
    pcb = max(board.solids().vals(), key=lambda s: s.Volume())
    pcb_bb = pcb.BoundingBox()
    fixture_clearances = {
        "front_stop_mm": round(pcb_bb.ymin - (-21.45), 3),
        "rear_wedge_face_mm": round(WEDGE_FACE_Y - pcb_bb.ymax, 3),
        "rear_wedge_to_anvil_mm": 0.0,
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
    "version": "AirGap Paste Flip Vault v1",
    "units": "mm",
    "dimensions_mm": {
        "width": BODY_W,
        "depth": BODY_D,
        "height_shell": TOP_Z,
        "total_height_closed": cover_top_z,
        "closed_keycap_to_shield_nominal_gap": round(cover_bottom_z - (cap_base_z + cap_h), 2),
    },
    "checks": checks,
    "motion_sweep_deg": motion_sweep,
    "fixture_clearances_mm": fixture_clearances if board_step_path.exists() else None,
    "usb_load_path": "plug to connector to seated PCB to broad front shoulders on pull; PCB to rear wedge to full-width anvil on insertion",
    "parts": {},
}
manifest["dimensions_mm"]["length_with_loop"] = round(shell.val().BoundingBox().ylen, 1)
manifest["optional_wedge_faces_y_mm"] = {
    "looser": WEDGE_FACE_Y + 0.10,
    "nominal": WEDGE_FACE_Y,
    "tighter": WEDGE_FACE_Y - 0.10,
}

for name, obj in parts.items():
    s = obj.val()
    if not s.isValid() or len(obj.solids().vals()) != 1:
        regions = [(round(v.Volume(), 2), tuple(round(n, 2) for n in
                   (v.BoundingBox().xmin, v.BoundingBox().ymin, v.BoundingBox().zmin,
                    v.BoundingBox().xmax, v.BoundingBox().ymax, v.BoundingBox().zmax)))
                   for v in obj.solids().vals()]
        raise RuntimeError(f"Invalid or disconnected printable part: {name}: {regions}")
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

for name, obj in wedge_fit_options.items():
    if not obj.val().isValid() or len(obj.solids().vals()) != 1:
        raise RuntimeError(f"Invalid optional XIAO wedge: {name}")
    cq.exporters.export(obj, str(ROOT / f"{name}.step"))
    path = ROOT / f"{name}.stl"
    cq.exporters.export(obj, str(path), tolerance=0.03, angularTolerance=0.25)
    mesh = trimesh.load(path, force="mesh")
    mesh.update_faces(mesh.nondegenerate_faces())
    mesh.remove_unreferenced_vertices()
    mesh.export(path)

# Print the cap with its visible top on the A1 bed. This leaves the hollow stem
# and skirt open upward, avoiding a bridge across the underside cavity.
print_cap = keycap.rotate((0, 0, 0), (1, 0, 0), 180)
print_cap = print_cap.translate((0, 0, cap_base_z + cap_h))
print_cap_path = ROOT / "03_mx_keycap_vault_top_down.stl"
cq.exporters.export(print_cap, str(print_cap_path), tolerance=0.03, angularTolerance=0.25)
print_cap_mesh = trimesh.load(print_cap_path, force="mesh")
print_cap_mesh.update_faces(print_cap_mesh.nondegenerate_faces())
print_cap_mesh.remove_unreferenced_vertices()
print_cap_mesh.export(print_cap_path)

# The shield prints with its visible roof on the build plate. Its hinge cheeks
# then grow upward, without a large support scar on the outside face.
print_cover = cover.rotate((0, 0, 0), (1, 0, 0), 180)
print_cover = print_cover.translate((0, 0, -print_cover.val().BoundingBox().zmin))
print_cover_path = ROOT / "06_flip_shield_vault_face_down.stl"
cq.exporters.export(print_cover, str(print_cover_path), tolerance=0.03, angularTolerance=0.25)
print_cover_mesh = trimesh.load(print_cover_path, force="mesh")
print_cover_mesh.update_faces(print_cover_mesh.nondegenerate_faces())
print_cover_mesh.remove_unreferenced_vertices()
print_cover_mesh.export(print_cover_path)

hero_cover = cover.rotate((0, HINGE_Y, HINGE_Z), (1, HINGE_Y, HINGE_Z), -68)
open_preview_path = ROOT / "06_flip_shield_vault_open_preview.stl"
cq.exporters.export(hero_cover, str(open_preview_path), tolerance=0.03, angularTolerance=0.25)

cq.exporters.export(hinge_pin, str(ROOT / "hinge_pin_filament_reference.step"))

print(json.dumps(manifest, indent=2))

assembly = (cq.Assembly()
            .add(shell, name="upper_shell", color=cq.Color(0.12, 0.12, 0.14, 1.0))
            .add(base, name="bottom_chassis", color=cq.Color(0.12, 0.12, 0.14, 1.0))
            .add(keycap, name="keycap_oem", color=cq.Color(0.95, 0.45, 0.05, 1.0))
            .add(accent_halo, name="accent_halo", color=cq.Color(0.95, 0.30, 0.02, 1.0))
            .add(lightguides, name="lightguides", color=cq.Color(0.9, 0.95, 1.0, 0.7))
            .add(cover, name="flip_shield_closed", color=cq.Color(0.09, 0.10, 0.12, 1.0))
            .add(board_wedge, name="xiao_locking_wedge", color=cq.Color(0.2, 0.2, 0.22, 1.0))
            .add(hinge_pin, name="filament_hinge_pin", color=cq.Color(0.35, 0.35, 0.38, 1.0)))
assembly.save(str(ROOT / "flip_vault_closed_assembly.step"))
open_assembly = (cq.Assembly()
                 .add(shell, name="upper_shell", color=cq.Color(0.12, 0.12, 0.14, 1.0))
                 .add(base, name="bottom_chassis", color=cq.Color(0.12, 0.12, 0.14, 1.0))
                 .add(keycap, name="keycap", color=cq.Color(0.95, 0.45, 0.05, 1.0))
                 .add(accent_halo, name="accent_halo", color=cq.Color(0.95, 0.30, 0.02, 1.0))
                 .add(lightguides, name="lightguides", color=cq.Color(0.9, 0.95, 1.0, 0.7))
                 .add(cover_open, name="flip_shield_open", color=cq.Color(0.09, 0.10, 0.12, 1.0))
                 .add(board_wedge, name="xiao_locking_wedge", color=cq.Color(0.2, 0.2, 0.22, 1.0))
                 .add(hinge_pin, name="filament_hinge_pin", color=cq.Color(0.35, 0.35, 0.38, 1.0)))
open_assembly.save(str(ROOT / "flip_vault_open_assembly.step"))
if board_step_path.exists():
    fitted_assembly = (cq.Assembly()
                       .add(shell, name="upper_shell", color=cq.Color(0.12, 0.12, 0.14, 1.0))
                       .add(base, name="bottom_chassis", color=cq.Color(0.12, 0.12, 0.14, 1.0))
                       .add(keycap, name="keycap", color=cq.Color(0.95, 0.45, 0.05, 1.0))
                       .add(accent_halo, name="accent_halo", color=cq.Color(0.95, 0.30, 0.02, 1.0))
                       .add(lightguides, name="lightguides", color=cq.Color(0.9, 0.95, 1.0, 0.7))
                       .add(cover_open, name="flip_shield_open", color=cq.Color(0.09, 0.10, 0.12, 1.0))
                       .add(board_wedge, name="xiao_locking_wedge", color=cq.Color(0.2, 0.2, 0.22, 1.0))
                       .add(hinge_pin, name="filament_hinge_pin", color=cq.Color(0.35, 0.35, 0.38, 1.0))
                       .add(board, name="Seeed_XIAO_ESP32S3_reference", color=cq.Color(0.05, 0.4, 0.15, 1.0)))
    fitted_assembly.save(str(ROOT / "flip_vault_with_xiao_reference.step"))

with open(ROOT / "validation_summary.json", "w") as f:
    json.dump(manifest, f, indent=2)

print("Export completed successfully.")
