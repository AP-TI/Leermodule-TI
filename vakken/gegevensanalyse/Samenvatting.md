# Samenvatting Gegan BY LiamB-dev
## Entity relation diagram (ERD)

_Conceptueel:_
- Gebruikersbehoeften
- Functionaliteit

_Fysiek:_
- Technische details
- Gebruikers in model
- Rekening met security
- Db-schema

ERD = conceptueel

→ bevat:
- Entity type
- Attributen
- Kandidaat sleutel
- Meervoudige attributen
- Relaties
- Kardinaliteit
- Associatieve entiteit

ERD wordt in ontwerpfase vertaald naar fysiek model

**Informatie verzamelen op 2 manieren:**

Top-down
- Afgeleid uit domeinexpertise
- Uitgaande van eigen kennis

Bottom-up
- Afgeleid uit documenten en specificaties
- Uitgaande van bestaande info

 
**Entity-Relationship modeling:**

3 hoofdelementen
- Data entiteiten
- Attributen
- Relaties

_Entiteit:_
- Betekenisvol concept uit de gebruikersomgeving
- Voorstelling: rechthoek

_Attribuut:_
- Betekenisvolle eigenschap van entiteit
- Voorstelling: ellips // geschreven in entiteit

_Relatie (associatie):_
- link tussen entiteiten
- gelabeld met werkwoorden
- Voorstelling: Symbolische uiteinden verbonden met lijn

![Legende-ERD](/afb/Legende-ERD.png)

**ER modeling hoofdkenmerken:**

_Kandidaatsleutels en identifiers:_
- Entiteit moet attributen bezitten die onderscheid kunnen maken tussen verschillende records van deze entiteit (keys)
- kandidaatsleutel = attribuut (of combinatie van) die elk record uniek maken
- identifier = gekozen kandidaatsleutel

_Identifier kiezen:_
1. Steeds uniek
2. Waarde wijzigt niet
3. Mag nooit leeg zijn
4. Vermijd intelligente sleutels
5. Denk aan korte sleutels als vervanging van lange

**Conceptual Data Modeling en ERD:**

_Doel:_ Zoveel mogelijk data verzamelen en voorstellen

_Resultaat:_ Beter onderhoudbaar ontwerp

_Graden:_ Aantal entiteiten betrokken bij relatie
- Unair, relatie met dezelfde entiteit
- Binair, relatie tussen 2 entiteiten
- Ternair, gelijktijdige relatie tussen 3 entiteiten - niet gelijk aan 3 binaire

_Kardinaliteit:_
- Minimum cardinality
  - minimum aantal instanties van B geassociëerd met A
- Maximum cardinality
  - maximum aantal instanties van B geassociëerd met B
  
_Associatieve entiteit:_ entiteit met eigenschappen die gelijktijdig een link vormt tussen 2 andere entiteiten

**GegevensIntegriteit:**

- Garandeert geldigheid van gegevens in DB
- Engels “Constraints”
- Verschillende vormen:
  - Gegevenstype van attributen/kolommen
  - NOT NULL
  - PRIMARY KEY
  - CHECK
  - Referentiële integriteit

1. Gegevenstype:
- verplicht tot juistere invoer

2. NOT NULL:
- Speciale waarde
- “onbepaald”
- Record moet waarde bevatten voor NOT NULL kolom
- Default is NULL

3. PRIMARY KEY:
- Duid de uniekheid van de rijen aan
- Verplicht in elke tabel een kolom
- Automatisch NOT NULL

4. CHECK:
- Voorwaarde waar data inhoudelijk aan moet voldoen
- Vb. paswoord moet langer dan 8 karakters

5. Referentiële Integriteit:
- Zorgt dat verwijzingen steeds bestaan
- Enkele maatregelen dwingen dit af
- Bij wijzigingen van rijen, controle op geldigheid van waarden

Creëert keuzes voor verwijdering: 
- blokkeer van verwijderen bij nog bestaande relaties
- automatisch verwijderen van de relaties (cascaded delete)

**OPMERKING:** bij many to many een cross table/tussentabel

# Normalisatie
**Denormalisatie:**
- 1 tabel
- Nadelen:
  - Dubbele ingave
  - Extra schijfruimte
  - Veel plaatsen aanpassen en verwijderen
  - Inconsistente gegevens
- Voordelen:
  - Snel
  - Alles direct terugvinden
  - Geen ingewikkelde SQL
  - Goed bij vaststaande tabellen

**Normalisatie:**
- Elke rij is:
  - Uniek
  - Ondubbelzinnig
- Keys voor opvragingen

_Definities:_
- Sleutel attribuut: attribuut dat voorkomt in een sleutel
- Niet-sleutel attribuut: attribuut dat NIET voorkomt in een sleutel

Primaire sleutel (PRIMARY KEY):
- Uniek gegeven om overige gegevens te identificeren
- Bestaat uit 1 of meer kolommen
- Moet UNIQUE en NOT NULL zijn

Verwijssleutel (FOREIGN KEY)
- Gegeven in een tabel dat in andere tabel PK is

_Doeleinden:_
- Flexibiliteit: gegevens op verschillende manieren kunnen opvragen en bewerken
- Integriteit: gegevens worden niet corrupt of inconsistent
- Voor elk gegeven juist 1 plaats

