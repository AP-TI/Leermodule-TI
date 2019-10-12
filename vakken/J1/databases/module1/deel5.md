# Deel 5
## Oefening 1:
### 1A
```sql
INSERT INTO boetes (betalingsnr, spelersnr, datum, bedrag)
VALUES (15, 27, '1985-11-08', 75.00);
```
### 1B
```sql
INSERT INTO Boetes
SELECT
    betalingsnr + 1000,
    spelersnr,
    datum,
    bedrag
FROM
    boetes
WHERE
    bedrag < (SELECT AVG(bedrag) FROM boetes)
    OR spelersnr = 27
;
```
## Oefening 2:
### 2A
```sql
UPDATE Boetes
SET bedrag = bedrag * 1.10;
```
### 2B
```sql
DELETE
FROM boetes
WHERE betalingsnr > 1000;
```
