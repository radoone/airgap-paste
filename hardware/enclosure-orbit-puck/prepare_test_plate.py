"""One monochrome A1 plate with the ten required Orbit Puck printed parts."""
from pathlib import Path
from zipfile import ZipFile
import json,subprocess,xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parent
PROFILES=ROOT/'print_profiles'
OUT=ROOT/'bambu_a1'
NAME='00_all_parts_test_A1_PLA.3mf'
PARTS=['01_shell.stl','02_base.stl','03_keycap.stl','04_halo.stl','05_belt_left.stl','05_belt_right.stl','06_lightguide_left.stl','06_lightguide_right.stl','07_xiao_wedge.stl','09_mx_snap_plate.stl']
work=OUT/NAME.removesuffix('.3mf');work.mkdir(exist_ok=True)
process=json.loads((PROFILES/'process.json').read_text())
process.update({'name':'Orbit Puck one plate A1 PLA test','from':'user','enable_support':'0','wall_loops':'3','layer_height':'0.1','initial_layer_print_height':'0.1','sparse_infill_density':'20%','sparse_infill_pattern':'gyroid'})
settings=work/'process.json';settings.write_text(json.dumps(process,indent=2)+'\n')
cmd=['/Applications/BambuStudio.app/Contents/MacOS/BambuStudio','--load-settings',f'{PROFILES/"machine.json"};{settings}','--load-filaments',str(PROFILES/'PLA.json'),'--arrange','1','--orient','0','--slice','0','--export-3mf',NAME,'--outputdir',str(work),*[str(ROOT/n) for n in PARTS]]
with (work/'slicer.log').open('w') as log:subprocess.run(cmd,cwd=work,stdout=log,stderr=subprocess.STDOUT,check=True)
r=json.loads((work/'result.json').read_text());assert r['return_code']==0 and len(r['sliced_plates'])==1,r
plate=r['sliced_plates'][0];assert not plate.get('warning_message',''),plate
path=OUT/NAME;path.write_bytes((work/NAME).read_bytes())
with ZipFile(path) as z:
    assert z.testzip() is None
    gcode=[n for n in z.namelist() if n.endswith('.gcode')];assert len(gcode)==1
    support=sum(z.read(n).count(b'FEATURE: Support') for n in gcode);assert support==0
    items=sum(len(ET.fromstring(z.read(n)).findall('./{*}build/{*}item')) for n in z.namelist() if n.endswith('.model'));assert items==10,items
    (ROOT/'one_plate_test_preview.png').write_bytes(z.read('Metadata/plate_1.png'))
summary={'file':NAME,'parts':PARTS,'plate_count':1,'build_items':items,'layer_height_mm':.1,'first_layer_height_mm':.1,'supports':False,'support_feature_markers':support,'warning':plate.get('warning_message',''),'print_time_minutes':round(plate['total_predication']/60,1),'filament_grams':round(sum(f['total_used_g'] for f in plate['filaments']),2),'archive_ok':True,'material_note':'Single-colour PLA mechanical prototype; opaque light guides do not verify optical function.'}
(OUT/'one_plate_test_summary.json').write_text(json.dumps(summary,indent=2)+'\n')
print(json.dumps(summary,indent=2))
