# AirGap Paste Compact Hex Node v2

Tento model nadväzuje na konceptný obrázok z 23. 9. 2026: plochá šesťuholníková predná stena s USB-C a dvoma indikátormi, zošikmený horný obvod, hranatá oranžová MX klávesa bez nápisu a integrované bočné očko. Obrázok nemá mierku a neukazuje vnútro; rozmery vonkajšieho tvaru sú preto návrhové, nie odmerané z výrobku.

## Rozmery a súčiastky

| Položka | Návrh / stav |
| --- | --- |
| Telo bez očka | 48,0 mm cez prednú a zadnú plochu; 55,1 mm cez bočné vrcholy |
| Celok s očkom | 67,7 × 48,0 × 31,3 mm vrátane klávesy |
| Riadiaca doska | Seeed Studio XIAO ESP32-S3; uloženie kontrolované proti lokálnemu oficiálnemu STEP súboru |
| Spínač | 1× mechanický spínač štýlu MX, 3-pin; otvor 14,10 × 14,10 mm, platňa 1,50 mm; presný kus ešte treba odmerať |
| Klávesa | 20 × 20 mm, zaoblená, bez nápisu; pre podsvietenie translucent oranžové PLA |
| Hlavné podsvietenie | 1× 5 mm LED, rezistor podľa skutočnej LED a napájania, 1× tlačený svetlovod |
| Predné indikátory | 2× 2 mm LED; ich vzhľad na obrázku je návrhová referencia |
| Anténa | Nalepovacia 2,4 GHz FPC anténa XIAO, U.FL káblik; zadná vnútorná plocha 24 × 8,5 mm |
| Spojenie | 2× M3×10 zápustná skrutka DIN 963/ISO 2009 a 2× šesťhranná M3 matica |
| Očko | Integrovaný otvor pre šnúrku alebo samostatný kovový krúžok; kovový krúžok sa netlačí |
| USB-C | Zaoblený priechod 10,8 × 4,8 mm, vonkajšie odľahčenie 12,2 × 6,2 mm; čelo konektora približne 1,16 mm za čelom krabičky |

USB doska je medzi bočnými vedeniami, prednou stenou, zadnou zarážkou a dvoma hornými prítlačnými bodmi. To obmedzuje pohyb dosky pri zasúvaní a vyťahovaní kábla. Samotná sila držania USB-C závisí od konkrétneho konektora a kábla. Puzdro neupína ľubovoľný kábel za jeho gumový plášť; ak má byť kábel trvalo pripojený a namáhaný ťahom, treba navrhnúť samostatné odľahčenie pre jeho presné rozmery.

## Súbory a tlač

Na hlavnej A1 platni sú štyri tlačené diely: `01_upper_shell_hex`, `02_bottom_chassis_hex`, `03_mx_keycap_hex`, `04_lightguide_hex`. Samostatný `06_mx_fit_coupon_hex` skúša otvory 14,00/14,10/14,20 mm. Samostatný `07_usb_fit_coupon_hex` skúša otvor a okraj pre konkrétnu USB-C koncovku; jeho otvor sa tlačí naplocho, takže finálna kontrola musí prebehnúť aj na skutočnom plášti. Starý samostatný ochranný prstenec a stará 3MF platňa sú odložené v `../legacy-hex-node-v1/`.

Otvorenie priamo v Bambu Studio: `../prototype-plates-a1/03_Hex_Node_COMPACT_v2_ALL_PARTS_A1_PLA.3mf`. Nastavenie: Bambu Lab A1, 0,4 mm tryska, PLA, vrstva 0,20 mm, 3 steny, 20 % gyroid. Pod bočným očkom sú zapnuté podpery iba z podložky. Jedna platňa používa jednu farbu PLA; vzhľad čierne telo + oranžová klávesa vyžaduje AMS Lite alebo samostatné tlače.

## Čo ešte treba fyzicky overiť

1. Posuvným meradlom zmerať presný MX spínač a USB-C kábel: šírku/výšku koncovky, dĺžku odkrytej kovovej časti a rozmery gumového plášťa.
2. Vytlačiť MX a USB skúšobné mierky. Zasúvanie kábla do zostaveného plášťa musí byť úplné bez páčenia zásuvky; pri vyťahovaní sa doska nesmie pohnúť.
3. Skontrolovať zacvaknutie spínača, prácu klávesy a viditeľnosť LED cez konkrétny transparentný spínač a PLA.
4. Overiť priestor pre pripojený U.FL káblik, nalepenie antény, rádiový dosah a dosadnutie M3 matíc.

CAD kontrola zatiaľ potvrdila jeden platný solid pre každý diel a nulové objemové kolízie XIAO STEP/plášť/základňa; Blender potvrdil uzavreté STL siete. Bambu Studio vygenerovalo jednu A1 platňu bez varovania. Reálnu montáž a silu držania kábla potvrdí až fyzická skúška.
