"""Orbit Puck: compact circular MX/XIAO enclosure, dimensions in mm."""
from pathlib import Path
import math,json
import cadquery as cq
import trimesh
ROOT=Path(__file__).resolve().parent
REF=ROOT/'reference' if (ROOT/'reference').exists() else ROOT.parent/'reference'
R=23.5; WALL=2.2; FLOOR=2.4; TOP=23.4; FRONT=-21.2
MX_Y=4.0; PLATE_Z=13.4; PLATE_TOP=14.9; BOARD_Y=-9.73
SCREWS=((-18.2,-2.0),(18.2,-2.0))
def box(w,d,h,x=0,y=0,z=0): return cq.Workplane('XY').box(w,d,h,centered=(True,True,False)).translate((x,y,z))
def cy(r,h,x=0,y=0,z=0): return cq.Workplane('XY').circle(r).extrude(h).translate((x,y,z))
def iv(a,b): return sum(s.Volume() for s in a.intersect(b).solids().vals())
def trim(p): return p.cut(box(100,50,100,0,FRONT-25,-1))
def rr(w,d,r,n=6):
    pts=[]
    for x,y,a in ((w/2-r,d/2-r,0),(-w/2+r,d/2-r,90),(-w/2+r,-d/2+r,180),(w/2-r,-d/2+r,270)):
        for i in range(n):
            t=math.radians(a+90*i/(n-1)); pts.append((x+r*math.cos(t),y+r*math.sin(t)))
    return pts
# Slim 45-degree crown. The raised perimeter guards the key in a pocket.
outer=trim(cy(R,TOP-FLOOR,z=FLOOR).edges('>Z').chamfer(2.4))
shell=outer
inner=cy(R-WALL,21.0-FLOOR,z=FLOOR).cut(box(100,50,100,0,-19.4-25,-1))
shell=trim(shell).cut(inner)
# Open-bottom well: its snap plate is a separate flat printed cartridge.
mount=box(26.6,26.6,TOP-(PLATE_TOP+.1),0,MX_Y,PLATE_TOP+.1)
shell=shell.union(mount)
shell=shell.cut(box(24,24,TOP-PLATE_TOP+1,0,MX_Y,PLATE_TOP))
shell=shell.cut(box(14.1,14.1,3,0,MX_Y,PLATE_Z-.1))
# Room for two opposed plastic latch tongues below the plate.
shell=shell.cut(box(16.5,16.5,4.5,0,MX_Y,PLATE_Z-4.5))
# Two captive M3 nuts, accessible from below. Both 10 and 12 mm screws fit.
for x,y in SCREWS:
    post=cy(4.0,12.4,x,y,FLOOR).union(box(5,4,12.4,x+(2 if x>0 else -2),y,FLOOR))
    # When printed crown-down this 45-degree canopy grows each post from
    # the existing crown/wall, rather than beginning with a cantilever.
    canopy=(cq.Workplane('XY').workplane(offset=14.8).center(x,y)
            .circle(4).workplane(offset=6.2).circle(10.2).loft())
    post=post.union(canopy)
    shell=shell.union(post.intersect(trim(cy(R,TOP))))
    shell=shell.cut(cy(1.7,13,x,y,FLOOR-.1))
    rad=5.7/math.sqrt(3)
    pts=[(rad*math.cos(math.radians(30+60*i)),rad*math.sin(math.radians(30+60*i))) for i in range(6)]
    shell=shell.cut(cq.Workplane('XY').polyline(pts).close().extrude(2.6).translate((x,y,4.4)))
    # Slide the nut into a closed-height pocket from the inner cavity.
    shell=shell.cut(box(6.4,6.6,2.6,x-(2.9 if x>0 else -2.9),y,4.4))
# XIAO edge fixture translated 2 mm toward the centre.
for x in (-7.7,7.7):
    for y in (-12,-7): shell=shell.union(box(1.5,2,(TOP if y==-12 else 17.2)-4.45,x,y,4.45))
for x in (-7.8,7.8): shell=shell.union(box(2.4,1.4,1.7,x,-20.15,FLOOR))
for x in (-12.5,12.5): shell=shell.union(box(2,1.4,17.2-4.45,x,2,4.45))
# Restrict canopy to the well perimeter and leave the key travel clear.
shell=shell.cut(box(24,24,TOP-PLATE_TOP+1,0,MX_Y,PLATE_TOP))
usb=box(11,7,4.8,0,FRONT,2.9).edges('|Y').fillet(1.8)
mouth=box(12.6,1.5,6.5,0,FRONT+.65,2.05).edges('|Y').fillet(2)
shell=shell.cut(usb).cut(mouth)
for x in (-8.5,8.5):
    hole=cy(1,6).rotate((0,0,0),(1,0,0),90).translate((x,-18.7,5.2))
    shell=shell.cut(hole)
