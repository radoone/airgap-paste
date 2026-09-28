# AirGap Paste Mini v3 — Tlačový a montážny návod pre Bambu Lab A1

**Verzia:** Mini v3 (M3 Screws & Nuts Edition)  
**Cieľová tlačiareň:** Bambu Lab A1 (0,4 mm tryska, Textured PEI Plate)  
**Vonkajšie rozmery:** **Ø 46,0 mm × 21,8 mm**  
**Zdvih tlačidla:** 0,6 mm mechanický doraz  
**Uchytenie:** **4× skrutka M3 × 10 mm so zápustnou hlavou na plochý skrutkovač (DIN 963 / ISO 2009) + 4× šesťhranná matica M3 (DIN 934)**  
**Rozoberateľnosť:** **Plne rozoberateľné zospodu** bez poškodenia dielov alebo lámania plastových západiek.

---

## 1. Prehľad zmien a vyriešenie rozmerov Seeed Studio XIAO ESP32-S3

Oproti predošlým verziám boli kompletne prepracované všetky kritické rozmery:
1. **Generózna šírka lôžka dosky (20,8 mm):**  
   Samotná doska XIAO ESP32-S3 má šírku 17,78 mm. V novom modeli je šírka priečinka zväčšená na **20,8 mm**, čo poskytuje **+1,5 mm vôle na každej strane**. Vďaka tomu doska bez problémov pasuje aj s prispájkovanými pinmi alebo vyvedenými vodičmi na bočných plôškach (castellated pads).
2. **Pohodlné horizontálne osadenie dosky:**  
   Doska sa do spodnej základne jednoducho zasunie po bočných lištách spredu. Nie je potrebné žiadne páčenie ani ohýbanie pod uzavretý mostík.
3. **Priestor pre U.FL anténny konektor a RF tienenie:**  
   Stredový podstavec mikrospínača bol posunutý a vyvýšený tak, že nad doskou XIAO je **viac než 6 mm voľného vertikálneho priestoru**. Zacvaknutý anténny konektor U.FL s koaxiálnym káblikom má dostatok miesta a nehrozí jeho pritlačenie.
4. **Odľahčenie pod doskou (1,4 mm):**  
   Stredová časť pod doskou je znížená, takže spájkované body batérie (BAT+ a BAT-) na spodnej strane PCB sa nedotýkajú podlahy.
5. **USB-C port lícujúci s vonkajšou stenou:**  
   Výrez pre USB-C port má rozmery **13,2 × 7,0 mm** so skosením na vonkajšej stene, čo umožňuje spoľahlivé docvaknutie akéhokoľvek bežného USB-C kábla s hrubšou koncovkou.
6. **Rozoberateľnosť zospodu pomocou 4× M3:**  
   V hornom plášti sú vytlačené 4 presné šesťhranné vrecká pre matice M3 na pevných vnútorných ramenách. Spodná základňa má 4 kužeľové zápustné otvory (90°), do ktorých hlavy skrutiek M3×10 mm úplne zapadnú a lícujú so spodnou plochou krabičky.

---

## 2. Obsah balíka

- `01_shell_mini_A1_PLA_Black.3mf` — projekt horného plášťa (**Bambu PLA Basic Black**)
- `02_top_button_mini_A1_PETG_Translucent.3mf` — projekt tlačidla pre **priesvitné PETG** (efektívne prepúšťa svetlo LED)
- `02_top_button_mini_A1_PLA_White.3mf` — alternatívny projekt tlačidla pre **Bambu PLA Basic White**
- `03_bottom_base_mini_A1_PLA_Black.3mf` — projekt spodnej základne (**Bambu PLA Basic Black**)
- `stl/`
  - `01_shell_mini.stl` — STL model plášťa
  - `02_top_button_mini.stl` — STL model tlačidla
  - `03_bottom_base_mini.stl` — STL model spodnej základne
