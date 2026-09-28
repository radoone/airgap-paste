# AirGap Paste Ops Capsule — prenosný prototyp

Ops Capsule je druhý, samostatný návrh pre AirGap Paste. Má tmavé kompaktné telo, čistú oranžovú MX klávesu, oranžový zapustený rám okolo nej, dve vyššie ochranné lišty a široké zadné očko na šnúrku alebo kovový krúžok. Lišty siahajú 0,8 mm nad vrch klávesy, takže plochý predmet vo vrecku tlačí najprv na ne. Horný prístup pre prst zostáva otvorený. Predná stena nesie USB-C a dve okienka svetlovodov.

## Rozmery a diely

Telo bez očka: **54 × 48 mm**. Celková dĺžka s očkom: **62 mm**. Výška po vrch ochranných líšt: **23 mm**. Otvor MX: **14,10 × 14,10 mm** v **1,50 mm** platni. USB-C priechod: **11,0 × 4,8 mm**, vonkajšie odľahčenie **12,6 × 6,0 mm**. Tvar je zámerne bez nápisu.

| Diel | Súbor | Navrhovaná farba |
| --- | --- | --- |
| Horný plášť s očkom a lištami | `01_upper_shell_ops.stl/.step` | Matná čierna |
| Spodná základňa | `02_bottom_chassis_ops.stl/.step` | Matná čierna |
| Klávesa | `03_mx_keycap_ops.stl/.step` | Oranžová |
| Dva svetlovody | `04_lightguides_ops.stl/.step` | Číra |
| Vložený rám okolo spínača | `05_accent_halo_ops.stl/.step` | Oranžová |

`ops_capsule_assembly.step` obsahuje tlačené diely, `ops_capsule_with_xiao_reference.step` pridáva oficiálny STEP model dosky v navrhnutej polohe. `ops_capsule_assembly.blend` a náhľady slúžia na vizuálnu kontrolu; kovový krúžok, karabína, ilustračný spínač a svietiace LED v scéne nie sú súčasťou tlačených dielov.

## Elektronika a upevnenie dosky

Návrh počíta s **holou Seeed Studio XIAO ESP32-S3 bez pinových líšt**, jedným 3-pin MX spínačom, dvoma vodičmi zo spínača na D1 a GND, svetlovodmi a dodanou FPC anténou. Predné okienka sú pripravené pre stavové svetlo; ich skutočné rozsvietenie vyžaduje overenie polohy LED na konkrétnej doske alebo doplnenie samostatne zapojených LED. Na rozoberateľné spojenie slúžia **2× M3 × 10 mm zápustné skrutky a 2× M3 matice**.

Doska leží na dvoch spodných lištách. Štyri bočné plotíky bránia posunu do strán, predné dorazy zachytávajú silu pri vyťahovaní USB kábla a zadný doraz silu pri zasúvaní. Štyri horné prítlaky dosku zaistia po zoskrutkovaní plášťa. Podľa oficiálneho STEP sú nominálne medzery približne **0,13 mm vpredu, 0,20 mm vzadu, 0,20 mm na každej strane a 0,20 mm zhora**. Nové upevňovacie prvky majú s STEP modelom dosky nulovú objemovú kolíziu. USB konektor je približne **1,15 mm za vonkajším čelom**.

Pri montáži použite tenkú **0,3 mm pružnú izolačnú podložku pod horné prítlaky** a približne **0,5 mm pružnú podložku pri zadnom doraze**. Hrúbku dolaďte podľa skutočnej tlače, aby PCB nemalo citeľnú vôľu a podložka netlačila na súčiastky, spájkované vodiče ani U.FL. Vodiče prispájkujte pred vložením PCB. Oranžový rám má 0,2 mm bočnú vôľu v šachte a po skúšobnom osadení ho možno uchytiť malou kvapkou lepidla.

## Bambu Lab A1 a overenie

V `bambu_a1/` sú tri samostatné 3MF platne: čierne telo, oranžová klávesa s rámom a číre svetlovody. Profil používa A1, 0,4 mm trysku, 0,20 mm vrstvu, tri steny a 20 % gyroid. Pre čierny plášť sú zapnuté podpery iba z podložky. Oranžová platňa používa navyše `03_mx_keycap_ops_top_down.stl`: ide o tú istú klávesu otočenú viditeľnou plochou na podložku, aby vnútorný úchyt nepotreboval podpery. Všetkých päť montážnych STL aj táto tlačová orientácia sú **manifold, každá jedna spojená časť**; všetky tri A1 platne sa pripravili bez varovania slicera. Pred tlačou otvorte vrstvy a skontrolujte podpery pod ochrannými lištami a očkom.

Ide o geometricky a v sliceri overený **prototyp**. Skutočný MX spínač, USB-C kábel a jeho plastová koncovka, pružnosť podložiek, opakované cykly konektora, odolnosť očka a rádiové správanie antény s kovovým krúžkom ešte potrebujú fyzickú skúšku. Anténu umiestnite čo najďalej od kovového krúžku podľa možností kabeláže a po montáži odmerajte rádiový dosah.
