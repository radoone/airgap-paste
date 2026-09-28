"""Closed carry-state studio render from the verified Flip Vault scene."""
from pathlib import Path
import bpy
from mathutils import Matrix, Vector
ROOT = Path('/Users/radoone/Documents/airgap paste/hardware/enclosure-flip-vault')
bpy.ops.wm.open_mainfile(filepath=str(ROOT / 'flip_vault_assembly.blend'))
old = bpy.data.objects.get('06_flip_shield_vault_open_preview')
if old:
    bpy.data.objects.remove(old, do_unlink=True)
bpy.ops.wm.stl_import(filepath=str(ROOT / '06_flip_shield_vault.stl'))
obj = bpy.context.selected_objects[0]
obj.name = '06_flip_shield_vault_closed'
obj.data.transform(Matrix.Scale(0.001, 4))
obj.data.update()
obj.data.materials.clear()
obj.data.materials.append(bpy.data.materials['Shell_Black_PLA'])
cam = bpy.data.objects['Hero_Camera']
cam.location = (-0.115, -0.205, 0.115)
cam.data.lens = 82
cam.rotation_euler = (Vector((0.007, -0.003, 0.013)) - cam.location).to_track_quat('-Z', 'Y').to_euler()
scene = bpy.context.scene
scene.render.filepath = str(ROOT / 'flip_vault_closed_preview.png')
bpy.ops.render.render(write_still=True)
