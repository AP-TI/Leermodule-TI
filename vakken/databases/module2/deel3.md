# Deel 3
## Oefening 1
### 1.
```sql
SELECT 
    naam, voorletters, spelersnr
FROM
    spelers
ORDER BY SUBSTR(naam, 1, 1);
```
### 2.
```sql
SELECT 
    spelersnr, SUM(bedrag)
FROM
    boetes
GROUP BY spelersnr
ORDER BY SUM(bedrag);
```
### 3.
```sql
SELECT 
    spelersnr,
    naam,
    coalesce((SELECT 
            SUM(bedrag)
        FROM
            boetes b
        WHERE
            b.spelersnr = s.spelersnr), 0) AS TotaalBedrag
FROM
    spelers s
GROUP BY spelersnr
ORDER BY 3;
```