"""AirGap Paste EDC Pocket Vault — parametric, support-free enclosure.

Target hardware:
- Seeed Studio XIAO ESP32-S3
- plate-mounted 3-pin MX-compatible switch
- 5 mm LED with a removable translucent light guide
- 4x M3x10 countersunk screws and captive M3 nuts

All dimensions are millimetres.  The script exports STEP and STL files plus a
machine-readable validation report.  It intentionally keeps the visual idea
from render 13 separate from the dimensional hardware references.
"""

from pathlib import Path
import json
import math
import cadquery as cq

ROOT = Path(__file__).resolve().parent
REF = ROOT.parent / "reference"


def rounded_box(width, depth, height, radius, z=0, x=0, y=0):
    body = cq.Workplane("XY").rect(width, depth).extrude(height)
    body = body.edges("|Z").fillet(radius)
    return body.translate((x, y, z))


def box(width, depth, height, x=0, y=0, z=0):
    return (
        cq.Workplane("XY")
        .box(width, depth, height, centered=(True, True, False))
        .translate((x, y, z))
    )


def cylinder(diameter, height, x=0, y=0, z=0):
    return cq.Workplane("XY").circle(diameter / 2).extrude(height).translate((x, y, z))


def hex_prism(across_flats, height, x=0, y=0, z=0):
    radius = across_flats / math.sqrt(3)
    points = [
        (
            radius * math.cos(math.radians(30 + 60 * i)),
            radius * math.sin(math.radians(30 + 60 * i)),
        )
        for i in range(6)
    ]
    return cq.Workplane("XY").polyline(points).close().extrude(height).translate((x, y, z))


def intersection_volume(first, second):
    solids = first.intersect(second).solids().vals()
    return sum(item.Volume() for item in solids) if solids else 0.0


# ---------------------------------------------------------------------------
# Critical dimensions and tolerances
# ---------------------------------------------------------------------------
BODY_W = 54.0
BODY_D = 48.0
BODY_RADIUS = 7.0
BASE_H = 2.6
BODY_TOP = 24.0
WALL = 2.2

MX_X = 0.0
MX_Y = 4.5
MX_CUTOUT = 14.10       # 14.0 nominal + 0.10 FDM clearance
MX_PLATE = 1.50         # standard snap-in plate thickness
MX_FLANGE = 15.60

BOARD_W = 17.78
BOARD_L = 20.95
BOARD_POCKET_W = 20.80  # +1.51 mm each side for wires / solder
BOARD_POCKET_L = 22.80
BOARD_Y = -10.3
BOARD_BOTTOM_Z = 3.10
BOARD_ENVELOPE_H = 4.85

USB_W = 13.20
USB_H = 7.00
USB_Z = 3.0

LED_X = 0.0
LED_Y = 15.0
LED_BORE = 5.35

LUG_X = 28.0
LUG_Y = 12.0
LUG_OD = 14.0
LUG_HOLE = 5.0

SCREW_POINTS = ((-20.0, -16.5), (20.0, -16.5), (-20.0, 16.5), (20.0, 16.5))
M3_CLEARANCE = 3.40
M3_CSK = 6.40
M3_NUT_AF = 5.70


# ---------------------------------------------------------------------------
# Part 1: upper shell — print top-face down, no supports
# ---------------------------------------------------------------------------
shell = rounded_box(BODY_W, BODY_D, BODY_TOP - BASE_H, BODY_RADIUS, z=BASE_H)
inner = rounded_box(
    BODY_W - 2 * WALL,
    BODY_D - 2 * WALL,
    BODY_TOP - BASE_H - 2.6,
    BODY_RADIUS - WALL,
    z=BASE_H,
)
shell = shell.cut(inner)

# Integrated EDC lanyard lug.  The hole is vertical and prints cleanly.
lug = cylinder(LUG_OD, BODY_TOP - BASE_H, LUG_X, LUG_Y, BASE_H)
lug_bridge = box(7.0, 14.0, BODY_TOP - BASE_H, 24.5, LUG_Y, BASE_H)
shell = shell.union(lug).union(lug_bridge)
shell = shell.cut(cylinder(LUG_HOLE, BODY_TOP + 2, LUG_X, LUG_Y, -1))

