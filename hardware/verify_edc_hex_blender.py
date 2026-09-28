"""Import the EDC Pocket Vault and Hex Node into Blender for mesh QA."""
from pathlib import Path
import json
import math
import bpy
import bmesh
from mathutils import Matrix, Vector

ROOT = Path(__file__).resolve().parent
OUT = ROOT / "blender-verification"
OUT.mkdir(exist_ok=True)
MODELS = {
    "EDC Pocket Vault": {
        "folder": ROOT / "enclosure-edc-pocket-vault",
        "parts": [("01_upper_shell_edc.stl", "black", "x180"), ("02_bottom_chassis_edc.stl", "dark", "none"), ("03_mx_keycap_translucent.stl", "orange", "x180"), ("04_lightguide_translucent.stl", "light", "yneg90"), ("06_guard_left.stl", "black", "x180"), ("07_guard_right.stl", "black", "x180"), ("08_paracord_cord_bead.stl", "dark", "bead")],
        "render": "edc_pocket_vault_blender_check.png",
    },
    "Hex Node": {
        "folder": ROOT / "enclosure-hex-node",
        "parts": [("01_upper_shell_hex.stl", "black", "x180"), ("02_bottom_chassis_hex.stl", "dark", "none"), ("03_mx_keycap_hex.stl", "orange", "x180"), ("04_lightguide_hex.stl", "light", "yneg90")],
        "render": "hex_node_blender_check.png",
    },
}
COLOURS = {"black": (0.09, 0.10, 0.12, 1), "dark": (0.15, 0.16, 0.18, 1), "orange": (1.0, 0.35, 0.06, 1), "light": (0.7, 0.9, 1.0, 1)}

for obj in list(bpy.data.objects): bpy.data.objects.remove(obj, do_unlink=True)
def mat(name):
    value = bpy.data.materials.new(name)
    value.diffuse_color = COLOURS[name]
    value.metallic = 0.1 if name in {"black", "dark"} else 0.0
    value.roughness = 0.4
    return value
mats = {name: mat(name) for name in COLOURS}
def correct(obj, mode):
    if mode == "x180": obj.data.transform(Matrix.Rotation(math.pi, 4, "X"))
    if mode == "yneg90": obj.data.transform(Matrix.Rotation(-math.pi / 2, 4, "Y"))
    if mode == "bead": obj.location = (48.0, 0.0, 7.0)
    obj.data.update()
def analyse(obj):
    mesh = bmesh.new(); mesh.from_mesh(obj.data)
    open_edges = sum(1 for edge in mesh.edges if not edge.is_manifold); mesh.free()
    points = [obj.matrix_world @ vertex.co for vertex in obj.data.vertices]
    low = [min(point[i] for point in points) for i in range(3)]
    high = [max(point[i] for point in points) for i in range(3)]
    return {"vertices": len(obj.data.vertices), "faces": len(obj.data.polygons), "non_manifold_edges": open_edges, "bbox_mm": [round(high[i]-low[i],3) for i in range(3)]}
def point_at(obj, target): obj.rotation_euler = (Vector(target)-obj.location).to_track_quat("-Z", "Y").to_euler()

scene = bpy.context.scene
collections, report = {}, {}
for label, model in MODELS.items():
    collection = bpy.data.collections.new(label); scene.collection.children.link(collection); collections[label] = collection
    report[label] = {"parts": {}}
    for filename, colour, orientation in model["parts"]:
        bpy.ops.wm.stl_import(filepath=str(model["folder"] / filename))
        obj = bpy.context.selected_objects[0]
        for original in list(obj.users_collection): original.objects.unlink(obj)
        collection.objects.link(obj); obj.name = filename.removesuffix(".stl")
        correct(obj, orientation); obj.data.materials.append(mats[colour])
        report[label]["parts"][obj.name] = analyse(obj)

bpy.ops.mesh.primitive_plane_add(size=300, location=(8, 0, 0)); floor = bpy.context.object; floor.data.materials.append(mats["dark"])
bpy.ops.object.camera_add(location=(138, -173, 120)); camera = bpy.context.object; camera.data.lens = 77; scene.camera = camera; point_at(camera, (12, 0, 14))
for location, energy, size in [((35,-45,95),900,45),((-60,-25,55),450,35),((40,60,65),550,25)]:
    bpy.ops.object.light_add(type="AREA", location=location); light = bpy.context.object; light.data.energy = energy; light.data.shape = "DISK"; light.data.size = size; point_at(light, (8,0,10))
# Workbench is intentionally used for the proof images: it makes the imported
# printable solids and separate parts legible independent of decorative lights.
scene.render.engine = "BLENDER_WORKBENCH"; scene.display.shading.light = "STUDIO"; scene.display.shading.color_type = "MATERIAL"; scene.render.resolution_x = 1000; scene.render.resolution_y = 700; scene.render.resolution_percentage = 100; scene.render.image_settings.file_format = "PNG"; scene.world.color = (0.012,0.015,0.02)
for label, collection in collections.items():
    for other_label, other in collections.items(): other.hide_render = other_label != label
    scene.render.filepath = str(OUT / MODELS[label]["render"]); bpy.ops.render.render(write_still=True)
bpy.ops.wm.save_as_mainfile(filepath=str(OUT / "edc_and_hex_blender_verification.blend"))
(OUT / "blender_mesh_check.json").write_text(json.dumps(report, indent=2)+"\n")
print(json.dumps(report, indent=2))
