# Hoofdstuk 4

Cryptografie: beveiligen van communicatie tegen allerlei inbreuken op de privacy ervan

Confidentialiteit: de beveiliging van communicatie tegen kennisname ervan door derden

Integriteit: de beveiliging van communicatie tegen allerlei wijzigingen ervan door derden

Authenticatie: het garanderen van de identiteit van een correspondent.

Soorten versleuteling:

- Bitversleuteling of stroomvercijfering: bit per bit
- Karakterversleuteling: karakter per karakter
- Byteversleuteling: byte per byte
- Blokversleuteling: blok na blok

cryptografisch algoritme =

- symm: sleutel voor ver- en ontsleutelen is hetzelfde
- asymm: sleutel voor ver- en ontsleutelen is niet hetzelfde

Substitutie: de vervanging van elke klare invoerblok of –bit door zijn versleutelde uitvoerblok of –bit

Permutatie of transpositie: vertalen van boodschap M tot zijn vercijferde boodschap C

Sleutelruimte: De verzameling van alle geldige sleutels. Grotere sleutelruimte = beter algoritme.

Diffusie: verandering in de klare boodschap M veroorzaakt een ‘lawine’ aan wijzigingen in de versleutelde versie C, en omgekeerd. Grotere diffusie, beter algoritme.

Confusie: de mate waarin er geen wiskundig verband kan worden gelegd tussen een onderschepte versleutelde boodschap C en de gebruikte sleutel K. Grotere confusie = beter algoritme.

Kraakpoging: brute kracht: alle sleutels uit de sleutelruimte één voor één proberen.

Associatietabel: elke verzameling verbanden tussen bitrijen enerzijds en hun overeenkomstige unieke betekenis anderzijds

- vb: ASCII: invoer = byte (0 - 255) , vb Unicode: invoer = 16bits (0 - 65535)

2 getallen zijn congruent modulo m:

- 2 getallen hebben dezelfde rest na deling door hetzelfde getal m

Restklasse of congruentieklasse modulo m:

- de oneindige verzamelingen waar getallen dezelfde hebben rest na deling door hetzelfde getal m

Vertegenwoordiger van restklasse modulo m : het kleinste natuurlijk getal a
notatie: ![a_streepje](../afb/H4/a_streepje.png)

![modulo](../afb/H4/modulo.png)

ongestraft optellen of aftrekken met een willekeurig m-voud in een restklasse a  modulo m

- kan ik niet goed uitleggen dus zie hier de voorbeelden:

![modulo_voorbeelden](../afb/H4/modulo_voorbeelden.png)

Restsysteem of restklassenverzameling: de verzameling van alle restklassen modulo m ∈ N\{0}

- Notatie: Z<sub>m</sub> = ![Zm_verzameling](../afb/H4/Zm_verzameling.png)

De kardinaliteit van een restsysteem: het aantal elementen van een restsysteem

- \# Z<sub>m</sub> = m

Eigenschap plus-bewerking:

- Als a ≡ b mod m en c ≡ d mod m dan a + c ≡ b + d mod m
- ofwel: als 1 ≡ 7 mod 6 en 3 ≡ 9 mod 6 dan 1+3 ≡ 7+9 mod 6 → 4 ≡ 16 mod 6

Eigenschap maal-bewerking:

- Als a ≡ b mod m en c ≡ d mod m dan a \* c ≡ b \. d  mod m
- ofwel: als 1 ≡ 7 mod 6 en 3 ≡ 9 mod 6 dan 1 \* 3 ≡ 7 \* 9 mod 6 → 3 ≡ 63 mod 6

Eigenschap: invers element ![s_streepje](../afb/H4/s_streepje.png) (als S)

getal * S mod getalbasis = 1

vb1 ppt dia 39: 9 \* S % 26 = 1

→ 9 \* 1 % 26 = 9 → nope

→ 9 \* 2 % 26 = 18 → nope

→ 9 \* 3 % 26 = 27 % 26 = 1 → omfg JAAA

→ invers element van 9 in restklasse Z<sub>26</sub> = 3

vb2 ppt dia 39: 10 * S % 26 = 1

→ 10 \* 1 % 26 = 10 → nope

→ 10 \* 2 % 26 = 20 → nope

→ 10 \* 3 % 26 = 4 → nope

→ 10 \* 4 % 26 = 14 → nope

→ 10 \* 5 % 26 = 24 → nope

→ 10 \* 6 % 26 = 12 → nope

… 10 \* x % 26 = veelvoud van 2 → kan NOOIT 1 zijn…

→ geen invers element van 10 in Z<sub>26</sub>

Besluit: niet alle elementen van Z<sub>m</sub> hebben een invers element.

→ inverteerbare/inverse elementen in gereduceerd restsysteem Z<sub>m</sub><sup>*</sup>

