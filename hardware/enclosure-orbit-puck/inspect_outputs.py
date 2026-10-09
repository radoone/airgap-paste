"""Inspect exported meshes, front-wall continuity and sliced 3MF content."""
from pathlib import Path
from zipfile import ZipFile
import json,xml.etree.ElementTree as ET
import cadquery as cq
import trimesh
ROOT=Path(__file__).resolve().parent
meshes={}
for p in sorted(ROOT.glob('*.stl')):
    if '_assembly' in p.stem or p.stem.startswith('XIAO'): continue
    m=trimesh.load_mesh(p);m.merge_vertices();m.fix_normals()
    r={'watertight':bool(m.is_watertight),'components':len(m.split(only_watertight=False)),'positive_volume':bool(m.volume>0),'min_z':round(float(m.bounds[0,2]),4)}
    assert r['watertight'] and r['components']==1 and r['positive_volume'],(p,r)
    meshes[p.name]=r
(ROOT/'mesh_validation.json').write_text(json.dumps(meshes,indent=2)+'\n')
shell=cq.importers.importStep(str(ROOT/'01_shell.step'))
probe=cq.Workplane('XY').box(2,.8,2,centered=(True,True,False)).translate((0,-20.3,15))
v=sum(s.Volume() for s in shell.intersect(probe).solids().vals());assert abs(v-3.2)<.001,v
(ROOT/'front_wall_inspection.json').write_text(json.dumps({'front_wall_probe_expected_mm3':3.2,'front_wall_probe_actual_mm3':v,'solid_front_above_USB':True},indent=2)+'\n')
plates=[]
for p in sorted((ROOT/'bambu_a1').glob('*.3mf')):
    with ZipFile(p) as z:
        assert z.testzip() is None
        names=z.namelist();gcodes=[n for n in names if n.endswith('.gcode')];imgs=[n for n in names if n.endswith('.png')];models=[n for n in names if n.endswith('.model')]
        assert gcodes and imgs and models
        resources=sum(len(ET.fromstring(z.read(n)).findall('.//{*}object')) for n in models)
        items=sum(len(ET.fromstring(z.read(n)).findall('./{*}build/{*}item')) for n in models)
        support=sum(z.read(n).count(b'FEATURE: Support') for n in gcodes)
        assert support==0,(p.name,support)
        plates.append({'file':p.name,'gcode':len(gcodes),'previews':len(imgs),'object_resources':resources,'build_items':items,'support_feature_markers':support,'archive_ok':True})
        (ROOT/(p.stem+'_plate_preview.png')).write_bytes(z.read('Metadata/plate_1.png'))
(ROOT/'bambu_a1'/'archive_validation.json').write_text(json.dumps(plates,indent=2)+'\n')
print(f'{len(meshes)} printable meshes, solid USB front, {len(plates)} sliced archives passed.')
