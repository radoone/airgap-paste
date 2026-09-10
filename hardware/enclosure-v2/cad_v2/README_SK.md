# AirGap Paste v2 — dvojdielny mechanický prototyp

## Aktualizácia vzhľadu — 10. 9. 2026

Logo je teraz súčasťou horného STL/STEP: Wi-Fi zdroj vľavo, medzera „air gap“, šípka doprava a USB-C výstup vpravo. Reliéf je 0,6 mm nad stredovou plochou (z=25,6 mm) a je prispôsobený čitateľnosti v približne 17 mm veľkosti. Znak je spojený s vrchom, nejde o samostatný tlačený diel. Pôvodný nápis AIRGAP PASTE zostáva zapustený. `logo-proof.png` je kontrastná grafická ukážka tvaru; pri jednofarebnej tlači bude znak rovnakej farby ako vrch, nie čierny. Vrchol loga zostáva pod vyvýšeným obvodom tlačidla. Kontrola geometrie nenahrádza skúšku čitateľnosti pri tlači.

Pre budúce úpravy loga sa nemení priamo `build.py`: rozmery a tvar reliéfu sú v `brand_mark.py`. Po každej úprave spusť `build.py`; vzniknú nové STL, STEP, `logo-proof.png` a `validation.json`.

Aktuálny model má Ø68 × približne 27 mm: vrch má zaoblené vyvýšené rameno, stred s nápisom je o približne 2 mm nižšie než obvod. Spodok má zaoblené vonkajšie hrany. Zdvih, piest a tri servisné západky zostávajú zachované. Nasledujúce pôvodné rozmery 25 mm a pokyny pre plochý vrch sú historické; pre nový vrch platí táto sekcia.

Spodok: požadovaný hodvábne čierny povrch vytvára filament a nastavenie tlače, nie STL. Náhľad ukazuje čiernu/bielu farebnú kombináciu, nesimuluje skutočný lesk ani LED.

Vrch: požadovaný mliečne biely vzhľad potrebuje svetlopriepustný difúzny materiál. Bežný nepriehľadný biely filament nemusí prepustiť dostatok svetla. PETG uprednostňujeme pre pružné západky; konkrétny materiál najprv skúsiť s LED. Jedna LED v existujúcom bočnom držiaku nezaručuje rovnomerný svietiaci obvod; hrubšie okraje, piest a vodiace segmenty môžu vrhať tiene. Optika nie je overená.

Nový vrch už NIE JE plochý na pohľadovej strane. STL je naďalej exportované pohľadovou stranou nadol, ale zapustený stred potrebuje kontrolu mostov/podpôr v sliceri. Kontakty podpôr môžu zhoršiť pohľadový povrch. Pred finálnou tlačou overiť orientáciu a skúšobný výtlačok; pôvodné tvrdenie o jednoduchej tlači plochou nadol pre túto verziu neplatí.

Krabička Ø68 × 25 mm pre Bambu Lab A1. DVA tlačené diely: spodná vanička a priesvitný vrch, ktorý je zároveň tlačidlom. Zostava nemá skrutky: tri pružné západky vrchného dielu sa zachytia v bočných okienkach. Vrch sa môže pohybovať o 0,5 mm. Horný okraj vaničky tvorí doraz. Vrch má plytko zapustený obvodový svetelný prstenec a nápis AIRGAP PASTE v strede.

V2 je geometricky skontrolovaný prototyp, nie fyzicky otestovaný výrobok. Západky, návrat veľkého tlačidla, tolerancie tlače, konkrétny spínač, optika a anténa stále potrebujú skúšobnú montáž.

