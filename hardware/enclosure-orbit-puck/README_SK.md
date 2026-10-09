# AirGap Paste — Orbit Puck v2, bez podpier

Nový kruhový variant pre XIAO ESP32-S3 a 3-pin MX. Matný grafit, zapustená oranžová klávesa bez nápisu, jemné obvodové drážky a úzky oranžový pás. Tvar je navrhnutý ako malé vreckové zariadenie aj stolový geek doplnok. Predajnosť je zámer návrhu; záujem zákazníkov zatiaľ nebol testovaný.

## Veľkosť a rozsah

- Nominálny priemer **47 mm**, ploché čelo pre USB skracuje hĺbku na **44,7 mm**, výška **23,4 mm**.
- Vrch klávesy je vo výške **23,2 mm**, teda 0,2 mm pod horným ochranným lemom. Lem znižuje priamy kontakt s klávesou pri nosení; nenahrádza uzatvorený transportný kryt.
- Toto je najkompaktnejší dokončený kruhový variant v tomto balíku, nie dôkaz matematicky najmenšej možnej krabičky. Priemer obmedzuje šírka dosky, prístup k M3 maticiam, bočné vodiče a anténa. Výšku obmedzuje anténa a celý zdvih MX.
- Určené pre XIAO **bez pinových líšt**, 3-pin MX, vodiče a dodanú anténu. Batéria, XIAO Sense kamera a voliteľná samostatná 5 mm LED nie sú zahrnuté v osadení.

## Diely a tlač na Bambu Lab A1

Použite STL bez prípony `_assembly`: sú otočené na tlač a položené na Z=0. `_assembly.stl` zachovávajú montážne súradnice a slúžia na render/kontrolu.

1. `01_orbit_graphite_A1_PLA.3mf`: plášť horným lemom na podložku, základňa a nominálny XIAO klin. **Bez podpier**, 0,20 mm vrstvy. Stĺpiky matíc a prítlaky majú 45° nábehy.
2. `02_orbit_orange_A1_PLA.3mf`: samostatná **MX platnička `09_mx_snap_plate`**, klávesa vrchom na podložku, vnútorný rám a dve polovice obvodového pásu. **Bez podpier**, 0,10 mm vrstvy aj prvá vrstva: MX platnička tak má 15 nominálnych vrstiev a výšku 1,50 mm. Polovice pásu sa priložia zboku a prilepia.
3. `03_orbit_clear_A1_PLA.3mf`: dva krátke svetlovody, **bez podpier**, 0,20 mm vrstvy. Pri slabšej priľnavosti použite lokálny brim; brim nie je podpera.
4. `04_mx_fit_tests_A1_PLA.3mf`: voliteľné skúšobné platne 14,0 / 14,1 / 14,2 mm, **bez podpier**, 0,10 mm vrstvy aj prvá vrstva. Nemontujú sa do krabičky.

Profil: **A1, tryska 0,4 mm, PLA, tri steny, 20 % gyroid**. Podpery sú na všetkých platniach vypnuté; `archive_validation.json` kontroluje aj nulový počet podperových dráh v G-code. Krátke mosty ostávajú pri USB/LED otvoroch a vreckách matíc, čo nie je tlač na podperách. Ich kvalita závisí od chladenia a materiálu; overte ju prvým výtlačkom. Všetky štyri platne sa nakrájali bez varovaní. Hlavné diely majú odhad približne **91 minút / 17,7 g PLA**; voliteľné skúšobné diely približne **53 minút / 8 g**. Odhady tlače sú v `bambu_a1/plate_summary.json`. STEP a Blender sú súčasťou balíka.

## Montáž a pevné uchytenie dosky

Potrebujete **2× zápustnú M3 × 10 mm alebo M3 × 12 mm** (dĺžka vrátane zápustnej hlavy) a **2× bežnú M3 maticu**, približne 5,5 mm cez plochy a 2,4 mm vysokú. Nepoužívajte 10/12 mm skrutky s iným typom hlavy bez úpravy základne. M3 × 10 je preferovaná; oba varianty majú v CAD voľný priestor pre koniec skrutky.

