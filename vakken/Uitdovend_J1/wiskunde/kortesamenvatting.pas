// ** Wat te onthouden van het boek. ** \\
@@ Dana Tabatabaie Irani

Plak dit in Notepad++, zet Syntaxis naar Pascal voor een mooier weergaven.

//	*	4.	Getalformaten	[p. 65- 86]	*
/*
	//	Kommagetal = geheel getal + vlottende komma + zijn fractie.
		Reëel getal = toestandsteken + {Kommagetal}.
	
	//	Additief stelsel zoals de Romeinse getalnotatie
	
	//	Positiestelsel zoals decimale & binaire.
		Elk heeft een getalbasis	(1 < getalbasis B).
		Cijfer helemaal links	= Most Significant Digit.	(MSD)
		Cijfer helemaal rechts	= Least Significant Digit.	(LSD)
		Voorloopnullen	=	nullen voor de MSD plaatsen. (geen invloed op de waarde).
		Naloopnullen	=	nullen na de LSD plaatsen. (idem dito hierboven).
		Mantisse		=	waarde tussen 1 en de getalbasis	(1 <= x < B).
		Wetenschappelijke getalnotatie	=	toestandsteken * mantisse *	(getalbasis)^exponent
			bv:
				5,9 = (-1)^0 * 5,9 * 10^0
				0,59 = (-1)^0 * 5,9 * 10^-1
				...
		De Fransen telden op hun tenen. Dus daarmee Quatre-vingt blabla. Zeer belangrijke info.
		
	//	Introductie binaire getallen:
		Binair getal. B = 2. Kan kiezen uit de getallen {0,1}.
		(11000,11)B	=	(11000)B + (0.11)B 
					=	(0*B^0 + 0*B^1 + 0*B^2 + 1*B^3 + 1*B^4) + (1*B^-1 + 1*B^-2)				// B = 2
					=	(0*2^0 + 0*2^1 + 0*2^2 + 1*2^3 + 1*2^4) + (1*2^-1 + 1*2^-2)	
					=	0 + 0 + 0 + 8 + 16 + 1/2 + 1/4
		
		bit = binary digit.
		
		bit vooraan = Most Significant Bit.
		bit achteraan = Least Significant Bit.
		
		byte = 8 bits.
		halve byte = nibble. (4 bits).
	
	//	Binair optellen p. 73.
	
	//	Binair vermenigvuldigen p. 73.

	//	Binair verdubbelen = verschuiven van de vlottende komma naar rechts.
		bv:
			(110000,011)2 verdubbelen = (1100000,11)2
			(0,11)2 verdubbelen = (1,1)2
			(1)2 verdubbelen = (10)2
	
	//	Introductie octale getallen:
		Octaal getal. B = 8. Kan kiezen uit de getallen {0,1,2,3,4,5,6,7}.
		Men gebruikt prefix 0 om het te onderscheiden van een decimaal getal.
		bv:
			(123,7)8 = 0123,7
		
		Wordt gebruik bij bv. Linux bij de rechtenset: rwxrwxrwx.
		Elk mantisse ervan is een samenstelling van 3 binaire digits.
		Aangezien 2^3 = 8.
		Kan daar snel omzettingen mee doen.
	
	//	Introductie hexadecimale getallen:
		Hexadecimaal getal. B = 16. Kan kiezen uit de getallen {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}.
		Men gebruikt prefix 0x om het te onderscheiden van een decimaal getal.
		bv:
			(A1B3C5D9,FB) = 0xA1B3C5D9,FB
		
		Wordt gebruikt bij bv. HTML-kleurwaarden. RGB. (#FF0000) = Rood, (#00FF00) = Groen, (#0000FF) = Blauw.
		Groepering per nibble.
		Elk mantisse ervan is een samenstelling van 4 binaire digits.
		Aangezien 2^3 = 16.
		Kan daar snel omzettingen mee doen.
		
	//	Introductie modulo rekenen:
		Gewoon de restdeling.
		a ≡ r mod m <=> a = m*q + r
		bv:
			25 ≡ 1 mod 24 <=> 25 = 24 * 1 + 1
		
		Ook wel de Euclidische deling genoemd.
		
		p. 80. voor omzetten van decimaal naar vreemde getalbasen.
	
	//	Sexagesimale of zestigdelige getallen:
		Getalbasis = 60.
		
	//	Tips & Tricks converteren:
		Conversie van binaire getallen naar een B = 2^x stelsel is simpel.
		x duidt aan hoeveel getallen je van de binaire moet samennemen. Indien er niet genoeg getallen zijn, zet je er voorloop- én/of naloopnullen bij.
		Zie p. 83.
*/

