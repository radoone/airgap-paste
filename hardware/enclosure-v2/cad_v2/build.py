from pathlib import Path
import math,json
import cadquery as cq
from brand_mark import add_emboss, proof_geometry
P=Path(__file__).resolve().parent
REF=P/'reference'/'XIAO_ESP32S3_Seeed.step'
def cy(r,h,z=0,x=0,y=0):return cq.Workplane('XY').circle(r).extrude(h).translate((x,y,z))
def bx(w,d,h,x=0,y=0,z=0):return cq.Workplane('XY').box(w,d,h,centered=(True,True,False)).translate((x,y,z))
def rot(s,a):return s.rotate((0,0,0),(0,0,1),a)
# Official STEP: original X = board length, original Y = height.
ref=cq.importers.importStep(str(REF))
board=ref.rotate((0,0,0),(1,0,0),90).rotate((0,0,0),(0,0,1),-90).translate((-6.1113999554,-19.3913601643,4.25))
# Shell and floor become ONE printed tub.
bottom=cy(34,23).edges('<Z').fillet(.8).edges('>Z').fillet(.65).cut(cy(31.6,22,2))
# Enlarged inner pocket follows measured PCB extent and allows soldered wires.
bottom=bottom.cut(bx(19.2,22.2,6.5,0,-21.196,3.8))
# USB port centre/face from official STEP (front y=-33.2).
bottom=bottom.cut(bx(13,10,6.4,0,-34,3.16))
# Fibre entry ports (flexible fibres, not rigid straight light pipes).
for x in (-12,12):
 bottom=bottom.cut(cy(1.1,12).rotate((0,0,0),(1,0,0),90).translate((x,-25,12)))
# Printed ledges contact only bottom plane of PCB. Central underside stays open.
for x in (-7.4,7.4):bottom=bottom.union(bx(1.5,17,2,x,-21,2))
# Rear end stop; USB wall limits opposite motion. Adhesive retention on ledges.
bottom=bottom.union(bx(17,1,4,0,-9.95,2))
# Switch 6x6 footprint, 7mm overall height, adjustable prototype pedestal.
bottom=bottom.union(bx(11,11,12,0,0,2)).cut(bx(6.4,6.4,2,0,0,12.5))
for x in (-4.4,4.4):bottom=bottom.cut(bx(3,4,3,x,0,11.8))
led=cy(4.2,9,2,12,0).cut(cy(2.65,10,1.9,12,0)).cut(bx(3,9,3,12,0,2))
bottom=bottom.union(led)
# Free antenna adhesive area; no metal fixings. Size remains a reserved envelope.
bottom=bottom.union(bx(28,12,1,0,19,2))
# Three latch windows, act as up-travel retention; cap rim gives down-stop.
angles=(0,90,180)
for a in angles: bottom=bottom.cut(rot(bx(8,7,3,32,0,12.5),a))
# Large cap: all top is the button. 0.5mm clearance to tub at rest.
# Sculpted shoulder rises 2 mm above the central touch surface.
# Optical transmission and print supports require a physical prototype.
top=(cq.Workplane('XZ').moveTo(0,23.5).lineTo(32.8,23.5).lineTo(33.0,23.6)
 .threePointArc((33.65,23.85),(33.7,24.5))
 .threePointArc((32.8,26.6),(30.6,27.0))
 .threePointArc((28.4,26.5),(26.4,25.2))
 .threePointArc((25.8,25.03),(25.0,25.0))
 .lineTo(0,25.0).close().revolve(360,(0,0),(0,1)))
# Hollow the raised shoulder from below: rounded optical wall rather than a
# solid thick ring. Preserve the outer stop and guide attachment at r=29.65+.
halo_cavity=(cq.Workplane('XZ').moveTo(26.5,23.49).lineTo(29.5,23.49)
 .lineTo(29.5,25.6).threePointArc((28.0,25.0),(26.5,24.1))
 .close().revolve(360,(0,0),(0,1)))
top=top.cut(halo_cavity)
# A deliberately shallow, recessed wordmark gives the top a product identity
# with 1.14 mm of material remaining under the lettering. It is a single-colour
# print feature; the recess becomes more visible when the centre is lit.
wordmark_airgap=(cq.Workplane('XY').text('AIRGAP',3.55,.36,combine=False,
    font='DejaVu Sans',halign='center',valign='center').translate((0,-1.2,24.64)))
wordmark_paste=(cq.Workplane('XY').text('PASTE',2.65,.36,combine=False,
    font='DejaVu Sans',halign='center',valign='center').translate((0,-5.0,24.64)))
top=top.cut(wordmark_airgap).cut(wordmark_paste)
top=add_emboss(cq, top, cy, bx)
guide=cy(31.15,4.5,19).cut(cy(29.65,5,18.9))
for a in angles:guide=guide.cut(rot(bx(8,8,6,31,0,18),a))
top=top.union(guide).union(cy(2.2,4.1,19.5))
# Flex tongues 0.9mm thick, 10mm long, chamfered insertion hook.
for a in angles:
 tongue=bx(.9,5,10.1,30.65,0,13.5)
 hook=cq.Workplane('XZ').polyline([(30.8,13.5),(32.15,14.7),(32.15,15.5),(30.8,15.5)]).close().extrude(2.5,both=True)
 top=top.union(rot(tongue.union(hook),a))
