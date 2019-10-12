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
## Oefening 3
### 1.
```sql
CREATE USER RONALDO@LOCALHOST IDENTIFIED BY 'NIKE';
```
### 3.
Als je onderstaand statement probeert uit te voeren, krijg je een foutmelding: `Error Code: 1142. SELECT command denied to user 'RONALDO'@'localhost' for table 'spelers'`. Dit komt omdat de gebruiker 'RONALDO' geen toestemming heeft om het select-commando uit te voeren.
```sql
SELECT * FROM TENNIS.SPELERS
```
### 4.
```sql
DROP USER RONALDO@LOCALHOST;
```
## Oefening 4
### 1.
```sql
CREATE USER ALYSSA@LOCALHOST IDENTIFIED BY 'BOND007';
```
### 2.
```sql
GRANT SELECT ON tennis.spelers TO ALYSSA@LOCALHOST;
```
### 4.
Dit lukt.
### 5.
```sql
CREATE USER dennis@localhost;
```
Dit lukt niet.

Om dit op te lossen loggen we terug in als root en geven we ALYSSA het recht om gebruikers aan te maken:
```sql
GRANT CREATE USER ON *.* TO ALYSSA@LOCALHOST;
```
Als we nu opnieuw het `CREATE USER`-commando uitvoeren, krijgen we geen error meer op het account 'ALYSSA'.
## Oefening 5
LET OP: Roles behoren op dit moment niet tot onze leerstof, aangezien dit vroeger geen onderdeel was van MySQL. In de laatste versie is dit echter wel toegevoegd. Meer info daarover [hier](https://dev.mysql.com/doc/refman/8.0/en/roles.html).
### 1.
```sql
CREATE ROLE bestuur;
```
```sql
GRANT ALL ON tennis.bestuursleden TO bestuur;
```
### 2.
```sql
GRANT bestuur TO ALYSSA@LOCALHOST, dennis@LOCALHOST;
```