# Local underside relief leaves an exact 1.50 mm MX snap-in plate.
plate_relief_h = 2.6 - MX_PLATE
shell = shell.cut(box(18.4, 18.4, plate_relief_h + 0.05, MX_X, MX_Y, BODY_TOP - 2.6))
shell = shell.cut(box(MX_CUTOUT, MX_CUTOUT, 5.0, MX_X, MX_Y, BODY_TOP - 3.0))

# Rear light-guide passage feeds light into the translucent keycap skirt.
shell = shell.cut(cylinder(5.55, 5.0, LED_X, LED_Y, BODY_TOP - 3.0))

# Press-fit holes for two separately printed protective shoulders.  Keeping the
# shoulders separate gives the shell one planar print face and removes supports.
GUARD_PIN_D = 2.20
GUARD_HOLE_D = 2.45
for sx in (-19.0, 19.0):
    for sy in (0.0, 10.0):
        shell = shell.cut(cylinder(GUARD_HOLE_D, 3.2, sx, sy, BODY_TOP - 3.0))

# Four screw towers tied into the walls; nuts insert from below during assembly.
for sx, sy in SCREW_POINTS:
    tower = cylinder(8.0, 10.0, sx, sy, BASE_H)
    # Radial rib overlaps both the post and the rounded outer wall.
    rib_x = sx + (2.5 if sx > 0 else -2.5)
    rib = box(9.0, 4.0, 10.0, rib_x, sy, BASE_H)
    shell = shell.union(tower).union(rib)
    shell = shell.cut(cylinder(M3_CLEARANCE, 10.5, sx, sy, BASE_H - 0.1))
    shell = shell.cut(hex_prism(M3_NUT_AF, 5.2, sx, sy, BASE_H + 2.4))

# USB-C opening and two status-light ports at the front.
shell = shell.cut(box(USB_W, 5.0, USB_H, 0, -23.0, USB_Z))
for x in (-8.5, 8.5):
    pinhole = cylinder(1.8, 6.0).rotate((0, 0, 0), (1, 0, 0), 90).translate((x, -21.5, 7.0))
    shell = shell.cut(pinhole)


# ---------------------------------------------------------------------------
# Part 2: bottom electronics chassis
# ---------------------------------------------------------------------------
base = rounded_box(BODY_W, BODY_D, BASE_H, BODY_RADIUS)
base = base.union(cylinder(LUG_OD, BASE_H, LUG_X, LUG_Y, 0))
base = base.union(box(7.0, 14.0, BASE_H, 24.5, LUG_Y, 0))
base = base.cut(cylinder(LUG_HOLE, BASE_H + 2, LUG_X, LUG_Y, -1))

# Alignment rim inside shell; front is open so the USB plug is unobstructed.
rim_outer = rounded_box(BODY_W - 2 * WALL - 0.35, BODY_D - 2 * WALL - 0.35, 1.3, BODY_RADIUS - WALL, BASE_H)
rim_inner = rounded_box(BODY_W - 2 * WALL - 2.55, BODY_D - 2 * WALL - 2.55, 1.5, BODY_RADIUS - WALL - 1.1, BASE_H - 0.1)
rim = rim_outer.cut(rim_inner).cut(box(16.0, 8.0, 3.0, 0, -22.0, BASE_H - 0.1))
base = base.union(rim)

# Countersunk M3 holes, flush on the bottom.
for sx, sy in SCREW_POINTS:
    base = base.cut(cylinder(M3_CLEARANCE, BASE_H + 2, sx, sy, -0.1))
    cone = (
        cq.Workplane("XY")
        .circle(M3_CSK / 2)
        .workplane(offset=1.50)
        .circle(M3_CLEARANCE / 2)
        .loft(combine=False)
        .translate((sx, sy, -0.01))
    )
    base = base.cut(cone)

# XIAO slide-in bed, wire channels, and a rear stop.
for x in (-9.65, 9.65):
    base = base.union(box(1.5, BOARD_POCKET_L, 0.5, x, BOARD_Y, BASE_H))
    base = base.union(box(0.8, BOARD_POCKET_L - 2.0, 2.3, x * 1.08, BOARD_Y, BASE_H))
