"""AirGap Paste Hex Node — printable EDC enclosure for XIAO ESP32-S3 + MX."""
from pathlib import Path
import json, math
import cadquery as cq

ROOT = Path(__file__).resolve().parent
REF = ROOT.parent / "reference"

def box(w, d, h, x=0, y=0, z=0):
    return cq.Workplane("XY").box(w, d, h, centered=(True, True, False)).translate((x, y, z))
def cyl(d, h, x=0, y=0, z=0):
    return cq.Workplane("XY").circle(d / 2).extrude(h).translate((x, y, z))
def hex_prism(af, h, x=0, y=0, z=0):
    return cq.Workplane("XY").polyline(hex_points(af)).close().extrude(h).translate((x, y, z))
def hex_points(af):
    r = af / math.sqrt(3)
    # A broad front flat for USB and two indicators, vertices at left/right.
    return [(r * math.cos(math.radians(60*i)), r * math.sin(math.radians(60*i))) for i in range(6)]
def polygon(points, height, z=0):
    return cq.Workplane("XY").polyline(points).close().extrude(height).translate((0, 0, z))
def intervol(a, b):
    return sum(s.Volume() for s in a.intersect(b).solids().vals())

# Hardware-critical values (millimetres)
AF = 48.0              # compact lower body; constrained by USB + two LEDs
TOP_AF = 42.0          # sloped shoulder as seen in the concept image
SHOULDER_Z = 16.0
BASE_H = 2.6
TOP_Z = 22.0
WALL = 2.2
MX_X, MX_Y = 0.0, 5.0
MX_CUTOUT = 14.10      # 14.0 nominal + FDM clearance
MX_PLATE = 1.50
BOARD_W, BOARD_L, BOARD_H = 17.78, 20.95, 4.85
BOARD_POCKET_W, BOARD_POCKET_L, BOARD_Y = 20.8, 22.8, -11.6
USB_W, USB_H = 10.8, 4.8
LED_X, LED_Y, LED_BORE = 0.0, 14.0, 5.35
LUG_TOP, LUG_THICKNESS = 19.5, 6.0
SCREWS = ((-17.0, -1.0), (17.0, -1.0))
M3_D, M3_CSK, NUT_AF = 3.4, 6.4, 5.7

# Lower wall and the tapered top shoulder are one printable body.  The image
# does not provide a scale, so the exterior dimensions are design choices.
lower = hex_prism(AF, SHOULDER_Z - BASE_H, z=BASE_H).edges("|Z").fillet(1.2)
shoulder = (cq.Workplane("XY").workplane(offset=SHOULDER_Z)
            .polyline(hex_points(AF)).close()
            .workplane(offset=TOP_Z-SHOULDER_Z)
            .polyline(hex_points(TOP_AF)).close().loft(combine=True))
shell = lower.union(shoulder)
inner = hex_prism(AF - 2*WALL, TOP_Z - BASE_H - 2.6, z=BASE_H)
shell = shell.cut(inner)

# Flat, open loop seen on the right of the reference, integral with the shell.
# It takes a real split ring or a cord; the metal ring in the image is not PLA.
lug_outer = [(20,-8),(27,-11),(34,-10),(39,-6),(40,0),(38,7),(33,10),(27,10),(20,7)]
lug_hole = [(27,-5),(30,-6),(34,-5),(36,-2),(36,2),(33,6),(29,6),(26,3)]
lug = polygon(lug_outer, LUG_THICKNESS, LUG_TOP-LUG_THICKNESS)
lug = lug.cut(polygon(lug_hole, LUG_THICKNESS+1, LUG_TOP-LUG_THICKNESS-.5))
shell = shell.union(lug)

# Exact 1.50 mm MX mounting plate and LED/light-guide passage.
shell = shell.cut(box(18.4, 18.4, 2.6 - MX_PLATE + .05, MX_X, MX_Y, TOP_Z - 2.6))
shell = shell.cut(box(MX_CUTOUT, MX_CUTOUT, 5.0, MX_X, MX_Y, TOP_Z - 3.0))
shell = shell.cut(cyl(5.55, 5.0, LED_X, LED_Y, TOP_Z - 3.0))
# Narrow dark recess around the switch flange visible beside the orange cap.
shell = shell.cut(box(20.4, 20.4, .45, MX_X, MX_Y, TOP_Z-.44))

