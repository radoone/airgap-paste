"""Make a small exact enclosure corner to test cord feeding before the full shell."""
from pathlib import Path
import cadquery as cq,json,trimesh
ROOT=Path(__file__).resolve().parent
shell=cq.importers.importStep(str(ROOT/'01_shell.step'))
region=cq.Workplane('XY').box(13.5,13.5,14,centered=(True,True,False)).translate((-21.25,-14.8,12.8))
coupon=shell.intersect(region)
assert coupon.val().isValid() and len(coupon.solids().vals())==1
cq.exporters.export(coupon,str(ROOT/'10_eyelet_coupon.step'))
q=coupon.rotate((0,0,0),(1,0,0),180);b=q.val().BoundingBox()
q=q.translate((-(b.xmin+b.xmax)/2,-(b.ymin+b.ymax)/2,-b.zmin))
cq.exporters.export(q,str(ROOT/'10_eyelet_coupon.stl'),tolerance=.035,angularTolerance=.08)
m=trimesh.load(ROOT/'10_eyelet_coupon.stl',force='mesh')
assert m.is_watertight and len(m.split())==1
report={'cad_solid':1,'watertight':True,'print_extents_mm':m.extents.tolist(),'purpose':'Exact corner subsection for cord and bezel fit; open cut faces are test-only'}
(ROOT/'eyelet_coupon_check.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report))
