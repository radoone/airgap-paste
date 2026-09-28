"""Create separate-color and one-plate Bambu Lab A1 prototype projects."""

from pathlib import Path
import json
import subprocess
from zipfile import ZipFile

ROOT = Path(__file__).resolve().parent
HARDWARE = ROOT.parent
PROFILES = HARDWARE / "prototype-plates-a1" / "profiles"
BASE_PROCESS = HARDWARE / "reference" / "profiles" / "01_bottom_process.json"
CLI = "/Applications/BambuStudio.app/Contents/MacOS/BambuStudio"
OUT = ROOT / "bambu_a1"
OUT.mkdir(exist_ok=True)

plates = (
    ("01_black_body_A1_PLA.3mf", ["01_upper_shell_octo.stl", "02_bottom_chassis_octo.stl"], True),
    ("02_orange_keycap_A1_PLA.3mf", ["03_mx_keycap_octo.stl"], False),
    ("03_clear_lightguides_A1_PLA.3mf", ["04_lightguides_octo.stl"], False),
    ("04_all_parts_one_plate_A1_PLA.3mf", [
        "01_upper_shell_octo.stl", "02_bottom_chassis_octo.stl",
        "03_mx_keycap_octo.stl", "04_lightguides_octo.stl",
    ], True),
)
summaries = []

for filename, filenames, supports in plates:
    process = json.loads(BASE_PROCESS.read_text())
    process.update({
        "name": "AirGap Photo Match A1 PLA",
        "from": "user",
        "enable_support": "1" if supports else "0",
        "support_type": "normal(auto)",
        "support_style": "snug",
        "support_on_build_plate_only": "1",
        "wall_loops": "3",
        "layer_height": "0.2",
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
    if filename == "04_all_parts_one_plate_A1_PLA.3mf":
        with ZipFile(OUT / filename) as archive:
            (OUT / "04_all_parts_plate_preview.png").write_bytes(
                archive.read("Metadata/plate_1.png"))
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
