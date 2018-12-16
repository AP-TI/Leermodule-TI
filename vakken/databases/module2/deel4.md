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
## Oefening 2
### 2.
View 1: we selecteren alle spelersnummers uit de tabel wedstrijden waar het teamnummer gelijk is aan 2.
```sql
CREATE VIEW v_spelersnr_wedstrijden AS
    SELECT
        spelersnr
    FROM
        wedstrijden
    WHERE
        teamnr = 2;
```
View 2: we selecteren het gemiddelde boetebedrag van een speler uit team 2. Hiervoor maken we gebruik van de view die we hierboven hebben aangemaakt.
```sql
CREATE VIEW v_gemiddeld AS
    SELECT
        AVG(bedrag)
    FROM
        boetes
    WHERE
        spelersnr IN (SELECT * from v_spelersnr_wedstrijden);
```
View 3: we selecteren enkel de spelersnummers die boetes hebben welke groter zijn dan het gemiddelde van team 2, hiervoor maken we gebruik van de view die we hierboven hebben aangemaakt. Het `DISTINCT`-keyword zorgt ervoor dat dubbele spelersnummers uit ons resultaat worden verwijderd.
```sql
CREATE VIEW v_spelers_meer_dan_gemiddeld_boete AS
    SELECT DISTINCT
         spelersnr
    FROM
        boetes
    WHERE
        bedrag > (SELECT * from v_gemiddeld);
```
Om te testen of alles werkt selecteren we alles uit onze laatst aangemaakte view.
```sql
SELECT
    *
FROM
    v_spelers_meer_dan_gemiddeld_boete;
```
