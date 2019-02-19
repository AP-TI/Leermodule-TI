# Deel 8
## Oefening 1
### 1.
#### a)
```sql
SELECT
    wedstrijdnr, naam
FROM
    wedstrijden w
        INNER JOIN
    spelers s ON w.spelersnr = s.spelersnr;
```
Of andersom:
```sql
SELECT
    wedstrijdnr, naam
FROM
    spelers s
        INNER JOIN
    wedstrijden w ON w.spelersnr = s.spelersnr;
```
Eventueel met `ORDER BY wedstrijdnr` zodat de wedstrijden staan gesorteerd
```sql
SELECT
    wedstrijdnr, naam
FROM
    spelers s
        INNER JOIN
    wedstrijden w ON w.spelersnr = s.spelersnr
ORDER BY wedstrijdnr;
```
#### b)
```sql
SELECT
    wedstrijdnr, naam, divisie
FROM
    spelers s
        INNER JOIN
    wedstrijden w ON w.spelersnr = s.spelersnr
        INNER JOIN
    teams t ON w.teamnr = t.teamnr;
```
#### c)
```sql
SELECT
    s.spelersnr, s.naam, s.plaats
FROM
    spelers s
        INNER JOIN
    (SELECT
        *
    FROM
        spelers
    WHERE
        spelersnr = 27) s1 ON s.plaats = s1.plaats
WHERE
    s.spelersnr <> 27;
```
## Oefening 2
### 1.
#### a)
```sql
SELECT
    s.spelersnr, teamnr
FROM
    spelers s
        LEFT OUTER JOIN
    wedstrijden w ON s.spelersnr = w.spelersnr;
```
Je kan ook het `DISTINCT`-keyword gebruiken om dubbele resultaten eruit te halen
```sql
SELECT DISTINCT
    s.spelersnr, teamnr
FROM
    spelers s
        LEFT OUTER JOIN
    wedstrijden w ON s.spelersnr = w.spelersnr;
```
#### b)
We gebruiken de `COALESCE()`-functie om NULL-waarden te vervangen door 0.
```sql
SELECT DISTINCT
    s.spelersnr,
    COALESCE(bedrag, 0) AS bedrag,
    COALESCE(teamnr, 0) AS teamnr
FROM
    spelers s
        LEFT OUTER JOIN
    wedstrijden w ON s.spelersnr = w.spelersnr
        LEFT OUTER JOIN
    boetes b ON s.spelersnr = b.spelersnr;
```
## Oefening 3
### 1.
#### a)
```sql
SELECT
    betalingsnr
FROM
    boetes
WHERE
    bedrag > 60;
```
#### b)
```sql
SELECT
    spelersnr
FROM
    wedstrijden
WHERE
    gewonnen + verloren = 5;
```
#### c)
```sql
SELECT
    spelersnr, naam, voorletters
FROM
    spelers
WHERE
    spelersnr = (SELECT
            spelersnr
        FROM
            boetes
        WHERE
            betalingsnr = 4);
```
#### d)
```sql
SELECT
    spelersnr, naam, voorletters
FROM
    spelers
WHERE
    spelersnr = (SELECT
            spelersnr
        FROM
            teams
        WHERE
            teamnr = (SELECT
                    teamnr
                FROM
                    wedstrijden
                WHERE
                    wedstrijdnr = 2));
```
Onderstaande oplossing waarin een `INNER JOIN` wordt gebruikt geeft hetzelfde resultaat, maar de oefening dient om vergelijkingsoperatoren te leren gebruiken, daarom zou je de bovenstaande oplossing moeten bekomen.
```sql
SELECT
    spelersnr, naam, voorletters
FROM
    spelers
WHERE
    spelersnr = (SELECT
            t.spelersnr
        FROM
            teams t
                INNER JOIN
            wedstrijden w ON t.spelersnr = w.spelersnr
        WHERE
            wedstrijdnr = 2);
```
Daarbij zou het vreemd zijn om eerst een vergelijkingsoperator te gebruiken en daarna een `INNER JOIN`. Je kan dan beter gewoon 2 keer gebruik maken van een `INNER JOIN` zoals in onderstaand voorbeeld:
```sql
SELECT
    s.spelersnr, naam, voorletters
FROM
    spelers s
        INNER JOIN
    teams t ON s.spelersnr = t.spelersnr
        INNER JOIN
    wedstrijden w ON t.spelersnr = w.spelersnr
WHERE
    wedstrijdnr = 2;
```
#### e)
```sql
SELECT
    betalingsnr, spelersnr
FROM
    boetes b
WHERE
    spelersnr = (SELECT
            spelersnr
        FROM
            teams t
        WHERE
            t.spelersnr = b.spelersnr);
```
## Oefening 4
### 1.
#### a)
```sql
SELECT
    spelersnr, naam, plaats
FROM
    spelers
WHERE
    geslacht = 'V'
        AND NOT (plaats = 'Den Haag');
```
#### b)
```sql
SELECT
    betalingsnr, bedrag
FROM
    boetes
WHERE
    bedrag IN (50 , 75, 100);
```
#### c)
```sql
SELECT
    betalingsnr, bedrag
FROM
    boetes
WHERE
    bedrag IN (100 , 5 * betalingsnr,
        (SELECT
                bedrag
            FROM
                boetes
            WHERE
                betalingsnr = 2));
```
## Oefening 5
### 1.
#### a)
```sql
SELECT
    spelersnr, naam
FROM
    spelers
WHERE
    spelersnr IN (SELECT
            spelersnr
        FROM
            boetes
        WHERE
            bedrag > 50);
```
#### b)
```sql
SELECT
    spelersnr, naam
FROM
    spelers
WHERE
    spelersnr IN (SELECT
            spelersnr
        FROM
            boetes
        WHERE
            spelersnr NOT IN (SELECT 
                    spelersnr
                FROM
                    teams
                WHERE
                    divisie = 'ere'));
```
Alternatieve oplossing:
```sql
SELECT
    spelersnr, naam
FROM
    spelers
WHERE
    spelersnr IN (SELECT
            spelersnr
        FROM
            boetes)
        AND spelersnr NOT IN (SELECT
            spelersnr
        FROM
            teams
        WHERE
            divisie = 'ere');
```
