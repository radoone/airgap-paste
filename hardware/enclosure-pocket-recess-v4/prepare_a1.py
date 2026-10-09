"""Slice actual print-oriented STLs for Bambu Lab A1 / 0.4 / PLA."""
from pathlib import Path
from zipfile import ZipFile
import json,subprocess,shutil,sys,xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parent
OUT=ROOT/'bambu_a1';OUT.mkdir(exist_ok=True)
PROFILES=ROOT/'print_profiles';PROFILES.mkdir(exist_ok=True)
for name in ('machine.json','process.json','PLA.json'):
    if not (PROFILES/name).exists():
        shutil.copy2(ROOT.parent/'enclosure-orbit-puck/print_profiles'/name,PROFILES/name)
black=['01_shell.stl','02_base.stl','07_xiao_wedge.stl']
orange=['03_keycap.stl','04_halo.stl','05_mx_plate.stl','09_eye_bushing.stl']
clear=['06_lightguide_left.stl','06_lightguide_right.stl']
plates=[
 ('00_complete_test_A1_PLA.3mf',black+orange+clear,.1,'#333940','outer_only'),
 ('01_graphite_A1_PLA.3mf',black,.1,'#23282D','outer_only'),
 ('02_orange_A1_PLA.3mf',orange,.1,'#EF7525','no_brim'),
 ('03_clear_lightguides_A1_PLA.3mf',clear,.1,'#DCDDDD','outer_only'),
 ('04_mx_fit_tests_A1_PLA.3mf',['08_mx_coupon_14p0.stl','08_mx_coupon_14p1.stl','08_mx_coupon_14p2.stl','03_keycap.stl'],.1,'#EF7525','no_brim'),
]
existing={p["file"]:p for p in json.loads((OUT/"plate_summary.json").read_text())} if (OUT/"plate_summary.json").exists() else {}
summary=[]
for filename,parts,layer,colour,brim in plates:
    if sys.argv[1:] and not any(filename.startswith(prefix) for prefix in sys.argv[1:]):
        summary.append(existing[filename]); continue
    work=OUT/filename.removesuffix('.3mf');work.mkdir(exist_ok=True)
    process=json.loads((PROFILES/'process.json').read_text())
    process.update({'name':'AirGap Pocket Recess A1 PLA','from':'user','enable_support':'0',
        'wall_loops':'3','layer_height':str(layer),'initial_layer_print_height':str(layer),
        'sparse_infill_density':'20%','sparse_infill_pattern':'gyroid','brim_type':brim,
        'brim_width':'4','brim_object_gap':'0.15','detect_thin_wall':'0'})
    settings=work/'process.json';settings.write_text(json.dumps(process,indent=2)+'\n')
    filament=json.loads((PROFILES/'PLA.json').read_text());filament['filament_colour']=[colour]
    filpath=work/'filament.json';filpath.write_text(json.dumps(filament,indent=2)+'\n')
    cmd=['/Applications/BambuStudio.app/Contents/MacOS/BambuStudio','--load-settings',f'{PROFILES/"machine.json"};{settings}',
         '--load-filaments',str(filpath),'--arrange','1','--orient','0','--slice','0','--export-3mf',filename,
         '--outputdir',str(work),*[str(ROOT/n) for n in parts]]
    with (work/'slicer.log').open('w') as log:subprocess.run(cmd,cwd=work,stdout=log,stderr=subprocess.STDOUT,check=True)
    result=json.loads((work/'result.json').read_text());assert result['return_code']==0,result
    assert len(result['sliced_plates'])==1,result
    plate=result['sliced_plates'][0];assert not plate.get('warning_message',''),plate
    path=OUT/filename;path.write_bytes((work/filename).read_bytes())
    with ZipFile(path) as z:
        assert z.testzip() is None
        g=[n for n in z.namelist() if n.endswith('.gcode')];assert len(g)==1
        support=sum(z.read(n).count(b'FEATURE: Support') for n in g);assert support==0
        item_count=sum(len(ET.fromstring(z.read(n)).findall('./{*}build/{*}item')) for n in z.namelist() if n.endswith('.model'))
        assert item_count==len(parts),(item_count,parts)
        preview=OUT/(filename.removesuffix('.3mf')+'_preview.png')
        preview.write_bytes(z.read('Metadata/plate_1.png'))
        # Extract actual toolpath for independent layer inspection.
        (work/'plate_1.gcode').write_bytes(z.read(g[0]))
    info={'file':filename,'parts':parts,'objects':item_count,'plate_count':1,'layer_height_mm':layer,
          'supports':False,'support_feature_markers':support,'warning':plate.get('warning_message',''),
          'print_time_minutes':round(plate['total_predication']/60,1),
          'filament_grams':round(sum(f['total_used_g'] for f in plate['filaments']),2),'archive_ok':True}
    summary.append(info);print(json.dumps(info),flush=True)
(OUT/'plate_summary.json').write_text(json.dumps(summary,indent=2)+'\n')
