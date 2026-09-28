# AirGap Paste — EDC Pocket Vault v1

Parametrický 3D model podľa vizuálneho smeru `renders/13_edc_pocket_vault.jpg`. Obrázok určuje tvar a charakter produktu; presné rozmery vychádzajú z komponentových podkladov v `hardware/reference/` a z hodnôt uvedených nižšie.

## Čo model obsahuje

- `01_upper_shell_edc` — horný plášť s dvoma ochrannými ramenami, MX otvorom, USB-C otvorom, stavovými otvormi a EDC očkom,
- `02_bottom_chassis_edc` — odnímateľná základňa s lôžkom XIAO ESP32-S3, držiakom LED, anténnou plochou a vedením káblov,
- `03_mx_keycap_translucent` — priesvitná klávesa s MX krížom a svetelnou komorou,
- `04_lightguide_translucent` — svetlovod medzi 5 mm LED a zadnou hranou klávesy,
- `05_mx_fit_coupon` — skúšobná mierka 14,00 / 14,10 / 14,20 mm pre konkrétnu sériu MX spínačov,
- `06_guard_left` a `07_guard_right` — vymeniteľné ochranné ramená s lisovacími kolíkmi; oddelenie od plášťa umožňuje tlač bez podpier,
- `08_paracord_cord_bead` — samostatný šnúrkový paracord korálik, dĺžka 12 mm a priechod Ø5 mm; prevlieka sa na šnúrku, nie je určený ako krúžok na kľúče,
- `assembly_edc_pocket_vault.step` — zostava s oficiálnym STEP modelom Seeed XIAO ESP32-S3.

## Presné návrhové rozmery

| Prvok | Rozmer |
|---|---:|
| Telo bez očka | 54,0 × 48,0 × 24,0 mm |
| MX montážny otvor | 14,10 × 14,10 mm |
| Hrúbka MX montážnej platne | 1,50 mm |
| Lôžko dosky | 22,80 × 20,80 mm |
| Nominálna doska XIAO | 20,95 × 17,78 × približne 4,85 mm |
| USB-C otvor | 13,20 × 7,00 mm |
| Otvor svetlovodu / LED | 5,55 / 5,35 mm |
| EDC otvor | Ø 5,0 mm |
| Spojenie | 4× M3×10 DIN 963 + 4× M3 DIN 934 |

## Zapojenie

- MX spínač: jeden kontakt na `D1 / GPIO1`, druhý na `GND`; vo firmware zapnúť interný pull-up.
- 5 mm LED: `D0` cez vhodný predradný rezistor (typicky 220 Ω pre bežnú LED) a `GND`.
- Anténa: originálna 2,4 GHz FPC anténa do U.FL konektora; nalepiť na zadnú vnútornú plochu mimo kovových skrutiek.

## Tlač na Bambu Lab A1

1. Najprv vytlačte `05_mx_fit_coupon.stl` z rovnakého materiálu a s rovnakým profilom ako plášť. Použite otvor, do ktorého spínač pevne zacvakne bez praskania steny. Predvolený model používa 14,10 mm.
2. Plášť tlačte hornou plochou na podložke. Základňu tlačte spodnou plochou na podložke. Klávesu aj ochranné ramená tlačte hornou plochou na podložke. Svetlovod tlačte naležato. Dodané STL už majú tieto orientácie.
3. Základný profil: A1, tryska 0,4 mm, vrstva 0,20 mm; klávesa a svetlovod 0,12–0,16 mm; 3 steny; 20 % gyroid; bez podpier.
4. Plášť a základňa: PLA/PETG. Klávesa a svetlovod: translucent PETG alebo natural PETG. Dodaný A1 profil používa na optické diely 99 % priamočiaru výplň (Bambu Studio odmieta gyroid pri 100 %) a 3 steny.

## Montáž

1. Vložte MX spínač zhora do 1,50 mm platne.
2. Vložte 5 mm LED do držiaka, nasuňte svetlovod a skontrolujte, že zadná hrana klávesy nad ním voľne chodí.
3. XIAO zasuňte do bočných líšt USB-C konektorom k prednému otvoru. Vodiče veďte cez odľahčovacie drážky.
4. Nalepte FPC anténu na zadnú plochu a dodržte voľný ohyb koaxiálneho kábla.
5. Do horného plášťa vložte 4 matice M3. Priložte spodný diel a rovnomerne dotiahnite 4 zápustné skrutky M3×10.

## Stav overenia

Model má programovo overenú platnosť telies, rozmery a základné kolízie voči konzervatívnym obálkam komponentov. STEP zostava obsahuje oficiálny model XIAO. To ešte nenahrádza skúšobnú tlač: konkrétny MX klon, USB kábel, svietivosť/difúzia LED, U.FL kábel, pevnosť očka a presná dĺžka skrutiek sa musia potvrdiť fyzickým prototypom.
