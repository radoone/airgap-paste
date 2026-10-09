# Kontrola finálneho návrhu v4

Vybraný smer: tretí zobrazený koncept, Layered Crown, uložený ako selected_concept.png. Finálny rozmer zostavy 54 × 48 × 28,6 mm; telo 54 × 48 × 26,6 mm je určovaný CAD modelom.

## Vizuálna kontrola

Skontrolované finálne Blender rendery spredu, zhora a s odkrytým uchytením XIAO. 5 mm vonkajšie skosenie korunky pod uhlom 45° s 0,5 mm zaoblením hrán, stupňovitá priehlbina so šikmým prechodom, väčšia oranžová krytka, oranžový rám a vložka na šnúrku, jemná bočná drážka a správne orientovaný nápis sú súčasťou skutočnej geometrie. Tlačidlo vyčnieva 2 mm nad okrajom a oranžový rám neblokuje jeho zdvih. Horná priehlbina je v smere spredu dozadu skrátená na 26,4 mm a posunutá dopredu o 0,5 mm, aby zadný lem pri širšom skosení zostal súvislý. Poloha samotného MX, krytky a platničky zostáva na Y = 5 mm. Pridané sú tri kontroly MX puzdra/pinov proti XIAO.

Interaktívny náhľad používa zjednodušené tessellácie aktuálneho CAD. Overená zostava, odkrytá elektronika, rozloženie dielov a úzka šírka 320 px a bežné široké zobrazenie; žiadne zachytené JavaScript chyby. Náhľad nie je výrobný mesh.

## Digitálne overenie výroby

154 kontrol vybraných prienikov a montážnych dráh má nulový výsledok. Deväť tlačených dielov má platnú uzavretú geometriu. Prepočítané sú štyri platne obsahujúce telo, dno, vyššiu krytku alebo posunutú vložku očka; platňa nezmenených svetlovodov je prevzatá z v3 a jej geometria sa znovu kontroluje pri balení. Päť finálnych Bambu A1 / PLA / 0,4 mm platní používa 0,10 mm vrstvy, bez upozornení a podpier. Skontrolované skutočné extrúzne dráhy tela v Z = 0,1 / 1,3 / 3 / 13 / 18 / 23,8 mm potvrdzujú postupné zmeny korunky a priechodné otvory.

Súbor package_check.json obsahuje kontrolu modelov v dodaných 3MF voči aktuálnym STL. Archív má CRC a SHA-256 kontrolu všetkých pribalených súborov.

## Zostávajúca fyzická skúška

Pred tlačou finálnych farebných dielov treba použiť pribalený MX test, potom skúšobnú zostavu. Presné dosadnutie konkrétneho MX, plný zdvih, zasunutie USB kábla, vôľa PCB, priechod svetla, dosah Bluetooth a mechanická odolnosť neboli potvrdené fyzickým výtlačkom. Postup a tolerancie sú v README_SK.md.

crown_wall_check.json zaznamenáva dva vzorkované rezy kolmo na pás skosenia: ľavý 2,1213 mm a zadný 2,5272 mm. Nejde o globálnu analýzu minimálnej hrúbky všetkých detailov.