parts={'01_bottom':bottom,'02_top_button':top}
report={'source':'Official Seeed XIAO-ESP32S3 v2.step','nominal_PCB_mm':[21,17.8], 'official_STEP_overall_mm':[22.481981,17.78,4.46],'note':'STEP revision is the publicly supplied mechanical reference; no physical fit test.'}
for name,p in parts.items():
 s=p.val();assert s.isValid() and len(s.Solids())==1,name
 report[name]={'valid':s.isValid(),'solids':len(s.Solids()),'volume_mm3':round(s.Volume(),3)}
 pr=p if name=='01_bottom' else p.rotate((0,0,0),(1,0,0),180)
 pr=pr.translate((0,0,-pr.val().BoundingBox().zmin))
 cq.exporters.export(pr,str(P/(name+'.stl')),tolerance=.05,angularTolerance=.1)
 cq.exporters.export(p,str(P/(name+'.step')))
for label,a,b in [('parts_rest',bottom,top),('parts_pressed',bottom,top.translate((0,0,-.5))),('board_bottom',board,bottom),('board_top',board,top)]:
 vol=sum(s.Volume() for s in a.intersect(b).solids().vals());report[label+'_intersection_mm3']=round(vol,7)
 assert vol<.001,(label,vol)
(P/'validation.json').write_text(json.dumps(report,indent=2))
# Accurate geometry preview with official board.
import matplotlib;matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
fig=plt.figure(figsize=(13,6),facecolor='#f0f2f1')
for k,mode in enumerate(('assembled','inside','exploded')):
 ax=fig.add_subplot(1,3,k+1,projection='3d');ax.set_facecolor('#f0f2f1'); polygons=[];colors=[]
 things=[(bottom,'#242426',0),(board,'#c4aa70',0)]
 if mode!='inside':things.append((top,'#f5f3ee',20 if mode=='exploded' else 0))
 if mode=='inside':
  things[0]=(bottom.cut(bx(80,35,40,0,-23,9)), '#465761',0)
 for p,col,dz in things:
  solids=p.solids().vals()
  for s in solids:
   v,t=s.tessellate(.12);vs=[(q.x,q.y,q.z+dz) for q in v]
   for tri in t:
    face=[vs[i] for i in tri];polygons.append(face)
    normal=np.cross(np.array(face[1])-face[0],np.array(face[2])-face[0]);normal=normal/max(np.linalg.norm(normal),1e-12)
    brightness=.48+.5*abs(float(np.dot(normal,np.array([.3,-.4,.866]))))
    colors.append(tuple(np.clip(np.array(to_rgb(col))*brightness,0,1)))
 ax.add_collection3d(Poly3DCollection(polygons,facecolor=colors,edgecolor='none'))
 ax.set_xlim(-37,37);ax.set_ylim(-37,37);ax.set_zlim(0,50)
 ax.set_box_aspect((1,1,.7));ax.view_init(52 if mode=='inside' else 32,-65);ax.set_axis_off()
 ax.set_title({'assembled':'2 printed parts','inside':'Cutaway: official XIAO inside','exploded':'Moving snap-fit top'}[mode],fontsize=12)
fig.suptitle('AIRGAP PASTE | Sculpted button | 68 x 27 mm',fontsize=19)
fig.text(.5,.06,'Mechanical prototype. Switch, antenna and snap-fit require physical validation.',ha='center',fontsize=10)
fig.savefig(P/'preview.png',dpi=170,bbox_inches='tight')
# Flat technical logo proof: same Wi-Fi → gap → USB-C reading as the CAD.
from matplotlib.patches import Arc, Circle, Polygon, Rectangle
proof,pa=plt.subplots(figsize=(6,6),facecolor='#f5f3ee')
pa.set_facecolor('#f5f3ee')
mark=proof_geometry()
pa.add_patch(Circle(mark['source'][:2],mark['source'][2],facecolor='#25272a',edgecolor='none'))
for radius in mark['wifi_radii']:
 pa.add_patch(Arc(mark['source'][:2],2*radius,2*radius,theta1=135,theta2=225,
                  linewidth=9,color='#25272a'))
pa.add_patch(Polygon(mark['arrow'],closed=True,facecolor='#25272a',edgecolor='none'))
pa.add_patch(Rectangle(mark['usb'][:2],mark['usb'][2],mark['usb'][3],facecolor='#25272a',edgecolor='none'))
pa.add_patch(Rectangle(mark['usb_opening'][:2],mark['usb_opening'][2],mark['usb_opening'][3],facecolor='#f5f3ee',edgecolor='none'))
pa.text(0,-1.2,'AIRGAP',ha='center',va='center',fontsize=25,color='#25272a')
pa.text(0,-5,'PASTE',ha='center',va='center',fontsize=18,color='#25272a')
pa.set(xlim=(-15,15),ylim=(-10,22),aspect='equal');pa.axis('off')
proof.savefig(P/'logo-proof.png',dpi=180,bbox_inches='tight')
print(json.dumps(report,indent=2))
