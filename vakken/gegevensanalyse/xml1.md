# XML Oefeningen 1
## Oefening 1
```xml
<?xml version="1.0"?>
<persoon>
   <voornaam>Filip</voorNaam>
   <naam>Van Saksen - Coburg</naam>
</persoon>
```
Deze is niet wellformed omdat de sluitende `</voorNaam>` een hoofdletter N heeft.
Is ook niet valid aangezien er geen DTD is.
## Oefening 2
```xml
<?xml version="1.0"?>
<persoon>
   <voornaam>Filip</voornaam>
   <naam>Van Saksen - Coburg</naam>
   <leeftijd>  >20 jaar & < 90 jaar </leeftijd>
</persoon>
```
Is niet wellformed aangezien er een & staat, om een & te weergeven zet je `&amp`.
## Oefening 3
```xml
<?xml version="1.0"?>
<!DOCTYPE note [<!ELEMENT note (to,from,heading,body)>
<!ELEMENT to (#PCDATA)>
<!ELEMENT from (#PCDATA)>
<!ELEMENT heading (#PCDATA)>
<!ELEMENT body (#PCDATA)>]>
<note>
	<tol>owner@work.be</tol>
	<from>dog@home.be</from>
	<heading>Reminder</heading>
	<body>Don't forget me this weekend</body>
</note>
```
Wel wellformed, niet valid aangezien er 'tol' in plaats van 'to' staat.
### Juiste versie:
```xml
<?xml version="1.0"?>
<!DOCTYPE note [<!ELEMENT note (to,from,heading,body)>
<!ELEMENT to (#PCDATA)>
<!ELEMENT from (#PCDATA)>
<!ELEMENT heading (#PCDATA)>
<!ELEMENT body (#PCDATA)>]>
<note>
	<to>owner@work.be</to>
	<from>dog@home.be</from>
	<heading>Reminder</heading>
	<body>Don't forget me this weekend</body>
</note>
```
## Oefening 4
```xml
<?xml version="1.0"?>
<!DOCTYPE personen [
<!ELEMENT personen (persoon)+>
<!ELEMENT persoon (voornaam, achternaam)>
<!ELEMENT voornaam (#PCDATA)>
<!ELEMENT achternaam (#PCDATA)>
]>
<personen>
	<persoon>
		<voornaam>Jos</voornaam>
		<achternaam>Van De Walle</achternaam>
	</persoon>
	<persoon>
<voornaam>Saïda</voornaam>
<achternaam>Thrari</achternaam>
	</persoon>
</personen>
```
## Oefening 5
```xml
<?xml version="1.0"?>
<!DOCTYPE huisdieren [
<!ELEMENT huisdieren (huisdier)+>
<!ELEMENT huisdier (naam, diersoort, leeftijd)>
<!ATTLIST huisdier kleur (groen|wit|bruin) #REQUIRED>
<!ELEMENT naam (#PCDATA)>
<!ELEMENT diersoort (#PCDATA)>
<!ELEMENT leeftijd (#PCDATA)>
]>
<huisdieren>
  <huisdier kleur="bruin">
    <naam>Rex</naam>
    <diersoort>Hond</diersoort>
    <leeftijd>10</leeftijd>
  </huisdier>
  <huisdier kleur="groen">
    <naam>Fwiet</naam>
    <diersoort>Parkiet</diersoort>
    <leeftijd>8</leeftijd>
  </huisdier>
</huisdieren>
```
