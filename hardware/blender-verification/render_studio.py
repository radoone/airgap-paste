"""High-quality studio product render for AirGap Paste Stealth Octo in Blender.
Faithfully matching reference photo aesthetics, lighting, and materials.
"""

from pathlib import Path
import math, shutil
import bpy
from mathutils import Matrix, Vector

ROOT         = Path("/Users/radoone/Documents/airgap paste").resolve()
MODEL_DIR    = ROOT / "hardware" / "enclosure-stealth-octo"
OUT_DIR      = ROOT / "hardware" / "blender-verification"
ARTIFACT_DIR = Path("/Users/radoone/.gemini/antigravity/brain/85138082-12e5-4a64-9cc9-6484253c4e79")
OUT_DIR.mkdir(exist_ok=True)

# ── 1. Clean scene ───────────────────────────────────────────────────────────
for obj in list(bpy.data.objects):
    bpy.data.objects.remove(obj, do_unlink=True)
for mat in list(bpy.data.materials):
    bpy.data.materials.remove(mat, do_unlink=True)
for col in list(bpy.data.collections):
    if col != bpy.context.scene.collection:
        bpy.data.collections.remove(col)

# ── 2. Material Helper ───────────────────────────────────────────────────────
def make_mat(name, color, roughness=0.5, metallic=0.0, transmission=0.0,
             spec=0.5, emit_color=None, emit_str=0.0):
    mat = bpy.data.materials.new(name)
    mat.use_nodes = True
    bsdf = next((n for n in mat.node_tree.nodes if n.type == "BSDF_PRINCIPLED"), None)
    if not bsdf:
        return mat
    bsdf.inputs["Base Color"].default_value          = color
    bsdf.inputs["Roughness"].default_value           = roughness
    bsdf.inputs["Metallic"].default_value            = metallic
    bsdf.inputs["Transmission Weight"].default_value = transmission
    bsdf.inputs["Specular IOR Level"].default_value  = spec
    if emit_color:
        bsdf.inputs["Emission Color"].default_value    = emit_color
        bsdf.inputs["Emission Strength"].default_value = emit_str
    return mat

# ── 3. Materials Matching Reference Photo ────────────────────────────────────
# Dark charcoal / black matte PLA with subtle layer sheen
mat_shell = make_mat("Shell_Black_PLA", (0.022, 0.023, 0.025, 1.0), roughness=0.62, spec=0.25)

# Orange keycap matching reference photo
mat_orange = make_mat("Keycap_Orange", (0.86, 0.32, 0.02, 1.0), roughness=0.35, spec=0.45)
# Black keycap alternative
mat_black  = make_mat("Keycap_Black",  (0.020, 0.021, 0.024, 1.0), roughness=0.38, spec=0.35)

# Clear/frosted polycarbonate MX switch upper housing
mat_clear_switch = make_mat("Switch_Clear_PC", (0.85, 0.78, 0.72, 1.0), roughness=0.18, transmission=0.85, spec=0.8)

# Blue stem
mat_stem_blue = make_mat("MX_Blue_Stem", (0.02, 0.28, 0.88, 1.0), roughness=0.25, spec=0.6)

# Dark gunmetal / black steel split ring & carabiner
mat_dark_steel = make_mat("Gunmetal_Steel", (0.04, 0.042, 0.046, 1.0), roughness=0.22, metallic=0.92, spec=0.9)

# Intense cyan LED glow
mat_led = make_mat("Cyan_LED", (0.0, 0.9, 1.0, 1.0), roughness=0.05,
                   emit_color=(0.0, 0.95, 1.0, 1.0), emit_str=120.0)

# Keycap legend (text "PASTE" & WiFi)
mat_legend = make_mat("Keycap_Legend", (0.18, 0.08, 0.01, 1.0), roughness=0.45, spec=0.2)

# Warm distressed desk mat / leather surface
mat_desk = make_mat("Desk_Leather", (0.042, 0.028, 0.018, 1.0), roughness=0.78, spec=0.2)

SCALE = 0.001  # mm to meters

# ── 4. Import STL parts ───────────────────────────────────────────────────────
parts_spec = [
    ("01_upper_shell_octo.stl",    mat_shell,  "none"),
    ("02_bottom_chassis_octo.stl", mat_shell,  "none"),
    ("03_mx_keycap_octo.stl",      mat_orange, "none"),
]

imported = {}
for fname, mat, orient in parts_spec:
    bpy.ops.wm.stl_import(filepath=str(MODEL_DIR / fname))
    obj = bpy.context.selected_objects[0]
    obj.name = fname.replace(".stl", "")
    if orient == "x180":
        obj.data.transform(Matrix.Rotation(math.pi, 4, "X"))
    obj.data.transform(Matrix.Scale(SCALE, 4))
    obj.data.update()
    obj.data.materials.clear()
    obj.data.materials.append(mat)
    imported[obj.name] = obj

