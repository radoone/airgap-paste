"""Create three build plates and one MX fit-test plate for the A1."""

from pathlib import Path
import json
import subprocess

ROOT = Path(__file__).resolve().parent
HARDWARE = ROOT.parent
PROFILES = ROOT / "print_profiles"
BASE_PROCESS = PROFILES / "process.json"
CLI = "/Applications/BambuStudio.app/Contents/MacOS/BambuStudio"
OUT = ROOT / "bambu_a1"
OUT.mkdir(exist_ok=True)

plates = (
    ("01_orbit_graphite_A1_PLA.3mf", ["01_shell.stl", "02_base.stl", "07_xiao_wedge.stl"], False),
    ("02_orbit_orange_A1_PLA.3mf", ["09_mx_snap_plate.stl", "03_keycap.stl", "04_halo.stl", "05_belt_left.stl", "05_belt_right.stl"], False),
    ("03_orbit_clear_A1_PLA.3mf", ["06_lightguide_left.stl", "06_lightguide_right.stl"], False),
    ("04_mx_fit_tests_A1_PLA.3mf", ["08_mx_snap_coupon_14p0.stl", "08_mx_snap_coupon_14p1.stl", "08_mx_snap_coupon_14p2.stl"], False),
)
summaries = []

for filename, filenames, supports in plates:
    process = json.loads(BASE_PROCESS.read_text())
    process.update({
        "name": "AirGap Orbit Puck A1 PLA",
        "from": "user",
        "enable_support": "1" if supports else "0",
        "support_type": "normal(auto)",
        "support_style": "snug",
        "support_on_build_plate_only": "1",
        "wall_loops": "3",
        "layer_height": "0.1" if filename.startswith(("02_", "04_")) else "0.2",
        "initial_layer_print_height": "0.1" if filename.startswith(("02_", "04_")) else "0.2",
        "sparse_infill_density": "20%",
        "sparse_infill_pattern": "gyroid",
    })
    work = OUT / filename.replace(".3mf", "")
    work.mkdir(exist_ok=True)
    process_file = work / "process.json"
    process_file.write_text(json.dumps(process, indent=2) + "\n")
    command = [
        CLI,
        "--load-settings", f"{PROFILES / 'machine.json'};{process_file}",
        "--load-filaments", str(PROFILES / "PLA.json"),
        "--arrange", "1", "--orient", "0", "--slice", "0",
        "--export-3mf", filename, "--outputdir", str(work),
        *[str(ROOT / part) for part in filenames],
    ]
    with (work / "slicer.log").open("w") as log:
        subprocess.run(command, cwd=work, stdout=log, stderr=subprocess.STDOUT, check=True)
    result = json.loads((work / "result.json").read_text())
    if result.get("return_code") != 0 or len(result.get("sliced_plates", [])) != 1:
        raise RuntimeError(result)
    plate = result["sliced_plates"][0]
    (OUT / filename).write_bytes((work / filename).read_bytes())
    summaries.append({
        "file": filename,
        "parts": filenames,
        "support_enabled": supports,
        "warning": plate.get("warning_message", ""),
        "print_time_minutes": round(plate["total_predication"] / 60, 1),
        "filament_grams": round(sum(f["total_used_g"] for f in plate["filaments"]), 2),
    })

(OUT / "plate_summary.json").write_text(json.dumps(summaries, indent=2) + "\n")
print(json.dumps(summaries, indent=2))
