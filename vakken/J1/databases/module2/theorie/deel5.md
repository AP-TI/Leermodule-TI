# PPT5

### STORED PROCEDURES

#### DELIMITER

> Bij het gebruik van stored procedures verander je best eerst de DELIMETER naar ‘//’. De DELIMETER is het karakter dat ervoor zorgt dat een instructie afgesloten wordt (de ‘;’ achter elke instructie), maar aangezien je meerdere code-blocks in 1 stored procedure gebruikt ga je dus meerdere ‘;’ nodig hebben moet dit dus aangepast worden. Anders leest mysql het einde van je stored procedure nog ver voordat hij effectief gedaan is.

```sql
DELIMITER //
```

> Vergeet op het einde de DELIMETER niet terug te zetten naar ‘;’

#### IN PARAM

```sql
CREATE PROCEDURE DELETE_WEDSTRIJDEN
  (IN P_SPELERSNR INTEGER)
BEGIN
...
END //
```

> Maak een DELETE PROCEDURE aan, met als meegegeven variabele (IN) P_SPELERSNR. Noem variabelen altijd “P_%” zodat je weet dat dat de procedure variabelen zijn. Geef ook gelijk het type mee (INTEGER). Tussen BEGIN en END // komt de body van de stored procedure, waar je iets kan doen met de IN variabele.

> Je hebt de procedure nu aangemaakt, maar nog niet uitgevoerd. Een stored procedure voer je uit met CALL.

```sql
CALL DELETE_WEDSTRIJDEN(8);
```

> Waarbij (8) de IN variabele P_SPELERSNR is die je gebruikt in de body.

#### OUT PARAM

> Naast de IN (invoerparameter) heb je ook OUT (uitvoerparameter). Je kan zowel IN, als OUT, als IN en OUT parameters hebben. Een OUT parameter moet ook al geïnitialiseerd zijn voor je heb kan gebruiken in een stored procedure. Voorbeeld:

```sql
SET @AANTAL = 0;
-- 
DELIMITER //
CREATE PROCEDURE AANTAL_BOETES
(
  IN P_SPELERSNR INTEGER,
  OUT P_AANTAL INTEGER
)
BEGIN
  SET P_AANTAL = (SELECT COUNT(*) FROM TENNIS.BOETES
                      WHERE SPELERSNR = P_SPELERSNR);
END //
DELIMITER ;
--
CALL AANTAL_BOETES(8,@AANTAL);
SELECT @AANTAL;
```

> Je geeft hier dus 2 parameters mee in de CALL functie. @AANTAL verwijst naar de variabele die je voor de procedure hebt aangemaakt. Doe SET P_AANTAL om er een waarde aan toe te kennen. Nadien kan je die variabele ook makkelijk afdrukken met een SELECT.

#### LOCAL VAR

> Soms heb je echter een extra locale variabele nodig. Voorbeeld:

```sql
...
BEGIN
  DECLARE GETAL1 INTEGER DEFAULT 100;
  SET GETAL1 = 100;
END //
```

> Deze DECLARE je in het BEGIN-END blok. Hier zet je de naam op GETAL1, en het is een integer met defaultwaarde 100. Daarna kan je met SET een waarde toekennen aan de gemaakte variabele.

#### IF ELSE

```sql
BEGIN
  IF  P1 > P2 THEN
    SET P3 = P1;
  ELSE
    IF P1 = P2 THEN
      SET P3 = P1;
    ELSE
      SET P3 = P2;
    END IF;
  END IF;
END //
```

> Gewoon hetzelfde als de if structuur in csharp, alleen moet je hier de if else echt afsluiten met END IF. 

#### CASE

```sql
BEGIN
  CASE
    WHEN P1 > P2 THEN SET P3 = P1;
    WHEN P1 = P2 THEN SET P3 = P2;
    ELSE SET P3 = P2;
  END CASE;
END //
```

