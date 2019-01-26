# Deel 1
## Oefening 1
### 1.
```sql
select betalingsnr from boetes where bedrag not between 50 and 100;
```
### 2.
```sql
select spelersnr, naam from spelers where naam like '_e%e_';
```
### 3.
```sql
select spelersnr from spelers where bondsnr is null;
```
## Oefening 2
```sql
select
    naam, voorletters
from
    spelers s
where
    exists( select
            spelersnr
        from
            teams t
        where
            t.spelersnr = s.spelersnr);
```
## Oefening 3
### 1.
```sql
select spelersnr, naam from spelers where spelersnr = any(select spelersnr from boetes);
```
LET OP! Wegens een bug in MySQL workbench lijkt dit een error te geven, dit is niet het geval, de query runt gewoon.
### 2.
```sql
select
    betalingsnr, bedrag, datum
from
    boetes b1
where
    bedrag >= all (select
            bedrag
        from
            boetes b2
        where
            year(b1.datum) = year(b2.datum));
```
### 3.
```sql
select
    (select
            spelersnr
        from
            spelers
        where
            spelersnr <= all (select
                    spelersnr
                from
                    spelers)) as laagste,
    (select
            spelersnr
        from
            spelers
        where
            spelersnr >= all (select
                    spelersnr
                from
                    spelers)) as hoogste;
```
## Oefening 4
### 1.
```sql
SELECT
    spelersnr
FROM
    spelers s
WHERE
    NOT 3 = ANY (SELECT
            gewonnen - verloren
        FROM
            wedstrijden w
        WHERE
            s.spelersnr = w.spelersnr);
```
### 2.
```sql
select
    t.teamnr, divisie
from
    teams t
where
    teamnr not in (select
            teamnr
        from
            wedstrijden
        where
            spelersnr = 6);
```
## Oefening 5
### 1.
```sql
select
    spelersnr, naam
from
    spelers s
where
    s.spelersnr not in (select
            w.spelersnr
        from
            wedstrijden w
        where
            w.spelersnr = s.spelersnr
                and w.teamnr = 1);
```
### 2.
```sql
SELECT
    spelersnr, naam
FROM
    spelers s
WHERE
    s.spelersnr IN (SELECT
            w.spelersnr
        FROM
            wedstrijden w
        WHERE
            gewonnen > verloren and exists(select * from wedstrijden w1 where w.spelersnr = w1.spelersnr and gewonnen > verloren and w.wedstrijdnr <> w1.wedstrijdnr));
```
