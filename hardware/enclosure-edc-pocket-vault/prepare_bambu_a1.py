"""Generate and actually slice support-free Bambu Lab A1 3MF projects."""

from pathlib import Path
import json
import subprocess

ROOT = Path(__file__).resolve().parent
PROFILE_SOURCE = ROOT.parent / "reference" / "profiles"
OUT = ROOT / "bambu_a1"
PROFILES = OUT / "profiles"
VALIDATION = OUT / "validation"
CLI = "/Applications/BambuStudio.app/Contents/MacOS/BambuStudio"

PROFILES.mkdir(parents=True, exist_ok=True)
VALIDATION.mkdir(parents=True, exist_ok=True)
(PROFILES / "machine.json").write_bytes((PROFILE_SOURCE / "machine.json").read_bytes())

tasks = [
    ("01_upper_shell_edc", "PLA", "Black", "01_bottom_filament.json", 0.20),
    ("02_bottom_chassis_edc", "PLA", "Black", "01_bottom_filament.json", 0.20),
    ("03_mx_keycap_translucent", "PETG", "Translucent", "02_top_filament.json", 0.16),
    ("04_lightguide_translucent", "PETG", "Translucent", "02_top_filament.json", 0.16),
    ("05_mx_fit_coupon", "PLA", "Black", "01_bottom_filament.json", 0.20),
    ("06_guard_left", "PLA", "Black", "01_bottom_filament.json", 0.20),
    ("07_guard_right", "PLA", "Black", "01_bottom_filament.json", 0.20),
]

summary = {}
for name, material, colour, filament_source, layer_height in tasks:
    key = f"{name}_{material}_{colour}"
    process = json.loads((PROFILE_SOURCE / "01_bottom_process.json").read_text())
    process.update(
        {
            "name": f"AirGap EDC Vault {name} A1 0.4",
            "from": "user",
            "enable_support": "0",
            "wall_loops": "3",
            "layer_height": str(layer_height),
            "sparse_infill_density": "20%",
            "sparse_infill_pattern": "gyroid",
            "outer_wall_speed": ["50"],
            "inner_wall_speed": ["90"],
            "top_shell_layers": "6",
            "bottom_shell_layers": "5",
            "brim_type": "no_brim",
        }
    )
    if "keycap" in name or "lightguide" in name:
        process.update(
            {
                "sparse_infill_density": "99%",
                "sparse_infill_pattern": "rectilinear",
                "top_surface_speed": ["30"],
            }
        )

    process_file = PROFILES / f"{key}_process.json"
    filament_file = PROFILES / f"{material}_{colour}.json"
    process_file.write_text(json.dumps(process, indent=2) + "\n")
    filament_file.write_bytes((PROFILE_SOURCE / filament_source).read_bytes())

    work = VALIDATION / key
    work.mkdir(parents=True, exist_ok=True)
    project_name = f"{name}_A1_{material}_{colour}.3mf"
    command = [
        CLI,
        "--load-settings",
        f"{PROFILES / 'machine.json'};{process_file}",
        "--load-filaments",
        str(filament_file),
        "--arrange",
        "1",
        "--orient",
        "0",
        "--slice",
        "0",
        "--export-3mf",
        project_name,
        "--outputdir",
        str(work),
        str(ROOT / f"{name}.stl"),
    ]
    with (work / "slicer.log").open("w") as log:
        subprocess.run(command, cwd=work, stdout=log, stderr=subprocess.STDOUT, check=True)

    result = json.loads((work / "result.json").read_text())
    if result.get("return_code") != 0:
        raise RuntimeError(result)
    plate = result["sliced_plates"][0]
    source_3mf = work / project_name
    (OUT / project_name).write_bytes(source_3mf.read_bytes())
    summary[key] = {
        "file": project_name,
        "material": material,
        "colour": colour,
        "layer_height_mm": layer_height,
        "supports": False,
        "print_time_minutes": round(plate["total_predication"] / 60, 1),
        "filament_grams": round(plate["filaments"][0]["total_used_g"], 2),
        "warning": plate.get("warning_message", ""),
    }
    print(f"{project_name}: {summary[key]}")

(OUT / "slice_summary.json").write_text(json.dumps(summary, indent=2) + "\n")