Matice vložte zboku z vnútornej dutiny do vreciek plášťa pri oddelenej základni, ešte pred vložením dosky. Vrecko má pod maticou pevné osadenie a nad ňou strop; overená je aj vzorkovaná cesta zasunutia matice. Potom dosku položte na lišty a posuňte hranu PCB k dvom predným oporám. Zhora vložte `07_xiao_wedge` za zadnú hranu PCB. Pri príliš tesnom/voľnom uložení sú k dispozícii `07_wedge_looser` a `07_wedge_tighter`, rozdiel 0,1 mm.

USB zaťaženie sa prenáša z PCB do širokých predných opôr pri vyťahovaní a do zadného klinu a dorazu pri zasúvaní. Bočné plotíky a štyri horné prítlaky držia dosku v ďalších smeroch. Klin zachytia horné stĺpiky. Pod horné prítlaky použite tenkú pružnú izolačnú podložku podľa skutočnej vôle, približne 0,3 mm; netlačte na súčiastky, U.FL ani spájkované vodiče. Skrutky doťahujte primerane, bez deformácie PLA.

USB otvor má vnútorný rozmer 11 × 4,8 mm a vonkajšie odľahčenie 12,6 × 6,5 mm. Oficiálny XIAO STEP nekoliduje s plášťom ani základňou; aj tak treba skúsiť konkrétny USB kábel a opakované zasúvanie.

## MX zacvaknutie a plný chod

Otvor **14,1 × 14,1 mm** je v samostatnej **1,5 mm** montážnej platničke `09_mx_snap_plate`. Tá je povinnou súčasťou krabičky; nepliesť si ju s voliteľnými skúšobnými MX dielmi. Najprv vytlačte skúšobné diely a použite konkrétny switch. Po tlači ich obráťte stojanom nadol; oba jazýčky sa musia zachytiť pod platňou. Ak vyhovuje iný otvor, upravte hlavný otvor v zdroji pred tlačou celého plášťa.

MX najprv zacvaknite do samostatnej platničky mimo krabičky. Osadenú platničku vložte zvnútra do horného plášťa; jej výrezy musia obísť prítlaky dosky. Horný lem a štyri zvislé opory základne ju po zoskrutkovaní zachytia bez ďalších skrutiek. Nad platničkou je nominálna montážna vôľa 0,1 mm; prípadnú vôľu podľa výtlačku dolaďte tenkou izolačnou podložkou na oporách. Elektrické piny orientujte **k zadnej stene (+Y), od USB**. Pod stredovým pinom a kontaktmi je vybranie; zadný doraz PCB je v strede nižší, aby neprekážal. Vodiče veďte bokom od dosky, nenechajte ich pod prítlakmi alebo v dráhe spínača.

Spodok platničky dosadá na opory vo výške 13,4 mm, vrch je vo výške 14,9 mm. Pri modelovanom **4 mm stlačení** zostáva spodný okraj klávesy **0,6 mm nad montážnou platňou**. Kontrola používa rozmerové obaly spodného tela a kolíkov z KOMPONENTY.md, nie presný STEP vášho MX klonu. Dutina a krížová objímka tlačenej klávesy sa musia vyskúšať na skutočnom switchi; ak sa zasekáva, použite bežnú kompatibilnú 1U MX klávesu alebo dolaďte dutinu. Pred uzavretím opakovane skúste zdvih, návrat a pevné zacvaknutie, potom elektrické zopnutie D1/GND.

## Anténa a svetlá

