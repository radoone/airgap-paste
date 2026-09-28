"""Blender inspection view of the printed lower fixture and XIAO STEP reference."""

from pathlib import Path
import bpy
from mathutils import Matrix, Vector

ROOT = Path(__file__).resolve().parent
for obj in list(bpy.data.objects):
    bpy.data.objects.remove(obj, do_unlink=True)

def material(name, rgba, metallic=0.0, roughness=0.6):
    mat = bpy.data.materials.new(name)
    mat.diffuse_color = rgba
    mat.use_nodes = True
    node = next(n for n in mat.node_tree.nodes if n.type == "BSDF_PRINCIPLED")
    node.inputs["Base Color"].default_value = rgba
    node.inputs["Metallic"].default_value = metallic
    node.inputs["Roughness"].default_value = roughness
    return mat

body_mat = material("Printed black PLA", (0.025, 0.028, 0.033, 1.0))
board_mat = material("Seeed XIAO STEP reference", (0.025, 0.24, 0.09, 1.0), 0.05)
floor_mat = material("Neutral background", (0.12, 0.13, 0.15, 1.0))

for filename, name, mat in (
    ("02_bottom_chassis_octo.stl", "Printed bottom fixture", body_mat),
    ("XIAO_reference_position.stl", "Official XIAO reference", board_mat),
):
    bpy.ops.wm.stl_import(filepath=str(ROOT / filename))
    obj = bpy.context.selected_objects[0]
    obj.name = name
    obj.data.transform(Matrix.Scale(0.001, 4))
    obj.data.materials.clear()
    obj.data.materials.append(mat)

bpy.ops.mesh.primitive_plane_add(size=0.4, location=(0, 0, -0.0001))
bpy.context.object.data.materials.append(floor_mat)

def aim(obj, target):
    obj.rotation_euler = (Vector(target) - obj.location).to_track_quat("-Z", "Y").to_euler()

bpy.ops.object.light_add(type="AREA", location=(-0.08, -0.10, 0.13))
bpy.context.object.data.energy = 1.5
bpy.context.object.data.size = 0.12
aim(bpy.context.object, (0, -0.01, 0))
bpy.ops.object.light_add(type="AREA", location=(0.09, 0.05, 0.13))
bpy.context.object.data.energy = 1.8
bpy.context.object.data.size = 0.1
aim(bpy.context.object, (0, -0.01, 0))

bpy.ops.object.camera_add(location=(-0.072, -0.090, 0.082))
camera = bpy.context.object
camera.data.type = "ORTHO"
camera.data.ortho_scale = 0.085
aim(camera, (0, -0.008, 0.003))
bpy.context.scene.camera = camera

scene = bpy.context.scene
scene.render.engine = "CYCLES"
scene.cycles.samples = 64
scene.cycles.use_denoising = True
scene.render.resolution_x = 1200
scene.render.resolution_y = 900
scene.render.resolution_percentage = 100
scene.render.image_settings.file_format = "PNG"
scene.render.filepath = str(ROOT / "board_fit_inspection.png")
bpy.ops.render.render(write_still=True)
print("Board fit inspection rendered.")
