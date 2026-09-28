# Prehľad hardvérových komponentov — AirGap Paste

Tento dokument slúži ako centrálny register všetkých fyzických komponentov, ich presných technických rozmerov, montážnych tolerancií a odkazov pre projekt AirGap Paste.

---

## 1. Mikrokontrolér: Seeed Studio XIAO ESP32-S3

Kompaktná riadiaca doska s procesorom ESP32-S3, Wi-Fi 2.4 GHz, BLE 5.0 a hardvérovou podporou USB.

| Parameter | Hodnota | Poznámka k návrhu krabičky |
| :--- | :--- | :--- |
| **Nominálne rozmery PCB** | 20,95 mm × 17,78 mm | Plošný spoj |
| **Výška dosky s komponentmi** | cca 4,85 mm | Od spodku PCB po vrch RF štítu |
| **Šírka priečinka v krabičke** | **20,8 mm** | Ponechaná vôľa +1,5 mm na každú stranu pre spájkované vodiče na bočných plôškach |
| **Dĺžka lôžka v krabičke** | **22,0 mm** | Vôľa +1,0 mm na dĺžku pre voľné uloženie |
| **Presah USB-C konektora** | **1,53 mm** pred prednú hranu PCB | Výška konektora 3,16 mm (zvršok siaha do výšky 7,16 mm od základne) |
| **Predný výrez pre USB-C** | 12,6 mm × 6,5 mm so skosením | Umožňuje plné zacvaknutie aj hrubších káblov |
| **Konektor antény** | IPEX / U.FL na hornej strane dosky | Vyžaduje zvislú vôľu min. 5,0 mm nad PCB |
| **Spodná strana PCB** | Spájkovacie plôšky pre batériu (BAT+/BAT-) | Krabička má spodné vybranie hĺbky 1,4 mm, aby doska ležala rovno |
| **Stavové LED na doske** | Integrované na prednom okraji dosky | V prednej stene krabičky sú 2 uzavreté dierky (Ø 1,8 mm) pre viditeľnosť LED |
| **Zapojenie pinov pre tlačidlo** | Pin **D1** (GPIO 1) a pin **GND** | Interný pull-up rezistor je aktivovaný vo firmware |

---

## 2. Tlačidlo: 3-Pin MX Mechanický Switch

Štandardný mechanický spínač klávesnicového formátu (Cherry MX clone, clicky prevedenie) zabezpečujúci výrazný mechanický klik a vysokú odolnosť.

