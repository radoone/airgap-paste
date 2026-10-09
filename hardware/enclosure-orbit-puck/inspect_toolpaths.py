"""Visual inspection sheets from actual sliced XY extrusion paths."""
from pathlib import Path
from zipfile import ZipFile
from collections import defaultdict
import re,math,json
from PIL import Image,ImageDraw,ImageFont
ROOT=Path(__file__).resolve().parent
p=ROOT/'bambu_a1/01_orbit_graphite_A1_PLA.3mf'
with ZipFile(p) as z:
    code=z.read(next(n for n in z.namelist() if n.endswith('.gcode'))).decode()
x=y=height=0.;feature='Custom';layers=defaultdict(list)
for line in code.splitlines():
    if line.startswith('; Z_HEIGHT:'): height=float(line.split(':')[1])
    if line.startswith('; FEATURE:'): feature=line.split(':',1)[1].strip()
    if line.startswith(('G1 ','G2 ','G3 ')):
        values={a:float(b) for a,b in re.findall(r'([XYE])(-?\d*\.?\d+)',line.split(';')[0])}
        nx,ny=values.get('X',x),values.get('Y',y)
        if values.get('E',0)>0 and math.hypot(nx-x,ny-y)>.005 and feature!='Custom':layers[round(height,3)].append((x,y,nx,ny,feature))
        x,y=nx,ny
assert layers
allsegments=[s for a in layers.values() for s in a]
bounds=(min(min(s[0],s[2]) for s in allsegments),min(min(s[1],s[3]) for s in allsegments),max(max(s[0],s[2]) for s in allsegments),max(max(s[1],s[3]) for s in allsegments))
chosen=[min(layers,key=lambda h:abs(h-t)) for t in (1.4,1.6,3.8,6.4,16.6,19.2)]
image=Image.new('RGB',(1500,1050),'#f5f7fa');draw=ImageDraw.Draw(image)
try:font=ImageFont.truetype('/System/Library/Fonts/Supplemental/Arial.ttf',20)
except OSError:font=ImageFont.load_default()
for i,h in enumerate(chosen):
    col,row=i%3,i//3;left,top=col*500,row*525
    draw.text((left+20,top+10),f'Z {h:.2f} mm - actual G-code',fill='#172b4d',font=font)
    scale=min(460/(bounds[2]-bounds[0]),460/(bounds[3]-bounds[1]))
    for s in sorted(layers[h],key=lambda s:'Bridge' in s[4] or 'Overhang' in s[4]):
        colour='#e64a36' if 'Bridge' in s[4] else '#e0951f' if 'Overhang' in s[4] else '#4b94a8' if s[4]=='Sparse infill' else '#526678'
        a=(left+20+(s[0]-bounds[0])*scale,top+490-(s[1]-bounds[1])*scale)
        b=(left+20+(s[2]-bounds[0])*scale,top+490-(s[3]-bounds[1])*scale)
        draw.line((a,b),fill=colour,width=2)
    draw.text((left+20,top+500),'Red: bridges / orange: overhang walls',fill='#526678',font=font)
image.save(ROOT/'support_free_toolpath_inspection.png')
bridge=[math.hypot(s[2]-s[0],s[3]-s[1]) for s in allsegments if 'Bridge' in s[4]]
support=[s for s in allsegments if 'Support' in s[4]]
assert not support
report={'file':p.name,'layers_inspected_mm':chosen,'support_extrusion_segments':len(support),'longest_bridge_segment_mm':round(max(bridge,default=0),2),'bridge_note':'Segment length is a G-code path measurement, not a physical bridge-quality test.'}
(ROOT/'toolpath_inspection.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report,indent=2))
