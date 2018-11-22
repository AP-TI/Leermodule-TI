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