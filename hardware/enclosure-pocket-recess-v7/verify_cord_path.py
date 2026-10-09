"""Check a nominal pair of flexible 2 mm cord strands in the isolated eyelet.
This checks the designed clearance path, not cord material or threading force.
"""
from pathlib import Path
import cadquery as cq
import json, math
ROOT=Path(__file__).resolve().parent
shell=cq.importers.importStep(str(ROOT/'01_shell.step'))
bezel=cq.importers.importStep(str(ROOT/'09_eye_bushing.step'))
seat=cq.Vector(-22.3,-14.8,23.8)
angle=math.radians(20)
outward=cq.Vector(math.sin(angle),0,math.cos(angle))
bend_radius=2.0
bend_end_z=18.0
join_z=bend_end_z+bend_radius*(1-math.sin(angle))
depth=(seat.z-join_z)/math.cos(angle)
join=seat-outward*depth
centre=join+cq.Vector(-math.cos(angle)*bend_radius,0,math.sin(angle)*bend_radius)
checks={}; strands=[]
for label,dy in [('left',-1.05),('right',1.05)]:
    offset=cq.Vector(0,dy,0)
    first=seat+outward*3+offset
    p=join+offset
    middle=centre+cq.Vector(bend_radius*math.cos(math.radians(-55)),0,bend_radius*math.sin(math.radians(-55)))+offset
    end=centre+cq.Vector(0,0,-bend_radius)+offset
    last=cq.Vector(-30,end.y,end.z)
    wire=cq.Wire.assembleEdges([cq.Edge.makeLine(first,p),cq.Edge.makeThreePointArc(p,middle,end),cq.Edge.makeLine(end,last)])
    strand=cq.Workplane(cq.Plane(origin=first,normal=-outward)).circle(1.0).sweep(cq.Workplane(obj=wire),isFrenet=True)
    for name,part in [('shell',shell),('bezel',bezel)]:
        volume=sum(s.Volume() for s in strand.intersect(part).solids().vals())
        checks[label+'__'+name]=volume
    strands.append(strand)
compound=cq.Compound.makeCompound([s.val() for s in strands])
cq.exporters.export(compound,str(ROOT/'reference/cord_path_reference.stl'),tolerance=.05)
report={'nominal_strand_diameter_mm':2.0,'strands':2,'centre_separation_mm':2.1,'bend_centre_radius_mm':2.0,'intersections_mm3':checks,'scope':'Flexible cord nominal clearance only; no strength, wear or physical threading test'}
(ROOT/'cord_path_check.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
assert max(checks.values())<.01,checks
