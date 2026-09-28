# AirGap Paste – krabička podľa fotografie (prototyp)

Táto verzia vychádza z funkčnej osemhrannej konštrukcie `enclosure-stealth-octo`. Zachováva jej vnútorné uloženie a pripojenia, ale dodáva čistú oranžovú klávesu **bez nápisu** a nový Blender náhľad. Referenčný obrázok nemá mierku ani pohľad dovnútra, preto vonkajšie rozmery nie sú odmerané z fotografie.

## Súbory

- `01_upper_shell_octo.stl/.step` – čierny horný plášť s integrovaným očkom a otvorom pre MX spínač.
- `02_bottom_chassis_octo.stl/.step` – spodná základňa s lôžkom pre XIAO.
- `03_mx_keycap_octo.stl/.step` – čistá oranžová klávesa pre MX krížový tŕň.
- `04_lightguides_octo.stl/.step` – dvojica svetlovodov spojená mostíkom; vytlačiť z číreho materiálu.
- `photo_match_assembly.step` – geometrická zostava tlačených dielov.
- `photo_match_with_xiao_reference.step` – zostava aj s oficiálnym STEP modelom dosky XIAO v navrhnutej polohe.
- `board_fit_inspection.png` – pohľad na otvorenú základňu s doskou v lôžku; `XIAO_reference_position.stl` je iba referenčná geometria dosky, nie diel na tlač.
- `photo_match_assembly.blend` a `photo_match_preview.png` – Blender scéna a náhľad; spínač, svietiace LED, kovový krúžok a karabína sú v scéne iba ilustračné.
- `build_photo_match.py` a `render_photo_match.py` – zdrojové skripty na obnovu dielov a náhľadu.
- `bambu_a1/01_black_body_A1_PLA.3mf`, `02_orange_keycap_A1_PLA.3mf` a `03_clear_lightguides_A1_PLA.3mf` – tri oddelené A1 platne podľa farby; všetky sa úspešne pripravili v Bambu Studio bez varovania.
- `bambu_a1/04_all_parts_one_plate_A1_PLA.3mf` – všetky štyri tlačené diely na jednej A1 platni pre jednofarebný prototyp. Používa jedno PLA, vrstvu 0,20 mm, tri steny, 20 % gyroid a podporu iba z podložky. Bambu Studio ju rozložilo a naslicovalo bez varovania; náhľad rozloženia je `bambu_a1/04_all_parts_plate_preview.png`. Svetlovody vytlačené z bežného nepriehľadného PLA nebudú funkčné ako priehľadné svetlovody.

## Rozmery a osadenie

Telo má 48 × 48 mm bez očka, približne 61,8 × 48 mm s očkom, výšku 16,5 mm po hornú plochu a 22,2 mm po vrch klávesy. Rovná bočná stena siaha do výšky 11,5 mm; horné skosenie má výšku 5,0 mm a vodorovné odsadenie 5,0 mm, teda 45° na čelných hranách. Otvor MX má 14,10 × 14,10 mm v platni hrubej 1,50 mm. Zapustenie okolo spínača má 23,0 × 23,0 mm. Predný priechod USB-C má 11,0 × 4,8 mm s vonkajším odľahčením 12,6 × 6,0 mm. Dva predné otvory majú priemer 2,0 mm.

Vnútri je priestor pre Seeed Studio XIAO ESP32-S3, vodiče od MX spínača na D1 a GND a nalepovaciu FPC anténu s U.FL káblikom. Konštrukcia sa rozoberá pomocou **2× M3 × 10 mm zápustnej skrutky a 2× M3 matice**. Kovový krúžok nie je súčasťou tlače. LED diódy a príslušné odpory treba osadiť podľa elektronického zapojenia; Blender svetlo nepredstavuje hotový elektrický obvod.

### Pevné uloženie dosky pri používaní USB-C

Doska **nie je ponechaná voľne v dutine**. Dve súvislé spodné lišty nesú okraje PCB, štyri krátke bočné plotíky obmedzujú pohyb do strán, predné dorazy po bokoch konektora bránia vytiahnutiu dosky a zadný doraz prenáša silu pri zasúvaní kábla do základne. Po zoskrutkovaní plášťa štyri horné prítlaky držia okraje dosky zhora. Sila z kábla sa tak prenáša do vytlačenej krabičky, nielen do pájených spojov USB konektora.

Podľa oficiálneho STEP XIAO má PCB 17,78 × 20,95 mm a v zostave leží spodkom približne na Z=3,00 mm. Nominálne medzery sú približne 0,13 mm k prednému dorazu, 0,20 mm k zadnému, 0,21 mm na každej strane a 0,20 mm pod hornými prítlakmi. USB konektor je približne 1,15 mm za vonkajším čelom krabičky. Tieto medzery sú zámerné kvôli toleranciám tlače; pri montáži vložte **tenkú 0,3 mm pružnú izolačnú podložku pod horné prítlaky** a **približne 0,5 mm pružnú podložku k zadnému dorazu**, aby doska nemala citeľnú vôľu. Podložky prispôsobte skutočnej tlači a doske; nesmú tlačiť na súčiastky, pájkované vodiče ani anténny konektor. Vodiče k tlačidlu prispájkujte ešte pred vložením dosky a veďte ich medzi bočnými plotíkmi. Model predpokladá **holú dosku bez naspájkovaných pinových líšt**.

## Overenie a hranice

- CAD export: každý zo štyroch tlačených dielov je platný samostatný solid; objemové kolízie medzi tlačenými dielmi sú nulové.
- Bambu Studio `--info`: všetky štyri STL sú manifold a každý má jednu spojenú časť.
- Nové lišty, dorazy a prítlaky boli skontrolované proti oficiálnemu STEP XIAO: nulová objemová kolízia. Úplný boolean test celej komplikovanej zostavy doska/plášť/základňa sa pri tomto exporte nespúšťal.
- Vlastný kus MX spínača, USB-C kábel, anténu, LED, svetlovody a skrutky treba pred finálnou sériou fyzicky vyskúšať. Najmä konektor kábla môže mať väčší plastový obal než CAD priechod. Po skúšobnej montáži aspoň opakovane zasuňte a vytiahnite kábel a sledujte, či sa PCB alebo zásuvka nepohne.

Pre Bambu Lab A1 začnite s 0,4 mm tryskou, vrstvou 0,20 mm, tromi stenami a 20 % gyroid. Horný plášť skúšobne tlačte obrátený a pod očkom povoľte podperu iba z podložky. Klávesu vytlačte samostatne z oranžového PLA/PETG, svetlovody z číreho materiálu. Pred potvrdením tlače ešte skontrolujte orientáciu a vrstvy v Bambu Studio.
