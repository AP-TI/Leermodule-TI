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
Is ook niet valid aangezien er geen DTD (document type definition) is.
## Oefening 2
```xml
<?xml version="1.0"?>
<persoon>
   <voornaam>Filip</voornaam>
   <naam>Van Saksen - Coburg</naam>
   <leeftijd>  >20 jaar & < 90 jaar </leeftijd>
</persoon>
```
Is niet wellformed aangezien er een & staat, om een & te weergeven zet je `&amp;`.
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
### Oefening 6
```xml
<?xml version="1.0"?>
<!DOCTYPE bank [
<!ELEMENT bank (rekening+, klant+)>
<!ELEMENT rekening (#PCDATA)>
<!ELEMENT klant (#PCDATA)>
<!ATTLIST rekening rekening-nummer ID #REQUIRED kantoorNaam CDATA #REQUIRED saldo CDATA #REQUIRED>
<!ATTLIST klant klant-naam ID #REQUIRED klant-straat CDATA #REQUIRED klant-stad CDATA #REQUIRED>
]>

<bank>
  <rekening rekening-nummer="A-101" kantoorNaam="Brussel&amp;stad" saldo="500"></rekening>
  <rekening rekening-nummer="A-102" kantoorNaam="Antwerpen-centrum" saldo="400"></rekening>
  <rekening rekening-nummer="A-201" kantoorNaam="Brussel-rand" saldo="900"></rekening>
  <klant klant-naam="Marthe" klant-straat="Kerkstraat" klant-stad="Antwerpen"></klant>
  <klant klant-naam="Hanne" klant-straat="Oyalelelaan" klant-stad="Bergen"></klant>
</bank>
```
### Oefening 7
Mondeling gedaan
### Oefening 8
```xml
<?xml version="1.0"?>
<!DOCTYPE student [
<!ELEMENT student (firstName, lastName, id, plan)>
<!ELEMENT plan (courses)>
<!ELEMENT courses (course)*>
<!ELEMENT course (name, shortName, record?)>
<!ELEMENT record (grade, date)>
<!ELEMENT firstName (#PCDATA)>
<!ELEMENT lastName (#PCDATA)>
<!ELEMENT id (#PCDATA)>
<!ELEMENT name (#PCDATA)>
<!ELEMENT shortName (#PCDATA)>
<!ELEMENT grade (#PCDATA)>
<!ELEMENT date (#PCDATA)>
<!ATTLIST courses year CDATA #REQUIRED>
]>
	 <student>
		<firstName>John</firstName>
		<lastName>Van Kerckhove</lastName>
		<id>281283</id>
		<plan>
			<courses year="1">
				 <course>
					<name>Systeemanalyse</name>
					<shortName>SA</shortName>
					<record>
						<grade>14</grade>
						<date>13/06/11</date>
					</record>
				</course>
				<course>
					<name>Gegevensanalyse</name>
					<shortName>GA</shortName>
				 </course>
			</courses>
		</plan>
	</student>

```
### Extra Oefening DTD
```xml
<?xml version="1.0" ?>
<!DOCTYPE TVPLANNING[
<!ELEMENT TVPLANNING (KANAAL+)>
<!ELEMENT KANAAL (BANNER?, DAG)>
<!ELEMENT PROGRAMMASLOT (TIJD, TITEL, BESCHRIJVING?)>
<!ATTLIST PROGRAMMASLOT VTR CDATA #IMPLIED>
<!ELEMENT BANNER (#PCDATA)>
<!ELEMENT DAG (DATUM, FEESTDAG?, PROGRAMMASLOT?)>
<!ELEMENT DATUM (#PCDATA)>
<!ELEMENT FEESTDAG (#PCDATA)>
<!ELEMENT TITEL (#PCDATA)>
<!ATTLIST TVPLANNING NAAM CDATA #REQUIRED>
<!ATTLIST KANAAL KAN CDATA #REQUIRED>
<!ELEMENT TIJD (#PCDATA)>
<!ATTLIST TITEL RATING CDATA #IMPLIED>
<!ATTLIST TITEL TAAL (Nederlands|Frans|Duits) #IMPLIED>
<!ELEMENT BESCHRIJVING (#PCDATA)>


]>
<TVPLANNING NAAM="SPORT">
    <KANAAL KAN="VRT">
        <BANNER>Pol</BANNER>
        <DAG>
            <DATUM>31/10/2017</DATUM>
            <FEESTDAG>Halloween</FEESTDAG>
        </DAG>
    </KANAAL>
    <KANAAL KAN="SPORTNET">
        <DAG>
            <DATUM>30/11/2017</DATUM>
            <PROGRAMMASLOT VTR="avond">
                <TIJD>19:08</TIJD>
                <TITEL RATING="KT" TAAL="Nederlands">Mixed martial arts grootste
                    <![CDATA[%
                    <!&]]> wedstrijden
                </TITEL>
                <BESCHRIJVING>De beste wedstrijden van 2016 &amp; 2017</BESCHRIJVING>
            </PROGRAMMASLOT>
        </DAG>
    </KANAAL>
    <KANAAL KAN="SPORTNET">
        <DAG>
            <DATUM>05/11/2017</DATUM>
            <PROGRAMMASLOT>
                <TIJD />
                <TITEL />
            </PROGRAMMASLOT>
        </DAG>
    </KANAAL>
</TVPLANNING>
```
### Oefening 9
```xml
<?xml version="1.0"?>
<!DOCTYPE personen[
<!ELEMENT personen (persoon+)>
<!ELEMENT persoon (((voornaam, achternaam)|(achternaam, voornaam)), geboortedatum?, vrijeTekst?)>
<!ELEMENT voornaam (#PCDATA)>
<!ELEMENT achternaam (#PCDATA)>
<!ELEMENT geboortedatum (#PCDATA)>
<!ELEMENT vrijeTekst (#PCDATA)>
<!ATTLIST persoon id CDATA #REQUIRED>
]>
<personen>
	<persoon id="p1">
		<voornaam>Jos</voornaam>
		<achternaam>Van De Walle</achternaam>
	</persoon>
	<persoon id="p2">
		<achternaam>Thrari</achternaam>
		<voornaam>Saïda</voornaam>
		<geboortedatum>02/11/1980</geboortedatum>
		<vrijeTekst>
			<![CDATA[Zij houdt van speciale tekens zoals &<> en ]]>
		</vrijeTekst>
	</persoon>
	<persoon id="p3">
		<achternaam>Johnson</achternaam>
		<voornaam>Thomas</voornaam>
		<geboortedatum>02/12/1982</geboortedatum>
	</persoon>
</personen>
```
### Oefening 10
Deze oefening diende enkel om te tonen hoe slechte XML eruit zag. Je kan hiervoor geen zinvol DTD maken.
### Scouts
```xml
<?xml version="1.0" ?>

<!DOCTYPE SCOUTS [
<!ELEMENT SCOUTS (LEIDER, PATROUILLE+)>
<!ATTLIST SCOUTS NAAM CDATA #REQUIRED>
<!ATTLIST SCOUTS id ID #REQUIRED>
    <!ELEMENT LEIDER (#PCDATA)>
    <!ELEMENT PATROUILLE (LEIDER, SUBLEIDER+, AANTAL, KREET?, VAANDEL)>
        <!ATTLIST PATROUILLE naam CDATA #REQUIRED>
        <!ATTLIST LEIDER geslacht (M|V|X) #IMPLIED>
        <!ELEMENT SUBLEIDER (#PCDATA)>
        <!ELEMENT AANTAL (#PCDATA)>
        <!ELEMENT KREET (#PCDATA)>
        <!ELEMENT VAANDEL ((FIGUUR, KLEUR) | (KLEUR, FIGUUR))>
            <!ELEMENT FIGUUR (#PCDATA)>
            <!ELEMENT KLEUR (#PCDATA)>
]>

<SCOUTS NAAM="ALBERTUS" id="A859">
   <LEIDER>AKELA &amp; RAHJA</LEIDER>
   <PATROUILLE naam="VALKEN">
        <LEIDER geslacht="M">Karel De Grootte</LEIDER>
        <SUBLEIDER> Karin De Cleyne</SUBLEIDER>
        <AANTAL>6</AANTAL>
        <KREET>VALKEN<![CDATA[%<!]]> VLIEGEN HOGER</KREET>
        <VAANDEL>
            <KLEUR>Groen</KLEUR>
            <FIGUUR>Boom</FIGUUR>
        </VAANDEL>
   </PATROUILLE>
   <PATROUILLE naam="MEEUWEN">
        <LEIDER geslacht="V">Kim Patteyns</LEIDER>
        <SUBLEIDER> Veerle De Baatselier</SUBLEIDER>
        <SUBLEIDER> Debbie De Baatselier</SUBLEIDER>
        <AANTAL>7</AANTAL>
        <VAANDEL>
            <FIGUUR>Rots</FIGUUR>
            <KLEUR>Blauw</KLEUR>
        </VAANDEL>
   </PATROUILLE>
</SCOUTS>
```
### Oefening 11
```xml
<?xml version="1.0"?>
<!DOCTYPE security[
<!ELEMENT security (userRole, managerRole, adminRole)>
<!ELEMENT userRole (logon, insert, create)>
<!ELEMENT managerRole (logon, insert, create, update)>
<!ELEMENT adminRole (logon, insert, create, update, delete)>

<!ELEMENT logon EMPTY>
<!ELEMENT insert EMPTY>
<!ELEMENT create EMPTY>
<!ELEMENT update EMPTY>
<!ELEMENT delete EMPTY>
]>
<security>
	<userRole>
		<logon />
		<insert />
		<create />
	</userRole>
	<managerRole>
		<logon />
		<insert />
		<create />
		<update />
	</managerRole>
	<adminRole>
		<logon />
		<insert />
		<create />
		<update />
		<delete />
	</adminRole>
</security>
```
#### DTD kan ook anders...
```xml
<?xml version="1.0"?>
<!DOCTYPE security [
<!ELEMENT security (userRole, managerRole, adminRole)>
<!ENTITY % defaultRole "(logon, insert, create)">
	<!ELEMENT userRole (%defaultRole;)>
		<!ELEMENT logon EMPTY>
		<!ELEMENT insert EMPTY>
		<!ELEMENT create EMPTY>
	<!ELEMENT managerRole (%defaultRole;, update)>
		<!ELEMENT update EMPTY>
	<!ELEMENT adminRole (%defaultRole;, update, delete)>
		<!ELEMENT delete EMPTY>
]>
```
