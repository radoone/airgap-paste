"""Pocket Recess: measured XIAO fixture, flat FPC seat, MX cartridge. Units mm.

Run with Python and requirements.txt installed. All outputs stay in this directory.
The official STEP is an assembly; it omits the tiny LEDs, so their XY locations
come from Seeed's PCB footprints and are recorded separately in the report.
"""
from pathlib import Path
import json, math, shutil
import cadquery as cq
import trimesh

ROOT = Path(__file__).resolve().parent
REF = ROOT / 'reference'
if not (REF / 'XIAO_ESP32S3_Seeed.step').exists():
    REF = ROOT.parent / 'reference'
W, D, H, R = 54.0, 48.0, 26.6, 8.0
FLOOR, WALL, ROOF = 2.4, 2.2, 2.8
MY, PZ, PT = 5.0, 11.8, 13.3
BY, FRONT = -11.5, -24.0
SCREWS = [(-19.0, -5.0), (19.0, -5.0)]
EYE = (-21.0, -16.0)

def box(w,d,h,x=0,y=0,z=0):
    return cq.Workplane('XY').box(w,d,h,centered=(True,True,False)).translate((x,y,z))
def cyl(r,h,x=0,y=0,z=0):
    return cq.Workplane('XY').circle(r).extrude(h).translate((x,y,z))
def rr(w,d,r,h,z=0,x=0,y=0):
    return box(w,d,h,x,y,z).edges('|Z').fillet(r)
def iv(a,b):
    return sum(s.Volume() for s in a.intersect(b).solids().vals())
def bounds(p):
    b=p.val().BoundingBox()
    return [b.xmin,b.xmax,b.ymin,b.ymax,b.zmin,b.zmax]
def mesh(p,path):
    cq.exporters.export(p,str(path),tolerance=.035,angularTolerance=.08)

board=cq.importers.importStep(str(REF/'XIAO_ESP32S3_Seeed.step')).rotate((0,0,0),(1,0,0),90).rotate((0,0,0),(0,0,1),-90)
b=board.val().BoundingBox()
board=board.translate((-(b.xmin+b.xmax)/2,BY-(b.ymin+b.ymax)/2,3-b.zmin))
pcb=board.solids().vals()[-1].BoundingBox()
assert abs(pcb.xlen-17.78)<.01 and abs(pcb.ylen-20.955)<.01

# Crown-down print: roof starts on the bed, internal posts grow from the roof.
outer=rr(W,D,R,H-FLOOR,FLOOR).edges('>Z').chamfer(3.0)
inner=rr(W-2*WALL,D-2*WALL,R-WALL,H-ROOF-FLOOR+.01,FLOOR-.01)
shell=outer.cut(inner)
well=rr(25,25,2.2,H-PT+1,PT,0,MY)
shell=shell.cut(well)
# Wider shallow crown terrace with a soft entry lip and 1.6 mm roof below.
terrace=rr(28.6,28.6,3.8,2.0,H-1.2,0,MY)
transition=cq.Workplane(obj=cq.Solid.makeLoft([
    rr(25,25,2.2,.1,H-3.0,0,MY).faces('<Z').val().outerWire(),
    rr(28.6,28.6,3.8,.1,H-1.2,0,MY).faces('<Z').val().outerWire()],ruled=True))
crown_cut=terrace.union(transition)
shell=shell.cut(crown_cut)
lip_edges=[e for e in shell.edges().vals() if abs(e.Center().z-H)<1e-5
           and abs(e.Center().x)<15 and abs(e.Center().y-MY)<15]
shell=shell.newObject(lip_edges).fillet(.45)
# Recess walls support the switch cartridge. The switch itself fits in a
# separate flat 1.50 mm plate, avoiding slicer rounding of a thick shell floor.
mount=rr(26.6,26.6,2,H-PT-.1,PT+.1,0,MY)
shell=shell.union(mount).cut(well)
shell=shell.cut(crown_cut)
shell=shell.cut(box(16.5,16.5,PT-FLOOR+.1,0,MY,FLOOR-.05))