# Screw towers and ribs connected to the outer wall.
for x, y in SCREWS:
    shell = shell.union(cyl(7.6, 9.0, x, y, BASE_H))
    shell = shell.union(box(11.0, 4.0, 9.0, x + (5.0 if x > 0 else -5.0), y, BASE_H))
    shell = shell.cut(cyl(M3_D, 10.5, x, y, BASE_H - .1))
    # hex nut pocket, 5.2 mm deep, accessed from the bottom
    n_r = NUT_AF / math.sqrt(3)
    pts = [(n_r*math.cos(math.radians(30+60*i)), n_r*math.sin(math.radians(30+60*i))) for i in range(6)]
    shell = shell.cut(cq.Workplane("XY").polyline(pts).close().extrude(5.2).translate((x, y, BASE_H+2.4)))

# Two lid pads hold the XIAO down once the M3 screws close the case.  The
# official board STEP is checked below so their 0.5 mm nominal air gap remains.
for x in (-7.2, 7.2):
    shell = shell.union(box(2.0, 3.0, 11.6, x, BOARD_Y, 8.0))

# USB-C port and two independent 2 mm LED openings in the front flat.
usb_throat = box(USB_W, 6.2, USB_H, 0, -24.0, 3.25).edges("|Y").fillet(2.0)
usb_mouth = box(12.2, 1.2, 6.2, 0, -23.4, 2.55).edges("|Y").fillet(2.4)
shell = shell.cut(usb_throat).cut(usb_mouth)
for x in (-10.1, 10.1):
    hole = cyl(2.0, 7).rotate((0,0,0), (1,0,0), 90).translate((x, -20.0, 7.0))
    shell = shell.cut(hole)

# Bottom electronics chassis
base = hex_prism(AF, BASE_H)
base = base.edges("|Z").fillet(1.1)

# alignment rim within the upper shell
rim = hex_prism(AF-2*WALL-.35, 1.3, z=BASE_H).cut(hex_prism(AF-2*WALL-2.90, 1.5, z=BASE_H-.1))
rim = rim.cut(box(20, 8, 3, 0, -22, BASE_H-.1))
for x, y in SCREWS:
    rim = rim.cut(cyl(18.0, 1.6, x, y, BASE_H-.1))
base = base.union(rim)
for x, y in SCREWS:
    base = base.cut(cyl(M3_D, BASE_H+2, x, y, -.1))
    cone = cq.Workplane("XY").circle(M3_CSK/2).workplane(offset=1.5).circle(M3_D/2).loft(combine=False).translate((x, y, -.01))
    base = base.cut(cone)

# XIAO slide-in bed: side ledges, fences, rear stop, BAT solder relief.
for x in (-9.65, 9.65):
    base = base.union(box(1.5, 20.5, .5, x, -10.7, BASE_H))
    base = base.union(box(.8, 20.5, 2.3, x*1.08, -10.7, BASE_H))
# USB plug insertion pushes the PCB rearwards.  This stop and the side fences
# carry that load into the printed base.  The front shell wall resists pull.
base = base.union(box(13.0, 1.6, 3.0, 0, BOARD_Y+BOARD_POCKET_L/2+1.0, BASE_H))
base = base.cut(box(15.0, 10.0, 1.45, 0, BOARD_Y, 1.2))

# LED cradle and antenna shelf.
led_holder = cyl(7.6, 6.0, LED_X, LED_Y, BASE_H).cut(cyl(LED_BORE, 6.5, LED_X, LED_Y, BASE_H+.2))
base = base.union(led_holder)
for x in (-1.3, 1.3): base = base.cut(cyl(1.1, 4.0, x, LED_Y, .5))
base = base.union(box(24.0, 2.0, 8.5, 0, 19.0, BASE_H))
for x in (-6.5, 6.5): base = base.cut(box(2.0, 5.0, 1.2, x, 3.0, 0))