Eigenschap: nuldelers

Twee elementen uit een restsysteem kunnen als product de nulklasse ![0_streepje](../afb/H4/0_streepje.png) opleveren, zonder dat één van beide de nulklasse is
A en B zijn nuldelers als A \* B = 0

vb ppt dia 41: ![a_en_b_streepje](../afb/H4/a_en_b_streepje.png) als A en B

(13 \* 10) % 26 = 130 % 26 = 0 → 13 en 10 zijn nuldelers in Z<sub>26</sub>

Alle delers van 26 en al hun veelvouden zijn nuldelers van Z<sub>26</sub>

Z<sub>m</sub> = Z<sub>m</sub><sup>*</sup> U {0} U {nuldelers}

Lineaire vergelijkingen oplossen:

vb1 ppt dia 43: ![vb1](../afb/H4/dia43vb1.png) als 9 \* x + 2 = 0

→ 9 \* x + 2 = 0

    +2 overzetten

→ 9 \* x = -2

    +26 (m = 26) want -2 zit niet in Z<sub>m</sub>

→ 9 \* x = 24

    invers element van 9 berekenen om over te zetten: 
       
    → 9 * 3 % 26 = 27 % 26 = 1 → omfg JAAA → x = 3

→ x = 24 * 3

   aantal keer 26 eruit halen

→ x = 72 - ((72/26) \* 26)

→ x = 72 - (2 *26)

→ x = 20

vb2 ppt dia 43: ![vb2](../afb/H4/dia43vb2.png) als 10 \* x + 2 = 0

→ 10 \* x + 2 = 0

    +2 overzetten

→ 10 \* x = -2

    +26 (m = 26) want -2 zit niet in Z<sub>m</sub>

→ 10 \* x = 24

    invers element van 10 berekenen om over te zetten: 
       
    → geen invers element OMG! → alles afgaan: van x = 0 tot x =25

→ 10 \* 0 % 26 = 24 → 0 = 24 → nope

→ 10 \* 1 % 26 = 24 → 10 = 24 → nope

→ 10 \* 2 % 26 = 24 → 20 = 24 → nope

→ 10 \* 3 % 26 = 24 → 4 = 24 → nope

→ 10 \* 4 % 26 = 24 → 14 = 24 → nope

→ 10 \* 5 % 26 = 24 → 24 = 24 → omfg JAAA (niet opgeven, blijven gaan! er kunnen meerdere oplossingen zijn…)

→ 10 \* 6 % 26 = 24 → 8 = 24 → nope

→ 10 \* 7 % 26 = 24 → 18 = 24 → nope

→ 10 \* 8 % 26 = 24 → 2 = 24 → nope

→ 10 \* 9 % 26 = 24 → 12 = 24 → nope

→ 10 \* 10 % 26 = 24 → 22 = 24 → nope

→ 10 \* 11 % 26 = 24 → 6 = 24 → nope

→ 10 \* 12 % 26 = 24 → 16 = 24 → nope

→ 10 \* 13 % 26 = 24 → 0 = 24 → nope

→ 10 \* 14 % 26 = 24 → 10 = 24 → nope

→ 10 \* 15 % 26 = 24 → 20 = 24 → nope

→ 10 \* 16 % 26 = 24 → 4 = 24 → nope

→ 10 \* 17 % 26 = 24 → 14 = 24 → nope

→ 10 \* 18 % 26 = 24 → 24 = 24 → omfg JAAA (niet opgeven, blijven gaan! er kunnen meerdere oplossingen zijn…)

→ 10 \* 19 % 26 = 24 → 8 = 24 → nope

→ 10 \* 20 % 26 = 24 → 18 = 24 → nope

→ 10 \* 21 % 26 = 24 → 2 = 24 → nope

→ 10 \* 22 % 26 = 24 → 12 = 24 → nope

→ 10 \* 23 % 26 = 24 → 22 = 24 → nope

→ 10 \* 24 % 26 = 24 → 6 = 24 → nope

→ 10 \* 25 % 26 = 24 → 16 = 24 → nope

---> x = 5 of x = 18 → x = {5,18}

vb3 ppt dia 43: ![vb3](../afb/H4/dia43vb3.png) als 10 * x + 3 = 0

→ 10 \* x + 3 = 0

    +3 overzetten

→ 10 \* x = -3

    +26 (m = 26) want -3 zit niet in Z<sub>m</sub>

→ 10 \* x = 23

       invers element van 10 berekenen om over te zetten: 
       
    → geen invers element OMG! → alles afgaan: van x = 0 tot x =25

→ 10 \* 0 % 26 = 23 → 0 = 23 → nope

→ 10 \* 1 % 26 = 23 → 10 = 23 → nope

