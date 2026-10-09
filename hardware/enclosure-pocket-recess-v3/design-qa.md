# Kontrola finálneho návrhu v3

Vybraný smer: tretí zobrazený koncept, Layered Crown, uložený ako selected_concept.png. Finálny rozmer 54 × 48 × 26,6 mm je určovaný CAD modelom.

## Vizuálna kontrola

Skontrolované finálne Blender rendery spredu, zhora a s odkrytým uchytením XIAO. 3 mm vonkajšie skosenie korunky pod uhlom 45°, stupňovitá priehlbina so šikmým prechodom, väčšia oranžová krytka, oranžový rám a vložka na šnúrku, jemná bočná drážka a správne orientovaný nápis sú súčasťou skutočnej geometrie. Tlačidlo je 1 mm pod okrajom a oranžový rám neblokuje jeho zdvih.

Interaktívny náhľad používa zjednodušené tessellácie aktuálneho CAD. Overená zostava, odkrytá elektronika, rozloženie dielov a úzka šírka 320 px a bežné široké zobrazenie; žiadne zachytené JavaScript chyby. Náhľad nie je výrobný mesh.

## Digitálne overenie výroby

151 kontrol vybraných prienikov a montážnych dráh má nulový výsledok. Deväť tlačených dielov má platnú uzavretú geometriu. Prepočítané sú dve platne obsahujúce telo; tri platne s nezmenenými dielmi sú prevzaté z v2 a ich geometria sa znovu kontroluje pri balení. Päť finálnych Bambu A1 / PLA / 0,4 mm platní používa 0,10 mm vrstvy, bez upozornení a podpier. Skontrolované skutočné extrúzne dráhy tela v Z = 0,1 / 1,3 / 3 / 13 / 18 / 23,8 mm potvrdzujú postupné zmeny korunky a priechodné otvory.

Súbor package_check.json obsahuje kontrolu modelov v dodaných 3MF voči aktuálnym STL. Archív má CRC a SHA-256 kontrolu všetkých pribalených súborov.

## Zostávajúca fyzická skúška

Pred tlačou finálnych farebných dielov treba použiť pribalený MX test, potom skúšobnú zostavu. Presné dosadnutie konkrétneho MX, plný zdvih, zasunutie USB kábla, vôľa PCB, priechod svetla, dosah Bluetooth a mechanická odolnosť neboli potvrdené fyzickým výtlačkom. Postup a tolerancie sú v README_SK.md.
