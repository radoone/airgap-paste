# Clicker Duck – hlava s upraveným uchytením pre Cherry MX

Upravené je vnútorné krížové lôžko v hlave kačky. Vonkajší tvar, poloha lôžka,
výška jeho ústia a pôvodný odlamovací podporný blok sú zachované. Telo v úplnom
3MF projekte ostalo identické s dodaným súborom.

Určenie: bežný Cherry MX/MX2A s krížovým tŕňom. Rozmery sú návrhové tolerancie
pre FDM tlač; presné dosadnutie na konkrétny spínač ešte nebolo fyzicky overené.

## Súbory na tlač

- `Head_Cherry_MX_sliced_A1_PETG.3mf`: iba upravená hlava, štandard 1,30 mm.
- `Clicker_Duck_Cherry_MX_sliced_A1_PETG.3mf`: hlava aj pôvodné telo.
- `Cherry_MX_fit_coupons_sliced_A1_PETG.3mf`: tri malé skúšobné diely.
- `Head_Cherry_MX_*1p25.stl`, `*1p30.stl`, `*1p35.stl`: tri tesnosti hlavy.
  Obsahujú pôvodný podporný blok pod uchytením. Druhá verzia každého STL so
  sufixom `_no_builtin_support` je čistá hlava; pri vlastnom rezaní potrebuje
  vyriešiť podporu vnútorného uchytenia.

Narezanie: Bambu Lab A1, tryska 0,4 mm, vrstvy 0,16 mm, 3 steny, 15 % výplň,
pôvodný profil Bambu PETG HF z dodaného projektu. Automatické podpory sú vypnuté;
hlava obsahuje samostatný odlamovací blok s pôvodnou medzerou 0,30 mm.
Použi materiál zodpovedajúci profilu; pri PLA zmeň filament a projekt znovu narež.

## Najprv over tesnosť

1. Vytlač skúšobné diely z rovnakého materiálu ako hlavu. Otvory smerujú hore.
2. Bodky pri otvore označujú šírku ramien kríža: 1 bodka = 1,25 mm,
   2 bodky = 1,30 mm, 3 bodky = 1,35 mm. Skús jemne nasadiť diel na spínač.
3. Vyber diel, ktorý drží bez kývania a dá sa nasadiť miernym tlakom.
   Štandardná hlava v 3MF používa 1,30 mm. Pri inom výsledku použi príslušný STL.
4. Po vytlačení hlavy odstráň podporný blok z dutiny. Očisti ústie kríža
   od zvyškov mostíka, nasaď hlavu a over stlačenie aj návrat.

Kríž má celkovú dĺžku ramien 4,20 mm, hĺbku 4,20 mm a nábehové skosenie
0,30 mm. Ústie zostáva 3,80 mm nad spodnou plochou hlavy. Pôvodný kríž mal
ramená široké 1,40 mm a hlbšiu dutinu. Nová slepá dutina má pevné dno.

## Overenie a hranice

Geometria je uzavretá. Hlava tvorí jeden súvislý diel a podporný blok druhý
samostatný diel – to je zámer. Bambu Studio projekty úspešne narezalo bez
hlásených upozornení. Krížový otvor bol skontrolovaný v reze aj v dráhach tlače.
Výsledky sú v `validation.json`, `slicer_summary.json` a `sliced_socket_layers.png`.

CAD a rezanie nenahrádzajú skúšku konkrétneho spínača. Dosadnutie, sila nasadenia,
plný zdvih a návrat hlavy musia byť overené po tlači. Referencia mechanizmu:
[CHERRY MX BLUE](https://www.cherry.de/en-gb/product/mx2a-blue).

Pôvodný model: MattMade.Me, Clicker Duck - Fidget. Pôvodná atribúcia a licenčné
metadáta sú zachované v 3MF. Úprava vychádza z používateľom dodaného súboru
`Clicker_Duck_-_Single_Color.3mf`, ktorý zostal nezmenený.
