"""Create separate, reproducible Bambu Studio A1 projects for AirGap Paste Mini v3."""
from pathlib import Path
import json, subprocess

P = Path(__file__).resolve().parent
PROFILES_SRC = P.parent / "reference" / "profiles"
OUT = P / "bambu_a1"
OUT.mkdir(exist_ok=True)
PROFILES = OUT / "profiles"
PROFILES.mkdir(exist_ok=True)
CLI = "/Applications/BambuStudio.app/Contents/MacOS/BambuStudio"

(PROFILES / "machine.json").write_bytes((PROFILES_SRC / "machine.json").read_bytes())

summary = {}
tasks = [
    ("01_shell_mini", "PLA", "Black", False),
    ("02_top_button_mini", "PETG", "Translucent", False),
    ("02_top_button_mini", "PLA", "White", False),
    ("03_bottom_base_mini", "PLA", "Black", True) # snug supports for switch shelf
]

for name, material, color_suffix, need_support in tasks:
    key = f"{name}_{material}_{color_suffix}"
    profile = json.loads((PROFILES_SRC / "01_bottom_process.json").read_text())
    profile.update({
        "name": f"AirGap Mini v3 {name} A1 0.4",
        "from": "user",
        "enable_support": "1" if need_support else "0",
        "wall_loops": "3",
        "layer_height": "0.2",
        "support_type": "normal(auto)",
        "support_style": "snug",
        "support_on_build_plate_only": "1",
        "support_top_z_distance": "0.2",
        "support_interface_top_layers": "3",
        "outer_wall_speed": ["50"],
        "inner_wall_speed": ["90"],
        "brim_type": "no_brim",
        "top_shell_layers": "6",
        "bottom_shell_layers": "5"
    })
    if "button" in name:
        profile.update({
            "top_shell_layers": "8",
            "bottom_shell_layers": "6",
            "top_surface_speed": ["30"]
        })
    proc_file = PROFILES / f"{key}_process.json"
    proc_file.write_text(json.dumps(profile, indent=2))

    fil_src = "02_top_filament.json" if material == "PETG" else ("02_top_filament_bambu_pla.json" if color_suffix == "White" else "01_bottom_filament.json")
    fil_file = PROFILES / f"{material}_{color_suffix}.json"
    fil_file.write_bytes((PROFILES_SRC / fil_src).read_bytes())

    work = OUT / "validation" / key
    work.mkdir(parents=True, exist_ok=True)
    out_3mf_name = f"{name}_A1_{material}_{color_suffix}.3mf"

    cmd = [
        CLI,
        "--load-settings", f"{PROFILES / 'machine.json'};{proc_file}",
        "--load-filaments", str(fil_file),
        "--arrange", "1",
        "--orient", "0",
        "--slice", "0",
        "--export-3mf", out_3mf_name,
        "--outputdir", str(work),
        str(P / f"{name}.stl")
    ]

    with (work / "slicer.log").open("w") as log:
        subprocess.run(cmd, cwd=work, stdout=log, stderr=subprocess.STDOUT, check=True)

    result = json.loads((work / "result.json").read_text())
    assert result["return_code"] == 0, result
    plate = result["sliced_plates"][0]
    out_project = work / out_3mf_name
    (OUT / out_3mf_name).write_bytes(out_project.read_bytes())

    summary[key] = {
        "file": out_3mf_name,
        "material": material,
        "color": color_suffix,
        "print_time_minutes": round(plate["total_predication"] / 60, 1),
        "filament_grams": round(plate["filaments"][0]["total_used_g"], 2),
        "warning": plate.get("warning_message", "")
    }
    print(f"Generated {out_3mf_name}: {summary[key]['print_time_minutes']} min, {summary[key]['filament_grams']} g")

(OUT / "slice_summary.json").write_text(json.dumps(summary, indent=2))
print("All 3MF projects generated successfully!")