for x,y in SCREWS:
    post=cyl(3.8,H-ROOF-FLOOR,x,y,FLOOR)
    shell=shell.union(post).union(box(7,4,H-ROOF-FLOOR,x+(2 if x>0 else -2),y,FLOOR))
    shell=shell.cut(cyl(1.7,17,x,y,FLOOR-.1))
    n=5.8/math.sqrt(3)
    pts=[(n*math.cos(math.radians(30+60*i)),n*math.sin(math.radians(30+60*i))) for i in range(6)]
    nut=cq.Workplane('XY').polyline(pts).close().extrude(2.7).translate((x,y,4.4))
    slot=box(7.0,6.8,2.7,x-(3.1 if x>0 else -3.1),y,4.4)
    shell=shell.cut(nut).cut(slot)

# Broad PCB edge stops carry connector insertion and withdrawal loads.
# Stops act on PCB laminate, not on the connector, buttons, shield or U.FL.
for side in (-1,1):
    x=side*7.7
    for y in (-14,-9):
        shell=shell.union(box(1.5,2,H-ROOF-4.45,x,y,4.45))
shell=shell.cut(well)

# End-wall antenna remains entirely flat. Envelope includes drawing tolerance
# and the thick cable attachment. Do not shorten or bend the radiating FPC.
ant=box(37.8,1.8,17.9,0,20.7,3.2)
ant_clear=box(38.2,2.2,18.3,0,20.7,3.0)
shell=shell.cut(ant_clear)

# Integrated closed lanyard hole in front-left corner, away from antenna.
eye=cyl(4.3,H-FLOOR,*EYE,FLOOR).intersect(outer)
shell=shell.union(eye).cut(cyl(2.1,H+1,*EYE,0))
shell=shell.cut(cyl(3.15,1.4,*EYE,H-1.3))

# Real connector envelope 8.94 x 4.20 mm, and front relief for plug moulding.
usb=box(11.5,7,5.2,0,FRONT,2.7).edges('|Y').fillet(1.8)
mouth=box(14.0,1.7,7.0,0,FRONT+.80,1.85).edges('|Y').fillet(2)
shell=shell.cut(usb).cut(mouth)

# LED centres: CHG0 (-5.842,-6.6802), D3 (+5.8928,-6.6802)
# relative to the PCB centre in Seeed PCB source; K1/K2 align within 0.1 mm
# to the mechanical STEP. LED Z envelope conservatively extends to 4.85.
led_y=(pcb.ymin+pcb.ymax)/2-6.6802
leds={
    'charge_left':box(1.1,.7,.6,-5.842,led_y,4.25),
    'status_right':box(1.1,.7,.6,5.8928,led_y,4.25),
}
guides={}
for side,label in [(-1,'left'),(1,'right')]:
    # Three-section solid guide; tapered collection end covers the real LED.
    # At print orientation the front face rests on the bed and taper grows up.
    guide=(cq.Workplane('XZ',origin=(side*9.0,-24.0,6.9)).rect(2.0,2.0)
           .workplane(offset=-5.4).center(side*-2.3,0).rect(2.0,2.0)
           .workplane(offset=-2.3).center(side*-.3,-.35).rect(2.8,2.8).loft(ruled=True))
    channel=(cq.Workplane('XZ',origin=(side*9.0,-24.05,6.9)).rect(2.4,2.4)
             .workplane(offset=-5.45).center(side*-2.3,0).rect(2.4,2.4)
             .workplane(offset=-2.4).center(side*-.3,-.35).rect(3.2,3.2).loft(ruled=True))
    hood=(cq.Workplane('XZ',origin=(side*9.0,-24.0,6.9)).rect(3.8,3.8)
          .workplane(offset=-5.4).center(side*-2.3,0).rect(3.8,3.8)
          .workplane(offset=-2.3).center(side*-.3,-.35).rect(4.4,4.4).loft(ruled=True))
    # Clearance around USB, boot/reset buttons and LED solder joints.
    hood=hood.cut(box(9.55,11,5.8,0,-19.2,2.3))
    hood=hood.cut(box(20,6,5.15,0,-17.5,0))
    shell=shell.union(hood).union(box(1.4,4,H-ROOF-8.5,side*10.2,-21,8.5))
    shell=shell.cut(channel)
    # Open-bottom C channel: install the guide vertically from the open case.
    # The closing base fills the lower front opening with a rigid cradle.
    xy=[(7.8,-24.15),(5.5,-18.6),(4.8,-16.1),(8.0,-16.1),(7.9,-18.6),(10.2,-24.15)]
    xy=[(side*x,y) for x,y in xy]
    slot=cq.Workplane('XY').polyline(xy).close().extrude(4.55).translate((0,0,2.35))
    shell=shell.cut(slot)
    guides['06_lightguide_'+label]=guide