## Súbory
- 01_bottom.stl — vanička vrátane podpier dosky, spínača, LED a lepiacej plochy antény.
- 02_top_button.stl — široký vrch, vodiace segmenty, tri pružné západky a stredový piest.
- STEP súbory — upraviteľné telesá v spoločných montážnych súradniciach.
- build.py — zdroj CadQuery; pre generovanie potrebuje CadQuery, NumPy, Matplotlib a priložený referenčný STEP.
- reference/XIAO_ESP32S3_Seeed.step — nezmenený oficiálny model dosky od Seeed, použitý ako referencia, NETLAČIŤ.
- preview.png — náhľad zo skutočnej CAD geometrie. Prostredný pohľad má odstránenú časť prednej steny, aby bolo vidno dovnútra; ide len o pohľad, STL stena zostáva kompletná. Spínač, LED, vodiče a anténa na náhľade nie sú modelované.
- validation.json — výsledky kontroly geometrie.

## Čo je teraz založené na oficiálnych dátach
Oficiálne podklady Seeed sú dostupné na:
https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/#resources

3D model:
https://files.seeedstudio.com/wiki/SeeedStudio-XIAO-ESP32S3/res/seeed-studio-xiao-esp32s3-3d_model.zip

DXF mechanický výkres:
https://files.seeedstudio.com/wiki/SeeedStudio-XIAO-ESP32S3/res/XIAO_ESP32S3_v1.1_Dimensioning.dxf

Použitý model je súbor „XIAO-ESP32S3 v2.step“ z oficiálneho ZIP. Jeho celkový obal vrátane USB má približne 22,482 × 17,780 × 4,460 mm. Nominálna veľkosť PCB v dokumentácii je 21 × 17,8 mm. Pomenovanie v2 patrí súboru modelu; nepreukazuje, že používateľ má konkrétnu revíziu PCB. DXF v názve uvádza v1.1. Novšie schémy môžu mať inú revíziu; model nepredstiera univerzálnu zhodu všetkých revízií.

USB otvor a uloženie dosky boli upravené podľa importovaného STEP. Čelo USB konektora v zostave leží y=-33,2 mm, os približne z=6,36 mm. Vonkajší polomer vaničky je 34 mm. Otvor má 13 × 6,4 mm a poskytuje vôľu okolo konektora. Zasunutie konkrétneho káblového konca nie je simulované.

Doska je podopretá na dvoch úzkych lištách pri spodnej rovine PCB z=4 mm; pod stredom je voľný priestor. Zadný doraz obmedzuje posun. Na fixáciu použi malé množstvo vhodného lepidla na podperách; lepidlo nesmie zasahovať do kontaktov. Žiadna ďalšia univerzálna elektronická doska ani pinové lišty nie sú potrebné.

Článok používateľa obsahuje aj krabičky pre XIAO ESP32S3 Sense s kamerou:
https://www.seeedstudio.com/blog/2025/12/19/top-10-esp32-cam-case-designs/
Je užitočný ako prehľad riešení, ale jeho kamerové krabičky nie sú priamo dvojdielnym tlačidlom AirGap Paste. Do tohto modelu nebola skopírovaná geometria cudzej krabičky; referenciou bol oficiálny STEP samotnej dosky.

## Tlač v Bambu Studio
STL už majú správnu orientáciu a spodok na z=0. Importuj ich ako samostatné objekty, mierka 100 %, jednotky mm.

1. Vaničku tlač plochým dnom nadol, otvorom hore. Bežné PLA alebo PETG bez vodivých plnív; čierna farba.
2. Vrch tlač širokou pohľadovou plochou nadol, západkami nahor. Prírodné/priesvitné PETG je východiskový materiál pre pružné západky. Krehké PLA pre tento vrch neodporúčame.
3. Východiskové nastavenie prototypu: skutočná 0,4 mm tryska, 0,20 mm vrstva, 3 steny, 15–20 % výplň vaničky. Vrchný 1,5 mm disk nech je plný; priesvitnosť závisí od filamentu a nastavení. Použi profil svojho filamentu.
4. Pred tlačou skontroluj náhľad vrstiev: USB a bočné okienka majú krátke mostíky. Skontroluj presahy háčikov. Podpory nezapínaj bez kontroly, aby nezablokovali malé otvory alebo západky.
5. Diely tlač oddelene pri výmene filamentu; AMS nie je potrebné. Prvý pokus je funkčná skúška, nie finálna optická verzia.

