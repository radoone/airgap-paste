# AirGap Paste Flip Vault — prenosná krabička s odklápacím krytom

Toto je rozpracovaný fyzický variant z vizuálneho návrhu č. 1. Kryt prekrýva oranžové MX tlačidlo počas nosenia a po odklopení ho sprístupní. Telo má krátke 45° skosenie, vyššiu kolmú spodnú stenu, predné USB-C, dve svetelné okienka a zadné očko. Bez nápisu a loga.

## Rozmery a tlačené diely

- Telo: **54 × 48 mm**, s očkom dĺžka **62 mm**, zatvorená výška **26,5 mm**.
- MX otvor **14,10 × 14,10 mm** v skutočnej **1,50 mm** montážnej platni. Rozhranie USB-C **11,0 × 4,8 mm** s vonkajším odľahčením **12,6 × 6,5 mm**.
- Medzera medzi vrchom nestlačenej klávesy a spodkom krytu: **1,2 mm**; boky tlačidla chránia steny krytu.
- `01_upper_shell_vault.stl/.step`: čierny horný plášť s pántovými oporami a očkom.
- `02_bottom_chassis_vault.stl/.step`: čierna základňa s pevnými dorazmi dosky.
- `03_mx_keycap_vault.stl/.step`: oranžová klávesa.
- `04_lightguides_vault.stl/.step`: číre svetlovody.
- `05_accent_halo_vault.stl/.step`: oranžový rám spínača.
- `06_flip_shield_vault.stl/.step`: čierny odklápací ochranný kryt.
- `07_xiao_locking_wedge.stl/.step`: vymeniteľný klin, ktorý uzamkne XIAO medzi prednými oporami a zadným dorazom.
- `08_mx_snap_coupon_14p0/14p1/14p2.stl/.step`: malé skúšobné diely s otvorom 14,0 / 14,1 / 14,2 mm pre skutočnú várku MX spínačov.

Na tlač použite už orientované `03_mx_keycap_vault_top_down.stl` a `06_flip_shield_vault_face_down.stl`; montážne STL zachovávajú spoločné súradnice. `06_flip_shield_vault_open_preview.stl` je iba polohovaný náhľad otvorenia, netlačiť ho.

## Ďalšie súčiastky a montáž

Potrebujete Seeed Studio XIAO ESP32-S3 **bez pinových líšt**, jeden 3-pin MX spínač, jeho vodiče, dodanú FPC anténu, **2× M3 × 10 mm zápustnú skrutku a 2× M3 maticu**, **4× neodýmový magnet 3 × 1 mm** a **50 mm odstrihnutého 1,75 mm filamentu** ako pántový čap. Magnety vložte do dvojíc s opačnými pólmi oproti sebe a po skúške ich zafixujte lepidlom. Filament prestrčte pántovými otvormi; oba vyčnievajúce konce po skúške veľmi opatrne roztavte do hlavičky alebo použite iný vhodný mechanický zaisťovací prvok. Kryt potrebuje fyzickú skúšku retencie a životnosti pántu.

Doska leží na spodných lištách a bočné plotíky bránia jej bočnému posunu. **Dve širšie predné opory držia hranu PCB pri vyťahovaní USB kábla. Zadný klin opretý o široký doraz drží dosku pri zasúvaní kábla.** Štyri horné prítlaky ju po zoskrutkovaní držia vo zvislom smere. Klin je pod bočnými stĺpikmi horného plášťa mechanicky zachytený, takže sa pri nosení nemôže vysunúť nahor. Bočné ušká klinu obopínajú doraz s vôľou 0,30 mm, aby sa klin neposúval do strán. Klin končí pod horným povrchom PCB a neopiera sa o súčiastky pri U.FL.

Pri montáži položte XIAO na lišty, posuňte jeho **hranu PCB** k predným oporám a klin zasuňte zhora za zadnú hranu PCB. Začnite nominálnym `07_xiao_locking_wedge.stl`. Ak sa nedá zasunúť bez ohýbania dosky, použite `07_xiao_wedge_looser.stl`; ak má doska vôľu, použite `07_xiao_wedge_tighter.stl`. Voliteľné kliny sú v balíku ako samostatné STL/STEP a líšia sa o 0,10 mm. Vytlačte potrebný variant zvlášť. **Nenatláčajte klin silou na USB konektor ani na súčiastky.** Vodiče spínača prispájkujte pred uložením dosky.

