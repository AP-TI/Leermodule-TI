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
