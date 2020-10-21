# IPv6

## Waarom

Internet Protocol versie 6 dient een aantal problemen van IPv4 op te lossen.

Het belangrijkste probleem dat IPv6 heeft aangepakt is het tekort aan verschillende adressen bij IPv4 (de laatste IPv4-adresblokken zijn immers toegewezen in begin 2011) door de lengte uit te breiden van 32 bits naar 128 bits. Hierdoor zijn er 2^128 oftewel ongeveer 3,4*10^38 IP-adressen beschikbaar (dus 50 000 000 000 000 000 000 000 000 000 per persoon).

## Adressering

- 128 bits lang
- Geschreven als 8 groepen van 4 hexadecimale cijfers, gescheiden door dubbele punten
  - `ff02:0000:0000:0000:0000:0000:0000:0500`
- Inkortingsregels
  - Voorloopnullen mogen worden weggelaten
  - Indien een groep 4 nullen bevat, mag deze volledig worden weggelaten, en bij meerdere nulgroepen achter elkaar, mogen deze allemaal vervangen worden door 2 dubbelpunten.
    - Let op, dit mag maar 1 keer per adres, want anders zou je niet meer weten hoeveel groepen er worden weggelaten.
- De inkortingsregels zorgen ervoor dat bovenstaand adres kan worden ingekort tot `ff02::500`

### Adressen op een lokaal netwerk

- Standaard dienen de eerste 64 bits voor het netwerk aan te duiden
- Dit zorgt ervoor dat er nog 64 bits over zijn om individuele hosts aan te duiden. Bijgevolg is het uitdelen van IP-nummers overbodig en kunnen aangesloten systemen dit automatisch voor zichzelf bepalen.
  - Oorspronkelijk werd dit gedaan aan de hand van het mac-adres, maar dit zorgt ervoor dat de gebruiker kan getraceerd worden door websites omdat het laatste deel van zijn IP-adres altijd hetzelfde zal zijn, ongeacht met welk netwerk de gebruiker is verbonden.

## Link local

- Alle apparaten die met dezelfde router zijn verbonden (in IPv4 noemden we dit het broadcast-domein, maar broadcasts bestaan niet meer in IPv6)

### Casts

- Unicast
  - Verzenden van een pakket naar één bestemming
- Multicast
  - Verzenden van een pakket naar meerdere bestemmingen die dit dienen te ontvangen (dus niet naar iedereen zoals een broadcast zou doen)
- Anycast
  - Kan worden gebruikt om een bepaalde service op te roepen, deelnemers van het netwerk die de service aanbieden luisteren dan allemaal naar 1 adres. De dichtstbijzijnde host die de service aanbiedt, reageert.