→ 10 \* 2 % 26 = 23 → 20 = 23 → nope

→ 10 \* 3 % 26 = 23 → 4 = 23 → nope

→ 10 \* 4 % 26 = 23 → 14 = 23 → nope

→ 10 \* 5 % 26 = 23 → 24 = 23 → nope

→ 10 \* 6 % 26 = 23 → 8 = 23 → nope

→ 10 \* 7 % 26 = 23 → 18 = 23 → nope

→ 10 \* 8 % 26 = 23 → 2 = 23 → nope

→ 10 \* 9 % 26 = 23 → 12 = 23 → nope

→ 10 \* 10 % 26 = 23 → 22 = 23 → nope

→ 10 \* 11 % 26 = 23 → 6 = 23 → nope

→ 10 \* 12 % 26 = 23 → 16 = 23 → nope

→ 10 \* 13 % 26 = 23 → 0 = 23 → nope

→ 10 \* 14 % 26 = 23 → 10 = 23 → nope

→ 10 \* 15 % 26 = 23 → 20 = 23 → nope

→ 10 \* 16 % 26 = 23 → 4 = 23 → nope

→ 10 \* 17 % 26 = 23 → 14 = 23 → nope

→ 10 \* 18 % 26 = 23 → 24 = 23 → nope

→ 10 \* 19 % 26 = 23 → 8 = 23 → nope

→ 10 \* 20 % 26 = 23 → 18 = 23 → nope

→ 10 \* 21 % 26 = 23 → 2 = 23 → nope

→ 10 \* 22 % 26 = 23 → 12 = 23 → nope

→ 10 \* 23 % 26 = 23 → 22 = 23 → nope

→ 10 \* 24 % 26 = 23 → 6 = 23 → nope

→ 10 \* 25 % 26 = 23 → 16 = 23 → nope

---> x = { } → geen uitkomst

invers element: HULP:

##### GGD

- wanneer men 2 getallen uit Z<sub>m</sub> neemt, en daar de grootst gemeenschappelijke deler (ggd) van zoekt en deze 1 blijkt te zijn, wil dit zeggen dat er een invers element bestaat.
- wanneer men 2 getallen uit Z<sub>m</sub> neemt, en daar de grootst gemeenschappelijke deler (ggd) van zoekt en deze niet 1 blijkt te zijn, wil dit zeggen dat er geen invers element bestaat.

→ Z<sub>m</sub><sup>*</sup> = {getal element van Z<sub>m</sub> waarvoor ggd = 1}

- dankzij deze regel moet je dus niet alle opties afgaan om uiteindelijk geen antwoord te vinden zoals in voorbeeld 3.

##### Structuren:

Alle eigenschappen van de hoofdbewerkingen plus en maal binnen een eindig restsysteem wordt samengevat in een structuur

- een structuur is additief wanneer de plus-bewerking uitgevoerd wordt.
- een structuur is een commutatieve additieve groep wanneer de plus-bewerking uitgevoerd wordt en GANS toegepast kan worden:

vb: ![vb_add_comm](../afb/H4/additieve_commutatieve_groep_tabel.png)

##### GANS

- Gesloten onder de plus-bewerking tussen alle elementen van de tabel
- Associatieve plus-bewerking tussen alle elementen van de tabel
- Neutraal element voor de plus-bewerking: {0} op elke rij van de tabel
- Symmetrisch element voor de plus-bewerking: diagonaal van linksboven naar rechtsonder

Halfgroep: een structuur die enkel gesloten en associatief is

- een structuur is multiplicatief wanneer de maal-bewerking uitgevoerd wordt

vb: ![vb_add_comm](../afb/H4/multiplicatieve_structuur_tabel.png)

- een structuur is een multiplicatieve commutatieve groep wanneer de maal-bewerking uitgevoerd wordt en GANS toegepast kan worden.

opmerking: bij de maal-bewerking is het neutraal element {1} en niet {0}.

zoek je het stukje over ggd (ppt4 dia 53-56): kijk dan hier [GGD](https://github.com/AP-TI-2018-2019/AP_2018-2019/blob/master/vakken/wiskunde/theorie/PPT_4.md#ggd)

Omwille van de cryptografische algoritmen moet Zm voorzien worden van 2 bewerkingen, zodat er een rijkere structuur (Z<sub>m</sub>,+,.) ontstaat → beter algoritme

_.xX- Onder voorbehoud van opmaak -Xx._

- sub / sup nakijken (vooral bij Z<sub>m</sub> en Z<sub>m</sub><sup>*</sup>
- asterisk al dan niet vooraf laten gaan met backslash: maalbewerking ipv schuine tekst

Credits @ Luka Hendrickx voor de mooie afbeeldingen van de tabellen
