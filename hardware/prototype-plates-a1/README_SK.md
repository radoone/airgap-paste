# AirGap Paste — celé prototypy na samostatných A1 platniach

Každý 3MF súbor obsahuje práve jeden prototyp a všetky jeho tlačené diely. Diely sú automaticky rozložené na jednej platni Bambu Lab A1 a používajú jeden PLA filament, takže ich možno vytlačiť bez AMS.

## Platňa 1 — EDC Pocket Vault

Súbor: `01_EDC_Pocket_Vault_ALL_PARTS_A1_PLA.3mf`

Obsahuje sedem dielov: horný plášť, spodný podvozok, MX klávesu, svetlovod, obe ochranné ramená a samostatný tlačiteľný paracord korálik s priechodom Ø5 mm. Nie je to krúžok na kľúče. MX skúšobná mierka nie je na hlavnej platni, pretože nie je súčasťou zostaveného zariadenia; zostáva samostatne v priečinku modelu.

Podpery sú vypnuté. Pre funkčný svetelný efekt možno túto prvú skúšobnú tlač spraviť celú z natural/translucent PLA; pre finálny vzhľad sú v priečinku EDC modelu pripravené aj samostatné čierne a translucent 3MF diely.

## Platňa 2 — Mini v3

Súbor: `02_Mini_v3_ALL_PARTS_A1_PLA.3mf`

Obsahuje tri diely: plášť, horné tlačidlo a spodný elektronický podvozok. Zapnuté sú automatické snug podpery iba z podložky, pretože spodný diel obsahuje vyvýšené lôžko spínača.

## Platňa 3 — Compact Hex Node v2

Súbor: `03_Hex_Node_COMPACT_v2_ALL_PARTS_A1_PLA.3mf`

Obsahuje štyri diely: zošikmený šesťuholníkový plášť s integrovaným očkom, spodný podvozok, hranatú MX klávesu bez nápisu a svetlovod. Pod očkom sú zapnuté snug podpery iba z podložky. Staršia v1 platňa je odložená v `../legacy-hex-node-v1/`.

## Pred spustením

V Bambu Studio skontrolujte vybranú A1 tlačiareň, 0,4 mm trysku a skutočne vložený typ PLA. Neškálujte modely; projekty sú v milimetroch a pri 100 % veľkosti.

Jedna platňa je jednofarebná. Na čierne telo a oranžovú klávesu, ako na koncepte, treba AMS Lite alebo samostatné tlače. Elektronika, skrutky, matice a prípadný kovový krúžok nie sú tlačené diely.