base = base.union(box(14.0, 1.4, 3.0, 0, BOARD_Y + BOARD_POCKET_L / 2, BASE_H))
base = base.cut(box(15.0, 10.0, 1.45, 0, BOARD_Y, 1.2))  # BAT+/BAT- solder relief

# 5 mm LED cradle and cable-routing holes.
led_holder = cylinder(7.6, 6.0, LED_X, LED_Y, BASE_H).cut(cylinder(LED_BORE, 6.5, LED_X, LED_Y, BASE_H + 0.2))
base = base.union(led_holder)
for x in (-1.3, 1.3):
    base = base.cut(cylinder(1.1, 4.0, x, LED_Y, 0.5))

# Rear curved antenna shelf; plastic-only region with 8 x 24 mm usable face.
antenna_shelf = box(24.0, 2.0, 8.0, 0, 20.0, BASE_H)
antenna_shelf = antenna_shelf.edges("|Z").fillet(0.7)
base = base.union(antenna_shelf)

# Tie-down slots for thin insulated wires.
for x in (-6.5, 6.5):
    base = base.cut(box(2.0, 5.0, 1.2, x, 3.0, 0.0))


# ---------------------------------------------------------------------------
# Part 3: translucent MX keycap
# ---------------------------------------------------------------------------
cap_w = 18.6
cap_d = 21.0
cap_z = BODY_TOP + 4.2
keycap = rounded_box(cap_w, cap_d, 6.8, 2.0, cap_z, MX_X, MX_Y + 0.8)
keycap = keycap.edges(">Z").chamfer(1.0)

# Hollow optical chamber, leaving 1.2 mm walls and a 1.4 mm top diffuser.
keycap = keycap.cut(rounded_box(cap_w - 2.4, cap_d - 2.4, 5.6, 1.0, cap_z - 0.1, MX_X, MX_Y + 0.8))

# MX cross socket: clone-tolerant dimensions, 4.5 mm engagement depth.
socket_z = cap_z - 0.2
cross = box(4.25, 1.40, 4.9, MX_X, MX_Y, socket_z).union(
    box(1.25, 4.25, 4.9, MX_X, MX_Y, socket_z)
)
stem_boss = cylinder(7.2, 6.4, MX_X, MX_Y, cap_z)
keycap = keycap.union(stem_boss).cut(cross)

# Light-collector notch at the rear underside, mating with the light guide.
keycap = keycap.cut(box(5.9, 4.0, 3.2, LED_X, LED_Y - 0.6, cap_z - 0.1))

# Shallow debossed lock mark keeps the entire key top planar for support-free
# face-down printing and works with a 0.4 mm nozzle.
mark_z = cap_z + 6.45
lock_body = rounded_box(5.8, 4.8, 0.7, 1.0, mark_z, 0, MX_Y + 1.2)
lock_hole = rounded_box(2.4, 2.0, 0.8, 0.5, mark_z - 0.05, 0, MX_Y + 1.1)
lock_mark = lock_body.cut(lock_hole)
shackle = box(0.9, 3.0, 0.7, -1.6, MX_Y + 3.0, mark_z)
shackle = shackle.union(box(0.9, 3.0, 0.7, 1.6, MX_Y + 3.0, mark_z))
shackle = shackle.union(box(4.1, 0.9, 0.7, 0, MX_Y + 4.1, mark_z))
keycap = keycap.cut(lock_mark.union(shackle))


# ---------------------------------------------------------------------------
# Part 4: translucent light guide from 5 mm LED to the keycap skirt
# ---------------------------------------------------------------------------
# A square optical bar is deliberate: after a 90-degree rotation it has one
# full-length flat print face and does not need support.
lightpipe = box(3.7, 3.7, 14.3, LED_X, LED_Y, 7.9)
collector = rounded_box(3.7, 8.0, 2.0, 0.8, 20.6, LED_X, LED_Y - 2.4)
lightpipe = lightpipe.union(collector)


# ---------------------------------------------------------------------------
# MX test coupon — print this first when the exact switch clone is unknown
# ---------------------------------------------------------------------------
coupon = rounded_box(60.0, 22.0, MX_PLATE, 2.0)
for x, cutout in zip((-20.0, 0.0, 20.0), (14.00, 14.10, 14.20)):
    coupon = coupon.cut(box(cutout, cutout, 3.0, x, 0, -0.2))

