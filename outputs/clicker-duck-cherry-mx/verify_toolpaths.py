from pathlib import Path
import re
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
ROOT=Path(__file__).resolve().parent
x=y=z=e=0.;relative_e=False;paths={}
for s in (ROOT/'slicer/plate_1.gcode').read_text().splitlines():
    if s.startswith('; Z_HEIGHT:'):z=float(s.split(':')[1])
    if s.startswith('M83'):relative_e=True
    if s.startswith('M82'):relative_e=False
    if s.startswith('G92 E'):e=float(s.split('E')[1].split()[0])
    if s.startswith(('G0 ','G1 ','G2 ','G3 ')):
        vals={k:float(v) for k,v in re.findall(r'([XYZE])(-?(?:\d+(?:\.\d*)?|\.\d+))',s)}
        nx=vals.get('X',x);ny=vals.get('Y',y)
        extrusion=vals.get('E',0 if relative_e else e)-(0 if relative_e else e)
        if extrusion>0 and max(abs(nx-94.6111322),abs(x-94.6111322),abs(ny-120.5166763),abs(y-120.5166763))<5:
            paths.setdefault(round(z,2),[]).append([(x-94.6111322,y-120.5166763),(nx-94.6111322,ny-120.5166763)])
        x,y=nx,ny;e=vals.get('E',e)
fig,axs=plt.subplots(2,3,figsize=(13,8))
for ax,want in zip(axs.flat,[3.24,3.56,3.88,4.36,5.0,7.88]):
    layer=min(paths,key=lambda l:abs(l-want))
    for segment in paths[layer]:ax.plot(*zip(*segment),color='#ad760a',lw=.8)
    ax.set(xlim=(-4.5,4.5),ylim=(-4.5,4.5),aspect='equal',title=f'G-code Z={layer:.2f} mm');ax.grid(alpha=.3)
fig.savefig(ROOT/'sliced_socket_layers.png',dpi=150)
print('Socket extrusion layers:',min(paths),max(paths))