> Case zoals geleerd in DB1…

#### WHILE

```sql
BEGIN    
  SET TELLER = -1;
  WHILE  TELLER <  WACHT_AANTAL DO
    SET TELLER = TELLER + 1;
  END WHILE;    
END //
```

> WHILE … DO … END WHILE.

#### REPEAT
```sql
BEGIN    
  SET TELLER = -1;
  REPEAT
    SET TELLER = TELLER + 1;
  UNTIL TELLER = WACHT_AANTAL END REPEAT;    
END //
```

> Volgens mij echt los hetzelfde concept als WHILE, FOR, … 

#### LOOP

```sql
BEGIN    
  SET TELLER = -1;
  LOOP1: LOOP
    IF TELLER = WACHT_AANTAL  THEN
      LEAVE LOOP1;
    ELSE
      BEGIN
        SET TELLER = TELLER + 1; 
        ITERATE LOOP1;               
      END;
    END IF;
  END LOOP LOOP1;    
END //   
```

> Opnieuw echt los hetzelfde concept als WHILE, FOR, … (ik zie het een beetje als een while true met een if, en dan break;, ik denk niet dat Olga hiermee akkoord gaat...)

> Voorbeeld in PPT5 dia 19: je maakt een variabele EIND die je met de CALL functie meegeeft als OUT-parameter. In de stored procedure geef je er de juiste waarde aan met SET, en kan je hem gebruiken. 

#### CALL

> In de CALL functie kan je ook expressies gebruiken die 1 waarde geven. Voorbeeld: 

```sql
SET @EIND = 0;
CALL WACHTEN((SELECT COUNT(*) FROM BOETES),@EIND);
```

> Count geeft hier 1 waarde weer, die geef je door aan de IN-PARAM in de stored procedure. 

```sql
CALL TENNIS.WACHTEN(...)
```

> Hier gebruik je de databasenaam om extra specifiek te zijn. Dit moet niet, maar kan duidelijker zijn.

```sql
BEGIN    
  SET TELLER = -1;
  WHILE  TELLER <  WACHT_AANTAL DO
    SET TELLER = TELLER + 1;
    CALL WACHTEN (WACHT_AANTAL-1,TELLER);
  END WHILE;    
END //
```

> Hier wordt getoond hoe je een CALL functie recursief kan gebruiken.

#### SELECT INTO

in een procedure de uitvoer van een SELECT opslaan in variabelen of parameters.
het resultaat van de SELECT mag slechts 1 rij bevatten.

```sql
BEGIN    
  SELECT
    SUM(BEDRAG) INTO SOM_BOETES    
  FROM
    BOETES 
  WHERE
    SPELERSNR = P_SPELERSNR;    
END //
```

> de uitvoer van SUM(BEDRAG) zal via INTO worden opgeslagen in SOM_BOETES, aangezien SUM() maar 1 rij terug geeft.

```sql
BEGIN
  SELECT
    PLAATS, STRAAT, HUISNR, POSTCODE
      INTO P_PLAATS, P_STRAAT, P_HUISNR, P_POSTCODE
  FROM
    SPELERS
  WHERE
    SPELERSNR = P_SPELERSNR;
END //
```

> INTO neemt een hele rij, en kan dus meerdere variabelen tegelijk aan.

#### HANDLERS

- ERRORS ERRORS ERRORS
  - error-code
  - SQLSTATE
  - NOT FOUND
  - SQLWARNING
  - SQLEXEPTION

> Voorbeeld

```sql
DELIMITER //

CREATE PROCEDURE DUBBEL
(
  OUT P_VERWERKT SMALLINT
)
BEGIN
   SET P_VERWERKT = 1;
   INSERT INTO TEAMS VALUES (2,27,'derde');
   SET P_VERWERKT = 2;
END //

DELIMITER ;

CALL DUBBEL(@VERWERKT);
SELECT @VERWERKT;  (resultaat is 2)
CALL DUBBEL(@VERWERKT);
SELECT @VERWERKT;  (resultaat is 2 maar procedure crasht)
```