# Printable paracord cord bead, not a keyring: 12 mm long with a Ø5 mm
# through-passage.  Its hexagonal outside has a stable flat print face.
cord_bead = hex_prism(12.0, 12.0).rotate((0, 0, 0), (1, 0, 0), 90)
cord_bore = cylinder(5.0, 14.0).rotate((0, 0, 0), (1, 0, 0), 90)
paracord_cord_bead = cord_bead.cut(cord_bore)


# Two removable protective shoulders.  Flat tops are deliberate print faces;
# two pins per rail give repeatable location and allow replacement after damage.
def make_guard(sx):
    guard = rounded_box(9.0, 25.0, 4.2, 2.2, BODY_TOP, sx, 5.0)
    for sy in (0.0, 10.0):
        guard = guard.union(cylinder(GUARD_PIN_D, 2.7, sx, sy, BODY_TOP - 2.7))
    return guard


guard_left = make_guard(-19.0)
guard_right = make_guard(19.0)


# ---------------------------------------------------------------------------
# Validation, reference envelopes, and exports
# ---------------------------------------------------------------------------
parts = {
    "01_upper_shell_edc": shell,
    "02_bottom_chassis_edc": base,
    "03_mx_keycap_translucent": keycap,
    "04_lightguide_translucent": lightpipe,
    "05_mx_fit_coupon": coupon,
    "06_guard_left": guard_left,
    "07_guard_right": guard_right,
    "08_paracord_cord_bead": paracord_cord_bead,
}

# Conservative hardware envelopes used for independently repeatable collision
# checks.  The official XIAO STEP is also included in the assembly below.
board_envelope = box(BOARD_W, BOARD_L, BOARD_ENVELOPE_H, 0, BOARD_Y, BOARD_BOTTOM_Z)
mx_body_envelope = box(MX_FLANGE, MX_FLANGE, 5.0, MX_X, MX_Y, BODY_TOP - MX_PLATE - 5.0)

report = {
    "version": "AirGap Paste EDC Pocket Vault v1",
    "units": "mm",
    "external_body_mm": [BODY_W, BODY_D, BODY_TOP],
    "overall_with_lug_mm": [LUG_X + LUG_OD / 2 + BODY_W / 2, BODY_D, BODY_TOP],
    "assembled_height_with_keycap_mm": round(cap_z + 6.8, 2),
    "hardware": {
        "board": "Seeed Studio XIAO ESP32-S3",
        "board_nominal_mm": [BOARD_L, BOARD_W, BOARD_ENVELOPE_H],
        "board_pocket_mm": [BOARD_POCKET_L, BOARD_POCKET_W],
        "usb_opening_mm": [USB_W, USB_H],
        "mx_cutout_mm": MX_CUTOUT,
        "mx_plate_thickness_mm": MX_PLATE,
        "led_bore_mm": LED_BORE,
        "fasteners": "4x M3x10 DIN 963 + 4x M3 DIN 934 nuts",
    },
    "parts": {},
    "checks": {},
    "physical_validation_required": [
        "print MX coupon and select 14.00/14.10/14.20 opening for the actual switch batch",
        "test USB cable overmould clearance",
        "test LED brightness and diffusion with chosen translucent filament",
        "verify U.FL cable bend radius and antenna radio performance",
        "verify screw length with actual DIN 963 head and nut thickness",
    ],
}

for name, part in parts.items():
    solid = part.val()
    if not solid.isValid():
        raise RuntimeError(f"{name}: invalid CAD solid")
    solids = part.solids().vals()
    if len(solids) != 1:
        details = [
            {
                "volume": round(item.Volume(), 3),
                "center": [round(v, 3) for v in item.Center().toTuple()],
            }
            for item in solids
        ]
        raise RuntimeError(f"{name}: expected one connected solid, got {len(solids)}: {details}")
    bbox = solid.BoundingBox()
    report["parts"][name] = {
        "valid": True,
        "solids": len(solids),
        "bbox_mm": [round(bbox.xlen, 3), round(bbox.ylen, 3), round(bbox.zlen, 3)],
        "volume_mm3": round(sum(item.Volume() for item in solids), 2),
    }