# Rounded square orange MX keycap, without lettering in this prototype.
cap_z = 24.5
keycap = box(20.0, 20.0, 6.8, MX_X, MX_Y, cap_z).edges("|Z").fillet(2.2)
keycap = keycap.edges(">Z").chamfer(.75)
keycap = keycap.cut(box(17.0, 17.0, 5.6, MX_X, MX_Y, cap_z-.1))
boss = cyl(7.2, 6.4, MX_X, MX_Y, cap_z)
cross = box(4.25, 1.4, 4.9, MX_X, MX_Y, cap_z-.2).union(box(1.25, 4.25, 4.9, MX_X, MX_Y, cap_z-.2))
keycap = keycap.union(boss).cut(cross)
keycap = keycap.cut(box(5.0, 4.0, 3.2, LED_X, LED_Y-.6, cap_z-.1))

# Solid square light guide fits a 5 mm LED holder and prints lying on a flat side.
lightguide = box(3.7, 3.7, 15.7, LED_X, LED_Y, 7.9).union(box(3.7, 8.0, 2.0, LED_X, LED_Y-2.4, 22.2))

# MX cutout calibration plate (not part of the primary print plate).
coupon = box(60, 22, 1.5)
for x, cut in zip((-20, 0, 20), (14.00, 14.10, 14.20)): coupon = coupon.cut(box(cut, cut, 3, x, 0, -.2))

# Small USB aperture coupon, also excluded from the four-part assembly plate.
# It checks the user's plug shell and overmould before spending PLA on a body.
usb_coupon = box(32, 14, 2.2)
usb_coupon = usb_coupon.cut(box(USB_W, USB_H, 3.0, z=-.2).edges("|Z").fillet(2.0))
usb_coupon = usb_coupon.cut(box(12.2, 6.2, 1.3, z=1.0).edges("|Z").fillet(2.4))

parts = {
    "01_upper_shell_hex": shell, "02_bottom_chassis_hex": base,
    "03_mx_keycap_hex": keycap, "04_lightguide_hex": lightguide,
    "06_mx_fit_coupon_hex": coupon, "07_usb_fit_coupon_hex": usb_coupon,
}
# PCB centre differs from the imported STEP envelope centre because the USB-C
# connector protrudes about 1.53 mm from the front of the board.
board_env = box(BOARD_W, BOARD_L, BOARD_H, 0, BOARD_Y+.765, 3.1)
mx_env = box(15.6, 15.6, 5.0, MX_X, MX_Y, TOP_Z-MX_PLATE-5.0)
checks = {"board_vs_shell_mm3": intervol(board_env, shell), "board_vs_keycap_mm3": intervol(board_env, keycap), "mx_vs_base_mm3": intervol(mx_env, base)}
checks["shell_vs_base_mm3"] = intervol(shell, base)
checks["lightguide_vs_shell_mm3"] = intervol(lightguide, shell)
checks["lightguide_vs_base_mm3"] = intervol(lightguide, base)
checks["lightguide_vs_keycap_mm3"] = intervol(lightguide, keycap)
for k, v in checks.items():
    if v > .05:
        if k == "shell_vs_base_mm3":
            regions = []
            for clash_solid in shell.intersect(base).solids().vals():
                bb = clash_solid.BoundingBox()
                regions.append((round(clash_solid.Volume(),2),tuple(round(t,2) for t in (bb.xmin,bb.ymin,bb.zmin,bb.xmax,bb.ymax,bb.zmax))))
            raise RuntimeError(f"collision {k}: {v}, regions={regions}")
        raise RuntimeError(f"collision {k}: {v}")

