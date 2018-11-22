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
select 
    spelersnr
from
    wedstrijden w1
where
    not 3 = any (select 
            gewonnen
        from
            wedstrijden w2
        where
            w1.spelersnr = w2.spelersnr);
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
