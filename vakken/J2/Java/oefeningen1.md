# Oefeningen 1
## 1.1
### Klasse Main
```java
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;

/**
 *
 * @author maxim
 */
public class Main {
    public static void main(String[] args) {
        Vlucht vlucht = new Vlucht(Locatie.PARIJS, LocalDateTime.of(2019, Month.OCTOBER, 6, 11, 50, 0), "BE99109");
        Passagier passagier = new Passagier("Janssens", "Maxim", "00.08.000-30321", vlucht);
        passagier.setGeboortedatum(LocalDate.of(2000, Month.AUGUST, 24));
        System.out.println("Passagier: " + passagier.toString());
    }
}
```
### Enumeratie Locatie (voor bestemming & vertrek)
Enumeraties in Java zijn een stuk veelzijdiger dan in C#, en het is bijgevolg gebruikelijk dat deze worden gedeclareerd in een apart bestand. De extra functionaliteiten van enums worden gebruikt in oefening 3.
```java
public enum Locatie {
    PARIJS, ROME, KEULEN, BRUSSEL;
}
```
### Klasse Passagier
Zoals je misschien al gemerkt hebt, werkt de shortcut 'prop-tab-tab' hier niet meer. Dit komt omdat properties in Java niet bestaan. In plaats daarvan werken we met gewone fields (die expliciet `private` dienen te staan, anders kunnen de waarden rechtsreeks worden aangepast vanuit andere klassen binnen hetzelfde package.). Om de waarden te kunnen opvragen of aanpassen vanuit andere klasses, maken we gebruik van respectievelijk getters en setters. Dit zijn methodes die niets anders doen dan de waarde van een bepaald field returnen of instellen. `setGeboortedatum` hieronder is een voorbeeld van een setter.