| Parameter | Hodnota / Špecifikácia |
| :--- | :--- |
| **Názov / Položka** | 3-Pin MX Style Mechanical Keyboard Switch (Clicky Blue style) |
| **Pôvod / Odkaz** | [AliExpress — Item 1005012963065863](https://www.aliexpress.com/item/1005012963065863.html) |
| **Počet kusov** | 50 ks v balení |
| **Montážny otvor (Plate Cutout)** | **14,0 mm × 14,0 mm** (štandardný štvorcový otvor) |
| **Hrúbka montážnej steny (Plate)** | **1,5 mm** (pri tejto hrúbke bočné plastové západky switchu pevne zacvaknú — snap-in) |
| **Rozmer hornej príruby switchu** | 15,6 mm × 15,6 mm |
| **Hĺbka tela pod platňou** | 5,0 mm (samotné plastové telo) |
| **Stredový vodiaci kolík** | Priemer Ø 4,0 mm, dĺžka 3,8 mm pod telom |
| **Elektrické kontakty** | 2 kovové spájkovacie piny (rozostup podľa MX štandardu) |
| **Celkový zdvih (Travel)** | cca 4,0 mm (zopnutie nastáva pri zdvihu cca 2,0 mm) |
| **Tŕň pre klávesu (Stem)** | Štandardný krížový MX tŕň (+) |
| **Rozmer kríža tŕňa** | Vodorovné rameno 4,0 × 1,3 mm; zvislé rameno 4,0 × 1,1 mm |
| **Kompatibilita kláves (Keycaps)** | Pasuje akákoľvek štandardná klávesa (OEM, Cherry, DSA, Artisan) alebo 3D tlačená klávesa |
| **Elektrické prepojenie** | 2 vodiče spájkované z pinov switchu priamo na piny D1 a GND na doske Seeed |

---

## 3. Spojovací materiál (Skrutky a matice)

Krabička je konštruovaná ako plne rozoberateľná zospodu pomocou 4 skrutiek bez nutnosti použitia závitových vložiek (heat-set inserts).

| Komponent | Špecifikácia | Použitie v modeli |
| :--- | :--- | :--- |
| **4× Skrutka M3 × 10 mm** | Zápustná hlava na plochý skrutkovač (DIN 963 / ISO 2009) | Prechádza zospodu cez spodnú základňu; 90° kužeľové zapustenie zabezpečí, že hlavy lícujú so spodnou plochou a krabička sa na stole nekolíše. |
| **4× Matica M3** | Štandardná šesťhranná matica M3 (DIN 934) | Vložená zvnútra do presných šesťhranných vreciek (rozmer cez hrany 5,7 mm) v stĺpikoch horného plášťa. Opiera sa o pevné vnútorné osadenie. |

---

## 4. Anténa: 2.4 GHz nalepovacia anténa

| Parameter | Špecifikácia |
| :--- | :--- |
| **Typ** | Flexibilná PCB / FPC prútová anténa 2.4 GHz dodávaná k doske Seeed XIAO ESP32-S3 |
| **Konektor** | U.FL / IPEX s tenkým koaxiálnym káblikom dĺžky cca 30 mm |
| **Umiestnenie v krabičke** | Nalepí sa na pripravenú zaoblenú vnútornú zadnú stenu krabičky |

---

## 5. Doplnkové / Voliteľné komponenty

| Komponent | Špecifikácia | Poznámka |
| :--- | :--- | :--- |
| **5 mm LED dióda** | Štandardná 5 mm LED (napr. zelená/modrá) s predradným rezistorom | V základni je integrované zvislé lôžko Ø 5,0 mm smerujúce nahor k tlačidlu (voliteľné podľa preferencie). |

---

## 6. Parametre pre 3D tlač (Bambu Lab A1)

| Parameter | Odporúčaná hodnota |
| :--- | :--- |
| **Tlačiareň** | Bambu Lab A1 |
| **Priemer trysky** | 0,4 mm |
| **Materiál plášťa a základne** | PLA Basic / PLA Tough (napr. matná čierna alebo sivá) |
| **Materiál klávesy** | PLA alebo PETG (pre vyššiu húževnatosť krížového spoja) |
| **Výška vrstvy** | 0,20 mm Standard (pre klávesu 0,16 mm alebo 0,12 mm pre jemný detail loga) |
| **Výplň (Infill)** | 20 % Gyroid |
| **Steny (Perimeters)** | min. 3 steny (pre pevnú montáž skrutiek a zacvaknutie switchu) |
| **Podpery (Supports)** | Navrhnuté tak, aby sa tlačilo **úplne bez podpier** |

---

## 7. Prvky pre prenosnosť (EDC — Everyday Carry)

Pre bezpečné a pohodlné nosenie vo vrecku, na kľúčoch alebo na batohu:

| Prvok | Špecifikácia | Účel |
| :--- | :--- | :--- |
| **Integrované EDC očko** | Otvor Ø 4,0 mm s plnou stenou hrúbky 3,0 mm | Pre prevlečenie taktického paracordu 550, EDC korálky alebo pripnutie mini karabínky k batohu/taške na laptop. |
| **Ochranné bočné lišty (Shoulders)** | Vyvýšené lemy chrániace boky klávesy | Zabraňujú nechcenému stlačeniu switchu v plnom vrecku alebo batohu. |
| **Zaoblené vreckové hrany** | Skosenia (chamfers) 45° a rádiusy min. 1,5 mm | Krabička netlačí vo vrecku nohavíc a nepoškriabe displej smartfónu či laptopu. |
| **Možnosť batériového napájania** | Doska XIAO ESP32-S3 má na spodku piny `BAT+` a `BAT-` | Umožňuje osadiť tenkú miniatúrnu LiPo batériu (napr. 150–300 mAh) pre úplnú nezávislosť od káblov na cestách. |
