"""Import Stealth Octo model into Blender, inspect meshes, and render photorealistic preview matching concept image."""

from pathlib import Path
import json, math
import bpy, bmesh
from mathutils import Matrix, Vector

ROOT = Path("/Users/radoone/Documents/airgap paste").resolve()
MODEL_DIR = ROOT / "hardware" / "enclosure-stealth-octo"
OUT_DIR = ROOT / "hardware" / "blender-verification"
OUT_DIR.mkdir(exist_ok=True)

# 1. Clean scene
for obj in list(bpy.data.objects):
    bpy.data.objects.remove(obj, do_unlink=True)
for mat in list(bpy.data.materials):
    bpy.data.materials.remove(mat, do_unlink=True)

# 2. Materials (locale-independent node access)
def create_mat(name, color, roughness=0.45, metallic=0.0, transmission=0.0, emission_color=None, emission_strength=0.0):
    mat = bpy.data.materials.new(name)
    bsdf = next((n for n in mat.node_tree.nodes if n.type == "BSDF_PRINCIPLED"), None)
    if bsdf:
        bsdf.inputs["Base Color"].default_value = color
        bsdf.inputs["Roughness"].default_value = roughness
        bsdf.inputs["Metallic"].default_value = metallic
        bsdf.inputs["Transmission Weight"].default_value = transmission
        if emission_color:
            bsdf.inputs["Emission Color"].default_value = emission_color
            bsdf.inputs["Emission Strength"].default_value = emission_strength
    return mat

# Charcoal / Carbon-fiber PLA body material
mat_shell = create_mat("Mat_Shell", (0.05, 0.055, 0.065, 1.0), roughness=0.55, metallic=0.05)
mat_keycap_black = create_mat("Mat_Keycap_Black", (0.05, 0.05, 0.06, 1.0), roughness=0.42)
mat_keycap_orange = create_mat("Mat_Keycap_Orange", (0.95, 0.32, 0.02, 1.0), roughness=0.35)
mat_switch = create_mat("Mat_Switch_Clear", (0.85, 0.8, 0.75, 1.0), roughness=0.15, transmission=0.92)
mat_metal_ring = create_mat("Mat_Metal_Ring", (0.04, 0.04, 0.04, 1.0), roughness=0.25, metallic=0.92)
mat_led_glow = create_mat("Mat_LED_Glow", (0.0, 0.9, 1.0, 1.0), roughness=0.1, emission_color=(0.0, 0.9, 1.0, 1.0), emission_strength=90.0)

# 3. Import STL parts
parts_spec = [
    ("01_upper_shell_octo.stl", mat_shell, "x180"),
    ("02_bottom_chassis_octo.stl", mat_shell, "none"),
    ("03_mx_keycap_octo.stl", mat_keycap_orange, "x180"),
]

imported_objs = {}
report = {"parts": {}}

for filename, material, orient in parts_spec:
    filepath = str(MODEL_DIR / filename)
    bpy.ops.wm.stl_import(filepath=filepath)
    obj = bpy.context.selected_objects[0]
    obj.name = filename.replace(".stl", "")
    
    if orient == "x180":
        obj.data.transform(Matrix.Rotation(math.pi, 4, "X"))
    obj.data.update()
    
    obj.data.materials.clear()
    obj.data.materials.append(material)
    imported_objs[obj.name] = obj
    
    # Mesh QA
    bm = bmesh.new()
    bm.from_mesh(obj.data)
    non_manifold = sum(1 for e in bm.edges if not e.is_manifold)
    bm.free()
    
    verts = [obj.matrix_world @ v.co for v in obj.data.vertices]
    low = [min(v[i] for v in verts) for i in range(3)]
    high = [max(v[i] for v in verts) for i in range(3)]
    report["parts"][obj.name] = {
        "vertices": len(obj.data.vertices),
        "polygons": len(obj.data.polygons),
        "non_manifold_edges": non_manifold,
        "bbox_mm": [round(high[i] - low[i], 2) for i in range(3)],
    }

# 4. Add MX Switch Visual Representation in the well
# Centered at (MX_X=0.0, MX_Y=4.5), sitting in the plate cutout
bpy.ops.mesh.primitive_cube_add(size=1.0, location=(0.0, 4.5, 16.5))
sw_upper = bpy.context.object
sw_upper.scale = (15.5, 15.5, 4.2)
sw_upper.name = "MX_Switch_Housing"
sw_upper.data.materials.clear()
sw_upper.data.materials.append(mat_switch)

# Add blue stem inside switch
bpy.ops.mesh.primitive_cube_add(size=1.0, location=(0.0, 4.5, 19.5))
stem = bpy.context.object
stem.scale = (4.0, 4.0, 3.5)
stem.name = "MX_Stem_Blue"
mat_stem = create_mat("Mat_Stem_Blue", (0.05, 0.4, 0.95, 1.0), roughness=0.3)
stem.data.materials.clear()
stem.data.materials.append(mat_stem)