# Corner clearance for side pads and wires at the USB end.
shell=shell.cut(box(20.8,21.4,5.9,0,-9,2.4))
# Restore fixture after corner clearance; use PCB edges only.
for x in (-7.7,7.7):
    for y in (-12,-7): shell=shell.union(box(1.5,2,(TOP if y==-12 else 17.2)-4.45,x,y,4.45))
for x in (-7.8,7.8): shell=shell.union(box(2.4,1.4,1.7,x,-20.15,FLOOR))
# 45-degree lead-ins on the two rear PCB tabs and wedge keepers.
for x in (-7.7,7.7):
    ramp=(cq.Workplane('YZ').polyline([(-8.5,17.2),(-6,17.2),(-8.5,19.7)])
          .close().extrude(1.5).translate((x-.75,0,0)))
    shell=shell.union(ramp)
for side in (-1,1):
    points=[(side*11.5,17.2),(side*13,17.2),(side*13,18.7)]
    ramp=cq.Workplane('XZ').polyline(points).close().extrude(1.4).translate((0,2.7,0))
    shell=shell.union(ramp)
# Recessed continuous colour belt; shallow grip flutes above it.
groove=trim(cy(R+.2,1.2,z=10.4).cut(cy(R-1.0,1.4,z=10.3)))
shell=shell.cut(groove)
for a in range(0,360,12):
    if 235<a<305: continue
    t=math.radians(a)
    shell=shell.cut(cy(.55,6.4,(R+.30)*math.cos(t),(R+.30)*math.sin(t),12.2))
belt=trim(cy(R-.1,1.0,z=10.5).cut(cy(R-.9,1.2,z=10.4)))
# Two applied half-arcs assemble radially, without stretching brittle PLA.
belt_left=belt.intersect(box(50,100,3,-25.2,0,10))
belt_right=belt.intersect(box(50,100,3,25.2,0,10))
# Full A-02 antenna envelope, curved only along its long dimension.
# 37.8 mm includes drawing tolerance; 1.8 mm includes its solder joint.
a=37.8/20.0/2
angles=[math.pi/2-a+2*a*i/80 for i in range(81)]
pts=[(21.0*math.cos(t),21.0*math.sin(t)) for t in angles]
pts += [(19.2*math.cos(t),19.2*math.sin(t)) for t in reversed(angles)]
ant=cq.Workplane('XY').polyline(pts).close().extrude(17.9).translate((0,0,2.8))
shell=shell.cut(ant).intersect(outer)
# A 0.2 mm edge clearance lets the flat cartridge enter from below. Small
# notches clear the existing board tabs; the shell lands capture it above.
plate=box(26.2,26.2,1.5,0,MX_Y,PLATE_Z)
plate=plate.cut(box(14.1,14.1,2,0,MX_Y,PLATE_Z-.1))
for x in (-7.7,7.7): plate=plate.cut(box(1.9,2.4,2,x,-7,PLATE_Z-.1))
for x in (-12.5,12.5): plate=plate.cut(box(2.4,1.8,2,x,2,PLATE_Z-.1))
clear_pts=[(21.2*math.cos(t),21.2*math.sin(t)) for t in angles]
clear_pts += [(19.0*math.cos(t),19.0*math.sin(t)) for t in reversed(angles)]
ant_clear=cq.Workplane('XY').polyline(clear_pts).close().extrude(18.3).translate((0,0,2.6))
plate=plate.cut(ant_clear).intersect(cy(R-WALL-.2,TOP))
# Smooth interior rear wall is the adhesive antenna seat.
base=trim(cy(R,FLOOR)).edges('<Z').chamfer(.35)
rim=trim(cy(R-WALL-.25,1.4,z=FLOOR).cut(cy(R-WALL-1.45,1.6,z=FLOOR-.1)))
rim=rim.cut(box(22,8,3,0,-19.5,FLOOR-.1))
for x,y in SCREWS: rim=rim.cut(cy(6,2,x,y,FLOOR-.1))
rim=rim.cut(ant)
base=base.union(rim)
for x,y in SCREWS:
    base=base.cut(cy(1.7,5,x,y,-.1))
    cone=cq.Workplane('XY').circle(3.2).workplane(offset=1.5).circle(1.7).loft(combine=False).translate((x,y,-.01))
    base=base.cut(cone)
for side in (-1,1):
    base=base.union(box(1.4,20.5,.6,side*8.15,-8.7,FLOOR))
    for y in (-12.5,-1.5): base=base.union(box(1.2,3,2.5,side*9.7,y,FLOOR))