- `step/`
  - `01_shell_mini.step` — parametrický CAD STEP plášťa
  - `02_top_button_mini.step` — parametrický CAD STEP tlačidla
  - `03_bottom_base_mini.step` — parametrický CAD STEP spodnej základne
  - `assembly_mini.step` — kompletná 3D CAD zostava vrátane dosky XIAO, spínača a M3 spojovacieho materiálu
- `preview/`
  - `preview_mini.png` — 3D render zostavy, osadenia elektroniky a rozloženého pohľadu

---

## 3. Potrebný materiál

| Položka | Počet | Poznámka |
| :--- | :---: | :--- |
| **Skrutka M3 × 10 mm** (zápustná hlava na plochý skrutkovač, DIN 963) | 4 ks | Dĺžka 10 mm meraná vrátane hlavy |
| **Matica M3** (štandardná šesťhranná, DIN 934, s = 5,5 mm) | 4 ks | Vkladajú sa do vreciek v plášti |
| **Seeed Studio XIAO ESP32-S3** | 1 ks | Štandardná verzia |
| **Mikrospínač 6 × 6 mm** (výška 5 mm alebo 7 mm) | 1 ks | Momentový mikrospínač (napr. TE 1825910-6 / Omron B3F) |
| **5 mm LED dióda** | 1 ks | Podsvietenie tlačidla |
| **2,4 GHz samolepiaca anténa Seeed** | 1 ks | S U.FL / IPEX konektorom |

---

## 4. Postup montáže krok za krokom

### Krok 1: Príprava a osadenie elektroniky na základňu (Base)
1. **Mikrospínač:** Vložte 6×6 mm spínač do centrálneho lôžka na vyvýšenom podstavci. Nožičky spínača smerujú do pripravených šácht.
2. **LED dióda:** Vsuňte 5 mm LED diódu zhora do kruhového držiaka za spínačom. Drôtené prívody preveďte cez otvory v základni.
3. **Prepojenie vodičov:**  
   - Spínač zapojte medzi pin **D1** a **GND** dosky XIAO ESP32-S3.
   - LED diódu (s predradným odporom napr. 220 Ω) zapojte medzi pin **D0** a **GND**.
4. **Osadenie dosky XIAO:**  
   - Zasuňte dosku Seeed Studio XIAO ESP32-S3 do predného priečinka základne tak, aby USB-C konektor smeroval dopredu a zadná hrana dosky sa oprela o zadný doraz.
   - Zacvaknite U.FL konektor antény na dosku.
   - Samolepiacu flexibilnú anténu nalepte na zadnú oblú stenu držiaka antény.

### Krok 2: Príprava plášťa a tlačidla
1. **Osadenie matíc M3:**  
   - Otočte vytlačený plášť (`01_shell_mini`) hore nohami.
   - Do 4 stĺpikov vložte šesťhranné matice M3. Matice dosadnú na pevné dno (z = 5 mm) a vďaka šesťhrannému tvaru sa pri uťahovaní nepretáčajú.
2. **Vloženie tlačidla:**  
   - Tlačidlo (`02_top_button_mini`) vsuňte do plášťa **zospodu**.
   - Široký spodný lem tlačidla dosadne na horný vnútorný okraj plášťa. Tlačidlo nemôže z plášťa vypadnúť smerom nahor.

### Krok 3: Spojenie a zoskrutkovanie krabičky zospodu
1. Priložte osadenú základňu (`03_bottom_base_mini`) k spodnej časti plášťa. Vodiaci lem na základni presne zapadne do plášťa.
2. Zospodu vložte **4× skrutku M3 × 10 mm** do zápustných otvorov.
3. Plochým skrutkovačom skrutky rovnomerne dotiahnite do matíc M3.
4. Hlavy skrutiek sú úplne zapustené do spodného krytu, takže krabička stabilne sedí na stole.

### Krok 4: Demontáž (v prípade potreby servisu alebo úpravy)
- Kedykoľvek stačí povoliť a vyskrutkovať 4 skrutky M3 zospodu.
- Základňa s celou osadenou elektronikou sa plynule vysunie – žiadne lámanie západiek, žiadne namáhanie spájkovaných vodičov.