V kontrolovanej polohe oficiálneho STEP modelu sú nominálne medzery približne **0,001 mm pri predných oporách, 0,004 mm pri kline, 0,20 mm po bokoch a 0,20 mm zhora**. Ide o CAD hodnoty, ktoré sú menšie ako bežné výrobné odchýlky FDM tlače; výber klinu treba urobiť podľa fyzického výtlačku. Pod horné prítlaky použite približne **0,3 mm pružnú izolačnú podložku** tak, aby netlačila na súčiastky, spájkované vodiče ani U.FL. USB konektor je približne **1,02 mm za vonkajším čelom**; overte aj plastové puzdro konkrétneho kábla.

Svetlovody sú iba optické diely. Reálne dve svietiace bodky vyžadujú kompatibilnú polohu LED na osadenej doske alebo samostatne zapojené LED. Ilustračné svietenie v náhľade nie je dôkazom hotovej elektroniky.

## Zacvaknutie a chod MX tlačidla

**Najprv vytlačte skúšobnú platňu** `04_mx_snap_fit_coupons_A1_PLA.3mf`. Po tlači otočte skúšobný diel tak, aby jeho rám tvoril stojan pod 1,5 mm platňou. Skúste vlastný 3-pin MX spínač v otvore **14,1 mm**: oba bočné jazýčky sa musia počuteľne/viditeľne zachytiť pod platňou a spínač sa pri stlačení nesmie nadvihovať. Ak je otvor po tlači príliš tesný alebo voľný, porovnajte diely 14,2 a 14,0 mm a podľa výsledku upravte otvor celého plášťa pred jeho tlačou. Skúšobné diely potvrdzujú len mechanický fit konkrétneho výtlačku a spínača.

V krabičke tlačte na **telo spínača**, nie na jeho stem. Zasuňte ho zhora a orientujte dva kovové elektrické piny smerom k zadnej časti krabičky (**+Y**, k očku). Pod spínačom je znížené lôžko pre stredový plastový pin, kontakty a vedenie vodičov; v jeho mieste ostáva 1,6 mm hrubé dno. Po zacvaknutí nasuňte oranžovú klávesu na krížový stem a vyskúšajte plný návrat po stlačení. Klávesa je upravená tak, aby pri modelovanom **4 mm zdvihu** nenarazila do montážnej platne: spodný okraj má v krajnej polohe **0,6 mm medzeru**. S otvoreným krytom ju skúste viackrát stlačiť ešte pred pripojením napájania a pred uzavretím krabičky. Po zapojení vodičov na D1 a GND treba elektrické zopnutie overiť na reálnom zariadení.

## Bambu Lab A1 a stav overenia

V `bambu_a1/` sú štyri hotové 3MF platne: čierna (plášť, základňa, kryt, nominálny klin), oranžová (klávesa, rám), číra (svetlovody) a samostatná čierna skúšobná platňa s tromi MX otvormi. Profil: Bambu Lab A1, 0,4 mm tryska, PLA, 0,20 mm vrstva, tri steny, 20 % gyroid; hlavná čierna platňa má podpery iba z podložky. Všetky tlačené STL majú uzavretú sieť a jednu spojenú časť. Štyri platne sa nakrájali bez varovaní. Pred tlačou vizuálne skontrolujte vrstvy pri pánte, tenké steny, klin a podpery.

V CAD nemajú tlačené diely významné objemové kolízie v montážnych polohách. Pánt bol skontrolovaný po 10° od 0° po 110° bez kolízie s plášťom alebo klávesou. Oficiálny STEP model XIAO nekoliduje s horným plášťom, základňou, nominálnym klinom ani prvkami uchytenia. Kontrola lokálnej MX platne namerala 1,50 mm; modelovaný podplatňový objem tela spínača, priestor pre kontakty a klávesa po 4 mm stlačení nemajú kolíziu s krabičkou. `flip_vault_closed_assembly.step`, `flip_vault_open_assembly.step` a `flip_vault_with_xiao_reference.step` umožňujú ďalšiu kontrolu.

Vnútorná dutina klávesy je rozšírená kvôli hornému puzdru spínača. Presný model konkrétneho MX spínača nebol k dispozícii; kontrola podplatňového priestoru používa rozmerový obal. Kolízia klávesy s jeho horným puzdrom a fit krížového stemu preto musia byť overené na skutočnom spínači, prípadne porovnaním s bežnou 1U MX klávesou.

**Toto je geometricky a v sliceri overený prototyp.** Zatiaľ neprebehla fyzická tlač ani skúška MX spínača, konkrétneho USB kábla, čapu, magnetov, antény, odolnosti očka či opakovaného zasúvania kábla. Kryt a pánt preto zatiaľ nemožno považovať za sériovo overený mechanizmus.
