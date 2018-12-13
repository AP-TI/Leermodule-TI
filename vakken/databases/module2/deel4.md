# Deel 4
## Oefening 1
### 1.
```sql
CREATE VIEW v_aantalsp AS
    SELECT
        teamnr, COUNT(DISTINCT spelersnr) AS aantal
    FROM
        wedstrijden
    GROUP BY teamnr
    UNION SELECT
        teamnr, 0 as aantal
    FROM
        teams t
    WHERE
        t.teamnr NOT IN (SELECT DISTINCT
                teamnr
            FROM
                wedstrijden);
```
### 2.
```sql
CREATE VIEW v_teamvanaf5 (teamnr , aantalspelers) AS
    SELECT
        *
    FROM
        v_aantalsp
    WHERE
        teamnr >= 5;
```