# ── 5. MX Switch Inside Recessed Well ─────────────────────────────────────────
# Position: centered at (0.0, 4.5 mm, Z = 13.9 mm)
bpy.ops.mesh.primitive_cube_add(size=1.0, location=(0, 4.5*SCALE, 14.1*SCALE))
sw = bpy.context.object; sw.name = "SW_Housing"
sw.scale = (15.2*SCALE, 15.2*SCALE, 4.0*SCALE)
sw.data.materials.clear(); sw.data.materials.append(mat_clear_switch)

# Blue cross stem inside switch
bpy.ops.mesh.primitive_cube_add(size=1.0, location=(0, 4.5*SCALE, 16.8*SCALE))
st = bpy.context.object; st.name = "SW_Stem"
st.scale = (4.0*SCALE, 4.0*SCALE, 3.2*SCALE)
st.data.materials.clear(); st.data.materials.append(mat_stem_blue)

# Switch latches visible on front/back edges
for sy in (-7.2, 7.2):
    bpy.ops.mesh.primitive_cube_add(size=1.0, location=(0, (4.5 + sy)*SCALE, 14.7*SCALE))
    latch = bpy.context.object; latch.name = f"SW_Latch_{sy}"
    latch.scale = (6.0*SCALE, 1.2*SCALE, 1.5*SCALE)
    latch.data.materials.clear(); latch.data.materials.append(mat_clear_switch)

# ── 6. Keycap Legend ("PASTE" + WiFi arches) ──────────────────────────────────
# Place 3D text right on the scoop of the keycap
# Keycap dish center is around Z = (15.0 + 8.8 - 0.55) = 23.25 mm
legend_z = 23.35 * SCALE
bpy.ops.object.text_add(location=(-3.6*SCALE, 3.0*SCALE, legend_z))
txt = bpy.context.object; txt.name = "Keycap_Text"
txt.data.body = "PASTE"
txt.data.size = 2.0 * SCALE
txt.data.extrude = 0.08 * SCALE
txt.rotation_euler = (0, 0, 0)
txt.data.materials.clear(); txt.data.materials.append(mat_legend)

# WiFi arches symbol above "PASTE"
for idx, (rad, thick) in enumerate([(1.6, 0.28), (2.4, 0.28)]):
    bpy.ops.mesh.primitive_torus_add(
        align='WORLD',
        location=(0.0, 5.8*SCALE, legend_z),
        rotation=(0, 0, 0),
        major_radius=rad*SCALE, minor_radius=(thick/2)*SCALE,
        major_segments=32, minor_segments=8
    )
    wf = bpy.context.object; wf.name = f"WiFi_Arc_{idx}"
    wf.scale = (1.0, 0.6, 0.5)
    wf.data.materials.clear(); wf.data.materials.append(mat_legend)

# Small wifi dot
bpy.ops.mesh.primitive_cylinder_add(
    radius=0.35*SCALE, depth=0.15*SCALE,
    location=(0.0, 5.0*SCALE, legend_z)
)
wdot = bpy.context.object; wdot.name = "WiFi_Dot"
wdot.data.materials.clear(); wdot.data.materials.append(mat_legend)

# ── 7. Front Dual Lightguides & Glow ─────────────────────────────────────────
for lx in (-8.5, 8.5):
    bpy.ops.mesh.primitive_cylinder_add(
        radius=0.95*SCALE, depth=1.8*SCALE,
        location=(lx*SCALE, -23.6*SCALE, 5.2*SCALE)
    )
    led = bpy.context.object; led.name = f"Front_LED_{lx}"
    led.rotation_euler = (math.pi/2, 0, 0)
    led.data.materials.clear(); led.data.materials.append(mat_led)

    # Point light for ambient bounce onto desk
    bpy.ops.object.light_add(type="POINT", location=(lx*SCALE, -25.2*SCALE, 5.2*SCALE))
    pt = bpy.context.object; pt.name = f"LED_Light_{lx}"
    pt.data.energy = 0.016
    pt.data.color = (0.0, 0.92, 1.0)
    pt.data.shadow_soft_size = 0.002

# ── 8. Split Ring & Carabiner Loop ───────────────────────────────────────────
# Slender loop opening: X=24.4 to 34.6, Y=-6.8 to +6.8, Z=2.4 to 9.8 mm
# Split ring: outer dia ~21.6 mm, wire dia 2.0 mm (r=1.0 mm)
ring_x = 35.8 * SCALE
ring_y = -2.0 * SCALE
ring_z = 10.6 * SCALE  # radius is 10.6 mm, so it rests on desk at z=0!

bpy.ops.mesh.primitive_torus_add(
    align='WORLD',
    location=(ring_x, ring_y, ring_z),
    rotation=(math.radians(16), math.radians(-10), math.radians(12)),
    major_radius=10.6*SCALE, minor_radius=1.0*SCALE,
    major_segments=72, minor_segments=20
)
ring = bpy.context.object; ring.name = "Steel_Split_Ring"
ring.data.materials.clear(); ring.data.materials.append(mat_dark_steel)

# EDC Wiregate Carabiner lying flat on desk attached to ring
carabiner_x = 46.5 * SCALE
carabiner_y = -8.5 * SCALE
carabiner_z = 1.4 * SCALE

