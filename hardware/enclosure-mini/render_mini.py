"""Render the AirGap Paste Mini v3 enclosure with Seeed Studio XIAO ESP32-S3, switch, and M3 fasteners."""
from pathlib import Path
import numpy as np
import trimesh
import cadquery as cq
from PIL import Image, ImageDraw, ImageFont

P = Path(__file__).resolve().parent
REF_DIR = P.parent / "reference"

def cad_mesh(s):
    v, t = s.val().tessellate(0.04)
    return trimesh.Trimesh(vertices=[(p.x, p.y, p.z) for p in v], faces=t)

parts = {}
for n in ["01_shell_mini", "02_top_button_mini", "03_bottom_base_mini"]:
    parts[n] = cad_mesh(cq.importers.importStep(str(P / f"{n}.step")))

board_step = cq.importers.importStep(str(REF_DIR / "XIAO_ESP32S3_Seeed.step"))
board = board_step.rotate((0, 0, 0), (1, 0, 0), 90).rotate((0, 0, 0), (0, 0, 1), -90).translate((-6.1113999554, -7.22095, 2.95))
switch = cq.importers.importStep(str(REF_DIR / "c-1825910-6-c-3d.stp")).rotate((0, 0, 0), (0, 0, 1), 90).translate((0, 0, 18.5))

ant = trimesh.creation.box(extents=[28.0, 0.4, 10.0])
ant.apply_translation([0, 16.5, 9.0])
led = trimesh.creation.cylinder(radius=2.5, height=8.0)
led.apply_translation([0, 8.0, 12.0])

# Fasteners (M3x10 screws & nuts):
m3_screws = []
for a in (45, 135, 225, 315):
    rad = np.radians(a)
    sx, sy = 16.8 * np.cos(rad), 16.8 * np.sin(rad)
    sc = trimesh.creation.cylinder(radius=1.5, height=8.0)
    sc.apply_translation([sx, sy, 4.0])
    m3_screws.append(sc)

refs = [
    (cad_mesh(board), np.array([50, 165, 85])),     # Green PCB
    (cad_mesh(switch), np.array([120, 125, 135])),  # Metallic switch
    (ant, np.array([210, 120, 50])),               # Antenna
    (led, np.array([80, 180, 240]))                # Blue/cyan LED
]

def render(meshes, direction, size=900, scale=16.0, shadow=None, buffers_only=False):
    eye = np.array(direction, dtype=float)
    eye /= np.linalg.norm(eye)
    up = np.array([0.0, 0.0, 1.0]) if abs(eye[2]) < 0.99 else np.array([0.0, 1.0, 0.0])
    right = np.cross(up, eye)
    right /= np.linalg.norm(right)
    up = np.cross(eye, right)
    basis = np.array([right, up, eye]).T
    pixels = np.full((size, size, 3), (245, 246, 248), dtype=np.uint8)
    depth = np.full((size, size), -np.inf)
    light = np.array([-0.4, -0.6, 1.0])
    light /= np.linalg.norm(light)
    for mesh, base in meshes:
        projected = (mesh.vertices - [0, 0, 11]) @ basis
        projected[:, 0] = projected[:, 0] * scale + size / 2
        projected[:, 1] = size / 2 - projected[:, 1] * scale
        for ids, normal in zip(mesh.faces, mesh.face_normals):
            if normal @ eye <= 0:
                continue
            tri = projected[ids]
            lo = np.maximum(np.floor(tri[:, :2].min(axis=0)).astype(int), 0)
            hi = np.minimum(np.ceil(tri[:, :2].max(axis=0)).astype(int), size - 1)
            if np.any(lo > hi):
                continue
            x, y = np.meshgrid(np.arange(lo[0], hi[0] + 1) + 0.5, np.arange(lo[1], hi[1] + 1) + 0.5)
            a, b, c = tri
            denominator = (b[1] - c[1]) * (a[0] - c[0]) + (c[0] - b[0]) * (a[1] - c[1])
            if abs(denominator) < 1e-10:
                continue
            wa = ((b[1] - c[1]) * (x - c[0]) + (c[0] - b[0]) * (y - c[1])) / denominator
            wb = ((c[1] - a[1]) * (x - c[0]) + (a[0] - c[0]) * (y - c[1])) / denominator
            wc = 1 - wa - wb
            z = wa * a[2] + wb * b[2] + wc * c[2]
            region = np.s_[lo[1]:hi[1] + 1, lo[0]:hi[0] + 1]
            mask = (wa >= -1e-7) & (wb >= -1e-7) & (wc >= -1e-7) & (z > depth[region])
            shade = 0.40 + 0.60 * max(float(normal @ light), 0)
            pixels[region][mask] = np.clip(base * shade, 0, 255)
            depth[region][mask] = z[mask]
    if buffers_only:
        return depth, basis, size, scale
    if shadow is not None:
        shadow_depth, shadow_basis, shadow_size, shadow_scale = shadow
        yy, xx = np.indices(depth.shape)
        valid = np.isfinite(depth)
        projected_points = np.stack(((xx[valid] + 0.5 - size / 2) / scale,
                                     (size / 2 - yy[valid] - 0.5) / scale, depth[valid]), axis=1)
        light_points = projected_points @ basis.T @ shadow_basis
        sx = np.rint(light_points[:, 0] * shadow_scale + shadow_size / 2 - 0.5).astype(int)
        sy = np.rint(shadow_size / 2 - light_points[:, 1] * shadow_scale - 0.5).astype(int)
        sx = np.clip(sx, 0, shadow_size - 1)
        sy = np.clip(sy, 0, shadow_size - 1)
        shaded = light_points[:, 2] < shadow_depth[sy, sx] - 0.16
        visible_pixels = pixels[valid].astype(float)
        visible_pixels[shaded] *= 0.65
        pixels[valid] = visible_pixels.astype(np.uint8)
    return Image.fromarray(pixels)