//	*	5.	Getallen in computers	[p. 87-126]	*
/*
	//	Datatype van onze natuurlijke getallen = unsigned integers.
		Getalbreedte = aantal getallen nodig voor het representeren van dat getal.
		
		unsigned byte = getalbreedte van 1 byte. 2^8 = 256 verschillende waarden [0-255]
		Bv:
			(1011 1111)2
		
		Kardinaliteit = aantal elementen binnenin een verzameling. Notatie #.
		Bv:
			# (unsigned byte) = 256
		
		Unsigned int = getalbreedte van 2 bytes. 2^16 = 65 536 verschillende waarden [0-65 535]
		Bv:
			(1011 1010 1111 1000)2
	
		Unsigned long = getalbreedte van 4 bytes. 2^32 = 4 miljard.
		
	//	Introductie overloopbit:
		Wanneer een overdrachtbit terechtkomt voorbij de MSD buiten de getalbreedte.
		Bv:
			 1 0 0 1 1 1 0 1
			 1 1 0 0 1 0 1 0
			+---------------
			1(0110 0111)
		Dit noemt "overflow".
	
	//	Introductie magnitude-voorstelling:
		Tekenbit = bit die het teken van een getal bevat.
		Bv:
			(+20)dec = (1 0100)2
					 = (0001 0100)2
			
			(-20)dec = (1 0100)2
					 = (1001 0100)2
					 
	//	Introductie 1-komplement:
		Inverteren van elke bit.
		Bv:
			(0011 1111 0101 1010 0001)2
			(1100 0000 1010 0101 1110)2 1-komplement.
	
	//	Introductie 2-komplement:
		1 toevoegen bij het 1-komplement.
		Bv:
			(0011 1111 0101 1010 0001)2
			(1100 0000 1010 0101 1110)2 1-komplement.
			(1100 0000 1010 0101 1111)2 2-komplement.
					 
		We doen dit om positieve getallen om te zetten naar negatieve getallen of om de waarde te vinden van een negatief getal.
		Zeer logisch eigenlijk aangezien binaire getallen alleen maar kunnen optellen. Het verschil is dus de som van 2 binaire getallen maar de tweede operand dan in de 2-komplement.
		Bv:
			53 - 20 = 33
			53 + (-20) = 33
		
		Nuttig: 
			Binair naar decimaal omzetten: staat tekenbit op '1'? Zo ja, 2-komplement. Zo niet, gewoon omzetten naar decimaal.
			Decimaal naar binair omzetten: indien negatief getal, dan 2-komplement. Zo niet, gewoon omzetten naar binair.
	
	//	Introductie fictief "signed-nibble":
		4 bit getalbreedte. {-8,-7,-6...0,1...7}
	
	//	Introductie signed-x:
		Signed byte, signed int, signed long. Komt op hetzelfde neer als de unsigned maar dat er dan 1 tekenbit gebruikt wordt voor het teken.
	
	//	Logischerwijs met een vaste getalbreedte zal er sprake zijn van 'gehele "negatieve" of "positieve" overflow'.
		Bv: een overlopende som
			(50)10 = (0011 0010)2
			(100)10 = (0110 0100)2
			
			100 + 50 =	0011 0010
						0110 0100
						+---------
						(1001 0110)2
						= (-106) dec
						
			Klopt dus niet héé
		Idem dito met een overlopend verschil.
		Binnenblijvende som & verschil is dan een correcte bewerking.
			
			Samenvatting:	
				---------------------------------------------------------------------
				|	Overdrachtbit op tekenbit	|	Overloopbit	|	Correcte som	|
				---------------------------------------------------------------------
				|				Ja				|		Ja		|		Ja			|
				|				Ja				|		Nee		|		Nee			|
				|				Nee				|		Ja		|		Nee			|
				|				Nee				|		Nee		|		Ja			|
				---------------------------------------------------------------------
							
	//	Introductie reële opslagfouten:
		Exacte getallen worden slechts benaderend weergegeven op machinegetallen.
		Bv:
			Pi = (3,14159265...)	Pi' = (3,1)
			
		α = absolute fout
		α = | x - x' |
		
		Verder op voorbeeld:
			α = | pi - pi' | = 0,04159265...
			
		Voor elk absolute fout, is er ook een relatieve fout:
		ε = relatieve fout
		ε = α / |x|
		
		verder op voorbeeld:
			ε = α / |pi|	= 0,0132394....
							= 1,32%
	
	//	Introductie accuraatheid versus precisie:
		a = accuraatheid
		accuraatheid duidt aan hoeveel cijfers na de komma correct werden opgeslagen.
		a10 = floor(-a)
				α = 10^a
				log(α) = a
			
			= floor(-log(α))
		
		p = precisie
		precisie duidt het aantal foutloze beduidende cijfers aan. 
		p10 = ceiling(-p)
				ε = 10^p
				log(ε) = p
			
			= ceiling(-log(ε))
					 
	//	Bewijs theoretische band tussen a en p:
		p. 103.
		
			a - log(|x|) = p
		
			Beginnend bij ε = α / |x|
				ε = 10^p				α = 10^a
				
				<=>	10^p = 10^a / |x|
				<=> log(10^p) = log (10^a / |x|)
				<=>	p = log(10^a) - log(|x|)
				<=> p = a - log(|x|)
				<=> a - log(|x|) = p
				
			Q.E.D.
				
	//	Introductie binaire precisie:
		p2 = ceiling(-log2(ε))
		
	//	Herintroductie wetenschappelijke getal notatie:
		p. 105.
		
	//	Introductie mini precision:
		Een totaal van 8 te besteden bits. 1 tekenbit, 3 exponentenbits en 4 mantissebits. 
		
		Grootte met exponent bepaald.
		Bias β = constant positief bedrag waarmee de effectieve exponent mee wordt verhoogd.
		
		Eβ = E2 + β.
		
		Bij mini-precision is dit β = 4.
		
		Precisie met mantisse bepaald.
		Hidden bit = mantissebit voor de komma die per definitie altijd 1 is, en kan dus daardoor worden uitgespaard bij getal opslag.
		
		p. 107. zeker bekijken.
		p. 108. samenvatting ervan.
	
		Aantal getallen:
			#(mini-precision) = 2^8 = 256.
			
			exp bits = 2^3
			mantissebits = 2^4
							=> 8*16 = 128 getallen in R+
		
		Het getal nul:
			zit in één van de 34 gereserveerde bitrijen.
		p. 110.
		
		
		-----------------------------------------------------------------------------------------------------
		|	float type			|	byte	|	t	|	e	|	m	|	p10	|	bias β	| bruikbaar aantal	|
		-----------------------------------------------------------------------------------------------------
		|	'mini precision'	|	 1		|	1	|	3	|	4	|	2	|	+4		|		222			|
		-----------------------------------------------------------------------------------------------------
		
	
	//	Introductie single precision:
		p. 113.
		
		-----------------------------------------------------------------------------------------------------
		|	float type			|	byte	|	t	|	e	|	m	|	p10	|	bias β	| bruikbaar aantal	|
		-----------------------------------------------------------------------------------------------------
		|	'single precision'	|	 4		|	1	|	8	|	23	|	8	|	+127	|	4 miljard		|
		-----------------------------------------------------------------------------------------------------
		
	//	Introductie double precision:
		p. 116.
		
		-----------------------------------------------------------------------------------------------------
		|	float type			|	byte	|	t	|	e	|	m	|	p10	|	bias β	| bruikbaar aantal	|
		-----------------------------------------------------------------------------------------------------
		|	'double precision'	|	 8		|	1	|	11	|	52	|	16	|	+1023	|	16 triljoen		|
		-----------------------------------------------------------------------------------------------------
		
	//	Introductie foutophoping:
		p. 119.
		
		α = | x - x' |
		x' = x +- α
		
			via ε = α / |x|
				<=> ε * |x| = α
			kan dit herschreven worden naar
		
		x' = x +- ε * |x|
		x' = x[1+-ε]
		
	//	Bewijs van het epsilon-probleem:
		p. 120.
		
			(x'.(y'+z')')'
			
			...
			
			Q.E.D.
*/