bpy.ops.mesh.primitive_torus_add(
    align='WORLD',
    location=(carabiner_x, carabiner_y, carabiner_z),
    rotation=(0, 0, math.radians(-25)),
    major_radius=12.0*SCALE, minor_radius=1.3*SCALE,
    major_segments=64, minor_segments=16
)
carabiner = bpy.context.object; carabiner.name = "EDC_Carabiner"
carabiner.scale = (1.5, 0.65, 0.85)
carabiner.data.materials.clear(); carabiner.data.materials.append(mat_dark_steel)

# ── 9. Desk Surface (Warm Industrial Bench / Mat) ────────────────────────────
bpy.ops.mesh.primitive_plane_add(size=2.5, location=(0.02, 0.0, 0.0))
desk = bpy.context.object; desk.name = "Studio_Desk"
desk.data.materials.clear(); desk.data.materials.append(mat_desk)

# ── 10. Studio 3-Point Lighting ──────────────────────────────────────────────
def aim(obj, at):
    obj.rotation_euler = (Vector(at) - obj.location).to_track_quat("-Z", "Y").to_euler()

target_pt = (0.005, -0.003, 0.012)

# Warm Key Light (front-left, prominent warm highlight on facets)
bpy.ops.object.light_add(type="AREA", location=(-0.24, -0.26, 0.32))
kl = bpy.context.object; kl.name = "Key_Light"
kl.data.energy = 4.5
kl.data.size = 0.22
kl.data.color = (1.0, 0.96, 0.91)
aim(kl, target_pt)

# Subtle Fill Light (front-right)
bpy.ops.object.light_add(type="AREA", location=(0.28, -0.12, 0.20))
fl = bpy.context.object; fl.name = "Fill_Light"
fl.data.energy = 1.4
fl.data.size = 0.26
fl.data.color = (0.86, 0.92, 1.0)
aim(fl, target_pt)

# Rim Light (back-top, creates sharp edge highlights on stealth facets)
bpy.ops.object.light_add(type="AREA", location=(0.06, 0.32, 0.26))
rl = bpy.context.object; rl.name = "Rim_Light"
rl.data.energy = 2.8
rl.data.size = 0.12
rl.data.color = (1.0, 0.98, 0.95)
aim(rl, target_pt)

# World background (very dark studio ambiance)
world = bpy.context.scene.world
if world and world.node_tree:
    bg = next((n for n in world.node_tree.nodes if n.type == "BACKGROUND"), None)
    if bg:
        bg.inputs["Color"].default_value    = (0.012, 0.014, 0.018, 1.0)
        bg.inputs["Strength"].default_value = 0.20

# ── 11. Camera Angle Matching Reference Photo ────────────────────────────────
# Elevated angle (~34° elevation, looking towards front-left/front-right)
bpy.ops.object.camera_add(location=(-0.115, -0.210, 0.115))
cam = bpy.context.object; cam.name = "Hero_Camera"
cam.data.lens = 82
# Deep focus so entire product and details are pin-sharp
cam.data.dof.use_dof = True
cam.data.dof.focus_distance = 0.24
cam.data.dof.aperture_fstop = 22.0  # deep DOF, everything sharp
bpy.context.scene.camera = cam
aim(cam, (0.007, -0.003, 0.011))

# ── 12. Cycles Render Settings ───────────────────────────────────────────────
scene = bpy.context.scene
scene.render.engine          = "CYCLES"
scene.cycles.device          = "CPU"
scene.cycles.samples         = 256
scene.cycles.use_denoising   = True
scene.cycles.denoiser        = "OPENIMAGEDENOISE"
scene.view_settings.view_transform = "Filmic"
scene.view_settings.look     = "Medium High Contrast"
scene.view_settings.exposure = 0.40
scene.view_settings.gamma    = 1.02
scene.render.resolution_x    = 1440
scene.render.resolution_y    = 900
scene.render.resolution_percentage = 100
scene.render.image_settings.file_format  = "PNG"
scene.render.image_settings.compression  = 15

# ── 13. Render Both Variations ───────────────────────────────────────────────
def render_and_save(out_filename):
    out_path = OUT_DIR / out_filename
    scene.render.filepath = str(out_path)
    bpy.ops.render.render(write_still=True)
    shutil.copy(str(out_path), str(ARTIFACT_DIR / out_filename))
    print(f"Rendered and copied: {out_filename}")

print("Rendering Orange PASTE Keycap variation...")
render_and_save("stealth_octo_hero_orange.png")

# Switch to Black Keycap
imported["03_mx_keycap_octo"].data.materials[0] = mat_black
# Hide text/wifi for prototype black version or make it white/gray
mat_legend_black = make_mat("Legend_White", (0.85, 0.85, 0.85, 1.0), roughness=0.3, spec=0.5)
txt.data.materials[0] = mat_legend_black

print("Rendering Black Prototype Keycap variation...")
render_and_save("stealth_octo_hero_black.png")

# Save blend scene for inspection
bpy.ops.wm.save_as_mainfile(filepath=str(OUT_DIR / "stealth_octo_assembly.blend"))
print("All renders completed successfully!")
