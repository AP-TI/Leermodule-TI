# Hoofdstuk 2
Von Neumann-cyclus: ophalen, decoderen, uitvoeren, wegschrijven.

Datatypes zijn gestandariseerd dankzij IEEE

Getalbreedte: het aantal bits, benut door de computer, voor een getal

Kardinaliteit (#): aantal elementen van een verzameling

Unsigned integers: datatype van de natuurlijke getallen
- unsigned byte: 2<sup>8</sup>
- unsigned int = 2<sup>16</sup>
- unsigned long: 2<sup>32</sup>

Overloopbit: een overdrachtbit, die terechtkomt voorbij de msb van de getalbreedte

Overflow: het verschijnsel waarbij een resultaat niet langer binnen de opgelegde getalbreedte past en dus buiten de op te slagen verzameling valt

CONVERTEREN NAAR NEGATIEF: 2 KOMPLEMENT

Signed integers: datatype van de natuurlijke getallen
- signed byte: (-2<sup>7</sup> - 2<sup>7</sup>-1)
- signed int = 2^16: (-2<sup>15</sup> - 2<sup>15</sup>-1)
- signed long: 2^32: (-2^<sup>31</sup> - 2<sup>31</sup>-1)

Een voldoende hoge precisie van opgeslagen reële getallen is doorslaggevend voor de betrouwbare resultaten

Exacte getallen worden slechts benaderd weergegeven als machinegetallen
Notatie:
- Exact getal: x
- Benaderde weergave als machinegetal: x’

Absolute afrondingsfout alfa = exact getal - machinegetal (x - x’)

Relatieve afrondingsfout epsilon = absolute afrondingsfout gedeeld door exact getal (in %) -> (alfa /x)

Constante relatieve fout (5% in cursus, maar normaal in opgave)

Accuraatheid a = floor(-log(alfa)) à het aantal cijfers na de komma van x’
(absolute waarde! Accuraatheid kan niet negatief zijn)

Precisie p = ceiling(-log(epsilon)) à het aantal beduidende cijfers van x’

Verband tussen a en p à A – log(|x|) = p

Bekijk ppt dia 44-45-46. Stop niet voor je het begrijpt.

Wetenschappelijke getalnotatie:

getal = toestandsteken x mantisse x (getalbasis)exponent

Verdeling bij wetenschappelijke notatie:
- 1 bit voor toestandsteken
- 1 bit voor grootte-orde (exponent)
- 4 bits voor mantisse (x’)
 
Verdeling bij mini-precision:
- 1 bit voor toestandsteken
- 3 bits voor exponent
- 4 bits voor mantisse (x’)
 
Bias β = een constant positief getal, waarmee de effectieve exponent E2 wordt verhoogd 

E<sub>β</sub> = E<sub>2</sub> + β

E<sub>2</sub> = -4

β = 4

E<sub>β</sub> =  0

0dec = 000bin → 3exponentbits -> 3x 0

Hidden bit: mantissebit vóór de komma die per definitie 1 is en bijgevolg kan worden weggelaten, dus winst van 1 extra meeneembare mantissebit

34 gereserveerde bitrijen

Exponentbits mogen niet 111 zijn -> NAN of infinity

niet alles 0, of tekenbit 1 en de rest 0 -> NULL

256 - 34 → 222 vrije bitrijen → 111 pos, 111 neg, telkens p2 = 5 en p10 = 2

34 gereserveerde rijen:

- NAN: 2<sup>4</sup>
- -NAN: 2<sup>4</sup>
- INFINITY al bij in NAN geteld, -INFINITY al bij in -NAN geteld 
- NULL & -NULL

Machineprecisie p2 = 5 (4 mantissebits + hiddenbit) uitdrukken in absolute foutvlaggen ±α rond de machinegetallen x’

Vaste procentuele opslagfout = 2<sup>-5</sup>

→ ε<sub>M</sub> = α / (|x′|)

De absolute foutvlaggen worden groter naarmate de opgeslagen getalwaarde |x’| zelf vergroot

- Positieve reële overflow: resultaten groter dan 7,8
- Positieve reële underflow: resultaten in het open interval ]+0;+0,066\[
- Negatieve reële overflow: resultaten kleiner dan -7,8
- Negatieve reële underflow: resultaten in het open interval ]-0,066;-0[

0 zelf staat gedeclareerd in de -NULL en NULL (gereserveerde bitrijen)

mini-precision: 1 byte (8 bits) : 256 mogelijke waarden, single precision: 4 bytes (32 bits): ongeveer 4 miljard mogelijke waarden

Verdeling bij single-precision:
- 1 bit voor toestandsteken
- 8 bits voor exponent
- 23 bits voor mantisse (x’)
 
Bias β = 127

Machineprecisie p2 = 24 (23 mantissebits + hiddenbit) uitdrukken in absolute foutvlaggen ±α rond de machinegetallen x’

Vaste procentuele opslagfout = 2<sup>-24</sup> ≈ 10<sup>-8</sup> 

Als de computer meerdere bewerkingen uitvoert op x’ in R, dan kunnen de fouten verergeren

Er bestaan 
- oneindig veel niet-machinegetallen
- eindig aantal bruikbare machinegetallen

Foutophoping: x’ = x. (1±ε) → ZIE DIA 90 & 91 PPT2

(x’.(y’+z’)’)’ ≈ x’.(y’+z’).(1±2ε) of x’.(y’+z’) WANT (1±2ε) is verwaarloosbaar

Foutexplosies: door berekeningen uit te voeren op 2 machinegetallen gaat de absolute fout enorm verergeren waardoor het originele getal amper te herkennen is. Voorbeelden: ZIE PPT
