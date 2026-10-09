"""Underside view of the actual assembled Orbit Puck meshes."""
from pathlib import Path
import bpy
from mathutils import Vector
ROOT=Path(__file__).resolve().parent
bpy.ops.wm.open_mainfile(filepath=str(ROOT/'orbit_assembly.blend'))
# Remove studio floor so the camera can look up at the assembled underside.
for obj in list(bpy.data.objects):
    if obj.type=='MESH' and max(obj.dimensions)>1: bpy.data.objects.remove(obj,do_unlink=True)
# Illustrative DIN 963 M3 countersunk heads in their CAD hole positions.
metal=bpy.data.materials.get('XIAO connector reference')
for x in (-.0182,.0182):
    bpy.ops.mesh.primitive_cone_add(vertices=64,radius1=.003,radius2=.0015,depth=.0015,location=(x,-.002,.00075))
    head=bpy.context.object;head.name='M3 countersunk screw head illustration'
    head.data.materials.append(metal)
    bpy.ops.mesh.primitive_cube_add(size=1,location=(x,-.002,.0001))
    slot=bpy.context.object;slot.scale=(.0045,.00065,.0004)
    bpy.context.view_layer.objects.active=slot;bpy.ops.object.transform_apply(location=False,rotation=False,scale=True)
    modifier=head.modifiers.new('Straight driver slot','BOOLEAN');modifier.operation='DIFFERENCE';modifier.object=slot
    bpy.context.view_layer.objects.active=head;bpy.ops.object.modifier_apply(modifier=modifier.name)
    bpy.data.objects.remove(slot,do_unlink=True)
cam=bpy.context.scene.camera
cam.location=(.044,-.065,-.105)
cam.rotation_euler=(Vector((0,0,.004))-cam.location).to_track_quat('-Z','Y').to_euler()
cam.data.lens=62
for name,loc in [('Key',(-.06,-.04,-.10)),('Fill',(.075,-.01,-.065)),('Rim',(0,.07,-.06))]:
    o=bpy.data.objects.get(name)
    if o:
        o.location=loc
        o.rotation_euler=(Vector((0,0,.004))-o.location).to_track_quat('-Z','Y').to_euler()
scene=bpy.context.scene
scene.world.use_nodes=True
bg=next(n for n in scene.world.node_tree.nodes if n.type=='BACKGROUND')
bg.inputs['Color'].default_value=(.045,.065,.09,1)
bg.inputs['Strength'].default_value=.5
scene.render.filepath=str(ROOT/'orbit_bottom.png')
bpy.ops.render.render(write_still=True)