shell=shell.intersect(outer).cut(usb).cut(mouth)

base=rr(W,D,R,FLOOR).edges('<Z').chamfer(.35)
rim=rr(W-2*WALL-.5,D-2*WALL-.5,R-WALL-.25,1.4,FLOOR)
rim=rim.cut(rr(W-2*WALL-2.9,D-2*WALL-2.9,R-WALL-1.45,1.6,FLOOR-.1))
rim=rim.cut(box(23,8,3,0,-22,FLOOR-.1)).cut(ant_clear)
rim=rim.cut(cyl(5.0,3,*EYE,FLOOR-.1))
for x,y in SCREWS:
    rim=rim.cut(cyl(5.3,3,x,y,FLOOR-.1))
    rim=rim.cut(box(8,4.5,3,x+(2 if x>0 else -2),y,FLOOR-.1))
base=base.union(rim).cut(cyl(2.1,FLOOR+1,*EYE,-.1))
for x,y in SCREWS:
    base=base.cut(cyl(1.7,5,x,y,-.1))
    csk=cq.Workplane('XY').circle(3.2).workplane(offset=1.5).circle(1.7).loft().translate((x,y,-.01))
    base=base.cut(csk)
for side in (-1,1):
    base=base.union(box(1.5,.8,1.7,side*7.95,pcb.ymin-.55,FLOOR))
    # Matching tapered front cradle fits entirely within the C-channel mouth.
    xy=[(side*x,y) for x,y in [(7.8,-24.15),(5.5,-18.6),(4.8,-16.1),(8.0,-16.1),(7.9,-18.6),(10.2,-24.15)]]
    seat=cq.Workplane('XY').polyline(xy).close().offset2D(-.15).extrude(3.4).translate((0,0,FLOOR))
    seat=seat.intersect(box(2.3,2.5,3.4,side*8.8,-22.75,FLOOR))
    base=base.union(seat)
    base=base.union(box(1.4,20.5,.6,side*8.15,(pcb.ymin+pcb.ymax)/2,FLOOR))
    for y in (-14.5,-3.5):base=base.union(box(1.2,3,2.5,side*9.7,y,FLOOR))
base=base.union(box(28.6,1.5,2.8,0,2.75,FLOOR))
base=base.cut(box(5,1.2,2.6,0,3.1,2.8))
for side in (-1,1):
    base=base.cut(box(2.2,1.6,3.0,side*13.3,2.6,FLOOR))
    base=base.cut(box(3.8,2.0,1.1,side*13.3,2.6,4.2))
base=base.cut(box(15,10,1.4,0,BY,1.0))
for x in (-11.6,11.6):
    for y in (-5,14.5):base=base.union(box(1.6,2.6,PZ-FLOOR,x,y,FLOOR))

def wedge(face):
    pts=[(2.0,2.4),(.0,2.4),(face,3.0),(face,4.15),(2.0,4.15)]
    # Broad axial wedge bridges from PCB rear toward the captive anvil.
    p=cq.Workplane('YZ').polyline(pts).close().extrude(27).translate((-13.5,0,0))
    for side in (-1,1):
        p=p.union(box(1.8,1.2,1.75,side*13.3,2.6,FLOOR))
    return p
