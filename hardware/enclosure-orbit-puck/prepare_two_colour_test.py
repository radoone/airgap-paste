"""Two monochrome A1 mechanical test plates: graphite and orange."""
from pathlib import Path
from zipfile import ZipFile
import json,subprocess,xml.etree.ElementTree as ET
ROOT=Path(__file__).resolve().parent; OUT=ROOT/'bambu_a1'; PROFILES=ROOT/'print_profiles'
plates=[('10_test_black_A1_PLA.3mf',['01_shell.stl','02_base.stl','07_xiao_wedge.stl'],.2,'black'),('11_test_orange_A1_PLA.3mf',['09_mx_snap_plate.stl','03_keycap.stl','04_halo.stl','05_belt_left.stl','05_belt_right.stl','06_lightguide_left.stl','06_lightguide_right.stl'],.1,'orange')]
summary=[]
for name,parts,layer,colour in plates:
    work=OUT/name.removesuffix('.3mf');work.mkdir(exist_ok=True)
    process=json.loads((PROFILES/'process.json').read_text());process.update({'name':'Orbit Puck two-colour mechanical test','from':'user','enable_support':'0','wall_loops':'3','layer_height':str(layer),'initial_layer_print_height':str(layer),'sparse_infill_density':'20%','sparse_infill_pattern':'gyroid'})
    settings=work/'process.json';settings.write_text(json.dumps(process,indent=2)+'\n')
    filament=json.loads((PROFILES/'PLA.json').read_text());filament['filament_colour']=['#171C22' if colour=='black' else '#F47A20']
    filament_path=work/'filament.json';filament_path.write_text(json.dumps(filament,indent=2)+'\n')
    cmd=['/Applications/BambuStudio.app/Contents/MacOS/BambuStudio','--load-settings',f'{PROFILES/"machine.json"};{settings}','--load-filaments',str(filament_path),'--arrange','1','--orient','0','--slice','0','--export-3mf',name,'--outputdir',str(work),*[str(ROOT/n) for n in parts]]
    with (work/'slicer.log').open('w') as log:subprocess.run(cmd,cwd=work,stdout=log,stderr=subprocess.STDOUT,check=True)
    r=json.loads((work/'result.json').read_text());assert r['return_code']==0 and len(r['sliced_plates'])==1,r
    p=r['sliced_plates'][0];assert not p.get('warning_message',''),p
    path=OUT/name;path.write_bytes((work/name).read_bytes())
    with ZipFile(path) as z:
        assert z.testzip() is None
        gc=[n for n in z.namelist() if n.endswith('.gcode')];assert len(gc)==1
        support=sum(z.read(n).count(b'FEATURE: Support') for n in gc);assert support==0
        count=sum(len(ET.fromstring(z.read(n)).findall('./{*}build/{*}item')) for n in z.namelist() if n.endswith('.model'));assert count==len(parts)
        (ROOT/(name.removesuffix('.3mf')+'_preview.png')).write_bytes(z.read('Metadata/plate_1.png'))
    summary.append({'file':name,'colour':colour,'parts':parts,'build_items':count,'plate_count':1,'layer_height_mm':layer,'supports':False,'support_feature_markers':support,'warning':p.get('warning_message',''),'print_time_minutes':round(p['total_predication']/60,1),'filament_grams':round(sum(f['total_used_g'] for f in p['filaments']),2),'archive_ok':True})
(OUT/'two_colour_test_summary.json').write_text(json.dumps(summary,indent=2)+'\n');print(json.dumps(summary,indent=2))
