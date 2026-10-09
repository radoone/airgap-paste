"""Render the actual Orbit Puck CAD meshes in Blender."""
from pathlib import Path
import math,bpy
from mathutils import Matrix,Vector
ROOT=Path(__file__).resolve().parent
bpy.ops.object.select_all(action='SELECT'); bpy.ops.object.delete(use_global=False)
def mat(name,c,rough=.5,metal=0,emission=0):
    m=bpy.data.materials.new(name); m.use_nodes=True
    n=next(n for n in m.node_tree.nodes if n.type=='BSDF_PRINCIPLED'); n.inputs['Base Color'].default_value=(*c,1); n.inputs['Roughness'].default_value=rough; n.inputs['Metallic'].default_value=metal
    if emission: n.inputs['Emission Color'].default_value=(*c,1); n.inputs['Emission Strength'].default_value=emission
    return m
black=mat('Graphite matte polymer',(.012,.018,.026),.52)
orange=mat('Signal orange polymer',(.9,.19,.018),.34)
cyan=mat('Illustrative cyan indicator',(0,.75,1),.25,emission=7)
clear=mat('Illustrative switch housing',(.20,.27,.31),.28)
for p in sorted(ROOT.glob('*_assembly.stl')):
    bpy.ops.wm.stl_import(filepath=str(p)); o=bpy.context.selected_objects[0]; o.name=p.stem
    o.data.transform(Matrix.Scale(.001,4)); o.data.update()
    o.data.materials.append(orange if any(t in p.name for t in ('keycap','halo','belt','snap_plate')) else cyan if 'lightguide' in p.name else black)
# Show the official XIAO reference so the real USB connector is visible.
metal=mat('XIAO connector reference',(.25,.29,.33),.32,metal=.7)
bpy.ops.wm.stl_import(filepath=str(ROOT/'XIAO_reference.stl'))
o=bpy.context.selected_objects[0];o.name='XIAO official reference';o.data.transform(Matrix.Scale(.001,4));o.data.update();o.data.materials.append(metal)
# Approximate translucent MX flange, for visualization only.
bpy.ops.mesh.primitive_cube_add(size=1,location=(0,.004,.0164))
o=bpy.context.object;o.name='MX visual housing only';o.scale=(.0156,.0156,.003);o.data.materials.append(clear)
bevel=o.modifiers.new('Housing edge','BEVEL');bevel.width=.0003;bevel.segments=2
floor=mat('Studio slate',(.027,.038,.054),.78)
bpy.ops.mesh.primitive_plane_add(size=200,location=(0,0,-.00025));bpy.context.object.data.materials.append(floor)
def aim(o,pt):o.rotation_euler=(Vector(pt)-o.location).to_track_quat('-Z','Y').to_euler()
for name,loc,power,size,color in [('Key',(-.06,-.045,.12),.15,.075,(1,.86,.73)),('Fill',(.09,-.02,.055),.09,.06,(.63,.82,1)),('Rim',(0,.085,.09),.18,.055,(.7,.85,1))]:
    bpy.ops.object.light_add(type='AREA',location=loc);o=bpy.context.object;o.name=name;o.data.energy=power;o.data.shape='DISK';o.data.size=size;o.data.color=color;aim(o,(0,0,.012))
bpy.ops.object.camera_add(location=(.076,-.108,.103));cam=bpy.context.object;cam.data.lens=65;aim(cam,(0,0,.011));bpy.context.scene.camera=cam
scene=bpy.context.scene;scene.render.engine='CYCLES';scene.cycles.samples=80;scene.cycles.use_denoising=True
scene.world.color=(.15,.15,.15);scene.render.resolution_x=1400;scene.render.resolution_y=1000;scene.render.resolution_percentage=100
scene.view_settings.view_transform='AgX';scene.render.image_settings.file_format='PNG'
scene.render.filepath=str(ROOT/'orbit_hero.png');bpy.ops.render.render(write_still=True)
bpy.ops.wm.save_as_mainfile(filepath=str(ROOT/'orbit_assembly.blend'))
cam.location=(.0001,-.025,.14);cam.data.lens=65;aim(cam,(0,0,.010))
scene.render.filepath=str(ROOT/'orbit_top.png');bpy.ops.render.render(write_still=True)
