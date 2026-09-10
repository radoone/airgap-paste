# AirGap Paste — kontext na prenesenie do nového projektu

## Zadanie používateľa a pevné rozhodnutia
Navrhnúť fyzickú krabičku pre AirGap Paste: https://airgap-paste.web.app/ . Používateľ má Bambu Lab A1 a Seeed Studio XIAO ESP32S3 (štandardná doska, bez kamerového modulu Sense). Nemá ďalšiu univerzálnu dosku a preferuje PRIAME spájkovanie vodičov na XIAO.

Požadovaný vzhľad je podľa používateľovho obrázka webu: nízky čierny kruhový valec, veľká mliečna/priesvitná horná plocha s logom AirGap Paste a zeleným svietiacim obvodom. Vrchná plocha má byť fyzickým tlačidlom na potvrdenie prenosu. Zachovať natívny USB-C konektor na XIAO. Anténa musí byť CELÁ VNÚTRI; nevynechať ani miesto pre jej káblik. Zachovať viditeľnosť oboch diód dosky svetlovodmi alebo iným optickým riešením. Počítať s jednou prídavnou LED na podsvietenie vrchu. Drahý LED prstenec nie je požiadavkou.

Používateľ spochybnil tri STL a preferuje DVA hlavné tlačené diely: spodok a vrch. Navrhnuté riešenie: spodná vanička s elektronikou, priesvitný zacvakávací vrch, ktorý je súčasne pohyblivým tlačidlom. Diely sa tlačia samostatne; AMS nie je potrebné.

## Čo sa vytvorilo
1. Generované obrázky: obdĺžnikový návrh bol nahradený kruhovým; následne vzhľad upravený podľa používateľovej referencie. Obrázky sú iba estetické koncepty, nie výrobná dokumentácia. Rovnomerný zelený okraj na vizuáli nie je overený s jednou LED.
2. CAD v1: tri diely (telo, spodné veko, tlačidlo), Ø68 × 25 mm. Používateľovi odovzdaný ZIP AirGap_Paste_A1_v1.zip. Išlo o prvý geometrický prototyp s neoverenými rozmermi komponentov. V1 sa nemá považovať za finálny návrh.
3. CAD v2: aktuálny dvojdielny prototyp Ø68 × 25 mm, súbory v priečinku cad_v2 v prenosnom ZIP. Obsahuje dva STL, dva STEP, CadQuery build.py, README_SK.md, validation.json, preview.png a referenčný STEP Seeed. Vrch má tri pružné háčiky, vodiace segmenty a stredový piest. Nominálny pohyb 0,5 mm; horný okraj vaničky tvorí doraz. Západky zaisťujú vrch proti vytiahnutiu, neslúžia ako návratová pružina.

## Oficiálne mechanické podklady — už získané, nepýtať používateľa na základné rozmery dosky
Používateľ výslovne žiadal vyhľadať datasheet a upozornil na existujúce tlačené krabičky. Dokumentáciu treba používať namiesto odhadovania rozmerov dosky.

- Dokumentácia a sekcia Resources: https://wiki.seeedstudio.com/xiao_esp32s3_getting_started/#resources
- Oficiálny 3D model: https://files.seeedstudio.com/wiki/SeeedStudio-XIAO-ESP32S3/res/seeed-studio-xiao-esp32s3-3d_model.zip
- Mechanický DXF: https://files.seeedstudio.com/wiki/SeeedStudio-XIAO-ESP32S3/res/XIAO_ESP32S3_v1.1_Dimensioning.dxf
- Používateľov článok: https://www.seeedstudio.com/blog/2025/12/19/top-10-esp32-cam-case-designs/

ZIP aj DXF boli úspešne stiahnuté. Oficiálny ZIP obsahuje „XIAO-ESP32S3 v2.step“, Top view.jpg, Bottom View.jpg a XIAO-ESP32S3.png. V CAD v2 je nezmenený STEP uložený pod reference/XIAO_ESP32S3_Seeed.step. Ďalšie oficiálne podklady sú v official_reference v prenosnom balíku.

Nominálny rozmer PCB podľa Seeed: 21 × 17,8 mm. Zmeraný celkový obal referenčného STEP vrátane USB: približne 22,482 × 17,780 × 4,460 mm. Výška a poloha konektora boli použité v CAD v2; doska už nie je iba odhadovaný kváder. Názov STEP v2 a DXF v1.1 nezaručuje identickú revíziu používateľovej dosky. Nie je potvrdená zhoda všetkých výrobných revízií.

Článok uvádza viac krabičiek pre XIAO ESP32S3 Sense s kamerou, napr. Camera Case Xiao ESP32S3 Sense by brunnair a XIAO ESP32-S3 Sense Case by ScottyDoesKnow. Ich detailné stránky na Printables sa nepodarilo načítať. Nebola prevzatá geometria komunitnej krabičky. Na mechanickú referenciu sa použil oficiálny STEP XIAO.

