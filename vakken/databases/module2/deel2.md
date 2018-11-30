# Deel 2
Vanaf dit deel zet ik alle keywords in hoofdletters omdat de code zo overzichtelijker is.
## Oefening 1
### 1.
```sql
SELECT 
    COUNT(DISTINCT functie) AS `Aantal Bestuursfuncties`
FROM
    bestuursleden;
```
### 2.
```sql
SELECT DISTINCT
    spelersnr,
    (SELECT 
            s.naam
        FROM
            spelers s
        WHERE
            s.spelersnr = w1.spelersnr) AS naam
FROM
    wedstrijden w1
WHERE
    1 < (SELECT 
            COUNT(spelersnr)
        FROM
            wedstrijden w
        WHERE
            w.spelersnr = w1.spelersnr
                AND gewonnen > verloren);
```
### 3.
```sql
SELECT DISTINCT
    spelersnr,
    (SELECT 
            naam
        FROM
            spelers s
        WHERE
            b.spelersnr = s.spelersnr) AS naam,
    (SELECT 
            COUNT(spelersnr)
        FROM
            boetes b1
        WHERE
            b.spelersnr = b1.spelersnr) AS `aantal boetes`
FROM
    boetes b
WHERE
    1 < (SELECT 
            COUNT(spelersnr)
        FROM
            boetes b1
        WHERE
            b.spelersnr = b1.spelersnr);
```
## Oefening 2
### 1.
```sql
SELECT 
    MIN(gewonnen - verloren) as `laagste aantal`
FROM
    wedstrijden
WHERE
    gewonnen > verloren;
```
### 2.
```sql
SELECT DISTINCT
    spelersnr, bedrag, datum
FROM
    boetes b
WHERE
    b.bedrag = (SELECT 
            MAX(bedrag)
        FROM
            boetes b1
        WHERE
            b.spelersnr = b1.spelersnr);
```
### 3.
```sql
SELECT DISTINCT
    spelersnr,
    COALESCE((SELECT 
                    MAX(bedrag)
                FROM
                    boetes b2
                WHERE
                    s.spelersnr = b2.spelersnr),
            0) AS `Hoogste bedrag`,
    COALESCE((SELECT 
                    MIN(bedrag)
                FROM
                    boetes b2
                WHERE
                    s.spelersnr = b2.spelersnr),
            0) AS `Laagste bedrag`
FROM
    spelers s;
```
## Oefening 3
### 1.
```sql
SELECT 
    AVG(bedrag)
FROM
    boetes b
WHERE
    1 IN (SELECT 
            teamnr
        FROM
            wedstrijden w
        WHERE
            b.spelersnr = w.spelersnr);
```
### 2.
```sql
SELECT DISTINCT
    spelersnr,
    (SELECT 
            naam
        FROM
            spelers s
        WHERE
            w.spelersnr = s.spelersnr) AS naam
FROM
    wedstrijden w
WHERE
    8 = (SELECT 
            SUM(gewonnen)
        FROM
            wedstrijden w1
        WHERE
            w.spelersnr = w1.spelersnr);
```
### 3.
```sql
SELECT 
    COALESCE((SELECT 
                    MAX(bedrag)
                FROM
                    boetes b
                WHERE
                    s.spelersnr = b.spelersnr),
            0) AS `Maximale Boete`,
    COALESCE((SELECT 
                    AVG(bedrag)
                FROM
                    boetes b
                WHERE
                    s.spelersnr = b.spelersnr),
            0) AS `Gemiddelde Boete`
FROM
    spelers s;
```