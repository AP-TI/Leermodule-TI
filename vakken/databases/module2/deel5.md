# Deel 5
## Oefening 1
### 1.
We veranderen eerst de delimiter, anders zou de procedure niet kunnen worden afgemaakt.
```sql
delimiter //
```
Vervolgens creëren we de procedure.
```sql
CREATE PROCEDURE aantal_boetes
(IN p_spelersnr INTEGER)
BEGIN
SELECT COUNT(*) FROM boetes WHERE spelersnr = p_spelersnr;
END//
```
We veranderen opnieuw de delimiter naar de standaard ;.
```sql
delimiter ;
```
We roepen onze stored procedure op en geven als parameter-waarde '8' mee.
```sql
CALL aantal_boetes(8);
```
## Oefening 2
### 1.
```sql
delimiter //
create procedure grootste_tabel
(out grootste varchar(50))
begin
case when (select count(*) from spelers) > (select count(*) from boetes) then set grootste = 'Spelers'; else set grootste = 'Boetes';
end case;
end //
```
### 2.
```sql
call grootste_tabel(@grootste);
select @grootste;
```
