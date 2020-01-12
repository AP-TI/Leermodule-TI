# Deel 3

## Oefening 1

### 1

```sql
SELECT
    naam, voorletters, spelersnr
FROM
    spelers
ORDER BY SUBSTR(naam, 1, 1);
```

### 2

```sql
SELECT
    spelersnr, SUM(bedrag)
FROM
    boetes
GROUP BY spelersnr
ORDER BY SUM(bedrag);
```

### 3

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

## Oefening 2

### 1

```sql
SELECT
    spelersnr
FROM
    boetes
UNION SELECT
    spelersnr
FROM
    teams
UNION SELECT
    spelersnr
FROM
    spelers
WHERE
    plaats = 'Den Haag';
```

### 2

```sql
SELECT
    spelersnr
FROM
    bestuursleden
UNION SELECT
    spelersnr
FROM
    boetes
GROUP BY spelersnr
HAVING COUNT(*) >= 2
```

### 3

```sql
SELECT
    MAX(datum)
FROM
    (SELECT
        MAX(geb_datum) AS datum
    FROM
        spelers UNION SELECT
        MAX(datum)
    FROM
        boetes) AS datums;
```

### 4

#### Mogelijkheid 1

```sql
SELECT
    s.spelersnr, s.naam, COALESCE(SUM(b.bedrag), 0) as totaal
FROM
    spelers s
        LEFT OUTER JOIN
    boetes b ON s.spelersnr = b.spelersnr
GROUP BY spelersnr
ORDER BY totaal;
```

#### Mogelijkheid 2

```sql
SELECT
    spelersnr,
    naam,
    COALESCE((SELECT
                    SUM(bedrag)
                FROM
                    boetes b
                WHERE
                    b.spelersnr = s.spelersnr),
            0) AS totaal
FROM
    spelers s
ORDER BY totaal;
```
