# Deel 7

## Oefening 1

### 1

```sql
SELECT
    spelersnr,
    (SELECT
            COUNT(spelersnr)
        FROM
            wedstrijden w
        WHERE
            w.spelersnr = spelers.spelersnr) AS aantal
FROM
    spelers
```

### 3

```sql
SELECT
    Divisie,
    (SELECT
            divisie
        FROM
            teams
        WHERE
            teamnr = 2) AS `Divisie Team 2`
FROM
    teams
WHERE
    teamnr = 1;
```

## Oefening 2

### 1

(lees gewoon de errors in de output)

### 2.1

```sql
SELECT
    t.teamnr, s.naam
FROM
    teams t,
    spelers s
WHERE
    t.spelersnr = s.spelersnr;
```

### 2.2

```sql
SELECT
    w.wedstrijdnr, s.naam, t.divisie
FROM
    wedstrijden w,
    spelers s,
    teams t
WHERE
    w.spelersnr = s.spelersnr
        AND w.teamnr = t.teamnr
```

### 2.3

```sql
SELECT
    s.spelersnr
FROM
    spelers s
WHERE
    s.geb_datum < (SELECT
            geb_datum
        FROM
            spelers
        WHERE
            naam = 'Permentier'
                AND voorletters = 'r');
```
