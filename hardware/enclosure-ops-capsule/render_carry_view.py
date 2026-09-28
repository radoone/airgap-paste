"""Render the rear loop and guarded keycap from the saved Blender scene."""

from pathlib import Path
import bpy
from mathutils import Vector

root = Path(__file__).resolve().parent
scene = bpy.context.scene
carabiner = bpy.data.objects.get("EDC_Carabiner")
if carabiner:
    carabiner.hide_render = True
camera = scene.camera
camera.location = (0.105, 0.175, 0.145)
target = Vector((0.0, 0.008, 0.011))
camera.rotation_euler = (target - camera.location).to_track_quat("-Z", "Y").to_euler()
scene.cycles.samples = 64
scene.render.filepath = str(root / "ops_capsule_carry_preview.png")
bpy.ops.render.render(write_still=True)
