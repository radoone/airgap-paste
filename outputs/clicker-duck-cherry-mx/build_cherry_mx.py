"""Modify only the duck head socket; preserve its position and removable support."""
from inspect_model import *
import json, hashlib

CY=4.1354123
MOUTH=-7.84010315
DEPTH=4.2
LENGTH=4.2
CORE='http://schemas.microsoft.com/3dmanufacturing/core/2015/02'
def box(extents,center):
    m=tm.creation.box(extents=extents);m.apply_translation(center);return m
def tapered_box(a,b,z0,z1):
    # Square/rectangular lead-in, with a larger opening at the socket mouth.
    v=np.array([[-a[0]/2,-a[1]/2,z0],[a[0]/2,-a[1]/2,z0],[a[0]/2,a[1]/2,z0],[-a[0]/2,a[1]/2,z0],
                [-b[0]/2,-b[1]/2,z1],[b[0]/2,-b[1]/2,z1],[b[0]/2,b[1]/2,z1],[-b[0]/2,b[1]/2,z1]])
    f=[[0,2,1],[0,3,2],[4,5,6],[4,6,7],[0,1,5],[0,5,4],[1,2,6],[1,6,5],[2,3,7],[2,7,6],[3,0,4],[3,4,7]]
    m=tm.Trimesh(v,f,process=True);m.apply_translation([0,CY,0]);return m
def socket(w):
    items=[]
    for dims in [(LENGTH,w),(w,LENGTH)]:
        items.append(box([*dims,DEPTH+.002],[0,CY,MOUTH+DEPTH/2]))
        items.append(tapered_box((dims[0]+.30,dims[1]+.30),dims,MOUTH-.001,MOUTH+.30))
    return tm.boolean.union(items,engine='manifold')
def mesh_xml(mesh):
    el=E.Element('{'+CORE+'}mesh')
    vs=E.SubElement(el,'{'+CORE+'}vertices')
    for p in mesh.vertices:E.SubElement(vs,'{'+CORE+'}vertex',**{k:f'{x:.8f}' for k,x in zip(('x','y','z'),p)})
    fs=E.SubElement(el,'{'+CORE+'}triangles')
    for f in mesh.faces:E.SubElement(fs,'{'+CORE+'}triangle',**{k:str(int(x)) for k,x in zip(('v1','v2','v3'),f)})
    return el
def simple_3mf(meshes,path):
    r=E.Element('{'+CORE+'}model',nsmap={None:CORE},unit='millimeter')
    res=E.SubElement(r,'{'+CORE+'}resources');build=E.SubElement(r,'{'+CORE+'}build')
    for i,(name,m) in enumerate(meshes,1):
        ob=E.SubElement(res,'{'+CORE+'}object',id=str(i),type='model',name=name);ob.append(mesh_xml(m))
        E.SubElement(build,'{'+CORE+'}item',objectid=str(i))
    with zipfile.ZipFile(path,'w',zipfile.ZIP_DEFLATED) as z:
        z.writestr('[Content_Types].xml','<?xml version="1.0"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="model" ContentType="application/vnd.ms-package.3dmanufacturing-3dmodel+xml"/></Types>')
        z.writestr('_rels/.rels','<?xml version="1.0"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Target="/3D/3dmodel.model" Id="rel0" Type="http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel"/></Relationships>')
        z.writestr('3D/3dmodel.model',E.tostring(r,xml_declaration=True,encoding='UTF-8'))