Použitý rozmerový obal vychádza z [výkresu Seeed A-02](https://files.seeedstudio.com/wiki/XIAO_WiFi/antenna/FPC_Antenna_2.4GHz_1.16dbi_for_XIAO_ESP32S3/res/Datasheet_2.4GHz_FPC_Antenna_1.16dbi_for_XIAO_ESP32S3.pdf): **37,4 × 17,5 mm**, koaxiál približne 65 mm, hrúbka pri spoji do 1,8 mm. V CAD je pridaná rozmerová vôľa. Nalepí sa pozdĺž zadnej vnútornej steny, s pozvoľným ohybom dlhšej strany; neprelamujte žiarič ani spoj. Koaxiál veďte bokom okolo MX. Dodanú anténu porovnajte s týmto typom pred tlačou: staršia/iná anténa môže mať odlišné rozmery.

Zakrútenie FPC je geometrický predpoklad tohto malého návrhu. Minimálny prípustný polomer ohybu a výkon v tejto polohe neboli potvrdené. Overte fyzický ohyb, dosah Wi-Fi/BLE a vedenie koaxiálu; ak vaša anténa toto uloženie neumožňuje, treba upraviť jej miesto a veľkosť tela.

Dve cyan bodky na renderi sú ilustračné. Svetlovody vyžadujú reálne LED a ich zapojenie/zarovnanie; render nepotvrdzuje osvetlenie hotového zariadenia.

## Overenie a hranice

`validation.json` obsahuje platnosť a jednu spojenú časť každého hlavného dielu, kontrolu oficiálneho XIAO STEP, MX telesa a kolíkov, plného stlačenia klávesy proti krabičke, M3 × 12 a cesty vloženia matíc. Tlačené siete sú uzavreté. Samostatná MX platnička nekoliduje s doskou, plášťom, základňou ani anténou; zostáva 1,50 mm hrubá a jej nominálna horná vôľa v plášti je 0,10 mm. `support_free_toolpath_inspection.png` zobrazuje vybrané skutočné dráhy z G-code, vrátane nábehov a mostov nad výplňou; nenahrádza fyzickú skúšku tlače. Zanedbateľný dotyk klinu so základňou má približne 0,0027 mm³.

Ide o **CAD a slicer prototyp**, nie fyzicky overený sériový produkt. Tlač, zacvaknutie/zdvih konkrétneho MX, pevnosť USB uloženia, anténa a montáž musia prejsť fyzickou skúškou pred predajom alebo Kickstarter kampaňou.

## Jedna platňa na skúšobnú tlač

`bambu_a1/00_all_parts_test_A1_PLA.3mf` obsahuje všetkých **10 povinných tlačených dielov** na jednej A1 platni, v jednej farbe PLA a bez podpier. Voliteľné MX skúšobné diely na nej nie sú. Vrstva aj prvá vrstva sú 0,10 mm kvôli MX platničke hrubej 1,50 mm. Nakrájané bez varovaní; odhad **114 minút / 17,46 g PLA**. Overené: jedna platňa, 10 modelov, G-code, náhľad, nulové podperové dráhy a integrita 3MF. Nepriehľadné svetlovody sú na tejto platni iba na mechanický test; osvetlenie overte až s čírym materiálom. Krátke mosty a zacvaknutie MX ešte vyžadujú fyzickú skúšku.

## Dve farby na skúšobnú tlač

- `10_test_black_A1_PLA.3mf`: čierne telo, základňa a klin; 0,20 mm vrstvy, približne 61 minút / 15,69 g.
- `11_test_orange_A1_PLA.3mf`: oranžová klávesa, MX platnička, rám, dva obvodové pásy a dva svetlovody; 0,10 mm vrstvy, približne 24 minút / 1,91 g.

Obe platne bez podpier a bez varovaní, spolu všetkých 10 povinných dielov. Oranžové svetlovody sú iba na mechanický test; pre svetelnú funkciu ich vytlačte z číreho materiálu. Samostatný balík `Orbit_Puck_Test_2_Farby_A1.zip` obsahuje len tieto dve 3MF a stručné pokyny.