critical_checks = {
    "board_vs_shell_mm3": intersection_volume(board_envelope, shell),
    "board_vs_keycap_mm3": intersection_volume(board_envelope, keycap),
    "mx_body_vs_base_mm3": intersection_volume(mx_body_envelope, base),
}
report["checks"] = {key: round(value, 4) for key, value in critical_checks.items()}
for key, value in critical_checks.items():
    if value > 0.05:
        raise RuntimeError(f"collision {key}: {value:.3f} mm3")

print_orientation = {
    "01_upper_shell_edc": shell.rotate((0, 0, 0), (1, 0, 0), 180),
    "02_bottom_chassis_edc": base,
    "03_mx_keycap_translucent": keycap.rotate((0, 0, 0), (1, 0, 0), 180),
    "04_lightguide_translucent": lightpipe.rotate((0, 0, 0), (0, 1, 0), 90),
    "05_mx_fit_coupon": coupon,
    "06_guard_left": guard_left.rotate((0, 0, 0), (1, 0, 0), 180),
    "07_guard_right": guard_right.rotate((0, 0, 0), (1, 0, 0), 180),
    "08_paracord_cord_bead": paracord_cord_bead,
}
report["stl_print_orientation"] = {
    "01_upper_shell_edc": "top face on build plate",
    "02_bottom_chassis_edc": "bottom face on build plate",
    "03_mx_keycap_translucent": "key top on build plate",
    "04_lightguide_translucent": "laid on side",
    "05_mx_fit_coupon": "flat",
    "06_guard_left": "flat guard top on build plate",
    "07_guard_right": "flat guard top on build plate",
    "08_paracord_cord_bead": "hexagonal barrel laid on a flat side",
}

for name, part in parts.items():
    cq.exporters.export(part, str(ROOT / f"{name}.step"))
    cq.exporters.export(print_orientation[name], str(ROOT / f"{name}.stl"), tolerance=0.01, angularTolerance=0.1)

# Exact reference board orientation/placement matches the verified source model.
board_reference = cq.importers.importStep(str(REF / "XIAO_ESP32S3_Seeed.step"))
board_reference = (
    board_reference
    .rotate((0, 0, 0), (1, 0, 0), 90)
    .rotate((0, 0, 0), (0, 0, 1), -90)
)
bb = board_reference.val().BoundingBox()
board_reference = board_reference.translate((-((bb.xmin + bb.xmax) / 2), BOARD_Y - ((bb.ymin + bb.ymax) / 2), BOARD_BOTTOM_Z - bb.zmin))
official_board_shell = intersection_volume(board_reference, shell)
report["checks"]["official_xiao_step_vs_shell_mm3"] = round(official_board_shell, 4)
placed_bb = board_reference.val().BoundingBox()
report["official_xiao_step_placed_bbox_mm"] = [
    round(placed_bb.xlen, 3),
    round(placed_bb.ylen, 3),
    round(placed_bb.zlen, 3),
]
if official_board_shell > 0.05:
    raise RuntimeError(f"official XIAO STEP collides with shell: {official_board_shell:.3f} mm3")

assembly = cq.Assembly()
assembly.add(shell, name="Upper shell", color=cq.Color(0.08, 0.09, 0.09))
assembly.add(base, name="Bottom chassis", color=cq.Color(0.12, 0.13, 0.13))
assembly.add(keycap, name="Translucent MX keycap", color=cq.Color(1.0, 0.33, 0.05, 0.72))
assembly.add(lightpipe, name="Translucent light guide", color=cq.Color(0.95, 0.95, 0.78, 0.65))
assembly.add(guard_left, name="Left protective shoulder", color=cq.Color(0.08, 0.09, 0.09))
assembly.add(guard_right, name="Right protective shoulder", color=cq.Color(0.08, 0.09, 0.09))
assembly.add(paracord_cord_bead.translate((48.0, 0.0, 7.0)), name="Paracord cord bead", color=cq.Color(0.12, 0.13, 0.14))
assembly.add(board_reference, name="Seeed XIAO ESP32-S3 reference", color=cq.Color(0.1, 0.55, 0.2))
assembly.save(str(ROOT / "assembly_edc_pocket_vault.step"))

(ROOT / "validation_edc_vault.json").write_text(json.dumps(report, indent=2) + "\n")
print(json.dumps(report, indent=2))