## Aktuálne vnútorné riešenie CAD v2
- XIAO pri USB otvore, na dvoch úzkych spodných lištách, s voľným stredom pod doskou. Priame vodiče bez pinových líšt. Fixácia malým množstvom vhodného lepidla na podperách, nejde o hotový presný klip dosky.
- USB otvor 13 × 6,4 mm. Čelo USB z referenčného modelu v zostave y=-33,2 mm, os z≈6,36 mm. Konkrétny káblový konektor nebol modelovaný.
- Lôžko mikrospínača 6,4 × 6,4 mm, dno z=12,5 mm. PREDPOKLAD je spínač s telom 6 × 6 mm a celkovou výškou 7 mm. Konkrétny katalógový typ ešte NEBOL vybraný. Piest vrchu končí v pokoji z=19,5 mm. Treba zladiť jeho výšku, pracovný zdvih a doraz s datasheetom zvoleného spínača.
- Držiak jednej 5mm LED, otvor Ø5,3 mm. Konkrétna LED a rezistor neboli definitívne vybrané.
- Rezervovaná lepiaca plocha antény 28 × 12 mm na opačnej strane od USB. To je návrhová rezerva, NIE overený rozmer dodanej antény. U.FL a anténa sú pre Wi-Fi/BLE; dodaná anténa má byť použitá, ak vyhovuje. Káblik musí zostať mimo piestu a západiek. Neumiestňovať žiariacu časť na kovový kryt dosky.
- Dva bočné otvory Ø2,2 mm pre približne Ø2 mm flexibilné optické vlákna. Konce treba priviesť nad LED dosky a izolovať od hlavného podsvietenia. Presná optická trasa/držiaky koncov ešte nie sú navrhnuté podľa súčiastok.
- V STL zatiaľ nie je logo ani kompletné estetické doladenie vizuálu.

## Overenie a limity — neprezentovať ako hotový odskúšaný výrobok
CadQuery overil: oba tlačené diely sú platné a každý je jeden súvislý solid. Nulové objemové prieniky dielov v pokoji aj pri pohybe vrchu o 0,5 mm. Nulové prieniky oficiálneho STEP XIAO s oboma tlačenými dielmi.

NEBOLO overené: fyzická tlač a montáž, sila/životnosť západiek, pružná deformácia pri zacvaknutí, návrat vrchu pružinou spínača, stlačenie na okraji, konkrétna anténa, káblik a rádiový výkon, optické vlastnosti, LED, presný spínač a jeho dovolený zdvih, model konkrétneho USB kábla. Nulové CAD kolízie nie sú dôkazom funkčnosti hotového výrobku.

## Priložený softvérový projekt
V project_sources sú pôvodné používateľove súbory:
01-README.md, 02-setup-platformio, 03-platformio.ini, 04-pio, 05-README.md, 06-PROTOCOL.md.
Nie je priložený implementačný zdroj firmvéru main.cpp; tvrdenia o jeho správaní pochádzajú z README/protokolu.

PlatformIO:
- board = seeed_xiao_esp32s3
- platform = espressif32@6.12.0
- framework = arduino
- NimBLE-Arduino ^2.3.6
- ARDUINO_USB_MODE=0, ARDUINO_USB_CDC_ON_BOOT=0

Podľa controller README:
- externý normálne rozpojený momentový spínač: D1 / GPIO2 — tlačidlo — GND;
- BOOT funguje ako SEND počas behu, ale externý D1 je určený pre produkt, aby držanie pri štarte neaktivovalo bootloader;
- fyzické potvrdenie párovania, držanie tlačidla 5 sekúnd ruší uložené párovania;
- stavové blikanie už ovláda oranžovú používateľskú LED dosky; používateľská LED je podľa Seeed na GPIO21, aktívna v LOW;
- druhá LED na XIAO je nabíjacia, nie druhá ľubovoľne programovateľná stavová LED;
- prídavná zelená LED nemá v poskytnutých dokumentoch určené GPIO ani implementáciu. Je potrebné doplniť ovládanie vo firmvéri; nesľubovať, že bude sama kopírovať vstavanú LED. Firmvér sa v tomto chate nemenil.

AirGap Paste prijíma text cez BLE, autentifikuje ho, overí dĺžku/SHA-256 a po fyzickom potvrdení ho píše cez USB HID klávesnicu. Protokol v2, push-to-pair, HMAC-SHA256, max. 16 KB textu, režimy command/text, ciele ascii/linux/macos/windows. Webový dizajn používateľ ukázal obrázkom, samotná stránka sa pri prvom pokuse nepodarila načítať.

## Tlačové východisko
Bambu Lab A1, 0,4mm tryska iba ak je skutočne osadená, vrstvy 0,20 mm, 3 steny. Spodok čierny PLA/PETG, vrch priesvitný PETG kvôli pružným západkám. STL sú už otočené na tlač: vanička dnom dole, vrch veľkou pohľadovou plochou dole a háčikmi hore. V Bambu Studio samostatné objekty, 100 % mierka, mm. Mostíky a háčiky treba skontrolovať v sliceri. Nie je vytvorený ani overený hotový Bambu profil/3MF/G-code.

## Odporúčaný ďalší postup
1. Vybrať konkrétny dostupný momentový spínač a LED s datasheetmi. Používateľ nechce ďalšiu univerzálnu dosku.
2. Podľa spínača uzavrieť geometriu piestu, dorazov a návratu vrchu; preveriť veľké tlačidlo pri stlačení na kraji.
3. Overiť rozmery dodanej antény z oficiálnych podkladov alebo identifikáciou konkrétnej antény. Základné rozmery XIAO už netreba pýtať od používateľa.
4. Dokončiť praktické vedenie svetlovodov, ochranu vodičov, fixáciu dosky a servisný prístup k BOOT/RESET.
5. Skúšobná tlač, slicer kontrola, montáž a podľa výsledku doladiť tolerancie. Až potom finálne STL/3MF a estetické detaily.

Pokyn pre nový projekt: pokračuj v dvojdielnej kruhovej krabičke z CAD v2, použi priložený oficiálny STEP dosky, zachovaj vnútornú anténu, svetlovody a priame zapojenie. Nepovažuj výšky spínača ani anténny priestor za overené. Nevytváraj opäť trojdielny koncept bez dôvodu.
