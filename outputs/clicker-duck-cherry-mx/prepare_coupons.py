"""Place the test coupons into the valid head-only Bambu project."""
from build_cherry_mx import *
parts=[]
for i,tag in enumerate(['tight_1p25','standard_1p30','loose_1p35']):
    m=tm.load_mesh(ROOT/f'Fit_coupon_{tag}.stl')
    m.apply_translation([-15+i*15,CY,-11.6401024]);parts.append(m)
mesh=tm.util.concatenate(parts)
with zipfile.ZipFile(ROOT/'Head_Cherry_MX_A1_PETG.3mf') as z:
    data={n:z.read(n) for n in z.namelist()}
top=E.fromstring(data['3D/Objects/object_7.model'])
o=top.find('c:resources/c:object[@id="1"]',NS)
o.remove(o.find('c:mesh',NS));o.append(mesh_xml(mesh))
data['3D/Objects/object_7.model']=E.tostring(top,xml_declaration=True,encoding='UTF-8')
config=E.fromstring(data['Metadata/model_settings.config'])
o=config.find('object[@id="3"]')
o.find('metadata[@key="name"]').set('value','Cherry MX fit coupons 1.25 / 1.30 / 1.35 mm')
o.find('metadata[@face_count]').set('face_count',str(len(mesh.faces)))
o.find('part/metadata[@key="name"]').set('value','Fit coupons: 1 / 2 / 3 dots')
o.find('part/mesh_stat').set('face_count',str(len(mesh.faces)))
data['Metadata/model_settings.config']=E.tostring(config,xml_declaration=True,encoding='UTF-8')
with zipfile.ZipFile(ROOT/'Cherry_MX_fit_coupons_A1_PETG.3mf','w',zipfile.ZIP_DEFLATED) as z:
    for n,b in data.items():z.writestr(n,b)