base=base.union(box(26.6,1.6,2.8,0,3.8,FLOOR))
base=base.cut(box(15,10,1.4,0,BOARD_Y,1))
# Pins face +Y: central pin behind PCB, metal contacts toward rear.
base=base.cut(box(14.5,1.6,1.0,0,3.8,4.4))
# Lower floor gives 0.5 mm clearance to the 3.8 mm centre pin.
base=base.cut(box(14.5,10,.9,0,MX_Y+2.5,1.6))
# Four vertical pillars capture the separate MX plate when the base closes.
for x in (-11.2,11.2):
    for y in (-5,12.5): base=base.union(box(1.6,2.6,PLATE_Z-FLOOR,x,y,FLOOR))
# Board wedge: rear board edge Y=1.511, anvil front Y=3.
def wedge(face):
    pts=[(3,2.4),(1.8,2.4),(face,3),(face,4.15),(3,4.15)]
    p=cq.Workplane('YZ').polyline(pts).close().extrude(26).translate((-13,0,0))
    for side in (-1,1):
        p=p.union(box(1.8,.8,1.75,side*13.1,2.6,FLOOR)).union(box(.8,1.6,1.75,side*14,3.4,FLOOR))
    return p
lock=wedge(1.52)
# Reuse the corrected sculpted keycap geometry, shifted to this switch plane.
bp,tp=rr(18.2,18.2,2),rr(15.2,15.2,1.4)
cap=cq.Workplane('XY').polyline(bp).close().workplane(offset=3.7).polyline(tp).close().loft().translate((0,MX_Y,19.5))
hollow=cq.Workplane('XY').polyline(rr(16.4,16.4,1.6)).close().workplane(offset=2.1).polyline(rr(14.6,14.6,1.1)).close().loft().translate((0,MX_Y,19.4))
cap=cap.cut(hollow).union(cy(2.9,5.7,0,MX_Y,16.0))
cap=cap.cut(box(4.25,1.35,5.8,0,MX_Y,15.9).union(box(1.35,4.25,5.8,0,MX_Y,15.9)))
halo=box(23.4,23.4,.8,0,MX_Y,PLATE_TOP).edges('|Z').fillet(1.4)
halo=halo.cut(box(19.4,19.4,1,0,MX_Y,PLATE_TOP-.1).edges('|Z').fillet(1))
guides={}
for side,x in (('left',-8.5),('right',8.5)):
    guides['06_lightguide_'+side]=cy(.95,1.2).rotate((0,0,0),(1,0,0),90).translate((x,-20.25,5.2))
parts={'01_shell':shell,'02_base':base,'03_keycap':cap,'04_halo':halo,'05_belt_left':belt_left,'05_belt_right':belt_right,'07_xiao_wedge':lock,'09_mx_snap_plate':plate,**guides}
board=cq.importers.importStep(str(REF/'XIAO_ESP32S3_Seeed.step')).rotate((0,0,0),(1,0,0),90).rotate((0,0,0),(0,0,1),-90)
bb=board.val().BoundingBox(); board=board.translate((-(bb.xmin+bb.xmax)/2,BOARD_Y-(bb.ymin+bb.ymax)/2,3-bb.zmin))
mx=box(14,14,5,0,MX_Y,PLATE_Z-5)
pins=box(14,9,3.8,0,MX_Y+3.25,PLATE_Z-8.8).union(cy(2,3.8,0,MX_Y,PLATE_Z-8.8))
checks={'shell_base':iv(shell,base),'board_shell':iv(board,shell),'board_base':iv(board,base),'board_wedge':iv(board,lock),'board_mx_body':iv(board,mx),'board_pin_envelope':iv(board,pins),'mx_base':iv(mx,base),'mx_shell':iv(mx,shell),'pins_base':iv(pins,base),'pins_shell':iv(pins,shell),'antenna_shell':iv(ant,shell),'antenna_base':iv(ant,base),'antenna_mx':iv(ant,mx),'pressed_keycap_shell':iv(cap.translate((0,0,-4)),shell),'pressed_keycap_halo':iv(cap.translate((0,0,-4)),halo),'wedge_shell':iv(lock,shell),'wedge_base':iv(lock,base),'pins_wedge':iv(pins,lock)}
checks.update({'plate_shell':iv(plate,shell),'plate_base':iv(plate,base),'plate_board':iv(plate,board),'plate_antenna':iv(plate,ant),'mx_plate':iv(mx,plate),'pressed_cap_plate':iv(cap.translate((0,0,-4)),plate),'pins_plate':iv(pins,plate)})
for x,y in SCREWS:
    screw12=cy(1.5,10.5,x,y,1.5)
    checks[f'screw12_{x}_shell']=iv(screw12,shell)
    checks[f'screw12_{x}_base']=iv(screw12,base)
