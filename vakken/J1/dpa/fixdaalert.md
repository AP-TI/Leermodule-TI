# DPA
## Het grote "ik doe niks verkeerd maar da werkt hier ni"-kennissysteem
### Deel 4
#### Mijn CPU-Alert werkte perfect, maar de alert voor error 102 werkt niet
Dit komt doordat de error niet wordt gelogd. Gewoon volgend commando uitvoeren en dan werkt je alert normaalgezien wel.
```sql
EXECUTE    sp_altermessage 102, 'WITH_LOG', 'true';
GO
```