def main():
    meshes=load()
    raw=tm.boolean.union(meshes[1].split(),engine='manifold')
    neg_parts=meshes[2].split(only_watertight=False)
    transform=np.array([[1,0,0,0],[0,-1,0,CY],[0,0,-1,-6.64010239],[0,0,0,1]])
    # Part 0 was the oversized cross; parts 1 and 2 retain the external pocket
    # and the 0.30 mm release gap above the original sacrificial support.
    retained=[]
    for p in neg_parts[1:]:p.apply_transform(transform);retained.append(p)
    pocketed=tm.boolean.difference([raw,*retained],engine='manifold')
    reports={}
    coupons=[]
    for i,(name,w) in enumerate([('tight_1p25',1.25),('standard_1p30',1.30),('loose_1p35',1.35)]):
        head=tm.boolean.difference([pocketed,socket(w)],engine='manifold')
        parts=sorted(head.split(),key=lambda p:p.volume,reverse=True)
        assert len(parts)==2 and parts[0].is_volume and parts[1].is_volume
        model=parts[0]
        # Validate the only exterior change is internal to the 17 mm square pocket.
        assert np.allclose(head.bounds,raw.bounds,atol=1e-5)
        print(name,'volumes',[(p.volume,p.bounds.tolist()) for p in parts],flush=True)
        printable=head.copy();printable.apply_translation([0,0,11.6401024])
        printable.export(ROOT/f'Head_Cherry_MX_{name}.stl')
        modelonly=model.copy();modelonly.apply_translation([0,0,11.6401024]);modelonly.export(ROOT/f'Head_Cherry_MX_{name}_no_builtin_support.stl')
        reports[name]={'cross_length_mm':LENGTH,'cross_arm_width_mm':w,'socket_depth_mm':DEPTH,
                       'entry_chamfer_mm':.30,'mouth_height_from_head_underside_mm':MOUTH+11.6401024,
                       'watertight':bool(head.is_watertight),'solid_count':len(parts),'main_volume_mm3':model.volume,
                       'support_volume_mm3':parts[1].volume,'same_outer_bounds':True}
        # Test puck, socket points up for support-free printing; three dots identify
        # tight/standard/loose. Matching socket geometry and same outer sleeve.
        puck=box([10,10,6.2],[0,CY,MOUTH+3.1])
        puck=tm.boolean.difference([puck,socket(w)],engine='manifold')
        puck.apply_transform(np.array([[1,0,0,0],[0,-1,0,0],[0,0,-1,0],[0,0,0,1]]))
        puck.apply_translation([0,0,-puck.bounds[0,2]])
        dots=[]
        for d in range(i+1):
            c=tm.creation.cylinder(radius=.5,height=.5,sections=24);c.apply_translation([-3+d*1.5,-CY+3.4,6.15]);dots.append(c)
        puck=tm.boolean.difference([puck,*dots],engine='manifold')
        puck.export(ROOT/f'Fit_coupon_{name}.stl')
        puck.apply_translation([90+i*15,105+CY,0]);coupons.append((name,puck))
        if i==1:standard=head;standardmodel=model
    simple_3mf(coupons,ROOT/'Cherry_MX_fit_coupons.3mf')
    # Bake the revised head/support into its original normal part. The duck body
    # and its negative volume, object transforms, plate and print settings survive.
    with zipfile.ZipFile(SRC) as zi:
        top=E.fromstring(zi.read('3D/Objects/object_7.model'))
        obj=top.find('c:resources/c:object[@id="1"]',NS)
        old=obj.find('c:mesh',NS);obj.remove(old);obj.append(mesh_xml(standard))
        top.find('c:resources',NS).remove(top.find('c:resources/c:object[@id="2"]',NS))
        root=E.fromstring(zi.read('3D/3dmodel.model'))
        comps=root.find('c:resources/c:object[@id="3"]/c:components',NS)
        comps.remove(comps.find('c:component[@objectid="2"]',NS))
        config=E.fromstring(zi.read('Metadata/model_settings.config'))
        objconfig=config.find('object[@id="3"]')
        objconfig.remove(objconfig.find('part[@id="2"]'))
        objconfig.find('metadata[@key="name"]').set('value','Duck head - Cherry MX 1.30 mm')
        objconfig.find('metadata[@face_count]').set('face_count',str(len(standard.faces)))
        part=objconfig.find('part[@id="1"]')
        part.find('metadata[@key="name"]').set('value','Duck head - Cherry MX with removable support')
        part.find('mesh_stat').set('face_count',str(len(standard.faces)))
        replacements={'3D/Objects/object_7.model':E.tostring(top,xml_declaration=True,encoding='UTF-8'),
                      '3D/3dmodel.model':E.tostring(root,xml_declaration=True,encoding='UTF-8'),
                      'Metadata/model_settings.config':E.tostring(config,xml_declaration=True,encoding='UTF-8')}
        with zipfile.ZipFile(ROOT/'Clicker_Duck_Cherry_MX.3mf','w',zipfile.ZIP_DEFLATED) as zo:
            for info in zi.infolist():zo.writestr(info,replacements.get(info.filename,zi.read(info.filename)))
    body=meshes[4].copy();body.apply_translation([-2.86102295e-06,1.03534508,-11.2895203])
    bodyneg=meshes[5].copy();bodyneg.apply_translation([0,-7.81060487,7.91257064])
    body=tm.boolean.union(body.split(),engine='manifold')
    body=tm.boolean.difference([body,bodyneg],engine='manifold')
    body.apply_translation([0,0,34.7708016])
    body.export(ROOT/'Body_original_effective.stl')
    print('body',body.is_volume,len(body.split()),flush=True)
    reports['validation']={'source_sha256':hashlib.sha256(SRC.read_bytes()).hexdigest(),
        'body_mesh_and_transform_preserved_in_project':True,
        'actual_switch_travel_verified':False,'physical_fit_tested':False}
    (ROOT/'validation.json').write_text(json.dumps(reports,indent=2)+'\n')
    fig,ax=plt.subplots(figsize=(7,7))
    sec=standardmodel.section([0,0,1],[0,CY,MOUTH+.8])
    for line in sec.discrete:ax.plot(line[:,0],line[:,1]-CY,lw=1.6,color='#c68400')
    ax.set(xlim=(-5,5),ylim=(-5,5),aspect='equal',xlabel='mm',ylabel='mm',title='Cherry MX head socket: 4.20 × 1.30 mm')
    ax.grid(alpha=.3);fig.savefig(ROOT/'socket_section.png',dpi=180);plt.close(fig)

if __name__=='__main__':main()
