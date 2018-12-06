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
## Oefening 4
### 1.
```sql
SELECT
    jaartoe
FROM
    spelers
GROUP BY jaartoe;
```
### 2.
```sql
SELECT
    jaartoe, count(*)
FROM
    spelers s
GROUP BY jaartoe;
```
### 3.
```sql
SELECT 
    teamnr, COUNT(*), SUM(gewonnen)
FROM
    wedstrijden w
WHERE
    w.teamnr = (SELECT 
            teamnr
        FROM
            teams
        WHERE
            divisie = 'ere')
GROUP BY teamnr;
```
## Oefening 5
### 1.
#### Oplossing 1
```sql
SELECT 
    s.spelersnr, naam, SUM(bedrag)
FROM
    spelers s
        INNER JOIN
    boetes b ON s.spelersnr = b.spelersnr
GROUP BY s.spelersnr , naam;
```
#### Oplossing 2
```sql
SELECT 
    spelersnr,
    (SELECT 
            naam
        FROM
            spelers s
        WHERE
            s.spelersnr = b.spelersnr) AS naam,
    SUM(bedrag)
FROM
    boetes b
GROUP BY spelersnr;
```
Dit is wel juist, maar van de oefening wordt verwacht dat je een `GROUP BY` op 2 kolommen tegelijk kan toepassen, daarom moet je oplossing 1 ook snappen.
### 2.
```sql
SELECT 
    t.teamnr, t.divisie, SUM(w.gewonnen)
FROM
    teams t
        INNER JOIN
    wedstrijden w ON t.teamnr = w.teamnr
GROUP BY t.teamnr , t.divisie;
```
## Oefening 6
### 1.
```sql
SELECT 
    FLOOR(spelersnr / 25 + 1) AS groep,
    COUNT(*) AS aantal,
    MAX(spelersnr) AS `Max spelersnr`
FROM
    spelers
GROUP BY FLOOR(spelersnr / 25 + 1);
```
### 2.
```sql
SELECT DISTINCT
    w.spelersnr, coalesce(b.aantal, 0) as aantal
FROM
    wedstrijden w
        LEFT OUTER JOIN
    (SELECT 
        spelersnr, COUNT(*) AS aantal
    FROM
        boetes
    GROUP BY spelersnr) b ON w.spelersnr = b.spelersnr;
```
### 3.
```sql
SELECT 
    w.teamnr, COUNT(DISTINCT (spelersnr)) AS aantal
FROM
    wedstrijden w
        INNER JOIN
    (SELECT 
        teamnr
    FROM
        teams t
    INNER JOIN spelers s ON s.spelersnr = t.spelersnr
    WHERE
        plaats = 'Den Haag') AS team_denhaag ON team_denhaag.teamnr = w.teamnr
WHERE
    gewonnen > verloren
GROUP BY w.teamnr;
```
## Oefening 7
### 1.
```sql
SELECT 
    plaats
FROM
    spelers
GROUP BY plaats
HAVING COUNT(*) > 4;
```
### 2.
```sql
SELECT 
    spelersnr
FROM
    boetes
GROUP BY spelersnr
HAVING SUM(bedrag) > 150;
```
### 3.
```sql
SELECT 
    teamnr, divisie
FROM
    teams
WHERE
    teamnr IN (SELECT 
            teamnr
        FROM
            wedstrijden
        GROUP BY teamnr
        HAVING COUNT(DISTINCT spelersnr) > 4)
```
### 4.
```sql
SELECT 
    spelersnr
FROM
    boetes
GROUP BY spelersnr
HAVING SUM(bedrag) = (SELECT 
        SUM(bedrag) * 2
    FROM
        boetes
    WHERE
        spelersnr = 104);
```