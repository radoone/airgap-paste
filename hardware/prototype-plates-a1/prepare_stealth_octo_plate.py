"""Generate ready-to-print Bambu Lab A1 3MF plate for Stealth Octo."""

from pathlib import Path
import json, subprocess

HARDWARE = Path("/Users/radoone/Documents/airgap paste/hardware").resolve()
REFERENCE = HARDWARE / "reference" / "profiles"
STEALTH = HARDWARE / "enclosure-stealth-octo"
OUT = HARDWARE / "prototype-plates-a1"
PROFILES = OUT / "profiles"
VALIDATION = OUT / "validation"
CLI = "/Applications/BambuStudio.app/Contents/MacOS/BambuStudio"

PROFILES.mkdir(parents=True, exist_ok=True)
VALIDATION.mkdir(parents=True, exist_ok=True)

parts = [
    STEALTH / "01_upper_shell_octo.stl",
    STEALTH / "02_bottom_chassis_octo.stl",
    STEALTH / "03_mx_keycap_octo.stl",
    STEALTH / "04_lightguides_octo.stl",
]

missing = [str(p) for p in parts if not p.exists()]
if missing:
    raise FileNotFoundError(f"Missing parts: {missing}")

# Process profile for Bambu Lab A1
process = json.loads((REFERENCE / "01_bottom_process.json").read_text())
process.update({
    "name": "AirGap Stealth Octo A1 0.4 PLA",
    "from": "user",
    "enable_support": "1",
    "support_type": "normal(auto)",
    "support_style": "snug",
    "support_on_build_plate_only": "1",
    "support_top_z_distance": "0.2",
    "support_interface_top_layers": "3",
    "wall_loops": "3",
    "layer_height": "0.2",
    "sparse_infill_density": "20%",
    "sparse_infill_pattern": "gyroid",
    "outer_wall_speed": ["50"],
    "inner_wall_speed": ["90"],
    "top_shell_layers": "6",
    "bottom_shell_layers": "5",
    "brim_type": "no_brim",
})

process_file = PROFILES / "stealth_octo_process.json"
process_file.write_text(json.dumps(process, indent=2) + "\n")

work = VALIDATION / "stealth_octo"
work.mkdir(parents=True, exist_ok=True)

project_name = "04_Stealth_Octo_ALL_PARTS_A1_PLA.3mf"

command = [
    CLI,
    "--load-settings", f"{PROFILES / 'machine.json'};{process_file}",
    "--load-filaments", str(PROFILES / "PLA.json"),
    "--arrange", "1",
    "--orient", "0",
    "--slice", "0",
    "--export-3mf", project_name,
    "--outputdir", str(work),
    *[str(p) for p in parts],
]

print("Running BambuStudio CLI to slice and export 3MF...")
with (work / "slicer.log").open("w") as log:
    subprocess.run(command, cwd=work, stdout=log, stderr=subprocess.STDOUT, check=True)

result = json.loads((work / "result.json").read_text())
if result.get("return_code") != 0:
    raise RuntimeError(result)

sliced = result["sliced_plates"]
if len(sliced) != 1:
    raise RuntimeError(f"Expected 1 plate, got {len(sliced)}")

data = sliced[0]
warning = data.get("warning_message", "")
if warning:
    print(f"Warning: {warning}")

source = work / project_name
destination = OUT / project_name
destination.write_bytes(source.read_bytes())

summary = {
    "file": project_name,
    "plate_count": 1,
    "object_count": len(parts),
    "material": "Bambu PLA Basic (Single Color)",
    "layer_height_mm": 0.2,
    "supports": True,
    "support_note": "Snug build-plate-only supports under the right carry loop",
    "print_time_minutes": round(data["total_predication"] / 60, 1),
    "filament_grams": round(sum(item["total_used_g"] for item in data["filaments"]), 2),
    "warning": warning,
    "path": str(destination),
}

print(json.dumps(summary, indent=2))
(OUT / "stealth_octo_plate_summary.json").write_text(json.dumps(summary, indent=2) + "\n")
print(f"Successfully generated {destination}")