lock=wedge(pcb.ymax+.20)
# Captive shoulders over the wedge's end tabs, outside solder pads.
for side in (-1,1):
    shell=shell.union(box(2.2,1.5,H-ROOF-4.35,side*13.3,2.6,4.35))
shell=shell.cut(well)

plate=rr(26.2,26.2,1.8,1.5,PZ,0,MY).cut(box(14.1,14.1,2,0,MY,PZ-.1))
for x in (-7.7,7.7):plate=plate.cut(box(1.9,2.4,2,x,-9,PZ-.1))
for side in (-1,1):plate=plate.cut(box(2.6,1.9,2,side*13.3,2.6,PZ-.1))

def points(w,d,r):
    out=[]
    for x,y,a in ((w/2-r,d/2-r,0),(-w/2+r,d/2-r,90),(-w/2+r,-d/2+r,180),(w/2-r,-d/2+r,270)):
        for i in range(9):
            t=math.radians(a+i*90/8);out.append((x+r*math.cos(t),y+r*math.sin(t)))
    return out
CAP_BOTTOM=PT+7.0; CAP_TOP=PT+12.3; CAP_CEILING=PT+10.9
# 6.6 mm upper housing plus 4 mm travel and 0.3 mm ceiling clearance.
# A blind cross socket seats the free stem at PT+10.2, independently of
# the higher outer ceiling; the earlier thin loft lacked this clearance.
def profile_wire(w,d,r,z):
    return rr(w,d,r,.1).faces('<Z').val().outerWire().translate((0,MY,z))
cap=cq.Workplane(obj=cq.Solid.makeLoft([profile_wire(20.2,20.2,2,CAP_BOTTOM),
                                      profile_wire(17.2,17.2,1.4,CAP_TOP)],ruled=True))
cap=cap.edges('>Z').fillet(.45)
void=(cq.Workplane('XY').polyline(points(18.4,18.4,1.6)).close()
      .workplane(offset=4.1).polyline(points(16.6,16.6,1.1)).close().loft().translate((0,MY,CAP_BOTTOM-.1)))
cap=cap.cut(void).union(cyl(2.65,CAP_CEILING-CAP_BOTTOM+.1,0,MY,CAP_BOTTOM))
cap=cap.cut(box(4.18,1.32,3.3,0,MY,CAP_BOTTOM-.1).union(box(1.32,4.18,3.3,0,MY,CAP_BOTTOM-.1)))
halo=rr(23.4,23.4,2.4,9.5,PT,0,MY).cut(rr(21.4,21.4,1.7,9.7,PT-.1,0,MY))
halo=halo.edges('>Z').fillet(.35)
bushing=cyl(3.0,1.3,*EYE,H-1.3).cut(cyl(2.1,1.5,*EYE,H-1.4)).edges('>Z').fillet(.15)
# Shallow waist groove preserves at least 1.85 mm of the exterior wall.
groove=rr(W+1,D+1,R+.5,.9,10.6).cut(rr(W-.7,D-.7,R-.35,1.1,10.5))
shell=shell.cut(groove).cut(crown_cut)
wordmark=cq.Workplane('YZ',origin=(-27.01,-2,15.0)).text('AIRGAP PASTE',2.5,.35,
                    font='Arial',halign='center',valign='center',combine=True)
wordmark=wordmark.mirror('XZ',basePointVector=(0,-2,0))
shell=shell.cut(wordmark)

parts={'01_shell':shell,'02_base':base,'03_keycap':cap,'04_halo':halo,'09_eye_bushing':bushing,
       '05_mx_plate':plate,'07_xiao_wedge':lock,**guides}
mx=box(14,14,5,0,MY,PZ-5)
pins=box(14,9,3.8,0,MY+3.25,PZ-8.8).union(cyl(2,3.8,0,MY,PZ-8.8))
upper_mx=(cq.Workplane('XY').rect(15.63,15.63).workplane(offset=.8).rect(15.63,15.63)
          .workplane(offset=5.8).rect(11.8,11.8).loft(ruled=True).translate((0,MY,PT)))
