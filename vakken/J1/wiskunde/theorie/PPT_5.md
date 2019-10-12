# Hoofdstuk 5

Lineaire vercijfering en ontcijfering is mogelijk in een structuur met 2 bewerkingen, bijvoorbeeld (Z26,+,.)

Ringstructuur: de structuur met 2 bewerkingen die voldoet aan de volgende criteria
- de verzameling vormt een commutatieve additieve groep
- de verzameling blijft gesloten onder de maal-bewerking
- de maal-bewerking is associatief
- in de verzameling gelden de linkse en rechtse distributiviteit

Unitaire ring: ring met eenheidselement

Commutatieve ring: ring waarin de vermenigvuldiging commutatief is
- Voorbeeld: het restsysteem (Z<sub>26</sub>,+, \*) uitgerust met de plus- en de maal-bewerking vormt een unitaire commutatieve ring

eigenschap modulo: machten
- (24 + 29)  mod 26 ≡ 1
- (5.25)  mod 26 ≡ 21
- 24<sup>6</sup>  mod 26 ≡ 12
- 27<sup>-1</sup>  mod 26 ≡ 1

##### VERCIJFEREN

DAG = { 3, 0, 6 } volgens “mini-karakter”-code

9x + 2 = y

→ 9 \* 3 + 2 = 29 → 3 = x1

→ 9 \* 0 + 2 = 2 = x2

→ 9 \* 6 + 2 = 56 → 30 → 4 = x3

→ { 3, 2, 4 } → DCG

##### ONTCIJFEREN

9x + 2 = y

→ 9 \* x + 2 = y

			+2 overzetten: → -2
      
→ 9 \* x = y - 2

			invers element van 9 is 3: rechterlid \*= 3
      
het ringelement 3 ∈ Z<sub>26</sub> is invariant onder de functie f met f(x) ≡ 9x + 2  mod 26

→ x = 3y -6

→ x = 3y +20

DCG = { 3, 2, 4 }

→ 3 \* 3+20 = 29 → 3 = x1

→ 3 \* 2+20 = 26 → 0 = x2

→ 3 \* 4+20 = 32 → 6 = x3	→ ONTCIJFERD: { 3, 0, 6 } = DAG

Z<sub>26</sub><sup>*</sup>={1,3,5,7,9,11,15,17,19,21,23,25}

Z<sub>26</sub><sup>*</sup>x Z<sub>26</sub> 

Grootte overeenkomstige sleutelruimte = 312 (count(Z<sub>26</sub><sup>*</sup>)\*26)

```
Oef 104) 
b = mod 26
y = ax + b 
y- b= a x
a-1(y-b) = x
a-1y -a-1b= x
```

Voorbeeld: rechte door de koppels (0,2), (11,23)

0 = a2 +b mod 26 → - a2 = b mod 26

11 = a23 +b mod 26 → 11 - a23 = b mod 26

-a2 = 11- a23

a21 = 11

invers element zoeken

→ 21 \* 0 % 26 = 0 → nope

→ 21 \* 1 % 26 = 21 → nope

→ 21 \* 2 % 26 = 16 → nope

→ 21 \* 3 % 26 = 11 → nope

→ 21 \* 4 % 26 = 6 → nope

→ 21 \* 5 % 26 = 1 → SNAILED IT OMFG

→ 21 \* 6 % 26 = 22 → nope

→ 21 \* 7 % 26 = 17 → nope

→ 21 \* 8 % 26 = 12 → nope

→ 21 \* 9 % 26 = 7 → nope

→ 21 \* 10 % 26 = 2 → nope

→ 21 \* 11 % 26 = 23 → nope

→ 21 \* 12 % 26 = 18 → nope

→ 21 \* 13 % 26 = 13 → nope

→ 21 \* 14 % 26 = 8 → nope

→ 21 \* 15 % 26 = 3 → nope

→ 21 \* 16 % 26 = 24 → nope

→ 21 \* 17 % 26 = 19 → nope

→ 21 \* 18 % 26 = 14 → nope

→ 21 \* 19 % 26 = 9 → nope

→ 21 \* 20 % 26 = 4 → nope

→ 21 \* 21 % 26 = 25 → nope

→ 21 \* 22 % 26 = 20 → nope

→ 21 \* 23 % 26 = 15 → nope

→ 21 \* 24 % 26 = 10 → nope

→ 21 \* 25 % 26 = 5 → nope

---> invers element van 21 is 5

→ a21 ≡ 11

→ a ≡ 11 \* 5

→ a ≡ 55 ≡ 3

→ a ≡ 3

11 ≡ a 23 + b mod 26

11 ≡ 3 \* 23 + b mod 26

-58 mod 26 = b

b = 20 

K(3,20)

Snailed it

→ eens men enkele karakters ontcijferd heeft, kan men de sleutel achterhalen en is alle tekst volledig leesbaar voor de afluisteraar. → geen privacy meer!

Caesarcijfer: 𝛼 = 1, β onbekend
- maximum 26 verschillende sleutels, 25 praktisch bruikbaar (want 0)

→ 12 multiplicatiecijfers waarvan 11 praktisch bruikbaar

de rest is bullshit... daar snappen we niks van. uitleg welkom in een issue!