Een ander verschil met C# is dat je het `override`-keyword niet meer hoeft te gebruiken als je een methode overschrijft. Bijvoorbeeld bij de `toString()`-methode. Wel is het gebruikelijk om `@Override` op het lijntje erboven te zetten, zodat je zelf weet wanneer je een methode overschrijft. Dit wordt een annotatie genoemd, en deze worden niet mee gekopieerd wanneer je een stuk code kopiert. Daarom zal je deze annotaties ook niet terugvinden in de oefeningen die hier op GitHub staan. Als je een annotatie vergeet te plaatsen, zal je IDE hiervan een melding geven.
```java
import java.time.LocalDate;

/**
 *
 * @author maxim
 */
public class Passagier {
    private String naam, voornaam, rijksregisternummer;
    private LocalDate geboortedatum;
    private Vlucht vlucht;
    
    public void setGeboortedatum(LocalDate geboortedatum) {
        this.geboortedatum = geboortedatum;
    }
    
    public Passagier(String naam, String voornaam, String rijksregisternummer, Vlucht vlucht){
        this(naam, voornaam, rijksregisternummer, vlucht, null);
    }
    
    public Passagier(String naam, String voornaam, String rijksregisternummer, Vlucht vlucht, LocalDate geboortedatum){
        this.naam = naam;
        this.voornaam = voornaam;
        this.rijksregisternummer = rijksregisternummer;
        this.vlucht = vlucht;
        this.geboortedatum = geboortedatum;
    }
    
    public String toString(){
        return "Naam: " + naam + "\nVoornaam: " + voornaam + "\nRijksregisternummer: " + rijksregisternummer + "\nGeboortedatum: " + geboortedatum + "\nVlucht: " + vlucht;
    }
}

```
### Klasse Vlucht
```java
import java.time.LocalDateTime;

/**
 *
 * @author maxim
 */
public class Vlucht {
    private Locatie bestemming;
    private Locatie vertrek = Locatie.BRUSSEL;
    private LocalDateTime tijdstipVertrek;
    private String vluchtnummer;
    
    public Vlucht(Locatie bestemming, LocalDateTime tijdstipVertrek, String vluchtnummer){
        this.bestemming = bestemming;
        this.tijdstipVertrek = tijdstipVertrek;
        this.vluchtnummer = vluchtnummer;
    }
    
    @Override
    public String toString(){
        return "Bestemming: " + bestemming + "\nVertrek: " + vertrek + "\nTijdstip vertrek: " + tijdstipVertrek + "\nVluchtnummer: " + vluchtnummer;
    }
}
```
## Oefening 1.2
### Klasse Main
```java
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;

/**
 *
 * @author maxim
 */
public class Main {
    public static void main(String[] args) {
        Vlucht vlucht = new Vlucht(Locatie.PARIJS, LocalDateTime.of(2019, Month.OCTOBER, 6, 11, 50, 0), "BE99109");
        Passagier passagier = new Passagier("Janssens", "Maxim", "00.08.000-30321");
        Passagier passagier2 = new Passagier("test", "test", "00.080.--0923032", LocalDate.of(2000, Month.AUGUST, 24));
        passagier.setGeboortedatum(LocalDate.of(2000, Month.AUGUST, 24));
        vlucht.addPassagier(passagier);
        vlucht.addPassagier(passagier2);
        System.out.println("Vlucht: " + vlucht.toString());
    }
}
```
### Klasse Vlucht
```java
import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 *
 * @author maxim
 */
public class Vlucht {
    private Locatie bestemming;
    private Locatie vertrek = Locatie.BRUSSEL;
    private LocalDateTime tijdstipVertrek;
    private String vluchtnummer;
    private ArrayList<Passagier> passagiers = new ArrayList<>();
    
    public Vlucht(Locatie bestemming, LocalDateTime tijdstipVertrek, String vluchtnummer){
        this.bestemming = bestemming;
        this.tijdstipVertrek = tijdstipVertrek;
        this.vluchtnummer = vluchtnummer;
    }
    
    public void addPassagier(Passagier passagier){
        passagiers.add(passagier);
    }
    
    public String passagiersToString(){
        String result = "";
        for(Passagier passagier : passagiers){
            result += passagier.toString();
        }
        return result;
    }
    
    @Override
    public String toString(){
        return "Bestemming: " + bestemming + "\nVertrek: " + vertrek + "\nTijdstip vertrek: " + tijdstipVertrek + "\nVluchtnummer: " + vluchtnummer + "\n\nPassagiers: " + passagiersToString();
    }
}
```
### Enumeratie Locatie
Blijft hetzelfde als in oefening 1.1
### Klasse Passagier
```java
import java.time.LocalDate;

/**
 *
 * @author maxim
 */
public class Passagier {
    private String naam, voornaam, rijksregisternummer;
    private LocalDate geboortedatum;
    
    public void setGeboortedatum(LocalDate geboortedatum) {
        this.geboortedatum = geboortedatum;
    }
    
    public Passagier(String naam, String voornaam, String rijksregisternummer){
        this(naam, voornaam, rijksregisternummer, null);
    }
    
    public Passagier(String naam, String voornaam, String rijksregisternummer, LocalDate geboortedatum){
        this.naam = naam;
        this.voornaam = voornaam;
        this.rijksregisternummer = rijksregisternummer;
        this.geboortedatum = geboortedatum;
    }
    
    public String toString(){
        return "Naam: " + naam + "\nVoornaam: " + voornaam + "\nRijksregisternummer: " + rijksregisternummer + "\nGeboortedatum: " + geboortedatum;
    }
}
```
## Oefening 1.3
### Klasse Main
```java
import java.time.LocalDateTime;
import java.time.Month;
import javafx.util.Duration;

/**
 *
 * @author maxim
 */
public class Main {
    public static void main(String[] args) {
        Presentator erik = new Presentator("Van Looy", "Erik");
        Programma deSlimsteMens = new Programma("De Slimste mens", erik, Duration.hours(1), LocalDateTime.of(2019, Month.MARCH, 2, 20, 30), Genre.KOMEDIE);
        Zender vier = new Zender("Vier");
        vier.addProgramma(deSlimsteMens);
        
        System.out.println(vier);
    }
}
```
### Klasse Presentator
```java
public class Presentator {
    private String naam, voornaam;
    
    public Presentator(String naam, String voornaam){
        this.naam = naam;
        this.voornaam = voornaam;
    }
    
    @Override
    public String toString(){
        return voornaam + " " + naam;
    }
}
```
### Klasse Programma
```java
import java.time.LocalDateTime;
import javafx.util.Duration;

/**
 *
 * @author maxim
 */
public class Programma {
    private String naam;
    private Presentator presentator;
    private Duration tijdsduur;
    private LocalDateTime uitzendTijdstip;
    private Genre genre;
    
    public Programma(String naam, Presentator presentator, Duration tijdsduur, LocalDateTime uitzendTijdstip, Genre genre){
        this.naam = naam;
        this.presentator = presentator;
        this.tijdsduur = tijdsduur;
        this.uitzendTijdstip = uitzendTijdstip;
        this.genre = genre;
    }
    
    @Override
    public String toString(){
        return "Naam: " + naam + "\nPresentator: " + presentator + "\nTijdsduur: " + tijdsduur.toHours() + "h\nUitzend tijdstip: " + uitzendTijdstip + "\n" + genre.getBeschrijving();
    }
}
```
### Enumeratie Genre
In de volgende enumeratie zie je al één van de extra functionaliteiten van enums binnen Java. Enumeraties gedragen zich eigenlijk gewoon als klasses. Hier hebben we een beschrijving toegevoegd, en via de `private`(!) constructor, kunnen we de beschrijving instellen.
```java
public enum Genre {
    ACTIE("Een programma vol actie"), THRILLER("Een spannend programma"), ROMANTIEK("Een programma vol romantiek"), KOMEDIE("Een grappig programma");
    
    private String beschrijving;
    
    private Genre(String beschrijving){
        this.beschrijving = beschrijving;
    }
    
    public String getBeschrijving(){
        return beschrijving;
    }
}
```
### Klasse Zender
```java
import java.util.ArrayList;

/**
 *
 * @author maxim
 */
public class Zender {
    private String naam;
    private ArrayList<Programma> programmas = new ArrayList<Programma>();
    
    public Zender(String naam){
        this.naam = naam;
    }
    
    public void addProgramma(Programma programma){
        programmas.add(programma);
    }
    
    public String programmasToString(){
        String result = "";
        for(Programma programma : programmas){
            result += "\n" + programma;
        }
        return result;
    }
    
    @Override
    public String toString(){
        return "Zender: " + naam + "\nProgramma's: " + programmasToString();
    }
}
```
## 1.4
### Klasse Main
```java
public class Main {
    public static void main(String[] args) {
        NietAlcoholischeDrank water = new NietAlcoholischeDrank(2.50, "Chaudfontaine", false);
        AlcoholischeDrank vodka = new AlcoholischeDrank(8.99, "Krupnik", 30);
        System.out.println(water);
        System.out.println(vodka);
    }
}
```
### Klasse Drank
```java
public class Drank {
    private double prijs;
    private String naam;
    
    public Drank(double prijs, String naam){
        this.prijs = prijs;
        this.naam = naam;
    }
    
    @Override
    public String toString(){
        return "Prijs: " + prijs + "\nNaam: " + naam;
    }
}
```
### Klasse AlcoholischeDrank
```java
public class AlcoholischeDrank extends Drank{
    private double alcoholpercentage;
    public AlcoholischeDrank(double prijs, String naam, double alcoholpercentage) {
        super(prijs, naam);
        this.alcoholpercentage = alcoholpercentage;
    }
    
    @Override
    public String toString(){
        return super.toString() + "\nAlcoholpercentage: " + alcoholpercentage;
    }
}
```
### Klasse NietAlcoholischeDrank
```java
public class NietAlcoholischeDrank extends Drank{
    private boolean prik;
    public NietAlcoholischeDrank(double prijs, String naam, boolean prik) {
        super(prijs, naam);
        this.prik = prik;
    }
    
    @Override
    public String toString(){
        return super.toString() + "\nPrik: " + (prik ? "ja" : "nee");
    }
}
```
## Oefening 1.5
### Klasse Drank
Om deze klasse abstract te maken, zet je gewoon het `abstract`-keyword achter `public`.
```java
public abstract class Drank {
    private double prijs;
    private String naam;
    
    public Drank(double prijs, String naam){
        this.prijs = prijs;
        this.naam = naam;
    }
    
    @Override
    public String toString(){
        return "Prijs: " + prijs + "\nNaam: " + naam;
    }
}
```
## Oefening 1.6
### Klasse Main
```java
public class Main {
    public static void main(String[] args) {
        NietAlcoholischeDrank water = new NietAlcoholischeDrank(2.50, "Chaudfontaine", false);
        AlcoholischeDrank vodka = new AlcoholischeDrank(8.99, "Krupnik", 30);
        Cafe cafe = new Cafe();
        cafe.addDrank(vodka);
        cafe.addDrank(water);
        System.out.println(cafe);
    }
}
```
### Klasse Cafe
```java
import java.util.ArrayList;

/**
 *
 * @author maxim
 */
public class Cafe {
    private ArrayList<Drank> dranken = new ArrayList<>();
    
    public void addDrank(Drank drank){
        dranken.add(drank);
    }
    
    public String drankenToString(){
        String result = "";
        for(Drank drank : dranken){
            result += "\n" + drank;
        }
        return result;
    }
    
    @Override
    public String toString(){
        return drankenToString();
    }
}
```
De andere klasses blijven hetzelfde.
## 1.7
### Klasse Main
```java
public class Main {

    public static void main(String[] args) {
        Sportauto sportauto = new Sportauto(Type.Benzine, Merk.Mercedes, 29010, 8, "WDD1173431N122434", "1-XYZ-139", 340);
        Gezinswagen gezinswagen = new Gezinswagen(Type.Diesel, Merk.Citroën, 78091, 7, "DSFG00FG0001", "1-ABC-862", 5, false);
        Garage garage = new Garage();
        garage.addAuto(sportauto);
        garage.addAuto(gezinswagen);
        System.out.println(garage);
    }
}
```
### Klasse Auto
```java
public abstract class Auto {

    static int teller = 0;
    private int volgnummer;
    private Type type;
    private Merk merk;
    private double kilometerstand;
    private double kilometerfactor;
    private String chassisnummer;
    private String nummerplaat;

    public void setKilometerstand(double kilometerstand) {
        this.kilometerstand = kilometerstand;
    }

    public void setNummerplaat(String nummerplaat) {
        this.nummerplaat = nummerplaat;
    }

    public Auto(Type type, Merk merk, double kilometerstand, double kilometerfactor, String chassisnummer, String nummerplaat) {
        volgnummer = teller++;
        this.type = type;
        this.merk = merk;
        this.kilometerstand = kilometerstand;
        this.kilometerfactor = kilometerfactor;
        this.chassisnummer = chassisnummer;
        this.nummerplaat = nummerplaat;
    }

    @Override
    public String toString() {
        return "\n\nVolgnummer: " + volgnummer + "\nType: " + type + "\nMerk: " + merk + "\nType: " + type + "\nKilometerstand: " + kilometerstand + "\nKilometerfactor: " + kilometerfactor + "\nChassisnummer: " + chassisnummer;
    }
}
```
### Klasse Gezinswagen
```java
public class Gezinswagen extends Auto {

    private int zitplaatsen;
    private boolean trekhaak;

    public Gezinswagen(Type type, Merk merk, double kilometerstand, double kilometerfactor, String chassisnummer, String nummerplaat, int zitplaatsen, boolean trekhaak) {
        super(type, merk, kilometerstand, kilometerfactor, chassisnummer, nummerplaat);
        this.zitplaatsen = zitplaatsen;
        this.trekhaak = trekhaak;
    }

    @Override
    public String toString() {
        return super.toString() + "\nZitplaatsen: " + zitplaatsen + "\nTrekhaak: " + (trekhaak ? "ja" : "nee");
    }
}
```
### Klasse Sportauto
```java
public class Sportauto extends Auto {
    private int pk;
    public Sportauto(Type type, Merk merk, double kilometerstand, double kilometerfactor, String chassisnummer, String nummerplaat, int pk) {
        super(type, merk, kilometerstand, kilometerfactor, chassisnummer, nummerplaat);
        this.pk = pk;
    }
    
    @Override
    public String toString(){
        return super.toString() + "\nPk: " + pk;
    }
}
```
### Enumeratie Merk
```java
public enum Merk {
    Mercedes, Audi, Tesla, Citroën, Jaguar, Peugot;
}
```
### Enumeratie Type
```java
public enum Type {
    Diesel, Benzine, LPG, CNG, Elektrisch;
}
```
### Klasse Garage
```java
public class Garage {

    ArrayList<Auto> autolijst = new ArrayList<>();

    public void addAuto(Auto auto) {
        autolijst.add(auto);
    }

    public String autolijstToString() {
        String result = "";
        for (Auto auto : autolijst) {
            result += auto;
        }
        return result;
    }

    @Override
    public String toString() {
        return autolijstToString();
    }
}
```