# Centre actuator/socket opening is an approximation: verify actual MX clone.
upper_mx=upper_mx.cut(box(6.0,6.0,7,0,MY,PT-.1))
clearance={}
for a,b in [('01_shell','02_base'),('01_shell','05_mx_plate'),('02_base','05_mx_plate'),('07_xiao_wedge','01_shell'),('07_xiao_wedge','02_base'),('04_halo','01_shell'),('04_halo','05_mx_plate'),('09_eye_bushing','01_shell')]:
    clearance[a+'__'+b]=iv(parts[a],parts[b])
for label,p in [('xiao',board),('antenna',ant),('mx_body',mx),('mx_pins',pins),*leds.items()]:
    for name in ['01_shell','02_base','05_mx_plate','04_halo','09_eye_bushing','07_xiao_wedge',*guides]:
        clearance[label+'__'+name]=iv(p,parts[name])
for name in ['01_shell','02_base','05_mx_plate','04_halo','07_xiao_wedge']:
    for travel in (0,2,4):clearance[f'cap_travel_{travel}__{name}']=iv(cap.translate((0,0,-travel)),parts[name])
for travel in (0,2,4):clearance[f'cap_travel_{travel}__mx_upper_housing']=iv(cap.translate((0,0,-travel)),upper_mx)
for name,guide in guides.items():
    clearance[name+'__shell']=iv(guide,shell)
    clearance[name+'__base']=iv(guide,base)
    for drop in (.25,1,3,6,10):
        clearance[f'{name}_vertical_insertion_drop_{drop}__shell']=iv(guide.translate((0,0,-drop)),shell)
# Straight coax keepout on right, from U.FL region to the antenna edge.
coax=box(2,17,2,-16.0,10.7,7.0)
clearance['coax__shell']=iv(coax,shell)
clearance['coax__base']=iv(coax,base)
clearance['coax__plate']=iv(coax,plate)
# M3 x 10 screw shanks and real 5.5 AF nut insertion, excluding intended nuts.
for side in (-1,1):
    x,y=side*19,-5
    screw=cyl(1.5,8.5,x,y,1.5)
    clearance[f'screw_{side}__shell']=iv(screw,shell)
    clearance[f'screw_{side}__base']=iv(screw,base)
    nr=5.5/math.sqrt(3)
    np=[(nr*math.cos(math.radians(30+60*i)),nr*math.sin(math.radians(30+60*i))) for i in range(6)]
    nshape=cq.Workplane('XY').polyline(np).close().extrude(2.4)
    for xpos in [side*(12.5+i*.5) for i in range(14)]:
        nut=nshape.translate((xpos,y,4.55))
        clearance[f'nut_path_{side}_{xpos}__shell']=iv(nut,shell)
        clearance[f'nut_path_{side}_{xpos}__xiao']=iv(nut,board)

report={'name':'AirGap Paste Pocket Recess v3 Beveled Crown','units':'mm','envelope_mm':[W,D,H],
        'crown':{'outer_chamfer_mm':3.0,'outer_chamfer_angle_degrees':45,'terrace_drop_mm':1.2,'terrace_min_roof_mm':1.6,'terrace_transition_angle_degrees':45,'orange_bezel_top_mm':22.8,'waist_groove_depth_mm':.35},
        'keycap_top_mm':CAP_TOP,'keycap_recess_mm':H-CAP_TOP,'mx_plate_mm':1.5,'mx_travel_mm':4,
        'mx_upper_housing_model':'Manufacturer dimensional envelope, 6.6 mm above plate, central 6 mm aperture approximate; actual clone and stem fit need coupon',
        'pressed_housing_ceiling_clearance_mm':.3,
        'pcb_bounds_mm':bounds(cq.Workplane(obj=board.solids().vals()[-1])),
        'usb_face_recess_mm':board.val().BoundingBox().ymin-FRONT,
        'pcb_fixture_clearance_mm':{'each_side':.21,'top':.20,'rear_nominal_wedge':.20,'front':.15},
        'antenna_envelope_mm':[37.8,1.8,17.9],'antenna':'Flat rear XZ seat, Seeed A-02 FPC, no fold',
        'led_xy_mm':{'charge_left':[-5.842,led_y],'status_right':[5.8928,led_y]},
        'led_source':'Seeed official KiCad CHG0 and D3; STEP omits LEDs; optical efficiency and PCB revision require physical verification',
        'hardware':'2x M3x10 countersunk, 2x M3 DIN934 nuts; bare XIAO ESP32-S3, 3-pin MX',
        'checks_mm3':clearance,'parts':{},'physical_validation':'Not performed'}
