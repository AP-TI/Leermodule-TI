# Deel 1
## Oefening 1
### 1)
```
select betalingsnr from boetes where bedrag not between 50 and 100;
```
### 2)
```
select spelersnr, naam from spelers where naam like '_e%e_';
```
### 3)
```
select spelersnr from spelers where bondsnr is null;
```
## Oefening 2
```
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