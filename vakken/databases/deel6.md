# Deel 6
## Oefening 1:
### 1A
```
SELECT 
    betalingsnr, 
    bedrag 
FROM 
    boetes;
```
### 1B
```
SELECT 
    spelersnr, 
    teamnr, 
    gewonnen-verloren
FROM 
    wedstrijden;
```
### 1C
```
SELECT 
    spelersnr,
    teamnr, 
    gewonnen-verloren AS resultaat
FROM 
    wedstrijden;
```
## Oefening 2:
### 2A
```
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
```
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
```
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
## Oefening 3:
### 3A
```
SELECT
    spelersnr,
    naam,
    concat('+31(0)', RIGHT(TELEFOON, (LENGTH(TELEFOON) - 1))) AS telefoon
FROM
    spelers;
```
### 3B
```
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
## Oefening 4:
### 4A
```
SELECT 
    max(gewonnen-verloren) AS maximum
FROM 
    wedstrijden;
```
### 4B
```
SELECT 
    count(wedstrijdnr) AS aantal
FROM 
    wedstrijden;
```
## EXTRA
### EX1
```
SELECT 
    naam as Uitgever
FROM 
    tbluitgevers;
```
Of uitgebreider:
```
SELECT 
    replace(naam, ' ', '_') as Uitgever
FROM 
    tbluitgevers;
```
### EX2
```
SELECT 
    lower(naam)
FROM 
    tblgamedefinitions
;
```
### EX3
```
SELECT 
    replace(replace(lower(naam), '-', '_'), ' ', '_') as Game
FROM 
    tblgamedefinitions
;
```
