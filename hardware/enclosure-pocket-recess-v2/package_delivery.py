"""Validate final 3MF geometry against current STL and package this design only."""
from pathlib import Path
from zipfile import ZipFile, ZIP_DEFLATED
import json, hashlib, xml.etree.ElementTree as ET
import numpy as np
import trimesh

ROOT=Path(__file__).resolve().parent
checks=[]
for plate in sorted((ROOT/'bambu_a1').glob('*.3mf')):
    with ZipFile(plate) as z:
        assert z.testzip() is None
        config=ET.fromstring(z.read('Metadata/model_settings.config'))
        source_names={}
        for obj in config.findall('object'):
            for part in obj.findall('part'):
                source_names[part.attrib['id']]=next(m.attrib['value'] for m in part.findall('metadata') if m.attrib.get('key')=='source_file')
        found=[]
        for name in z.namelist():
            if not name.endswith('.model'):continue
            xml=ET.fromstring(z.read(name))
            assert xml.attrib.get('unit')=='millimeter'
            for obj in xml.findall('./{*}resources/{*}object'):
                mesh=obj.find('{*}mesh')
                if mesh is None:continue
                verts=[[float(v.attrib[k]) for k in ('x','y','z')] for v in mesh.findall('./{*}vertices/{*}vertex')]
                faces=[[int(t.attrib[k]) for k in ('v1','v2','v3')] for t in mesh.findall('./{*}triangles/{*}triangle')]
                actual=trimesh.Trimesh(vertices=verts,faces=faces,process=False)
                source=source_names[obj.attrib['id']]
                expected=trimesh.load(ROOT/source,force='mesh')
                assert actual.is_watertight and len(actual.faces)==len(expected.faces),source
                error=abs(actual.volume-expected.volume)
                assert error<.02,(source,error)
                assert np.allclose(np.sort(actual.extents),np.sort(expected.extents),atol=.002),source
                found.append({'source':source,'mesh_volume_difference_mm3':round(error,6)})
        checks.append({'file':plate.name,'models_match_final_STLs':found,'archive_ok':True})
(ROOT/'package_check.json').write_text(json.dumps(checks,indent=2)+'\n')

files=[]
for pattern in ('*.stl','*.step','*.blend','*.png','*.json','*.py','*.md','requirements.txt'):
    files.extend(ROOT.glob(pattern))
files.extend((ROOT/'print_profiles').glob('*.json'))
for pattern in ('*.3mf','*_preview.png','plate_summary.json'):
    files.extend((ROOT/'bambu_a1').glob(pattern))
for pattern in ('*.step','*.stl','*.pdf','*.kicad_pcb'):
    files.extend((ROOT/'reference').glob(pattern))
files=sorted(set(files))
manifest={'design':'AirGap Paste Pocket Recess v2 Layered Crown','envelope_mm':[54,48,26.6],
          'files':[{'path':str(p.relative_to(ROOT)),'bytes':p.stat().st_size,'sha256':hashlib.sha256(p.read_bytes()).hexdigest()} for p in files]}
out=ROOT.parent/'AirGap_Paste_Pocket_Recess_v2_A1.zip'
with ZipFile(out,'w',ZIP_DEFLATED,compresslevel=6) as z:
    for p in files:z.write(p,'AirGap_Paste_Pocket_Recess_v2/'+str(p.relative_to(ROOT)))
    z.writestr('AirGap_Paste_Pocket_Recess_v2/manifest.json',json.dumps(manifest,indent=2)+'\n')
with ZipFile(out) as z:
    assert z.testzip() is None
    assert len([n for n in z.namelist() if n.endswith('.3mf')])==5
    for f in manifest['files']:
        b=z.read('AirGap_Paste_Pocket_Recess_v2/'+f['path'])
        assert hashlib.sha256(b).hexdigest()==f['sha256']
print(json.dumps({'archive':str(out),'size_mb':round(out.stat().st_size/1e6,2),'files':len(files)+1,
                  'verified_3mf':len(checks),'verified_meshes':sum(len(p['models_match_final_STLs']) for p in checks)},indent=2))
