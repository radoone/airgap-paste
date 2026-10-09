"""Plot real sliced shell extrusion; includes G2/G3 arcs. No CAD simulation."""
from pathlib import Path
import json, re, math, xml.etree.ElementTree as ET
from zipfile import ZipFile
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection

ROOT=Path(__file__).resolve().parent
source=ROOT/'bambu_a1/01_graphite_A1_PLA/plate_1.gcode'
if source.exists():
    gcode=source.read_text()
else:
    source=ROOT/'bambu_a1/01_graphite_A1_PLA.3mf'
    with ZipFile(source) as z:
        gcode=z.read(next(n for n in z.namelist() if n.endswith('.gcode'))).decode()
with ZipFile(ROOT/'bambu_a1/01_graphite_A1_PLA.3mf') as z:
    config=ET.fromstring(z.read('Metadata/model_settings.config'))
    shell_id=next(o.attrib['id'] for o in config.findall('object') if any(m.attrib.get('key')=='name' and m.attrib.get('value')=='01_shell.stl' for m in o.findall('metadata')))
    shell_label=next(int(next(m.attrib['value'] for m in instance.findall('metadata') if m.attrib.get('key')=='identify_id')) for instance in config.findall('./plate/model_instance') if any(m.attrib.get('key')=='object_id' and m.attrib.get('value')==shell_id for m in instance.findall('metadata')))
layers={}; x=y=0.; height=0.; obj=None; feature=''
for line in gcode.splitlines():
    if line.startswith('; Z_HEIGHT:'):
        height=round(float(line.split(':')[1]),3)
    elif line.startswith('; start printing object, unique label id:'):
        obj=int(line.split(':')[1])
    elif line.startswith('; stop printing object'):
        obj=None
    elif line.startswith('; FEATURE:'):
        feature=line.split(':',1)[1].strip()
    if not re.match(r'^G[123] ',line): continue
    vals={k:float(v) for k,v in re.findall(r'([XYEIJ])(-?\d*\.?\d+)',line)}
    nx,ny=vals.get('X',x),vals.get('Y',y)
    if obj==shell_label and vals.get('E',0)>0 and (nx!=x or ny!=y) and feature!='Brim':
        pts=[(x,y),(nx,ny)]
        if line.startswith(('G2 ','G3 ')) and ('I' in vals or 'J' in vals):
            cx,cy=x+vals.get('I',0),y+vals.get('J',0)
            a=math.atan2(y-cy,x-cx);b=math.atan2(ny-cy,nx-cx)
            sweep=(b-a)%(2*math.pi)
            if line.startswith('G2 '):sweep=-((a-b)%(2*math.pi))
            r=math.hypot(x-cx,y-cy);n=max(2,math.ceil(abs(sweep)*r/.25))
            pts=[(cx+r*math.cos(a+sweep*i/n),cy+r*math.sin(a+sweep*i/n)) for i in range(n+1)]
        layers.setdefault(height,[]).append((pts,feature))
    x,y=nx,ny

targets=[.1,1.3,3.,13.,18.,23.8]
colours={'Outer wall':'#186c9c','Inner wall':'#607786','Bridge':'#ed8129','Internal bridge':'#ed8129'}
fig,axes=plt.subplots(2,3,figsize=(11,8),constrained_layout=True)
chosen=[]
for ax,target in zip(axes.flat,targets):
    h=min(layers,key=lambda k:abs(k-target));paths=layers[h];chosen.append(h)
    lines=[];cs=[]
    for pts,feat in paths:
        lines.extend(list(zip(pts[:-1],pts[1:])))
        cs.extend([colours.get(feat,'#acb7bd')]*(len(pts)-1))
    ax.add_collection(LineCollection(lines,colors=cs,linewidths=.5))
    ax.autoscale();ax.set_aspect('equal');ax.set_xlabel('X (mm)');ax.set_ylabel('Y (mm)')
    ax.set_title(f'Shell print Z = {h:g} mm');ax.grid(alpha=.12)
fig.suptitle('Actual Bambu A1 toolpaths · crown down · PLA / 0.4 mm / 0.1 mm layers')
fig.savefig(ROOT/'toolpath_inspection.png',dpi=150)
report={'source':str(source.relative_to(ROOT)),'object_label':shell_label,'shell_layers':len(layers),
        'inspected_heights_mm':chosen,'arcs_tessellated':True,'support_features':gcode.count('FEATURE: Support'),
        'note':'Print coordinates. Selected actual extrusion sections; not a physical print test.'}
(ROOT/'toolpath_inspection.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report))
