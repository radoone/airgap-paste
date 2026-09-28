"""Create one ready-to-print Bambu Lab A1 plate per AirGap Paste prototype."""

from pathlib import Path
import json
import subprocess

HARDWARE = Path(__file__).resolve().parent
REFERENCE = HARDWARE / "reference" / "profiles"
EDC = HARDWARE / "enclosure-edc-pocket-vault"
MINI = HARDWARE / "enclosure-mini"
HEX = HARDWARE / "enclosure-hex-node"
OUT = HARDWARE / "prototype-plates-a1"
PROFILES = OUT / "profiles"
VALIDATION = OUT / "validation"
CLI = "/Applications/BambuStudio.app/Contents/MacOS/BambuStudio"

PROFILES.mkdir(parents=True, exist_ok=True)
VALIDATION.mkdir(parents=True, exist_ok=True)
(PROFILES / "machine.json").write_bytes((REFERENCE / "machine.json").read_bytes())
(PROFILES / "PLA.json").write_bytes((REFERENCE / "01_bottom_filament.json").read_bytes())

plates = [
    {
        "key": "01_edc_pocket_vault_all_parts",
        "project": "01_EDC_Pocket_Vault_ALL_PARTS_A1_PLA.3mf",
        "supports": False,
        "parts": [
            EDC / "01_upper_shell_edc.stl",
            EDC / "02_bottom_chassis_edc.stl",
            EDC / "03_mx_keycap_translucent.stl",
            EDC / "04_lightguide_translucent.stl",
            EDC / "06_guard_left.stl",
            EDC / "07_guard_right.stl",
            EDC / "08_paracord_cord_bead.stl",
        ],
        "note": "Seven assembly parts on one plate, including a printable paracord cord bead; MX fit coupon intentionally excluded.",
    },
    {
        "key": "02_mini_v3_all_parts",
        "project": "02_Mini_v3_ALL_PARTS_A1_PLA.3mf",
        "supports": True,
        "parts": [
            MINI / "01_shell_mini.stl",
            MINI / "02_top_button_mini.stl",
            MINI / "03_bottom_base_mini.stl",
        ],
        "note": "Three Mini v3 assembly parts on one plate; snug build-plate-only supports enabled for the electronics chassis.",
    },
    {
        "key": "03_hex_node_all_parts",
        "project": "03_Hex_Node_COMPACT_v2_ALL_PARTS_A1_PLA.3mf",
        "supports": True,
        "parts": [
            HEX / "01_upper_shell_hex.stl",
            HEX / "02_bottom_chassis_hex.stl",
            HEX / "03_mx_keycap_hex.stl",
            HEX / "04_lightguide_hex.stl",
        ],
        "note": "Four Compact Hex Node v2 printed parts on one plate; snug support under the side loop. MX fit coupon intentionally excluded. Hardware is fitted after printing.",
    },
]

summary = {}
for plate in plates:
    missing = [str(path) for path in plate["parts"] if not path.exists()]
    if missing:
        raise FileNotFoundError(f"Missing plate inputs: {missing}")

    process = json.loads((REFERENCE / "01_bottom_process.json").read_text())
    process.update(
        {
            "name": f"AirGap {plate['key']} A1 0.4 single material",
            "from": "user",
            "enable_support": "1" if plate["supports"] else "0",
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
        }
    )
    process_file = PROFILES / f"{plate['key']}_process.json"
    process_file.write_text(json.dumps(process, indent=2) + "\n")

    work = VALIDATION / plate["key"]
    work.mkdir(parents=True, exist_ok=True)
    command = [
        CLI,
        "--load-settings",
        f"{PROFILES / 'machine.json'};{process_file}",
        "--load-filaments",
        str(PROFILES / "PLA.json"),
        "--arrange",
        "1",
        "--orient",
        "0",
        "--slice",
        "0",
        "--export-3mf",
        plate["project"],
        "--outputdir",
        str(work),
        *[str(path) for path in plate["parts"]],
    ]
    with (work / "slicer.log").open("w") as log:
        subprocess.run(command, cwd=work, stdout=log, stderr=subprocess.STDOUT, check=True)

    result = json.loads((work / "result.json").read_text())
    if result.get("return_code") != 0:
        raise RuntimeError(result)
    sliced = result["sliced_plates"]
    if len(sliced) != 1:
        raise RuntimeError(f"{plate['key']} was arranged onto {len(sliced)} plates, expected exactly one")
    data = sliced[0]
    warning = data.get("warning_message", "")
    if warning:
        raise RuntimeError(f"{plate['key']} slicer warning: {warning}")

    source = work / plate["project"]
    destination = OUT / plate["project"]
    destination.write_bytes(source.read_bytes())
    summary[plate["key"]] = {
        "file": plate["project"],
        "plate_count": 1,
        "object_count": len(plate["parts"]),
        "material": "PLA single material",
        "layer_height_mm": 0.2,
        "supports": plate["supports"],
        "print_time_minutes": round(data["total_predication"] / 60, 1),
        "filament_grams": round(sum(item["total_used_g"] for item in data["filaments"]), 2),
        "warning": warning,
        "note": plate["note"],
    }
    print(json.dumps({plate["key"]: summary[plate["key"]]}, indent=2))

(OUT / "plate_summary.json").write_text(json.dumps(summary, indent=2) + "\n")