//	*	6.	Booleaanse wiskunde	[p. 127-173]	*
/*
	//	Introductie disjunctie:
		Kernwoordje "of", "or".
		Symbool: ∨ 
		Het één of het andere, of beiden.
		bv:
			Ik ga naar Disneyland. Ik ga naar Frankrijk.
		
		Waarheidstabel:
			-----------------------------
			|	p	|	q	|	p ∨ q	|
			-----------------------------
			|	1	|	1	|	1		|
			-----------------------------
			|	1	|	0	|	1		|
			-----------------------------
			|	0	|	1	|	1		|
			-----------------------------
			|	0	|	0	|	0		|
			-----------------------------
	
	//	Introductie conjunctie:
		Kernwoordje "en", "and".
		Symbool: ∧
		Het één én het ander.
		bv:
			Ik koop een ijsje en een appel.
			
		Waarheidstabel:
			-----------------------------
			|	p	|	q	|	p ∧ q	|
			-----------------------------
			|	1	|	1	|	1		|
			-----------------------------
			|	1	|	0	|	0		|
			-----------------------------
			|	0	|	1	|	0		|
			-----------------------------
			|	0	|	0	|	0		|
			-----------------------------	
	
	//	Introductie negatie:
		Kernwoordje "niet", "not".
		Symbool: ¬ 
		Ontkenning van hetgeen.
		bv:
			Ik koop geen ijsje.
		
		Waarheidstabel:
			-----------------
			|	p	|	¬p	|
			-----------------
			|	1	|	0	|
			-----------------
			|	0	|	1	|
			-----------------
	
	//	Bewijs van 'de uitgesloten derde' + Introductie dubbele ontkenning:
		p. 131.
			
			De wet van de uitgesloten derde sluit nl. uit dat er een derde waarheidswaarde kan bestaan.
			(De dubbele ontkenning van iets, is dat iets zelf.)
			
			¬(¬p) = p
			
			Waarheidstabel:
				-----------------------------
				|	p	|	¬p	|	¬(¬p)	|
				-----------------------------
				|	1	|	0	|	1		|
				-----------------------------
				|	0	|	1	|	0		|
				-----------------------------
				
			Q.E.D.
			
	//	Introductie logische implicatie:
		Kernwoordjes: "als... dan...", "if... else...".
		Symbool: -> 
		Enkel onwaar indien linkerlid waar is en rechterlid onwaar.
		
		bv:
			Als Ankara wint dan gaat Reçep op reis.
		
		Waarheidstabel:
			-----------------------------
			|	p	|	q	|	p -> q	|
			-----------------------------
			|	1	|	1	|	1		|
			-----------------------------
			|	1	|	0	|	0		|
			-----------------------------
			|	0	|	1	|	1		|
			-----------------------------
			|	0	|	0	|	1		|
			-----------------------------

	//	Bewijs van implicatie gelijk is aan ontkenning + disjunctie:
		p. 132.
		
			Regel 1:
			p -> q	=	¬p ∨ q
		
			Waarheidstabel:
				-----------------------------------------
				|	p	|	q	|	p -> q	|	¬p ∨ q	|
				-----------------------------------------
				|	1	|	1	|	1		|	1		|
				-----------------------------------------
				|	1	|	0	|	0		|	0		|
				-----------------------------------------
				|	0	|	1	|	1		|	1		|
				-----------------------------------------
				|	0	|	0	|	1		|	1		|
				-----------------------------------------
				
			Q.E.D.
			
	//	Conjunctie en disjunctie zijn commutatief. Implicatie niet.
	
	//	Introductie causale implicatie:
		Kernwoordjes: "als... dan...", "if... else...".
		Symbool: => 
		Gebruikt wanneer een logische implicatie een identiteit is en dus altijd een ware verbinding vormt.
		
	//	Bewijs van contrapositie:
		p. 134.
		
			Regel 2:
			p -> q	=	¬q -> ¬p
		
			Waarheidstabel:
				---------------------------------------------
				|	p	|	q	|	p -> q	|	¬q -> ¬p	|
				---------------------------------------------
				|	1	|	1	|	1		|		1		|
				---------------------------------------------
				|	1	|	0	|	0		|		0		|
				---------------------------------------------
				|	0	|	1	|	1		|		1		|
				---------------------------------------------
				|	0	|	0	|	1		|		1		|
				---------------------------------------------
			
			Q.E.D.
				
		OF
			¬q -> ¬p =	¬(¬q)∨ ¬p)
					 =	q ∨ ¬p
					 =	¬p ∨ q
					 =	p -> q
			
			Q.E.D.
	
	//	Introductie logische equivalentie:
		Kernwoordjes: "... als en slechts als...", "... if and only if...".
		Symbool: <-> 
		Waar indien beiden leden zelfde waarheidswaarde hebben.
		
		Waarheidstabel:
			-----------------------------
			|	p	|	q	|	p <-> q	|
			-----------------------------
			|	1	|	1	|	1		|
			-----------------------------
			|	1	|	0	|	0		|
			-----------------------------
			|	0	|	1	|	0		|
			-----------------------------
			|	0	|	0	|	1		|
			-----------------------------
			
	//	Bewijs van herschrijving logische equivalentie:
		p. 136.
		
			Regel 3:
			p <-> q = (¬p ∨ q) ∧ (¬q ∨ p)
			
			Waarheidstabel:
				---------------------------------------------------------------------
				|	p	|	q	|	¬p ∨ q	|	¬q ∨ p	|	(¬p ∨ q) ∧ (¬q ∨ p)		|
				---------------------------------------------------------------------
				|	1	|	1	|	1		|	1		|			1				|
				---------------------------------------------------------------------
				|	1	|	0	|	0		|	1		|			0				|
				---------------------------------------------------------------------
				|	0	|	1	|	1		|	0		|			0				|
				---------------------------------------------------------------------
				|	0	|	0	|	1		|	1		|			1				|
				---------------------------------------------------------------------
				
			Q.E.D.
		
		OF
			p <-> q = (¬p ∨ q) ∧ (¬q ∨ p)
					= p -> q ∧ (¬q ∨ p)
					= p -> q ∧ q -> p
					= p <-> q
				
				
			Q.E.D.
	
	//	Introductie causale equivalentie:
		Kernwoordjes: "... als en slechts als...", "... if and only if...".
		Symbool: <=> 
		Gebruikt wanneer een logische equivalentie een identiteit is en dus een altijd ware verbinding vormt.
		
	//	Introductie axioma's:
		Stellingen die vanzelfsprekend als "waar" worden aangenomen.
		
	//	Introductie structuur:
		structuur = (verzameling, bewerkingen).
		bv:
			van Uitsprakenlogica:
				structuur = (W, ¬, ∨, ∧)
	
	//	Introductie Schakelalgebra.
		structuur = (S, not, or, and)
	
	//	Introductie XOR-poort:
		Exclusieve-OR.
		Symbool: cirkel met kruis.
		Tekening: p. 145.
		Het één of het andere. Niet allebij.
				
		Schakeltabel:
			-----------------------------
			|	p	|	q	|	p xor q	|
			-----------------------------
			|	1	|	1	|	0		|
			-----------------------------
			|	1	|	0	|	1		|
			-----------------------------
			|	0	|	1	|	1		|
			-----------------------------
			|	0	|	0	|	0		|
			-----------------------------		
				
		de OR wordt ook wel de inclusieve-OR genoemd.
				
	//	Introductie OR-poort:
		Inclusieve-OR.
		Symbool: "or".
		Tekening: p. 143.
		Het één of het andere of beiden.
				
		Schakeltabel:
			-----------------------------
			|	p	|	q	|	p or q	|
			-----------------------------
			|	1	|	1	|	1		|
			-----------------------------
			|	1	|	0	|	1		|
			-----------------------------
			|	0	|	1	|	1		|
			-----------------------------
			|	0	|	0	|	0		|
			-----------------------------				
				
	//	Introductie AND-poort:
		AND.
		Symbool: "and".
		Tekening: p. 143.
		Het één en het andere.
				
		Schakeltabel:
			-----------------------------
			|	p	|	q	|	p and q	|
			-----------------------------
			|	1	|	1	|	1		|
			-----------------------------
			|	1	|	0	|	0		|
			-----------------------------
			|	0	|	1	|	0		|
			-----------------------------
			|	0	|	0	|	0		|
			-----------------------------				
				
	//	Introductie NOT-poort:
		NOT.
		Symbool: "not(x)".
		Tekening: p. 143.
		Ontkenning van dat.
				
		Schakeltabel:
			---------------------
			|	p	|	not(p)	|
			--------------------
			|	1	|	0		|
			---------------------
			|	0	|	1		|
			---------------------	
				
	//	Introductie YES-poort:
		YES.
		Symbool: "yes(x)".
		Tekening: p. 143.
				
		Schakeltabel:
			---------------------
			|	p	|	yes(p)	|
			--------------------
			|	1	|	1		|
			---------------------
			|	0	|	0		|
			---------------------				
				
	//	Introductie samengestelde poorten en schakelingen:
		p. [144-146].
				
				
	//	Introductie Axioma's van Huntington:
		p. 148.
		-----------------------------------------------------------------------------------------------------------------
			commutativiteit		|			a ∧ b	=	b ∧ a				|			a ∨ b	=	b ∨ a				|
		-----------------------------------------------------------------------------------------------------------------
			distributiviteit	|	a ∧ (b ∨ a) = (a ∧ b) ∨ (b ∧ a)			|	a ∨ (b ∧ a) = (a ∨ b) ∧ (b ∨ a)			|
		-----------------------------------------------------------------------------------------------------------------
			neutraal element	|				a ∧ 1 = a					|				a ∨ 0 = a					|
		-----------------------------------------------------------------------------------------------------------------
			uitgesloten derde	|				a ∧ ¬a = 0					|				a ∨ ¬a = 1					|
		-----------------------------------------------------------------------------------------------------------------
	
	//	Bewijs van opslorpend element:
		p. 149.
		
			1 ∨ a = 1					en				0 ∧ a = 0
			
			1 ∨ a	= (1 ∨ a) ∧ 1						0 ∧ a 	= (0 ∧ a) ∨ 0
					= (1 ∨ a) ∧ (a ∨ ¬a)						= (0 ∧ a) ∨ (a ∧ ¬a)
					= (a ∨ (¬a ∧ 1))							= (a ∧ (¬a ∨ 0)
					= (a ∨ (¬a))								= (a ∧ (¬a))
					= 1											= 0
					
			Q.E.D.										Q.E.D.
			
	
	//	Bewijs van idempotentie + Introductie idempotentie:
		p. 149.
		
			a ∨ a = a					en				a ∧ a = a
			
			a ∨ a 	= (a ∨ a) ∧ 1						a ∧ a 	= (a ∧ a) ∨ 0
					= (a ∨ a) ∧ (a ∨ ¬a)						= (a ∧ a) ∨ (a ∧ ¬a)
					= (a ∨ (¬a ∧ a))							= (a ∧ (¬a ∨ a))
					= (a ∨ 0)									= (a ∧ 1)
					= a											= a
			
			Q.E.D.										Q.E.D.
			
	//	Bewijs van De Morgan + Introductie De Morgan:
		p. 150.
			
			¬(a ∧ b) = ¬a ∨ ¬b
			
			...
			
			Q.E.D.
			
	//	Volgorde van bewerking:
		1) Haakjes
		2) Negaties
		3) Conjuncties
		4) Disjuncties
	
	//	Introductie minimale vormen:
		p. 152.
		
		Logische product van precies n factoren.
	
	//	Introductie maximale vormen:
		p. 152.
		
		Logische som van precies n factoren.
		
	//	Alle booleaanse functies in twee veranderlijke:
		p. [152-156].
		
	//	Introductie disjunctieve normaalvorm:
		Iets staat in disjunctieve normaalvorm indien het voorschrift is weergegeven als een disjunctie van alleen maar minimale vormen.
		
	//	Introductie conjunctieve normaalvorm:
		Iets staat in conjunctieve normaalvorm indien het voorschrift is weergegeven als een conjunctie van alleen maar maximale vormen.
		
	//	Introductie Karnaughkaarten:
		p. [156-167].
		
*/