> Hier zie je dat de CALL functie 2x na elkaar wordt aangeroepen. Aangezien je 2x dezelfde data wil inserten (dus ook een PK) ga je een error krijgen: duplicate entry. PS: in ppt staat er dan ook nog eens geen @ bij de variabele VERWERKT in de 2e CALL functie. Dat geeft nog een andere error: unknown column.

> Een handler voeg je toe in het begin van de BEGIN-END blok.

```sql
CREATE PROCEDURE DUBBEL
(
  OUT P_VERWERKT SMALLINT,
  OUT ERROR CHAR(5)
)
BEGIN   
  DECLARE CONTINUE HANDLER FOR SQLSTATE ‘23000’ SET ERROR = ‘23000’;
  SET ERROR = ‘00000’;
  SET P_VERWERKT = 1;
  INSERT INTO TEAMS VALUES (9,27,‘negen');
  SET P_VERWERKT = 2;
END //
```

> Wanneer er nu een error 23000 voorkomt, loopt het programma gewoon door. Je slaagt de error-code 23000 ook op in een OUT-parameter. Het programma zal de 2e INSERT niet kunnen doen, maar ipv te crashen, verder gaan naar het volgende.

#### CURSOR

resultaat van een SELECT-instructie rij per rij doorlopen

> Voorbeeld:

```sql
BEGIN   
  DECLARE V_SPELERSNR1 INTEGER;
  DECLARE V_SPELERSNR2 INTEGER;
  DECLARE V_SPELERSNR3 INTEGER;

  DECLARE C_SPELERS CURSOR FOR
  SELECT
    SPELERSNR
  FROM 
    SPELERS;

  OPEN C_SPELERS;

  FETCH C_SPELERS INTO V_SPELERSNR1;
  FETCH C_SPELERS INTO V_SPELERSNR2;
  FETCH C_SPELERS INTO V_SPELERSNR3;; 
  CLOSE C_SPELERS;
END //
```

> Je declareert de CURSOR voor de SELECT-instructie eronder.

> Je opent de CURSOR om hem te kunnen gebruiken. De CURSOR wijst nu naar de eerste rij die uit de SELECT-instructie komt.

> FETCH:  je CURSOR staat op een bepaalde positie. Aan de hand van die positie steek je de data van die rij op die positie in V_SPELERSNR. Bijvoorbeeld: cursor op 1: steek data van rij 1 in variabele. Als laatste gaat hij automatisch 1 plekkie vooruit. Dit moet je dus niet handmatig doen. Doe je dus 2x FETCH na elkaar, zal de cursor de 2e keer 1 verder zijn, automatisch.

> Sluit de CURSOR wanneer je hem niet meer nodig hebt met CLOSE. Er wordt namelijk geheugen gereserveerd zolang hij open is! 

#### Voordelen: 

- onderhoud
- performantie
- onafhankelijk van programmeertaal
- snellere uitvoering
- veiligheid: → geen sql-injection

### STORED FUNCTIONS

```sql
DELIMITER //

CREATE FUNCTION DOLLARS
(
  BEDRAG DECIMAL(7,2)
) 
RETURNS DECIMAL(7,2)
BEGIN
  RETURN BEDRAG * (1/0,8);
END //

DELIMITER ;
SELECT
  BETALINGSNR, 
  BEDRAG,
  DOLLARS(BEDRAG)
FROM 
  BOETES;
```

> Lijkt erg hard op Stored Prodecures. Merk op: achter de haakjes van de parameterlijst zien we RETURNS: de returnwaarde moeten we hier specifiëren. Ook weer hier: schrijf de code in het BEGIN-END blok. Je gebruikt de functie zoals SUM(), Min(), … zoals je in de onderste SELECT-instructie kan zien.
