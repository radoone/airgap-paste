from pathlib import Path
import bpy
from mathutils import Vector
ROOT=Path(__file__).resolve().parent
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
bpy.ops.wm.stl_import(filepath=str(ROOT/'Head_Cherry_MX_standard_1p30_no_builtin_support.stl'))
head=bpy.context.object;head.name='Cherry MX duck head'
mat=bpy.data.materials.new('Duck yellow');mat.diffuse_color=(1,.63,.035,1);mat.use_nodes=True
mat.node_tree.nodes.clear()
bs=mat.node_tree.nodes.new('ShaderNodeBsdfPrincipled');bs.inputs['Base Color'].default_value=(1,.63,.035,1);bs.inputs['Roughness'].default_value=.36
out=mat.node_tree.nodes.new('ShaderNodeOutputMaterial');mat.node_tree.links.new(bs.outputs['BSDF'],out.inputs['Surface'])
head.data.materials.append(mat)
for p in head.data.polygons:p.use_smooth=max(abs(p.normal.x),abs(p.normal.y),abs(p.normal.z))<.999
bpy.ops.object.camera_add(location=(58,-85,-60));camera=bpy.context.object
camera.data.type='ORTHO';camera.data.ortho_scale=69
def aim(o,target):o.rotation_euler=(Vector(target)-o.location).to_track_quat('-Z','Y').to_euler()
aim(camera,(0,-1,8));bpy.context.scene.camera=camera
for name,loc,energy,size in [('Key',(-35,-50,-40),110000,55),('Fill',(50,0,-20),85000,45),('Rim',(-30,45,45),125000,45)]:
    bpy.ops.object.light_add(type='AREA',location=loc);l=bpy.context.object;l.name=name;l.data.energy=energy;l.data.shape='DISK';l.data.size=size;aim(l,(0,0,8))
scene=bpy.context.scene;scene.render.engine='CYCLES';scene.cycles.samples=48
scene.world.color=(.16,.16,.16)
scene.render.resolution_x=1200;scene.render.resolution_y=1000;scene.render.resolution_percentage=100
scene.view_settings.view_transform='AgX'
scene.render.image_settings.file_format='PNG'
scene.render.filepath=str(ROOT/'head_underside.png');bpy.ops.render.render(write_still=True)
camera.location=(13,-14,-28);camera.data.ortho_scale=19;aim(camera,(0,4.1354,6))
scene.render.filepath=str(ROOT/'socket_closeup.png');bpy.ops.render.render(write_still=True)
bpy.ops.wm.save_as_mainfile(filepath=str(ROOT/'Duck_Cherry_MX_preview.blend'))