//	*	7.	Inleiding tot de cryptografie	[p. 175-200]	*
/*
	//	Introductie cryptografie:
		Def: "Beveiligen van communicatie tegen allerlei inbreuken op de privacy ervan."
		Confidentialiteit = beveiliging van communicatie tegen derden.
		Integriteit = beveiliging tegen wijziging tegen derden.
		Authenticatie = Garanderen van de identiteit van een correspondent.
		
		Alice & Bob hebben keys K. Alice zegt boodschap M, versleuteld naar cryptotext C, ontcijferd door key K bij Bob. Handtekeningen of signaturen = S.
	
		bericht B -> *Versleutelen/Encrypted* -> Sleuteltekst C -> Versturen -> C -> *Ontcijferen/Decrypten* -> B
	
	//	Bitrijen b, binaire getallen bin of '2'
		4 soorten algoritmen:
		
		*Bitversleuteling / stroomvercijfering:
			Ingevoerde klare boodschap bit per bit versleutelen tot een bitgewijze uitvoer.
		
		*Karakterversleuteling:
			Ingevoerde klare boodschap karakter na karakter versleutelen tot een karaktergewijze uitvoer.
			"Karakter" onder de ASCII code
			
		*Byteversleuteling:
			Ingevoerde klare boodschap byte na byte versleutelen tot een bytegewijze uitvoer.
		
		*Blokversleuteling:
			Ingevoerde klare boodschap blok na blok versleutelt tot bloksgewijze uitvoer.
			
	//	Sleutelontwerp:
		2 soorten:
		
		*Symmetrisch:
			Dezelfde sleutel gebruikt om te ontcijferen als te vercijferen.
		
		*Asymmetrisch:
			Versleutelen en ontsleutelen met verschillende sleutels.
			
		In de praktijk vaak een gelaagde combinatie van zowel symmetrisch als asymmetrisch.
		
	//	Indeling naar algoritme:
		
		Substitutie: vervanging van elke klare invoerblok /-bit door zijn versleutelde uitvoerblok /-bit.
		
		Permutatie: omschikking van de klare boodschap B tot de vercijferde boodschap C.
		
	//	De kracht van cryptografische algoritmen ligt enkel in hun ontwerp en in de kwaliteit van de sleutels K.
		
	//	Introductie sleutelruimte:
		p.179
		
		Def: de verzameling van alle geldige sleutels K. 
		
		Hoe groter de sleutelruimte, hoe sterker het cryptografisch algoritme.
		
		Een cryptografisch algoritme vervormt m.b.v. een geheime sleutel een klare boodschap M tot een versleutelde versie C
		
	//	Introductie diffusie:
		p.180
		
		Def: de mate waarin kleine wijzigingen in de klare boodschap M een 'lawine' aan wijzigingen in de versleutelde versie C veroorzaakt en omgekeerd.
	
	//	Introductie confusie:
		p. 180.
		
		Def: de mate waarin er geen wiskundig verband kan worden gelegd tussen een onderschepte versleuteld boodschap C en de daarvoor gebruikte sleutel K.
		
		Hoe groter de confusie, hoe sterker het cryptografisch algoritme.
		
	//	Introductie kraaktechnieken:
		p. 180.
		
		*Brute kracht aanval:
			Kraakpoging waarbij wordt ontsleuteld door sleutel na sleutel uit de totale sleutelruimte uit te proberen.
			
			Verrijst zeer veel tijd, theoretisch mogelijk, in de praktijk relatief gezien onmogelijk;
			
	//	Introductie Cryptografische rekenomgevingen:
		p. 181.
		
		Werken met bitrijen.
		
		*Associatietabel:
			Elke verzameling verbanden tussen bitrijen en hun overeenkomstige unieke betekenis.
			
	//	Introductie fictieve mini-karakter-code
		p.181.
		64 karakters van natuurlijk getallen: [0-63].
		Signed bytes.
		
		p.182. staat de associatietabel ervan.
		
	//	Introductie ASCII-code
		p. 183.
		
	//	Introductie Unicode
		p. 183.
		
	//	Introductie restsystemen:
		p. 183.
		
	//	Introductie restklasse:
		p. 183.
		
		2 getallen zijn congruent modulo m wanneer ze dezelfde rest hebben na de gehele deling door eenzelfde modulus m.
		
		∀ a,b ∈ Z: a ≡ b mod m ⇔ a = m.l + b			met m ∈ N\{0}, l ∈ Z
		
		Zie p. 184. voorbeelden.
		
		Def: restklasse of congruentieklasse modulo m als de oneindige verzameling gehele getallen die een gelijke rest vertonen na gehele deling door eenzelfde natuurlijke modulus m.
			De vertegenwoordiger van de restklasse is de kleinste natuurlijke getal ervan.
			
		Notatie restklasse: ā.
		
	//	Bewijs de eerste vuistregel:
		p. 185.
		
		a ≡ a ± m*k
		
		Zie p. 185. voorbeelden.
		
	//	Verder op restsystemen:
		Restsysteem/restklassenverzameling
		
		Def: verzameling van restklassen modulo m ∈ N\{0}
		
		Notatie: Notatie: Zm = {0,1,2,3,m-1} (met streepjes boven de cijfers).
		
		De kardinaliteit van een restsysteem: het aantal elementen van een restsysteem
		Notatie: #Zm = m

	//	Bewijs plusbewerking in restsysteem:
		p. 187.
		
		a ≡ b mod m
		c = d mod m
		-> a+c ≡ b+d mod m
		
		...
		
		Q.E.D.

	//	Bewijs maalbewerking in restsysteem:
		p. 187.
		
		a ≡ b mod m
		c = d mod m
		-> a*c ≡ b*d mod m
		
		...
		
		Q.E.D.
	
	//	Introductie inverse elementen in restsysteem:
		p. 188.
	
		Product van 2 restklassen (die zelf niet de nulkasse zijn) is gelijk aan 1.
		ā * ē = 1
		a en e zijn mekaars inverse.
		
	//	Introductie gereduceerd restsysteem:
		p. 189.
		
		Verzameling van de inverteerbare elementen van Zm.
		Z*m
		
		Trucje om ze te vinden: indien ggd(getal, restsysteem) > 1 => geen invers element.
								indien ggd(getal, restsysteem) = 1 => is invers element.
		
	//	Introductie nuldelers in restsysteem:
		p. 189.
		
		Product van 2 restklassen (die zelf niet de nulkasse zijn) is gelijk aan de nulklasse.
		ā * ē = 0
		ā als ē worden beiden nulders genoemd.
		
	//	Herintroductie restsysteem:
		p. 190.
		
		Zm = {Z*m} unie {0} unie {nuldelers}
		
	//	Introductie oplossen van lineaire vergelijkingen:
		p. 190.
		
		Elk lineaire vgl. valt altijd te herschrijven naar:
			a*x + b = 0
			
		Zie p. [190-191]. voorbeelden.
		
	//	Herintroductie structuur:
		(voor de additieve groep (Zm,+) inclusief 0:
		
		4 eigenschappen:
			1) Gesloten -> a + b = een element van Zm.
			2) Associatief -> a + (b + c ) = ( a + b ) + c
			3) Neutraal element -> a + 0 = a
			4) Symmetrisch element -> a + (-a) = 0
			   (a.k.a. invers element)
		
		Additieve groep is een groep.
		Commutativiteit -> a + b = b + a
		Hoofddiagonaal: loopt van linksboven naar rechtsonder.
		Groep dat enkel associatief en gesloten is, noemen we een halfgroep.
		
	//	Introductie Cayleytabel:
		p. 192.
		
		p. 193. voorbeeld Cayleytabel.
		
	//	Bewijs additieve commutatieve groep(Zm,+):
		p. 194.
		
		(Zm, +) is een additieve commutatieve groep:
		
		...
		
		Q.E.D.
		
	//	Introductie multiplicatieve groep (Zm\{0}, * ):
		p. 194.
		
		Eenheidselement = 1
		(neutraal element)
			iets maal het eenheidselement is dat iets zelf.
				bv:
					5 * 1 = 5
		
		multiplicatieve groep is geen groep:
			1) niet elk element heeft een invers element: tegenstrijd met puntje 4) 
				(elk element heeft een symmetrisch element).
			2) is niet gesloten: product van sommige dingen is 0 en nul zit er niet in.
			
	//	Introductie onderling deelbaar:
		p. 197.
		
		Wanneer twee gehele getallen b en c hun grootste gemene deler d > 1.
		
		Iets is een nuldeler indien ggd(x,Zm) > 1.
		
	//	Introductie relatief priem / onderling ondeelbaar:
		ppt slide 53.
		
		Wanneer twee gehele getallen b en c hun grootste gemene deler d = 1.
		
		Iets is een invers element indien ggd(x,Zm) = 1.
*/