## Súčiastky a montáž
- XIAO ESP32S3 bez pinových líšt, natívny dátový USB-C kábel.
- Anténa dodaná k XIAO, pripojená do U.FL. V zadnej polovici je rezervovaná lepiaca plocha 28 × 12 mm. Rozmer antény NIE JE overený STEP modelom dosky. Ak sa nezmestí, uprav plochu/umiestnenie podľa antény. Anténu umiestni mimo kovového krytu dosky, jej káblik veď voľným oblúkom mimo piestu a západiek. Over BLE v uzavretom kryte.
- Momentový normálne rozpojený spínač s telom približne 6 × 6 mm. Lôžko je 6,4 × 6,4 mm; jeho dno z=12,5 mm. Predpokladaná výška spínača po vrch piestu je 7 mm. Existujú rôzne výšky aj zdvihy: toto nie je definitívny výber katalógového dielu.
- Piest vrchu v pokoji končí z=19,5 mm, mechanický doraz je po 0,5 mm pohybu. Spínač nesmie byť predopnutý do zopnutia; musí zopnúť pred dorazom a nesmie sa na doraze poškodzovať. Výšku piestu alebo podpery uprav podľa vybraného spínača.
- Pružina mikrospínača má vracať veľký vrch. Západky sú záchyty, NIE návratové pružiny. Over návrat a chod pri stlačení v strede aj na okraji. Ak pružina nestačí, zvoľ vhodnejší spínač alebo doplň návratové pružiny.
- Jedna difúzna nízkoprúdová 5 mm LED, vhodný sériový rezistor, ohybné vodiče a izolácia. Držiak LED má otvor Ø5,3 mm. Jedna LED nezaručuje rovnomerne svietiaci zelený obvod ako umelecký vizuál.
- Dva flexibilné svetlovody/optické vlákna približne Ø2 mm, bočné otvory Ø2,2 mm. Ich konce upevni nad LED dosky a opticky oddeľ od hlavného podsvietenia. Rigidné tyčky nemožno jednoducho ohnúť. Trasy a minimálny polomer ohybu treba preveriť pre konkrétny materiál.

Najprv osaď a zapoj elektroniku vo vaničke. Skontroluj zasunutie USB a odľahčenie vodičov. Vyrovnaj tri háčiky vrchu s okienkami a vrch jemne zatlač. Nepretláčaj ho nasilu. Pri rozoberaní odtlač háčiky cez bočné okienka; nepáč za priehľadný disk. Konštrukcia nie je utesnená proti vode ani prachu.

## Zhoda s priloženým projektom
Priložený controller README uvádza externé tlačidlo medzi D1 / GPIO2 a GND. Toto zapojenie zachovaj. BOOT zostáva servisným tlačidlom na doske. Pri prístupe k BOOT/RESET odober vrch; doska je pri USB.

README popisuje stavové blikanie ORANŽOVEJ LED na doske. V poskytnutých súboroch nie je implementácia ovládania dodatočnej LED ani jej GPIO. Samostatná zelená LED preto nebude automaticky kopírovať stavové blikanie: firmware musí dostať výstup pre ňu. Nepájkuj ju paralelne k malej LED dosky. Firmvér sa v tomto kroku nemenil.

## Rozsah overenia
Oba tlačené diely musia po zmene zostať platné súvislé CAD telesá. Pred tlačou znovu spusť `build.py`, skontroluj aktualizovaný `validation.json` a otvor nový náhľad v sliceri. Nulové objemové prieniky treba overiť pre vaničku/vrch v pokoji, vaničku/vrch pri stlačení o 0,5 mm a oficiálny model XIAO voči obom dielom. Kontrola nepočíta pružnú deformáciu západiek pri zacvaknutí, pevnosť vrstiev, tolerancie tlače ani skutočné elektronické súčiastky okrem referenčného STEP XIAO. Je potrebná skúšobná montáž.
