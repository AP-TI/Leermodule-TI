# Subnetting in IPv4
Een IP-adres is opgedeeld ik 4 octets (4 groepen van 8 bits). Om het leesbaar te maken voor mensen worden IP-adressen decimaal weergegeven (bijvoorbeeld `192.168.0.1`).

Een netwerk behoort altijd tot een klasse. Je kan zien welke klasse door naar het eerste octet te kijken.

Indien een netwerk-adres begint met een getal van 1 t.e.m. 127 (bijvoorbeeld `10.0.0.0`), dan behoort dit netwerk tot klasse A. Netwerken in klasse A hebben standaard een netmasker van `255.0.0.0`. Dit netmasker is niet vast en kan worden uitgebreid.

Vanaf 128 t.e.m. 191 spreken we over klasse B.  Hier is het standaard netmasker `255.255.0.0`.

En tot slot hebben we van 192 t.e.m. 223 klasse C. Door het netmasker van `255.255.255.0` zijn netwerken van klasse C de kleinste netwerken (maximaal 253 hosts).


Oke, maar wat doet dit netmasker nu juist? Wel, het netmasker geeft aan welke bits tot het netwerk-deel behoren, en welke beschikbaar zijn voor individuele hosts. Je kan dit het best zien door het subnetmasker en het ip-adres om te zetten naar binair. Dit is echter niet de snelste manier, maar wel essentieel om het te begrijpen. Daarna leg ik uit hoe je gebruik kan maken van trucjes zoals de magic number.

Laten we beginnen met een netwerk uit klasse C:
Netwerk-adres: `192.168.0.0`
Standaard netmasker: `255.255.255.0`

Omzetten naar binair:
Netwerk-adres binair:         `1100 0000.1010 1000.0000 0000.0000 0000`
Standaard  netmasker binair:  `1111 1111.1111 1111.1111 1111.0000 0000`

We kunnen bepalen welk deel van het adres behoort tot het netwerkdeel door gebruik te maken van 'ANDing'. Dus gewoon Netwerk-adres EN het netmasker-adres nemen. Dus bij elke 1 in het subnetmasker, moet je de overeenkomstige bit in het IP-adres beschouwen als netwerk-deel, en elke 0 als host-deel.

Stel dat we nu  geen gebruik willen maken van de standaard-netmasker, omdat we bijvoorbeeld ons volledige netwerk willen opdelen in kleinere segmenten, dan kunnen we doen aan subnetting en ons subnetmasker uitbreiden. Je kan dit doen op 2 manieren; aan de hand van hoeveel hosts je per netwerk wilt of aan de hand van hoeveel subnetwerken je wilt.

We beginnen met een aantal hosts; bijvoorbeeld 20 per netwerk voor `192.168.0.0`. We zien dat dit netwerk behoort tot klasse C en dit zegt ons dat het standaard subnetmasker gelijk is aan `255.255.255.0`. Dit zorgt er echter voor dat dit netwerk plaats heeft voor 253 hosts, wat veel te veel is voor ons. We zullen ons netmasker moeten uitbreiden. Hiervoor moeten we een beetje binair  rekenen.

Standaard is het laatste octet van ons netmasker gelijk aan `0000 0000`. We breiden dit eerst uit naar `1111 1111`, zodat ons volledige netmasker gelijk is aan `255.255.255.255`. Zo hebben we enkel een netwerkdeel, dus we moeten ons netmasker terug kleiner maken totdat we plaats hebben voor 20 hosts. Als we onze laatste bit gelijk stellen aan 0 (`1111 1110`), hebben we plaats voor 2 hosts (eigenlijk 0, want het netwerkadres - en broadcast-adres zijn gereserveerd). 2 is nog steeds veel minder dan 20, dus we moeten ons netmasker blijven kleiner maken tot we plaats hebben voor minstens 20 hosts (dus 22 adressen, want het netwerkadres - en broadcast-adres zijn gereserveerd). Uiteindelijk merken we dat we de laatste 5 bits moeten instellen op nul, zodat het laatste octet van het netmasker gelijk is aan `1110 0000` of decimaal: 224. De 6-de bit vanaf rechts is de laatste bit van ons netmasker en daarmee ook de magic number, 32. Dankzij de magic number kunnen we heel simpel al onze verschillende netwerk-adressen berekenen, door dit nummer gewoon op te tellen bij het eerste adres

Ons eerste netwerk-adres is: `192.168.0.0/27` De /27 is een andere notatie voor ons subnetmasker `255.255.255.224` en geeft aan dat de eerste 27 bits van ons adres voor het netwerk-deel staan.
Het tweede netwerk-adres is: `192.168.0.32/27`
Het derde: `192.168.0.64/27`
Het vierde: `192.168.0.96/27`
Het vijfde: `192.168.0.128/27`
Het zesde: `192.168.0.160/27`
Het zevende: `192.168.0.192/27`
Het achtste: `192.168.0.224/27`

Indien we nog verder zouden gaan, dan moeten we naar het volgende octet gaan, dus `192.168.1.0/27`, omdat 256 niet weer te geven is met 8 bits, dus krijgen we een overdrachtbit, die in het volgende octet gelijk is aan 1.

Indien we weten hoeveel subnetwerken we willen, werken we gewoon in de omgekeerde richting.
