from pathlib import Path
import trimesh,matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
r=Path(__file__).resolve().parent
fig,ax=plt.subplots(figsize=(10,6),dpi=160)
for n,c,label in [('01_shell','#343f49','Telo'),('04_halo','#ef7525','Oranžový rámik'),('05_mx_plate','#597c8e','Platnička MX')]:
 m=trimesh.load(r/(n+'_assembly.stl'),force='mesh');lines=trimesh.intersections.mesh_plane(m,plane_origin=[0,5,0],plane_normal=[0,1,0])
 ax.add_collection(LineCollection(lines[:,:,[0,2]],colors=c,linewidths=2.5,label=label))
ax.annotate('Spodná príruba 1,4 mm',xy=(-12.5,14.1),xytext=(-17.2,18.5),arrowprops={'arrowstyle':'->','color':'#ef7525'},fontsize=11,color='#ad4a0f')
ax.annotate('Doraz tela proti vytiahnutiu',xy=(12.3,14.9),xytext=(0.5,19.4),arrowprops={'arrowstyle':'->'},fontsize=10)
ax.annotate('Platnička drží rámik zdola',xy=(10,13.3),xytext=(1,11.6),arrowprops={'arrowstyle':'->'},fontsize=10)
ax.set(xlim=(-18,18),ylim=(10.8,24.2),xlabel='X [mm]',ylabel='Z [mm]',title='Rámik zachytený zvnútra — rez skutočnými STL na Y = 5 mm')
ax.set_aspect('equal');ax.legend(loc='upper center',ncol=3,frameon=False);ax.grid(alpha=.16)
fig.tight_layout();fig.savefig(r/'halo_retention_section.png');plt.close(fig)
