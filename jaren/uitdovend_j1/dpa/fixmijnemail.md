# DPA

## Het grote "ik doe niks verkeerd maar da werkt hier ni"-kennissysteem

### Deel 4

#### Waarom krijg ik gene mail

Er zit in bug in SSMS (SQL Server Management Studio). Deze bug zorgt ervoor dat mails niet kunnen worden verstuurd indien .NET 3.5 niet is geïnstalleerd op je systeem (zelfs als je al een recentere versie hebt staan). Het vervelende is dat je hier ook geen melding van krijgt. Om dit op te lossen dien je gewoon [.NET 3.5](https://www.microsoft.com/nl-be/download/details.aspx?id=21) te installeren. Let op: Microsoft gaat je aan raden om nog extra rommel te downloaden, druk op Nee, bedankt en ga door.

![nothx](afbeeldingen/neebedankt.png)

We vullen als servernaam `smtp.office365.com` in en als poort `587`. Zorg er ook voor dat 'This server requires a secure connection' staat aangevinkt.

![wizard email](afbeeldingen/dmcw.png)

##### Bronnen

- De onvolledige documentatie op [ictpedia](https://ictpedia.ap.be/index.php/Smartphone). Hier staat namelijk nergens de Servernaam en Poort voor SMTP.
- Gelukkig staat dit (goed verstopt) in de [documentatie van Microsoft office](https://support.office.com/nl-nl/article/e-mail-instellen-onder-windows-phone-181a112a-be92-49ca-ade5-399264b3d417?ocmsassetID=HA102823194&CorrelationId=772b2ece-47b2-41b6-8385-30ef7e034551&ui=nl-NL&rs=nl-NL&ad=NL).
