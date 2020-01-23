# Software Engineering Samenvatting
## Gamification
Voordelen:
- Leuk
- Overal mogelijk
- Competitief
- Engagement
Nadelen:
- Kan belangrijker worden dan doel
- Niet voor iedereen

## Testing
Waarom testen we?
- Mensen maken fouten
- Kwaliteit garanderen
- Klant & ontwikkelaar geruststellen
- Werkt het programma zoals verwacht?

### Automatisch testen
#### Waarom?
- Testen uitvoeren die mensen niet kunnen uitvoeren
- Meer testen uitvoeren
- Tijd en geld besparen
- Kwaliteit en vertrouwen groeit
#### Wat kunnen we automatisch testen?
- Testen die heel veel tijd of moeite kosten
- Testen die je niet manueel kan uitvoeren
- Testen die gevoelig zijn voor menselijke fouten
- Steeds wederkerende testen
##### Voorbeelden
###### Test Level
UCIS
- Unit Testing
- Component Testing
- (System) Integration Testing
- System Testing

###### Test Type
PReSSFeL
- Performance testing
- Regression testing
- Security testing
- (Load) & Stability testing
- Functional testing
- Load & (Stability) testing

### Performantietesten
#### Soorten
- Load testen
  - Performantie van het systeem testen met een normaal aantal gebruikers/data
- Soak testen
  - Performantie van het systeem testen met een constant normaal aantal gebruikers/data
- Spike testen
  - Performantietest met plotselinge pieken in gebruikers/data
- Stresstest
  - Performantietest om het breekpunt van het systeem vast te stellen a.d.h.v. een extreem aantal gebruikers/data

#### Doel
- Responsetijd
- Acceptatie
  - Stabiliteit
- Regressie
  - Werkt de nieuwe versie even snel?
- Betrouwbaarheid
  - Kan het systeem een hoog aantal gebruikers/data aan?
- Bottleneck identificeren

### Golden master testing
Je maakt een nieuwe branch vanaf de `master`-branch. Je wijzigt de code op de nieuwe branch en test met willekeurige data. Als het resultaat hetzelfde is op de nieuwe branch, weet je dat je wijzigingen aan de code op de nieuwe branch geen functionaliteit breken, en kan je dus veilig terug mergen met de `master`-branch. Als dat niet het geval is, weet je dat je iets hebt kapot gemaakt, en moet je dus opnieuw beginnen vanaf de `master`-branch.

## Legacy code
### Simple design
1) Slaagt voor alle testen
2) Zo weinig mogelijk duplicatie van concepten
3) Zo leesbaar mogelijk; de code onthult de intentie
4) Bevat enkel de noodzakelijke code