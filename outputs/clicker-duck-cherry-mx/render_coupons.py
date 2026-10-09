from pathlib import Path
import bpy
from mathutils import Vector
r=Path(__file__).resolve().parent
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
mat=bpy.data.materials.new('yellow');mat.use_nodes=True;mat.node_tree.nodes.clear()
bs=mat.node_tree.nodes.new('ShaderNodeBsdfPrincipled');bs.inputs['Base Color'].default_value=(1,.63,.035,1);bs.inputs['Roughness'].default_value=.4
out=mat.node_tree.nodes.new('ShaderNodeOutputMaterial');mat.node_tree.links.new(bs.outputs['BSDF'],out.inputs['Surface'])
for i,tag in enumerate(['tight_1p25','standard_1p30','loose_1p35']):
 bpy.ops.wm.stl_import(filepath=str(r/f'Fit_coupon_{tag}.stl'));o=bpy.context.object;o.location=(-15+i*15,4.1354123,0);o.data.materials.append(mat)
def aim(o,p):o.rotation_euler=(Vector(p)-o.location).to_track_quat('-Z','Y').to_euler()
bpy.ops.object.camera_add(location=(15,-40,48));camera=bpy.context.object;camera.data.type='ORTHO';camera.data.ortho_scale=52;aim(camera,(0,0,3));bpy.context.scene.camera=camera
for loc,en in [((-20,-25,40),65000),((25,20,30),45000)]:
 bpy.ops.object.light_add(type='AREA',location=loc);o=bpy.context.object;o.data.energy=en;o.data.size=35;aim(o,(0,0,3))
s=bpy.context.scene;s.render.engine='CYCLES';s.cycles.samples=32;s.world.color=(.18,.18,.18)
s.render.resolution_x=1200;s.render.resolution_y=700;s.render.resolution_percentage=100;s.render.image_settings.file_format='PNG';s.render.filepath=str(r/'fit_coupons_preview.png');bpy.ops.render.render(write_still=True)