# 5. Add Emissive LED emitters in the 2 front lightguide holes
for lx in (-8.5, 8.5):
    bpy.ops.mesh.primitive_cylinder_add(radius=0.95, depth=1.8, location=(lx, -23.5, 5.6))
    led_obj = bpy.context.object
    led_obj.rotation_euler = (math.pi / 2, 0, 0)
    led_obj.name = f"Front_LED_Emitter_{lx}"
    led_obj.data.materials.clear()
    led_obj.data.materials.append(mat_led_glow)
    
    # Point light for realistic cast glow on the table
    bpy.ops.object.light_add(type="POINT", location=(lx, -24.4, 5.6))
    pt = bpy.context.object
    pt.data.energy = 2.0
    pt.data.color = (0.0, 0.85, 1.0)
    pt.data.shadow_soft_size = 0.5

# 6. Add Keyring split ring through the carry loop
bpy.ops.mesh.primitive_torus_add(
    align='WORLD', location=(33.0, 0.0, 11.0),
    rotation=(math.pi / 2, 0.18, 0),
    major_radius=13.0, minor_radius=1.3,
    major_segments=48, minor_segments=16
)
ring = bpy.context.object
ring.name = "Key_Split_Ring"
ring.data.materials.clear()
ring.data.materials.append(mat_metal_ring)

# 7. Desk / Leather Mat Surface
bpy.ops.mesh.primitive_plane_add(size=400, location=(0, 0, 0))
floor = bpy.context.object
mat_desk = create_mat("Mat_Desk", (0.16, 0.11, 0.08, 1.0), roughness=0.65)
floor.data.materials.clear()
floor.data.materials.append(mat_desk)

# 8. Studio Lighting & Camera Matching Reference Angle
def point_at(obj, target):
    obj.rotation_euler = (Vector(target) - obj.location).to_track_quat("-Z", "Y").to_euler()

# Main key light (warm, soft studio light from front-left)
bpy.ops.object.light_add(type="AREA", location=(-50, -85, 70))
key_l = bpy.context.object
key_l.data.energy = 450.0
key_l.data.size = 50.0
key_l.data.color = (1.0, 0.95, 0.90)
point_at(key_l, (5, -5, 12))

# Soft fill light from top-right
bpy.ops.object.light_add(type="AREA", location=(70, -45, 55))
fill_l = bpy.context.object
fill_l.data.energy = 220.0
fill_l.data.size = 60.0
fill_l.data.color = (0.92, 0.95, 1.0)
point_at(fill_l, (5, 0, 10))

# Rim / contour light from behind
bpy.ops.object.light_add(type="AREA", location=(25, 65, 50))
rim_l = bpy.context.object
rim_l.data.energy = 200.0
rim_l.data.size = 40.0
rim_l.data.color = (1.0, 0.98, 0.95)
point_at(rim_l, (0, 0, 12))

# World ambient background
world = bpy.context.scene.world
if world and world.node_tree:
    bg = next((n for n in world.node_tree.nodes if n.type == "BACKGROUND"), None)
    if bg:
        bg.inputs["Color"].default_value = (0.08, 0.09, 0.11, 1.0)
        bg.inputs["Strength"].default_value = 0.8

# Camera setup (framing the full device, USB-C, keycap, and keyring)
bpy.ops.object.camera_add(location=(-52, -120, 62))
cam = bpy.context.object
cam.data.lens = 65
bpy.context.scene.camera = cam
point_at(cam, (6, -4, 11))

# 9. Cycles Configuration
scene = bpy.context.scene
scene.render.engine = "CYCLES"
scene.cycles.device = "CPU"
scene.cycles.samples = 128
scene.cycles.use_denoising = True
scene.view_settings.view_transform = "Filmic"
scene.view_settings.look = "Medium High Contrast"
scene.view_settings.exposure = 0.5
scene.render.resolution_x = 1280
scene.render.resolution_y = 800
scene.render.resolution_percentage = 100
scene.render.image_settings.file_format = "PNG"

# Render Orange Keycap version (concept match)
out_png_orange = OUT_DIR / "stealth_octo_render_orange.png"
scene.render.filepath = str(out_png_orange)
bpy.ops.render.render(write_still=True)

# Also render Black Keycap version (prototype match)
imported_objs["03_mx_keycap_octo"].data.materials[0] = mat_keycap_black
out_png_black = OUT_DIR / "stealth_octo_render_black.png"
scene.render.filepath = str(out_png_black)
bpy.ops.render.render(write_still=True)

# Save .blend file for user
bpy.ops.wm.save_as_mainfile(filepath=str(OUT_DIR / "stealth_octo_assembly.blend"))

report_path = OUT_DIR / "stealth_octo_mesh_report.json"
report_path.write_text(json.dumps(report, indent=2) + "\n")
print("Blender QA and Render completed successfully!")