# A real 5.5 mm AF M3 nut can slide inward-to-outward through each slot.
for side in (-1,1):
    nr=5.5/math.sqrt(3)
    np=[(nr*math.cos(math.radians(30+60*i)),nr*math.sin(math.radians(30+60*i))) for i in range(6)]
    nut=cq.Workplane('XY').polyline(np).close().extrude(2.4)
    checks[f'nut_entry_{side}_shell']=max(iv(nut.translate((side*x,-2,4.4)),shell) for x in (13.2,14.2,15.2,16.2,17.2,18.2))
    checks[f'nut_seated_{side}_base']=iv(nut.translate((side*18.2,-2,4.4)),base)
for name,g in guides.items():
    checks[name+'_board']=iv(g,board); checks[name+'_shell']=iv(g,shell)
failures={k:round(v,5) for k,v in checks.items() if v>.05}
if failures:
    for a in plate.intersect(shell).solids().vals():
        bb=a.BoundingBox();print('PLATE CLASH',a.Volume(),[bb.xmin,bb.ymin,bb.zmin,bb.xmax,bb.ymax,bb.zmax])
    raise RuntimeError(f'Collisions mm3: {failures}')
print('Checks:',checks)
report={'design':'Orbit Puck v2 support-free cartridge','units':'mm','body_diameter_mm':R*2,'body_envelope_mm':[R*2,R-FRONT,TOP],'keycap_top_mm':23.2,'mx_plate_mm':1.5,'mx_travel_mm':4,'pressed_skirt_clearance_mm':.6,'mx_pins_orientation':'+Y, towards rear, above lowered anvil','screws':'2x countersunk M3x10 or M3x12 + 2x standard M3 nuts','nut_seat_z_mm':4.4,'nut_top_z_mm':6.8,'screw_tip_clearance_to_bore_end_M3x12_mm':3.3,'antenna_envelope':'A-02, 37.8 mm arc x 17.9 mm high x 1.8 mm radial; curvature and RF require physical test','checks_mm3':checks,'parts':{}}
assy=cq.Assembly()
for name,p in parts.items():
    assert p.val().isValid() and len(p.solids().vals())==1,(name,len(p.solids().vals()))
    cq.exporters.export(p,str(ROOT/(name+'.step')))
    cq.exporters.export(p,str(ROOT/(name+'_assembly.stl')),tolerance=.03,angularTolerance=.2)
    q=p.rotate((0,0,0),(1,0,0),180) if name in {'01_shell','03_keycap'} else p
    if name.startswith('06_'): q=p.rotate((0,0,0),(1,0,0),90)
    qb=q.val().BoundingBox(); q=q.translate((0,0,-qb.zmin))
    path=ROOT/(name+'.stl'); cq.exporters.export(q,str(path),tolerance=.03,angularTolerance=.2)
    m=trimesh.load_mesh(path); m.merge_vertices(); m.remove_unreferenced_vertices(); m.fix_normals(); m.export(path)
    assert m.is_watertight and len(m.split())==1,name
    b=trimesh.load_mesh(ROOT/(name+'_assembly.stl')).extents; report['parts'][name]={'valid':True,'solids':1,'watertight':True,'bbox_mm':[round(float(v),2) for v in b]}
    assy.add(p,name=name,color=cq.Color(.95,.28,.025) if name in {'03_keycap','04_halo','05_belt_left','05_belt_right'} else cq.Color(.08,.09,.10))
assy.save(str(ROOT/'orbit_assembly.step'))
assy.add(board,name='XIAO_reference',color=cq.Color(.1,.5,.2))
assy.add(ant,name='antenna_envelope',color=cq.Color(.2,.2,.2,.4))
assy.save(str(ROOT/'orbit_with_components.step'))
cq.exporters.export(board,str(ROOT/'XIAO_reference.stl'),tolerance=.06)
# Optional tolerance wedges and proven MX fit coupons are included separately.
for name,p in {'07_wedge_looser':wedge(1.62),'07_wedge_tighter':wedge(1.42)}.items():
    cq.exporters.export(p,str(ROOT/(name+'.step')))
    b=p.val().BoundingBox(); cq.exporters.export(p.translate((0,0,-b.zmin)),str(ROOT/(name+'.stl')),tolerance=.03)
probe=box(2,2,1.5,9,MX_Y,PLATE_Z)
report['mx_plate_probe_volume_mm3']=iv(probe,plate)
assert abs(report['mx_plate_probe_volume_mm3']-6)<.001
(ROOT/'validation.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