_Gradaties:_ aan de hand van de normaalvormen (0<sup>de</sup>, 1<sup>ste</sup>, 2<sup>de</sup>, 3<sup>de</sup>, …)

Steunen op elkaar -> 2NF is enkel mogelijk als tabel 1NF is

DB is genormaliseerd als alle tabellen dit zijn

## Normalisatielevels

**0NF:**
- Flatfile DB
- Opsomming van alle data in 1 entiteit
- Geeft Proces Berekeningen (PB) aan

**1NF:**
- Elke entiteit heeft PK
- Elk attribuut heeft 1 waarde, anders andere entiteit
- Volgorde van kolommen en rijen is irrelevant
- Elk attribuut heeft 1 datatype

**2NF:**
- Tabel moet 1NF zijn
- Attributen enkel afhankelijk van volledige identifier, anders andere entiteit

**3NF:**
- Tabel moet 2NF zijn
- Attributen mogen niet via een ander aan de key hangen
- Attributen waarbij je het ene weet als je het andere weet afsplitsen

# XML

**Inleiding:**
- Markup Language
- Gebaseerd op SGML
- Eenvoudige syntax
  - `<tagnaam>tekst</tagnaam>`
- Gestructureerd (boom)
- Tagnamen zelf kiezen
- Eenvoudig parsen
- ASCII
- **Nadeel:** snel grote bestanden

**Tags:**
- Open: `<tagnaam>`
- Sluit: `</tagnaam>`
- Combinatie: `<tagnaam/>`
- Kunnen genest worden
- Hoofdlettergevoelig
- Starten met letter of ‘-’
- Eender welk woord niet beginnend met “xml”
- Mag letters, cijfers, streepjes, liggende streepjes, punten bevatten
- Geen spaties

**Structuur:**
- Element tags
- Entity references
- Commentaar
- Processing instructions
- CDATA secties
- Document type declarations

**Element Tags:**
- Case sensitive
- Attributen
- Vb.: `<a href="http://samspade.org">spam</a>`

**Entity reference:**
- Soort ‘macro’
- Wijst naar veel gebruikte tekst
- Wijst naar externe referenties
- `<!ENTITY % name definition>`

Intern:

`<!ENTITY % appartement "slaapkamer, badkamer,toilet">`

Extern:

`<!ENTITY c SYSTEM "http://www.xmlwriter.net/copyright.xml">`

**Commentaar:**
- Tekst voor de XML document schrijver
- Zoals commentaar in programmeertalen
- Tussen <!-- en →

**Processing instructions:**
- Genegeerd door XML parser
- parser geeft door aan applicatie

CDATA: wordt niet geparsed en dus rechtstreeks uitgelezen

**Well-formedness**
- Voldoet aan XML syntax
- Laat toe om element groove (boom) te bouwen

_Rules:_
- Uniek root element tag
- Alle tags sluiten ergens
- Alle tags juist genest
- Attributen tussen quotes (“)
- `>`, `<`, & juist gebruikt
- 5 voorgedefiniëerde referenties: `&quot; &lt; &gt; &apos; &amp`;

**Parsers:**
- Lezen documenten in
- Verwerken documenten
- Controleren ‘well-formedness’

**Document Type Definition DTD:**
- Definieert XML structuur
- Aparte syntax naast XML

Restricties op:
- Element namen
- Attribuut namen en waarden
- Volgorde van elementen
- XML document dat voldoet = valid XML document

Valid XML document = well-formed, voldoet aan een DTD

Validatie: garanderen en wat wordt afgeleverd en controleren wat wordt ontvangen

DTD bevat declaraties voor: Elementen, Attributen

_Element:_ definieert naam en content model

kan bevatten:
- Textual content (#PCDATA)
- Namen van andere elementen
- Namen van parameter entries
- gecombineerd door logische operatoren

_Gebruikte logische tekens:_
- ‘E’ -> juist 1 element E
- ‘E?’ -> 0 of 1 element van E
- ‘E+’ -> 1 of meer elementen E
- ‘E*’ -> 0 of meer elementen E
- ‘E1|E2’ -> element E1 of element E2
- ‘E1,E2, -> eerst element E1 en dan element E2

_Keywords:_
- #PCDATA -> string
- EMPTY -> leeg
- ANY -> alles

Attributen:
- `<!ATTLIST elementName attrName values default>`

elementName -> bij welk element

attrName -> naam vh attribuut

values -> mogelijke waarden

default -> defaultwaarde

_Attribuutwaarden:_
- CDATA -> tekst
- ID -> unieke ID
- ENTITY -> in DTD gedeclareerde entities
- Door gebruiker ingevulde opsomming (gescheiden door pipe ‘|’)

_Attribuutdefaults:_
- #REQUIRED -> verplicht, geen defaultwaarde
- #IMPLIED -> niet verplicht, geen default waarde
- #FIXED -> vaste en verplichte waarde
- Door gebruiker ingevulde lijst van mogelijke waarden

_Entities:_

General entities in document en DTD (zoals &amp;)

Parameter entities enkel in DTD
- Reuse van veel gebruikte structuren
- Enkel in externe DTD
