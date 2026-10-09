"""Blender render and independent mesh inspection of actual exported CAD."""
from pathlib import Path
import bpy,bmesh,json,math
from mathutils import Matrix,Vector
ROOT=Path(__file__).resolve().parent
bpy.ops.object.select_all(action='SELECT');bpy.ops.object.delete(use_global=False)
scene=bpy.context.scene
scene.render.use_file_extension=True
bpy.context.preferences.filepaths.save_version=0
scene.unit_settings.system='METRIC';scene.unit_settings.length_unit='MILLIMETERS'
scene.unit_settings.scale_length=1
def mat(name,col,rough=.5,metal=0,trans=0):
    m=bpy.data.materials.new(name);m.use_nodes=True
    n=next((node for node in m.node_tree.nodes if node.type=='BSDF_PRINCIPLED'),None)
    if n is None:
        n=m.node_tree.nodes.new('ShaderNodeBsdfPrincipled')
        output=next((node for node in m.node_tree.nodes if node.type=='OUTPUT_MATERIAL'),None)
        if output is None:output=m.node_tree.nodes.new('ShaderNodeOutputMaterial')
        m.node_tree.links.new(n.outputs['BSDF'],output.inputs['Surface'])
    n.inputs['Base Color'].default_value=(*col,1)
    n.inputs['Roughness'].default_value=rough;n.inputs['Metallic'].default_value=metal
    n.inputs['Transmission Weight'].default_value=trans
    return m
graphite=mat('Matte graphite PLA',(.018,.022,.026),.56)
orange=mat('Signal orange PLA',(.8,.115,.012),.54)
clear=mat('Unlit translucent lightguides',(.66,.74,.76),.22,trans=.5)
metal=mat('Official board connector reference',(.28,.32,.35),.28,metal=.65)
green=mat('FPC antenna dimensional reference',(.12,.23,.11),.58)
mxmat=mat('MX dimensional reference',(.18,.19,.20),.6)
red=mat('Charge LED position, not simulated light',(.5,.04,.03),.5)
yellow=mat('User LED position, not simulated light',(.9,.5,.02),.5)
def load(path,name,material):
    bpy.ops.wm.stl_import(filepath=str(path));o=bpy.context.selected_objects[0];o.name=name
    o.data.transform(Matrix.Scale(.001,4));o.data.update();o.data.materials.append(material)
    bpy.context.view_layer.update()
    return o
parts={};report={}
for p in sorted(ROOT.glob('*_assembly.stl')):
    name=p.stem.removesuffix('_assembly')
    o=load(p,name,orange if name in ('03_keycap','04_halo','05_mx_plate','09_eye_bushing') else clear if 'lightguide' in name else graphite)
    parts[name]=o
    o.data.set_sharp_from_angle(angle=math.radians(35))
    for face in o.data.polygons:face.use_smooth=True
    mod=o.modifiers.new('Weighted CAD normals','WEIGHTED_NORMAL');mod.keep_sharp=True
    bm=bmesh.new();bm.from_mesh(o.data)
    report[name]={'vertices':len(bm.verts),'faces':len(bm.faces),'nonmanifold_edges':sum(not e.is_manifold for e in bm.edges),
                  'dimensions_mm':[round(v*1000,5) for v in o.dimensions]}
    bm.free()
    assert report[name]['nonmanifold_edges']==0,name
board=load(ROOT/'reference/XIAO_position.stl','XIAO official STEP reference',metal)
ant=load(ROOT/'reference/antenna_envelope.stl','Flat FPC envelope',green)
switch=load(ROOT/'reference/MX_envelope.stl','MX dimensional envelope',mxmat)
for name,material in [('charge_left',red),('status_right',yellow)]:
    load(ROOT/('reference/LED_'+name+'.stl'),'PCB LED position '+name,material)
(ROOT/'blender_mesh_validation.json').write_text(json.dumps(report,indent=2)+'\n')
floor=mat('Warm studio surface',(.18,.17,.15),.82)
bpy.ops.mesh.primitive_plane_add(size=2,location=(0,0,-.0003));ground=bpy.context.object;ground.name='Studio floor';ground.data.materials.append(floor)
def aim(o,p):o.rotation_euler=(Vector(p)-o.location).to_track_quat('-Z','Y').to_euler()
for name,loc,power,size,color in [
    ('Key',(-.075,-.085,.14),.32,.095,(1,.91,.82)),
    ('Fill',(.09,-.045,.075),.14,.075,(.81,.91,1)),
    ('Rim',(.0,.09,.11),.25,.065,(1,.87,.69))]:
    bpy.ops.object.light_add(type='AREA',location=loc);o=bpy.context.object;o.name=name;o.data.energy=power;o.data.shape='DISK';o.data.size=size;o.data.color=color;aim(o,(0,0,.013))
bpy.ops.object.camera_add(location=(-.088,-.125,.107));cam=bpy.context.object;cam.name='Assembly camera';cam.data.lens=65;aim(cam,(0,0,.012));scene.camera=cam
scene.render.engine='CYCLES';scene.cycles.samples=64;scene.cycles.use_denoising=True
scene.world.color=(.22,.22,.22);scene.view_settings.view_transform='AgX'
scene.render.resolution_x=1440;scene.render.resolution_y=1040;scene.render.resolution_percentage=100
scene.render.image_settings.file_format='PNG';scene.render.filepath=str(ROOT/'pocket_recess_hero.png')
bpy.ops.render.render(write_still=True)
bpy.ops.wm.save_as_mainfile(filepath=str(ROOT/'pocket_recess_assembly.blend'))
cam.location=(.0001,-.032,.145);cam.data.lens=65;aim(cam,(0,0,.012))
scene.render.filepath=str(ROOT/'pocket_recess_top.png');bpy.ops.render.render(write_still=True)
# Inspection view: reveal the real board, fixture and guide collecting ends.
parts['01_shell'].hide_render=True;parts['03_keycap'].hide_render=True;parts['04_halo'].hide_render=True
parts['05_mx_plate'].hide_render=True;switch.hide_render=True
cam.location=(.072,-.105,.115);cam.data.lens=60;aim(cam,(0,-.003,.008))
scene.render.filepath=str(ROOT/'xiao_usb_led_inspection.png');bpy.ops.render.render(write_still=True)
print(json.dumps({'blend':'pocket_recess_assembly.blend','mesh_validation':report}),flush=True)