report = {"version": "AirGap Paste Compact Hex Node v2", "units": "mm", "body_across_flats_mm": AF,
          "overall_with_lug_mm": [40+AF/math.sqrt(3), AF, TOP_Z],
          "assembled_height_with_keycap_mm": round(cap_z+6.8,2),
          "hardware": {"board":"Seeed Studio XIAO ESP32-S3", "board_pocket_mm":[BOARD_POCKET_L, BOARD_POCKET_W], "usb_opening_mm":[USB_W,USB_H], "mx_cutout_mm":MX_CUTOUT, "mx_plate_thickness_mm":MX_PLATE, "fasteners":"2x M3x10 DIN 963 + 2x M3 nuts", "front_indicators":"2x 2 mm LEDs", "keycap":"rounded square 20 x 20 mm, blank", "lanyard":"integral open loop for cord or purchased metal ring"},
          "checks": {k:round(v,4) for k,v in checks.items()}, "parts": {},
          "physical_validation_required":["MX fit coupon for actual switch batch","USB-C cable test","LED/light-guide brightness test","U.FL bend radius and antenna radio test","M3 screw length test"]}
for name, part in parts.items():
    solid = part.val()
    if not solid.isValid() or len(part.solids().vals()) != 1:
        raise RuntimeError(f"invalid or disconnected {name}: valid={solid.isValid()}, solids={len(part.solids().vals())}")
    bb = solid.BoundingBox()
    report["parts"][name] = {"valid":True,"solids":1,"bbox_mm":[round(bb.xlen,3),round(bb.ylen,3),round(bb.zlen,3)],"volume_mm3":round(solid.Volume(),2)}

# Include exact XIAO STEP in the assembly and collision-check it against shell.
board = cq.importers.importStep(str(REF / "XIAO_ESP32S3_Seeed.step")).rotate((0,0,0),(1,0,0),90).rotate((0,0,0),(0,0,1),-90)
bb = board.val().BoundingBox()
board = board.translate((-((bb.xmin+bb.xmax)/2), BOARD_Y-((bb.ymin+bb.ymax)/2), 3.1-bb.zmin))
report["usb_recess_from_front_mm"] = round(board.val().BoundingBox().ymin + AF/2, 3)
exact = intervol(board, shell)
report["checks"]["official_xiao_step_vs_shell_mm3"] = round(exact,4)
if exact > .05: raise RuntimeError(f"XIAO STEP collision: {exact}")
base_collision = intervol(board, base)
report["checks"]["official_xiao_step_vs_base_mm3"] = round(base_collision,4)
if base_collision > .05:
    details = []
    for clash_solid in board.intersect(base).solids().vals():
        clash_bb = clash_solid.BoundingBox()
        details.append((round(clash_solid.Volume(),3), tuple(round(v,2) for v in (clash_bb.xmin,clash_bb.ymin,clash_bb.zmin,clash_bb.xmax,clash_bb.ymax,clash_bb.zmax))))
    raise RuntimeError(f"XIAO STEP/base collision: {base_collision}, regions={details}")

print_parts = {"01_upper_shell_hex":shell.rotate((0,0,0),(1,0,0),180), "02_bottom_chassis_hex":base,
               "03_mx_keycap_hex":keycap.rotate((0,0,0),(1,0,0),180), "04_lightguide_hex":lightguide.rotate((0,0,0),(0,1,0),90),
               "06_mx_fit_coupon_hex":coupon, "07_usb_fit_coupon_hex":usb_coupon}
for name, part in parts.items():
    cq.exporters.export(part, str(ROOT / f"{name}.step"))
    cq.exporters.export(print_parts[name], str(ROOT / f"{name}.stl"), tolerance=.01, angularTolerance=.1)
assy = cq.Assembly()
for name, part, col in [("Upper shell",shell,(.07,.08,.09)),("Bottom chassis",base,(.12,.13,.14)),("PASTE keycap",keycap,(1,.35,.05)),("Light guide",lightguide,(.95,.95,.78)),("XIAO ESP32-S3",board,(.1,.55,.2))]: assy.add(part,name=name,color=cq.Color(*col))
assy.save(str(ROOT / "assembly_hex_node.step"))
(ROOT / "validation_hex_node.json").write_text(json.dumps(report, indent=2)+"\n")
print(json.dumps(report,indent=2))
