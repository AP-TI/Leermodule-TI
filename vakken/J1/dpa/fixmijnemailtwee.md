# DPA

## Het grote "ik doe niks verkeerd maar da werkt hier ni"-kennissysteem

### Deel 4

#### Die testmail werkte MAAR NU KRIJG IK GEEN MAILS VAN MIJN ALERTS

Dit kan aan veel dingen liggen. Eerst moeten we er zeker van zijn dat de SQL Server Agent aanstaat. Je kan hem aanzetten via SQL Server Configuration Manager

![startagent](afbeeldingen/startagent.png)

We kunnen dan in SSMS checken of SQL Server Agent aanstaat. (Indien er een groen icoontje voor staat is het in orde)

![agentaan](afbeeldingen/agentaan.png)

Nu moeten we ervoor zorgen dat email alerts aanstaan. Je kan dit aanzetten via de Properties (in `SSMS`, NIET in `SSCM`) van SQL Server Agent.

![agentprops](afbeeldingen/agentprops.png)

![ssap](afbeeldingen/ssap.png)
