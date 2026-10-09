from pathlib import Path
import zipfile
from lxml import etree as E
import numpy as np
import trimesh as tm
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt

ROOT=Path(__file__).resolve().parent
SRC=Path('/Users/radoone/Downloads/Clicker_Duck_-_Single_Color.3mf')
NS={'c':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
def load():
    meshes={}
    with zipfile.ZipFile(SRC) as z:
        for file in ['3D/Objects/object_7.model','3D/Objects/object_6.model']:
            r=E.fromstring(z.read(file))
            for o in r.findall('c:resources/c:object',NS):
                v=np.array([[float(p.get(k)) for k in ['x','y','z']] for p in o.findall('c:mesh/c:vertices/c:vertex',NS)])
                f=np.array([[int(p.get(k)) for k in ['v1','v2','v3']] for p in o.findall('c:mesh/c:triangles/c:triangle',NS)])
                m=tm.Trimesh(v,f,process=True)
                meshes[int(o.get('id'))]=m
    return meshes
if __name__=='__main__':
    m=load()
    for k,v in m.items():
        print(k,'bounds',v.bounds,'watertight',v.is_watertight,'volume',v.volume,'components',len(v.split()))
    # Head in the original print orientation: its flat underside is Z=-11.6401.
    m[2]=tm.boolean.union(m[2].split(only_watertight=False),engine='manifold')
    m[2].apply_transform(np.array([[1,0,0,0],[0,-1,0,4.1354123],[0,0,-1,-6.64010239],[0,0,0,1]]))
    raw=tm.boolean.union(m[1].split(),engine='manifold')
    head=tm.boolean.difference([raw,m[2]],engine='manifold')
    head.export(ROOT/'original_head_effective.stl')
    print('effective head',head.is_watertight,head.volume,len(head.split()))
    for name,mesh in [('head_raw',m[1]),('head_effective',head),('head_negative',m[2])]:
        fig,ax=plt.subplots(2,3,figsize=(15,10))
        for a,z in zip(ax.flat,[-11.5,-11.0,-10.7,-10.0,-8.0,-5.0]):
            s=mesh.section(plane_origin=[0,0,z],plane_normal=[0,0,1])
            if s:
                for line in s.discrete:a.plot(line[:,0],line[:,1],linewidth=.7)
            a.set(xlim=(-12,12),ylim=(-8,16),title=f'Z={z} mm',aspect='equal');a.grid()
        fig.savefig(ROOT/(name+'_sections.png'),dpi=140);plt.close(fig)