for name,p in parts.items():
    assert p.val().isValid(),name
    assert len(p.solids().vals())==1,(name,len(p.solids().vals()))
    cq.exporters.export(p,str(ROOT/(name+'.step')))
    mesh(p,ROOT/(name+'_assembly.stl'))
    q=p
    if name in ('01_shell','03_keycap'):q=p.rotate((0,0,0),(1,0,0),180)
    elif 'lightguide' in name:q=p.rotate((0,0,0),(1,0,0),90)
    # Wedge is laid on its broad side; long width remains horizontal.
    elif name=='07_xiao_wedge':q=p.rotate((0,0,0),(1,0,0),90)
    bb=q.val().BoundingBox();q=q.translate((-(bb.xmin+bb.xmax)/2,-(bb.ymin+bb.ymax)/2,-bb.zmin))
    mesh(q,ROOT/(name+'.stl'))
    m=trimesh.load(ROOT/(name+'.stl'),force='mesh')
    report['parts'][name]={'valid':True,'cad_solids':1,'watertight':bool(m.is_watertight),'mesh_components':len(m.split()),'print_bounds_mm':m.extents.tolist(),'volume_mm3':p.val().Volume()}
    assert m.is_watertight and len(m.split())==1,name
for size in (14.0,14.1,14.2):
    test=rr(24,24,1,1.5).cut(box(size,size,2,z=-.1))
    mesh(test,ROOT/(f'08_mx_coupon_{size:.1f}'.replace('.','p')+'.stl'))
for label,face in [('looser',pcb.ymax+.3),('tighter',pcb.ymax+.1)]:
    q=wedge(face);bb=q.val().BoundingBox();q=q.rotate((0,0,0),(1,0,0),90);bb=q.val().BoundingBox();q=q.translate((0,-(bb.ymin+bb.ymax)/2,-bb.zmin))
    mesh(q,ROOT/('07_wedge_'+label+'.stl'))
asm=cq.Assembly(name='AirGap_Paste_Pocket_Recess')
for name,p in parts.items():asm.add(p,name=name,color=cq.Color(.9,.26,.04) if name in ('03_keycap','04_halo','05_mx_plate','09_eye_bushing') else cq.Color(.08,.10,.12))
asm.save(str(ROOT/'pocket_recess_assembly.step'))
asm.add(board,name='XIAO_official_reference',color=cq.Color(.15,.5,.2))
asm.add(ant,name='Flat_FPC_antenna_envelope',color=cq.Color(.25,.3,.2,.5))
asm.add(mx.union(pins).union(upper_mx),name='MX_dimensional_envelope',color=cq.Color(.4,.4,.4,.6))
asm.save(str(ROOT/'pocket_recess_with_electronics.step'))
mesh(board,ROOT/'reference/XIAO_position.stl')
mesh(ant,ROOT/'reference/antenna_envelope.stl')
mesh(mx.union(pins).union(upper_mx),ROOT/'reference/MX_envelope.stl')
for name,p in leds.items():mesh(p,ROOT/('reference/LED_'+name+'.stl'))
(ROOT/'validation.json').write_text(json.dumps(report,indent=2)+'\n')
bad={k:v for k,v in clearance.items() if v>.01}
print(json.dumps({'envelope':report['envelope_mm'],'parts':report['parts'],'collisions_above_0p01_mm3':bad},indent=2))
if bad:raise RuntimeError('Resolve interference before slicing: '+str(bad))
