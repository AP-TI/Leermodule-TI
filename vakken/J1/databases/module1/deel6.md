# Deel 6

## Oefening 1

### 1A

```sql
SELECT
    betalingsnr,
    bedrag
FROM
    boetes;
```

### 1B

```sql
SELECT
    spelersnr,
    teamnr,
    gewonnen-verloren
FROM
    wedstrijden;
```

### 1C

```sql
SELECT
    spelersnr,
    teamnr,
    gewonnen-verloren AS resultaat
FROM
    wedstrijden;
```

## Oefening 2

### 2A

```sql
SELECT
    spelersnr,
    teamnr,
    CASE
        WHEN (gewonnen - verloren) > 0 THEN 'Gewonnen'
        WHEN (gewonnen - verloren) < 0 THEN 'Verloren'
        ELSE 'Gelijk'
    END AS resultaat
FROM
    wedstrijden;
```

### 2B

```sql
SELECT
    spelersnr,
    jaartoe,
    CASE
        WHEN (jaartoe < 1980) THEN 'Ouderen'
        WHEN (jaartoe >= 1980 AND jaartoe < 1983) THEN 'Jongeren'
        ELSE 'Kinderen'
    END AS Groep
FROM
    spelers;
```

### 2C

```sql
SELECT
    spelersnr,
    jaartoe,
    CASE
        WHEN (jaartoe < 1980) THEN
            CASE
                WHEN (bondsnr IS null) THEN 'Ouderen recreatief'
                ELSE 'Ouderen wedstrijd'
            END
        WHEN (jaartoe >= 1980 AND jaartoe < 1983) THEN 'Jongeren'
        ELSE 'Kinderen'
    END AS Groep
FROM
    spelers;
```

## Oefening 3

### 3A

```sql
SELECT
    spelersnr,
    naam,
    concat('+31(0)', RIGHT(TELEFOON, (LENGTH(TELEFOON) - 1))) AS telefoon
FROM
    spelers;
```

### 3B

```sql
SELECT
    spelersnr,
    naam,
    CASE
        WHEN (MONTH(geb_datum) = MONTH(CURRENT_DATE())) AND (DAY(geb_datum) = DAY(CURRENT_DATE())) THEN 'JARIG!'
        ELSE 'niet jarig'
    END AS FEEST
FROM
    spelers;
```

## Oefening 4

### 4A

```sql
SELECT
    max(gewonnen-verloren) AS maximum
FROM
    wedstrijden;
```

### 4B

```sql
SELECT
    count(wedstrijdnr) AS aantal
FROM
    wedstrijden;
```

## EXTRA

### EX1

```sql
SELECT
    naam as Uitgever
FROM
    tbluitgevers;
```

Of uitgebreider:

```sql
SELECT
    replace(naam, ' ', '_') as Uitgever
FROM
    tbluitgevers;
```

### EX2

```sql
SELECT
    lower(naam)
FROM
    tblgamedefinitions
;
```

### EX3

```sql
SELECT
    replace(replace(lower(naam), '-', '_'), ' ', '_') as Game
FROM
    tblgamedefinitions
;
```

### EX4

```sql
SELECT
    /*naam, CAST(releasedatum AS CHAR(10))*/
    naam,
    concat(DAY(releasedatum), '-', MONTH(releasedatum), '-', YEAR(releasedatum)) AS releasedatum
FROM
    tblconsoles
;
```

--> `naam, CAST(releasedatum AS CHAR(10))`is naar mijn mening een betere manier, maar dit geeft niet 100% het gewenste resultaat.

### EX5

```sql
SELECT
    naam, length(naam)
FROM
    tblgamedefinitions
;
```

### EX6

```sql
SELECT
    MAX(price) AS Hoogste_Prijs
FROM
    tblgames
;
```

### EX7

```sql
SELECT
    SUM(price) AS Max_Omzet
FROM
    tblgames
;
```

### EX8

```sql
SELECT
    naam, MIN(releasedatum)
FROM
    tblgamedefinitions
;
```

### EX9

```sql
SELECT
    gd.naam,
    price,
    CASE
        WHEN (gametypeid = 1) THEN 'Nieuw'
        ELSE 'Occasie'
    END AS gametypeid
FROM
    tblgames, tblgamedefinitions as gd
;
```

### EX10

```sql
select
    concat(naam, ';', id, ';', uitgever, ';', releasedatum, ';')
FROM
    tblgamedefinitions
;
```

### EX11

```sql
select
    g.price/*,
    gd.naam*/
FROM
    tblgamedefinitions as gd, tblgames as g
WHERE
    gd.naam = 'Super Ghouls \'n Ghosts'
    AND
    g.gamedefinitionid = gd.id
;
```

### EX12

```sql
select
    g.price,
    gd.naam,
    CASE
        WHEN (g.gametypeid = 1 && g.price < 50) THEN 'Nieuw - best buy'
        WHEN (g.gametypeid = 1 && g.price >= 50) THEN 'Nieuw - normaal'
        WHEN (g.gametypeid = 2 && g.price < 20) THEN 'Occassie - best buy'
        WHEN (g.gametypeid = 2 && g.price >= 20) THEN 'Occassie - normaal'
    END AS prijsindicator
FROM
    tblgamedefinitions as gd, tblgames as g
where
    gd.id = g.gamedefinitionid
;
```