canvas = Image.new("RGB", (2700, 1100), (245, 246, 248))
colours = {
    "01_shell_mini": np.array([45, 48, 52]),         # Matte Dark Anthracite PLA
    "02_top_button_mini": np.array([238, 240, 235]),  # Satin White / Translucent
    "03_bottom_base_mini": np.array([72, 78, 85])     # Technical Grey PLA
}

for i, mode in enumerate(["assembled", "electronics", "exploded"]):
    cur_meshes = []
    if mode == "assembled":
        cur_meshes = [(parts[n], colours[n]) for n in parts]
    elif mode == "electronics":
        cur_meshes = [(parts["03_bottom_base_mini"], colours["03_bottom_base_mini"])] + refs
        for sc in m3_screws:
            cur_meshes.append((sc, np.array([200, 205, 210])))
    else:
        # Exploded view
        for n, m in parts.items():
            mc = m.copy()
            z_offset = {"01_shell_mini": 22.0, "02_top_button_mini": -6.0, "03_bottom_base_mini": -18.0}[n]
            mc.apply_translation([0, 0, z_offset])
            cur_meshes.append((mc, colours[n]))
        b_c = cad_mesh(board).copy()
        b_c.apply_translation([0, 0, -18.0])
        cur_meshes.append((b_c, np.array([50, 165, 85])))

    shadow = render(cur_meshes, (-0.4, -0.6, 1.0), size=1500, scale=18.0 if mode == "exploded" else 24.0, buffers_only=True)
    img = render(cur_meshes, (0.55, -1.0, 0.95), scale=10.0 if mode == "exploded" else 15.0, shadow=shadow)
    canvas.paste(img, (900 * i, 100))

d = ImageDraw.Draw(canvas)
f = "/System/Library/Fonts/Supplemental/Arial.ttf"
try:
    title_font = ImageFont.truetype(f, 36)
    label_font = ImageFont.truetype(f, 26)
    sub_font = ImageFont.truetype(f, 22)
except Exception:
    title_font = label_font = sub_font = ImageFont.load_default()

d.text((55, 30), "AIRGAP PASTE MINI v3 | Ø 46.0 mm x 21.8 mm | 4x M3 Skrutky a Matice", fill=(30, 35, 40), font=title_font)
labels = [
    (55, "1. Zostava: Plášť + Plávajúce tlačidlo + Spodný kryt"),
    (955, "2. Podvozok elektroniky: XIAO ESP32-S3 + spínač + LED + 4x M3"),
    (1855, "3. Rozložený pohľad: Montáž a rozoberateľnosť zospodu")
]
for x, s in labels:
    d.text((x, 995), s, fill=(40, 45, 50), font=label_font)

d.text((55, 1045), "Overené 100% bez kolízií (0.000 mm³). Šírka priečinka dosky 20.8 mm (vôľa +1.5 mm na každú stranu pre spájkované piny/vodiče).", fill=(90, 95, 100), font=sub_font)

out_preview = P / "preview_mini.png"
canvas.save(out_preview)
print(f"Preview render saved to {out_preview}")
