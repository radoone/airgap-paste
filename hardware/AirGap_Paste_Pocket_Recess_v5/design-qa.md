# Kontrola návrhu v5 / Sculpted Eyelet

Úprava vychádza z vybraného konceptu č. 3. Telo má 54 × 48 × 26,6 mm a zostava s vyčnievajúcim tlačidlom 54 × 48 × 28,6 mm.

Očko sa presunulo do ramena korunky. Čierne rozšírené vybranie obklopuje oranžovú vložku sklonenú o 30°. Šikmý priechod vytvára oválny vstup a ústi do krátkeho bočného otvoru pre šnúrku do 2 mm, podľa používateľovej voľby. Spodný otvor je odstránený. Tvar nosného rohu je zosilnený, oranžová vložka sa po skúške lepí. Nápis sa posunul nižšie, aby nekolidoval s výstupom.

Skontrolované aktuálne Blender rendery celej zostavy, horného pohľadu, detailu očka a uchytenia XIAO. Geometria má 154 nulových kontrol vybraných kolízií a montážnych dráh. Deväť hlavných dielov má platný CAD solid a uzavretú mesh; Blender kontroluje nulový počet nemanifold hrán.

Samostatný skript verify_cord_path.py overuje dve nominálne 2 mm vetvy šnúrky a ohyb so stredovým polomerom 2 mm. Všetky štyri prieniky s telom a vložkou sú nulové. Ide o návrhovú dráhu, nie test poddajnosti šnúrky ani pevnosti krytu.

Prepočítané sú platne s upraveným telom, dnom a vložkou. Nezmenené svetlovody a MX test sú prevzaté z v4; všetky modely v dodaných 3MF sa pri balení porovnajú s aktuálnymi STL. Pridaná je šiesta platňa s presným výrezom rohu a vložkou očka na samostatnú skúšku. Všetkých šesť platní A1 / PLA / 0,4 mm / 0,10 mm je naslicovaných bez upozornení a dráh podpier. Skontrolované extrúzne dráhy tela v šiestich výškach vrátane priechodu šnúrky.

Fyzický výtlačok nebol overený. Pred celou zostavou sa má vyskúšať očko a MX. Navliekanie a oder šnúrky, nosnosť očka, vôľa USB, návrat tlačidla, LED a Bluetooth zostávajú predmetom fyzickej skúšky. Postup je v README_SK.md.
