# PPT2

### DISTINCT

```sql
SELECT
        PLAATS
FROM
        SPELERS
;
```

→ 

```sql
SELECT
        DISTINCT PLAATS
FROM
        SPELERS
;
```

> In plaats van letterlijk elke keer de plaats van de speler op te vragen (waardoor we enorm veel dubbele plaatsen krijgen), vragen we beter DISTINCT PLAATS. Dit zorgt ervoor dat alle dubbele plaatsen uit het resultaat gefilterd worden.

> DISTINCT kan ook gebruikt worden wanneer je meerdere kolommen tegelijk opvraagt in een SELECT query. In dat geval gaat hij elke combinatie maximum 1x weergeven. Zie PPT2 dia 5 voor een voorbeeld.

> NULL wordt ook doorgegeven (slechts 1 keer) indien het voorkomt.

### Aggregatiefuncties

- COUNT()
- MIN()
- MAX()
- SUM()
- AVG()

> Mogen niet genest worden!

### COUNT()

```sql
SELECT
        COUNT(BEDRAG)
FROM
        BOETES
;
```

> Selecteert het aantal bedragen (dus het aantal tellen, NIET ALLES OPTELLEN → zie SUM)

> Telt geen NULL waarden (deze worden overgeslagen) waardoor je enkel het aantal niet-NULL waarden te zien krijgt.

> In combinatie met DISTINCT (vb: COUNT(DISTINCT PLAATS)) zal eerst DISTINCT uitgevoerd worden, en dan pas het aantal verschillende mogelijkheden geteld worden.

### MAX

```sql
SELECT
        MAX(BEDRAG)
FROM
        BOETES
;
```

> Selecteert het grootste veld uit kolom BEDRAG van tabel BOETES.

### MIN

```sql
SELECT
        MIN(BEDRAG)
FROM
        BOETES
;
```

> Selecteert het kleinste veld uit kolom BEDRAG van tabel BOETES.

### SUM

```sql
SELECT
        SUM(BEDRAG)
FROM
        BOETES
;
```

> Selecteert de som van alle velden uit kolom BEDRAG van tabel BOETES.

> Kan ook gebruikt worden in combinatie met DISTINCT: eerst worden alle dubbels weg gefilterd, daarna wordt de som van alle verschillende velden berekend.

### AVG

```sql
SELECT
        AVG(BEDRAG)
FROM
        BOETES
;
```

> Berekend het gemiddelde van alle velden uit kolom BEDRAG van tabel BOETES.

> NULL <> 0 en zal dus ook niet meegerekend worden als 0!

### GROUP BY

```sql
SELECT
        PLAATS
FROM
        SPELERS
GROUP BY 
        PLAATS
;
```

> Dit groepeert alle plaatsen (hetzelfde als DISTINCT) en geeft ze dan weer in alfabetische volgorde. ASC / DESC zelf aan te vullen. Standaard ASC (a → z).

> Ook mogelijk om op meerdere kolommen tegelijk toe te passen. Dit zal ervoor zorgen dat elke combinatie 1x voorkomt en in volgorde (ASC / DESC) zal worden weergegeven.

> let op: wanneer er geen GROUP BY component is en 1 of meerdere aggregatiefuncties voorkomen in dezelfde query, kan men geen specifieke kolommen extra mee opvragen. Voorbeeld: (zie hieronder) Hier kan men de kolom DATUM niet mee opvragen. Dit zou ervoor zorgen dat er slechts 1 DATUM zou weergegeven worden (ik denk de datum van de eerste rij in tabel BOETES) maar dat is alleszins niet de bedoeling.

```sql
SELECT
        COUNT(*), SUM(BEDRAG), DATUM
FROM
        BOETES
;
```

> Een specifieke kolom kan wel meegegeven worden als je hem in een aggregatiefunctie gebruikt (vb: MIN(DATUM)) of hem in een GROUP BY statement gebruikt. Je zou hier bijvoorbeeld GROUP BY DATUM kunnen toevoegen om het te laten werken, maar zijn count() en sum() dan nog wel nuttig? (NEE!!)

### HAVING 

- enkel HAVING in combinatie met GROUP BY
- = soort van WHERE op elke subgroep van GROUP BY → filter

> Voorbeeld 1:

```sql
SELECT
         PLAATS, COUNT(*)
FROM
         SPELERS
GROUP BY
         PLAATS HAVING COUNT(*) > 1
;
```

> Geeft de plaats, en het aantal keer dat de plaats voorkomt weer, gegroepeerd per plaats, enkel wanneer het aantal keer dat plaats voorkomt groter is dan 1.

> Hier mag je de specifieke kolom PLAATS wel gebruiken bij de aggregatiefunctie omdat je PLAATS ook gebruikt in je GROUP BY.

> Voorbeeld 2:

```sql
SELECT
        SPELERSNR, SUM(BEDRAG)
FROM
        BOETES
GROUP BY
        SPELERSNR HAVING SUM(BEDRAG) > 150
;
```

> Geeft de spelersnr, en de som van de bedragen weer, gegroepeerd per SPELERSNR, enkel wanneer het opgetelde bedrag per speler hoger is dan 150.

> Hier mag je de specifieke kolom SPELERSNR wel gebruiken bij de aggregatiefunctie omdat je SPELERSNR ook gebruikt in je GROUP BY.

