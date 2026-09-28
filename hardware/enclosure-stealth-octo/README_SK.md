# AirGap Paste — Stealth Octo v1 (EDC Enclosure)

Tento model je presnou, funkčnou 3D konštrukciou navrhnutou na základe referenčného konceptu:
- **8-uholníkové stealth fazetované telo** s nízkym profilom a 45° zrazením hornej hrany.
- **Zapustená šachta pre MX spínač:** Odhaľuje transparentné telo mechanického spínača presne podľa obrázka, pričom zachováva plný zdvih klávesy 4,0 mm.
- **Plynule integrované EDC očko** na pravej strane pre prevlečenie krúžku na kľúče alebo karabínky.
- **Predná stena:** Presný výrez pre USB-C port dosky Seeed Studio XIAO ESP32-S3 a 2 otvory Ø 2,0 mm pre svetlovody stavových LED.
- **Pevné rozoberateľné uchytenie:** 2× zápustná skrutka M3 × 10 mm (DIN 963 / ISO 2009) zospodu do zapustených šesťhranných M3 matíc v hornom plášti.

---

## Prehľad dielov a rozmerov

| Diel | Súbor | Rozmery (Š × D × V) | Materiál / Farba |
| :--- | :--- | :--- | :--- |
| **Horný plášť** | `01_upper_shell_octo.stl` | 65,5 × 48,0 × 15,6 mm | PLA Basic (čierna) |
| **Spodná základňa** | `02_bottom_chassis_octo.stl` | 48,0 × 48,0 × 5,8 mm | PLA Basic (čierna) |
| **1U Fazetová klávesa** | `03_mx_keycap_octo.stl` | 18,4 × 18,4 × 7,2 mm | PLA Basic (čierna pre prototyp) |
| **Predné svetlovody** | `04_lightguides_octo.stl` | 19,0 × 7,0 × 2,0 mm | PLA Transparent / Clear |
| **Zostava (CAD)** | `assembly_stealth_octo.step` | 65,5 × 48,0 × 26,6 mm | Plná CAD zostava vrátane tolerancií |

---

## Nastavenie tlače pre Bambu Lab A1

- **Tlačiareň:** Bambu Lab A1 (tryska 0,4 mm)
- **Materiál:** Bambu PLA Basic (alebo PLA Tough / PLA-CF)
- **Výška vrstvy:** 0,16 mm alebo 0,20 mm Standard
- **Steny (Perimeters):** min. 3 steny (odporúčané 4 steny pre maximálnu tuhosť montážnej platne switchu)
- **Výplň (Infill):** 20 % Gyroid
- **Podpery (Supports):**
  - **Horný plášť (`01`):** Tlačí sa obrátený hornou plochou na PEI podložku. Vďaka 45° zrazeniam a stropným prechodom si vyžaduje iba minimálnu podporu pod bočným očkom (Build plate only, Snug).
  - **Spodná základňa (`02`):** 100% bez podpier (plochá základňa na podložke).
  - **Klávesa (`03`):** Tlačí sa hornou plôškou nadol na textúrovanú PEI podložku bez podpier.
  - **Svetlovody (`04`):** Bez podpier, položené naplocho.

> [!TIP]
> Pre dosiahnutie identického matného prémiového povrchu ako na referenčnej fotografii je možné v Bambu Studiu zapnúť funkciu **Fuzzy Skin** (Contour) s nastavením: *Fuzzy skin point distance: 0.3 mm*, *Fuzzy skin thickness: 0.1 mm*.

---

## Postup montáže

1. **Vloženie M3 matíc:** Do dvoch šesťhranných káps vo vežiach horného plášťa vložte 2× M3 matice (možno dotlačiť skrutkou alebo pinzetou).
2. **Osadenie MX switchu:** Do štvorcového otvoru 14,1 × 14,1 mm v hornom plášti zvrchu zacvaknite modrý MX spínač (orientovaný pinmi dozadu). Bočné plastové západky pevne zacvaknú do 1,5 mm hrubej platne.
3. **Zapojenie vodičov:** Z dvoch pinov switchu prispájkujte dva tenké izolované vodiče na piny **D1** (GPIO 1) a **GND** dosky Seeed Studio XIAO ESP32-S3.
4. **Vloženie svetlovodov a dosky:** Zvnútra vsuňte svetlovod do predných otvorov. Dosku Seeed XIAO ESP32-S3 vložte do lôžka v spodnej základni USB-C konektorom dopredu.
5. **Zoskrutkovanie:** Nasaďte horný plášť na spodnú základňu a zospodu zaskrutkujte 2× zápustné skrutky M3 × 10 mm. Hlavy skrutiek budú presne lícovať so spodnou rovinou.
6. **Nasadnutie klávesy:** Na krížový tŕň spínača zvrchu zatlačte vytlačenú klávesu.