//	*	8.	Lineaire cijfers	[p. 201-214]	*
/*
	//	Introductie de Ring:
		p. 202.
		
		Def:	structuur met 2 bewerkingen die voldoen aan volgende criteria:
					1) De verzameling Zm vormt onder zijn plus-bewerking (+ mod m) een commutatieve additieve groep (ℤm,+)
					2) De verzameling Zm blijft gesloten onder de maal-bewerking (. mod m):
					3) In Zm is de maalbewerking associatief -> a * b = b * a
					4) In Zm geldt linkse en rechtse distributiviteit -> a * (b + c) = (a + c) * b
	
	//	Introductie unitaire ring:
		p. 202.
		
		Indien een ring een eenheidselement heeft, noemen we de ring dan een unitaire ring.
		
		Indien de vermenigvuldiging commutatief is, noemen we de ring dan commutatieve ring.
		
		Indien beiden: unitaire commutatieve ring.
		
	//	Bewijs de ring:
		p. 203.
		
		...
		
		Q.E.D.
		
	//	Bewijs de tweede-vuistregel:
		p. 205.
		
		(a + b) mod m = a mod m + b mod m
		(a * b) mod m = a mod m * b mod m
		
		Zie p. 205. voorbeelden.
		
	//	Introductie publieke rekenomgeving:
		p. 205.
		
		We kiezen de ring (Z26, +, *) als rekenomgeving.
		Letters van alfabet kunnen dan voorgesteld worden {0 = A, 1= B, ..., 24 = Y, 25 = Z}.
		
	//	Introductie de vercijfering:
		p. 206.
		
		Lineaire functie: X |-> 𝛼x+β ≡ y
		
		=> Z26 blijft gesloten 
		=> domein en bereik zijn gelijk
		
		𝛼 en β zijn gelijk aan de overeenkomstige symmetrische sleutel K:
			K = (𝛼, β)
			
		zie ppt slide 13. voorbeeld.
		
	//	Introductie ringelement:
		p. 207.
		
		Def: elk ringelement dat element is van Zm is invariant onder een functie f zodra
			f(x) ≡ x mod m
			
	//	Introductie de ontcijfering:
		p. 207.
		
		Lineaire functie: y |-> 𝛼^-1 * y - 𝛼^-1 * β ≡ x
		
		Ontcijferingsfuncties f-1 kunnen dus enkel bestaan voor vercijferingsfuncties f waarvan de coëfficiënt 𝛼 tot het gereduceerd restsysteem van ℤ26  behoort

	//	Introductie grootte sleutelruimte:
		p. 207. (onderaan)
		
		Geldige sleutels: K = (𝛼, β) element van Z26 * Z*26 (gereduceerd restsysteem)
		
		12 inverse elementen in Z*26, 26 elementen in Z26 -> sleutelruimte = 12*26 = 312
		
		zie ppt slide 17. voorbeeld.
	
	//	Introductie "het algoritme":
		Elke lineaire vercijfering
			f: Z26 -> Z26 
				x ⟼ 𝛼x+β ≡ y
			met sleutel K = (𝛼, 𝛽)  ∈ Z26*x Z26 wordt ontsleuteld door zijn omgekeerde functie f^-1: Z26 ⟶Z26 
			y ⟼𝛼^-1 * y - 𝛼^-1 * β ≡ x

	//	Introductie de kraakpoging:
		p. 209.
		
		lees dit voor een uitgewerkt voorbeeld.
	
	//	Introductie soorten lineaire cijfers:
		p. 210.
		
		te vaag om het nut er uit te halen.
*/




Bron: Campus Handboek
Auteur: Ivo De Pauw, Bieke Masselis
Titel: Wiskunde voor IT, Nieuwe editie
Druk: juli 2018
ISBN nr: ISBN978 94 014 2100 3
Uitgeverij: LannooCampus
