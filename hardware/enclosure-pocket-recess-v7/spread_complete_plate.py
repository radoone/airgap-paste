"""Explicit 12 mm XY bounding-box gaps on Complete Test; preserve every mesh."""
from zipfile import ZipFile, ZIP_DEFLATED
from pathlib import Path
import xml.etree.ElementTree as ET
import numpy as np
import json
from itertools import combinations
GAP=12.0
NS='http://schemas.microsoft.com/3dmanufacturing/core/2015/02'
ET.register_namespace('',NS)
ET.register_namespace('p','http://schemas.microsoft.com/3dmanufacturing/production/2015/06')
ET.register_namespace('BambuStudio','http://schemas.bambulab.com/package/2021')
def footprints(z,xml):
    resources={o.attrib['id']:o for o in xml.findall('./{*}resources/{*}object')}
    found=[]
    for item in xml.findall('./{*}build/{*}item'):
        comp=resources[item.attrib['objectid']].find('./{*}components/{*}component')
        path=next(v for k,v in comp.attrib.items() if k.endswith('}path')).lstrip('/')
        model=ET.fromstring(z.read(path))
        vertices=np.array([[float(q.attrib[k]) for k in ('x','y','z')] for q in model.findall('.//{*}vertices/{*}vertex')])
        for el in (comp,item):
            tr=np.array(list(map(float,el.attrib['transform'].split()))).reshape(4,3)
            vertices=vertices@tr[:3]+tr[3]
        found.append((item,np.array([vertices.min(0)[:2],vertices.max(0)[:2]])))
    return found
def spread(source,destination):
    with ZipFile(source) as z:
        xml=ET.fromstring(z.read('3D/3dmodel.model'));objects=footprints(z,xml)
        rows=[objects[i:i+3] for i in range(0,len(objects),3)]
        heights=[max((b[1]-b[0])[1] for _,b in row) for row in rows]
        y=128-(sum(heights)+GAP*(len(rows)-1))/2
        for row,h in zip(rows,heights):
            widths=[(b[1]-b[0])[0] for _,b in row]
            x=128-(sum(widths)+GAP*(len(row)-1))/2
            for (item,b),w in zip(row,widths):
                t=np.array(list(map(float,item.attrib['transform'].split()))).reshape(4,3)
                t[3,:2]+=np.array([x+w/2,y+h/2])-(b[0]+b[1])/2
                item.attrib['transform']=' '.join(f'{v:.12g}' for v in t.ravel())
                x+=w+GAP
            y+=h+GAP
        # Drop stale thumbnails: Bambu regenerates them for the new placement.
        payload={n:z.read(n) for n in z.namelist() if not (n.startswith('Metadata/') and n.endswith('.png'))}
        payload['3D/3dmodel.model']=ET.tostring(xml,encoding='utf-8',xml_declaration=True)
    with ZipFile(destination,'w',ZIP_DEFLATED) as out:
        for n,b in payload.items():out.writestr(n,b)
def validate(path,expected_count=10):
    with ZipFile(path) as z:
        xml=ET.fromstring(z.read('3D/3dmodel.model'));objects=footprints(z,xml)
        settings=json.loads(z.read('Metadata/project_settings.config'))
        distances=[]
        for (ia,a),(ib,b) in combinations(enumerate([b for _,b in objects]),2):
            d=np.maximum(0,np.maximum(a[0]-b[1],b[0]-a[1]))
            distances.append({'objects':[ia+1,ib+1],'bounding_box_gap_mm':round(float(np.linalg.norm(d)),5)})
        gap=min(d['bounding_box_gap_mm'] for d in distances)
        assert len(objects)==expected_count and gap>=GAP-.002
        assert settings['print_sequence']=='by layer'
        assert all(np.all(b[0]>10) and np.all(b[1]<246) for _,b in objects)
        brim_width=float(settings['brim_width']) if settings['brim_type']!='no_brim' else 0.0
        brim_gap=float(settings['brim_object_gap']) if brim_width else 0.0
        return {'file':Path(path).name,'objects':len(objects),'print_sequence':'by layer',
                'minimum_full_height_XY_bounding_box_gap_mm':gap,
                'brim_width_mm':brim_width,'brim_object_gap_mm':brim_gap,
                'conservative_remaining_brim_gap_mm':round(gap-2*(brim_width+brim_gap),3),
                'pair_distances':distances}
if __name__=='__main__':
    import sys
    report=validate(sys.argv[1]);print(json.dumps(report,indent=2))
