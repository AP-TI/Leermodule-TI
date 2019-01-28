# PPT4

## VIEWS

> Een view is een soort virtuele tabel. Men voert een bepaalde formule uit die als resultaat een (virtuele) tabel geeft. De inhoud van deze tabel wordt NIET opgeslagen, vandaar de term ‘virtueel’.

> De naam van een view laat je altijd beginnen met “V_”, zodat je altijd gemakkelijk views herkent.

```sql
CREATE VIEW V_WOONPLAATS AS
SELECT
  DISTINCT PLAATS
FROM
  SPELERS
;
```

> De inhoud van het view V_WOONPLAATS zal de uitvoer van de query eronder bevatten. Vergeet de “AS” na de view-naam niet!

> Je kan views in views gebruiken, net zoals je methodes in methodes kan gebruiken in c#. Een beetje te gemakkelijk voor een heel voorbeeld. Zie PPT4 dia 5 indien je toch een uitgewerkt voorbeeld wenst.

> LET OP: je kan geen dingen uit views verwijderen, zonder dat je deze in de basistabel zelf verwijderd! Als je een DELETE-instructie voor een view schrijft, zal dit de data uit de basistabel verwijderen.

> Je kan ook views maken die niet gebaseerd zijn op tabellen. 

```sql
CREATE VIEW V_CIJFERS AS
SELECT
  ‘0’ CIJFER 
UNION SELECT
  ‘1’
UNION SELECT
  ‘2’
UNION SELECT
  ‘3’
;
```
> Dit geeft een kolom met de waarden 0, 1, 2, 3
> Specifieke kolomnamen kan je makkelijk tussen haakjes meegeven, tussen je view-naam en de “AS”. Voorbeeld:

```sql
CREATE VIEW V_INWONERS
(
  PLAATS,
  AANTAL
) AS
SELECT
  PLAATS,
  COUNT(*)
FROM
  SPELERS
GROUP BY
  PLAATS;
```

### VIEW MUTATIE

> Wanneer je je view wil aanpassen of muteren, gebruik je het UPDATE statement. Voorbeeld:

```sql
UPDATE
  V_VETERANEN
SET
  GEB_DATUM = ‘1970-09-01’
WHERE 
  SPELERSNR = 2;
```

> Bij het aanmaken van een view kan je op het einde “WITH CHECK OPTION” toevoegen. Dit zorgt ervoor dat bij mutaties de data alleen wordt aangepast indien de rijen weerhouden worden, anders niet. Dit bespaart tijd. Een delete instructie werkt dan ook wanneer de te verwijderen rij deel uitmaakt van de view. Wanneer je “WITH CHECK OPTION ” op alle views die er gemaakt/gebruikt worden van toepassing wil maken doe je “WITH CASCADED CHECK OPTION”.

> De SELECT-component mag het volgende niet bevatten:
- DISTINCT
- Aggregatiefunctie
- GROUP/ORDER BY
- SET

> De FROM-component mag slechts één tabel gebruiken

> Indien je dit wel doet zullen INSERT-query’s nooit werken.

### DROP VIEW 

> verwijderd ook alle views afhankelijk van het verwijderde view

## USERS
### CREATE USER

```sql
CREATE USER CHRIS@TEST IDENTIFIED BY ‘CHRISSEC’;
```

> De gebruiker CHRIS zal alleen kunnen inloggen vanaf de machine TEST, met het wachtwoord ‘CHRISSEC’

```sql
CREATE USER CHRIS IDENTIFIED BY ‘CHRISSEC’;
```

> Achter CHRIS wordt er hier automatisch @% geplaatst. % wil hier zeggen dat CHRIS zal kunnen inloggen vanaf elke machine.

### ALTER USER

```sql
ALTER USER CHRIS IDENTIFIED BY ‘BOND007’;
```

> Verandert het wachtwoord in ‘BOND007’

### DROP USER

```sql
DROP USER CHRIS;
```

> Verwijderd de user CHRIS

### BEVOEGDHEDEN GEVEN

#### Per Kolom
- SELECT (VIEW)
- INSERT
- DELETE
- UPDATE
- REFERENCES
- ALTER
- INDEX
- ALL = Alle bevoegdheden

```sql
GRANT INSERT, UPDATE
ON    SPELERS
TO    CHRIS;
```

> De user CHRIS krijgt bevoegdheden om insert en update query’s uit te voeren op alle kolommen in de tabel SPELERS.

```sql
GRANT UPDATE (SPELERSNR, DIVISIE)
ON    TEAMS
TO    CHRIS;
```

> De user CHRIS krijgt bevoegdheden om update query’s te schrijven op de kolommen SPELERSNR en DIVISIE in tabel TEAMS.

```sql
CREATE VIEW V_NV AS
SELECT
  NAAM,
  VOORLETTERS
FROM
  SPELERS;

GRANT SELECT
ON    V_NV
TO    CHRIS;
```

> Het view V_NV (Naam Voorletters) wordt aangemaakt met als inhoud de kolommen NAAM en VOORLETTERS uit tabel SPELERS. Wanneer je de user CHRIS toegang geeft tot het view, geef je hem eigenlijk ook toegang tot de echte kolommen NAAM en VOORLETTERS.

#### Per Database
- CREATE
- CREATE VIEW
- CREATE/DROP/EXECUTE ROUTINE
- DROP
- LOCK TABLES
- SELECT (VIEW)
- INSERT
- DELETE
- UPDATE
- REFERENCES
- ALTER
- INDEX
- ALL = Alle bevoegdheden

```sql
GRANT SELECT
ON    TENNIS.*
TO    CHRIS;
```

> De user CHRIS krijgt SELECT rechten op alle tabellen binnen de database TENNIS.

```sql
GRANT SELECT, INSERT
ON    *
TO    PAUL;
```

> De user PAUL krijgt bevoegdheden op alle tabellen binnen je GESELECTEERDE DATABASE.

```sql
GRANT SELECT, INSERT
ON    *.*
TO    PAUL;
```

> De user PAUL krijgt bevoegdheden op alle tabellen van alle databases.

```sql
GRANT ALL
ON    *.*
TO    ROOT;
```
> hahah want precies of ROOT heeft niet alle rechten…

Wat als de gebruiker zijn bevoegdheden mag doorgeven (en zelf ook behouden)?

```sql
GRANT SELECT
ON    TEAMS
TO    CHRIS
WITH GRANT OPTION;
```

> De user CHRIS kan nu alle gebruikers ook de bevoegdheid geven om SELECT instructies los te laten op tabel TEAMS.

### BEVOEGDHEDEN INTREKKEN

```sql
REVOKE  SELECT
ON      SPELERS
FROM    CHRIS;
```

> CHRIS’ SELECT-bevoegdheid op tabel SPELERS wordt ingetrokken.

### ROLES 
**NIET IN MYSQL, enkel MS SQL Server**

```sql
CREATE ROLE VERKOOP;
-- 
GRANT SELECT, INSERT
ON    BOETES
TO    VERKOOP;
--
GRANT SELECT, INSERT
ON    BOETES
TO    VERKOOP;
--
DROP VERKOOP;
```

> Maak een role VERKOOP.

> Geef bevoegdheden aan VERKOOP.

> Geef de role VERKOOP door aan de juiste users.

> Indien gewenst kan je de role nu verwijderen.

> Om een role terug in te trekken doe je:

```sql
REVOKE VERKOOP FROM PAUL;
```
