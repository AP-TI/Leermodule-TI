# Les 1

## Oefening 1.1

### Klasse Program

```csharp
class Program
    {
        static void Main(string[] args)
        {
            Vlucht vlucht = new Vlucht(1);

            Console.WriteLine(vlucht);
        }
    }
```

### Klasse Vlucht

```csharp
class Vlucht
    {
        public uint Vluchtnummer { get; set; }
        public string PlaatsBestemming { get; set; }
        public string PlaatsVertrek { get; set; }
        public DateTime DatumVertrek { get; set; }
        public DateTime DatumAankomst { get; set; }

        public Vlucht(int vluchtnummer, string vertrek, string bestemming, DateTime vertrekDatum, DateTime aankomstDatum)
        {
            Vluchtnummer = vluchtnummer;
            PlaatsBestemming = bestemming;
            PlaatsVertrek = vertrek;
            DatumVertrek = vertrekDatum;
            DatumAankomst = aankomstDatum;
        }

        public Vlucht(int vluchtnummer) :this(vluchtnummer, "Brussel", "Dublin", new DateTime(2019, 5, 2, 14, 49, 20), new DateTime(2019, 5, 2, 16, 47, 30))
        {

        }

        public TimeSpan Vluchtduur()
        {
            return DatumAankomst - DatumVertrek;
        }

        public override string ToString()
        {
            return "Vluchtnummer: " + Vluchtnummer + "\nVertrekplaats: " + PlaatsVertrek + "\nBestemming: " + PlaatsBestemming + "\nVertrektijd: " + DatumVertrek + "\nAankomsttijd: " + DatumAankomst + "\nVluchtdatum: " + Vluchtduur();
        }
    }
```

#### Extra 1 (vluchtnummer automatisch verhogen)

### Klasse Program

```csharp
class Program
    {
        static void Main(string[] args)
        {
            Vlucht vlucht = new Vlucht();
            Vlucht vlucht1 = new Vlucht();

            Console.WriteLine(vlucht + "\n\n" + vlucht1);
        }
    }
```

### Klasse Vlucht

```csharp
class Vlucht
    {
        static private uint vluchtnummer = 1;
        public uint Vluchtnummer { get; private set; }
        public string PlaatsBestemming { get; set; }
        public string PlaatsVertrek { get; set; }
        public DateTime DatumVertrek { get; set; }
        public DateTime DatumAankomst { get; set; }

        public Vlucht(string vertrek, string bestemming, DateTime vertrekDatum, DateTime aankomstDatum)
        {
            Vluchtnummer = vluchtnummer++;
            PlaatsBestemming = bestemming;
            PlaatsVertrek = vertrek;
            DatumVertrek = vertrekDatum;
            DatumAankomst = aankomstDatum;
        }

        public Vlucht() :this("Brussel", "Dublin", new DateTime(2019, 5, 2, 14, 49, 20), new DateTime(2019, 5, 2, 16, 47, 30))
        {

        }

        public TimeSpan Vluchtduur()
        {
            return DatumAankomst - DatumVertrek;
        }

        public override string ToString()
        {
            return "Vluchtnummer: " + Vluchtnummer + "\nVertrekplaats: " + PlaatsVertrek + "\nBestemming: " + PlaatsBestemming + "\nVertrektijd: " + DatumVertrek + "\nAankomsttijd: " + DatumAankomst + "\nVluchtdatum: " + Vluchtduur();
        }
    }
```

#### Extra 2 (Bestemming beperkt tot Frankrijk, Engeland en Duitsland. Vertrek enkel uit België)

### Klasse Program

```csharp
class Program
    {
        static void Main(string[] args)
        {
            Vlucht vlucht = new Vlucht();
            Vlucht vlucht1 = new Vlucht(Bestemmingen.Engeland, new DateTime(2019,2,5,14,38,10), new DateTime(2019,2,5,15,54,29));

            Console.WriteLine(vlucht + "\n\n" + vlucht1);
        }
    }
```

### Klasse Vlucht

```csharp
enum Bestemmingen { Frankrijk, Engeland, Duitsland}
    class Vlucht
    {
        static private uint vluchtnummer = 1;
        private uint Vluchtnummer { get; set; }
        public Bestemmingen PlaatsBestemming { get; set; }
        public string PlaatsVertrek { get; set; }
        public DateTime DatumVertrek { get; set; }
        public DateTime DatumAankomst { get; set; }

        public Vlucht(Bestemmingen bestemming, DateTime vertrekDatum, DateTime aankomstDatum)
        {
            Vluchtnummer = vluchtnummer++;
            PlaatsBestemming = bestemming;
            PlaatsVertrek = "België";
            DatumVertrek = vertrekDatum;
            DatumAankomst = aankomstDatum;
        }

        public Vlucht() :this(Bestemmingen.Duitsland, new DateTime(2019, 5, 2, 14, 49, 20), new DateTime(2019, 5, 2, 16, 47, 30))
        {

        }

        public TimeSpan Vluchtduur()
        {
            return DatumAankomst - DatumVertrek;
        }

        public override string ToString()
        {
            return "Vluchtnummer: " + Vluchtnummer + "\nVertrekplaats: " + PlaatsVertrek + "\nBestemming: " + PlaatsBestemming + "\nVertrektijd: " + DatumVertrek + "\nAankomsttijd: " + DatumAankomst + "\nVluchtduur: " + Vluchtduur();
        }
    }
```

## Oefening 1.2

### Klasse Program

```csharp
class Program
    {
        static void Main(string[] args)
        {
            Persoon maxim = new Persoon("Janssens", "Maxim", new DateTime(2000, 8, 24), Geslacht.Man);

            Console.WriteLine(maxim);
        }
    }
```

### Klasse Persoon

```csharp
enum Geslacht { Vrouw, Man }
    class Persoon
    {
        public string Naam { get; set; }
        public string Voornaam { get; set; }
        public DateTime Geboortedatum { get; set; }
        public Geslacht Geslacht { get; set; }

        public Persoon(string naam, string voornaam, DateTime geboortedatum, Geslacht geslacht)
        {
            Naam = naam;
            Voornaam = voornaam;
            Geboortedatum = geboortedatum;
            Geslacht = geslacht;
        }
        public Persoon(string naam, string voornaam) : this(naam, voornaam, new DateTime(2000, 1, 1), Geslacht.Vrouw)
        {

        }

        public int Leeftijd()
        {
            DateTime vandaag = DateTime.Today;
            int leeftijd = vandaag.Year - Geboortedatum.Year;
            if (vandaag.DayOfYear < Geboortedatum.DayOfYear)
                leeftijd--;
            return leeftijd;
        }

        public override string ToString()
        {
            return Voornaam + " " + Naam + " is " + Leeftijd() + " jaar oud.";
        }
    }
```

#### Extra 1 (extra methode om leeftijd te berekenen aan de hand van een meegegeven datum)

### Klasse Program

```csharp
class Program
    {
        static void Main(string[] args)
        {
            Persoon maxim = new Persoon("Janssens", "Maxim", new DateTime(2000, 8, 24), Geslacht.Man);

            Console.WriteLine(maxim + " " + maxim.BerekenLeeftijd(DateTime.Today));
        }
    }
```

### Klasse Persoon

```csharp
enum Geslacht { Vrouw, Man}
    class Persoon
    {
        public string Naam { get; set; }
        public string Voornaam { get; set; }
        public DateTime Geboortedatum { get; set; }
        public Geslacht Geslacht { get; set; }


        public Persoon(string naam, string voornaam, DateTime geboortedatum, Geslacht geslacht)
        {
            Naam = naam;
            Voornaam = voornaam;
            Geboortedatum = geboortedatum;
            Geslacht = geslacht;
        }
        public Persoon(string naam, string voornaam) :this(naam, voornaam, new DateTime(2000,1,1), Geslacht.Vrouw)
        {

        }

        public int BerekenLeeftijd(DateTime datum)
        {
            int leeftijd = datum.Year - Geboortedatum.Year;
            if (datum.DayOfYear < Geboortedatum.DayOfYear)
                leeftijd--;
            return leeftijd;
        }
        public int BerekenLeeftijd()
        {
            return BerekenLeeftijd(DateTime.Today);
        }



        public override string ToString()
        {
            return Voornaam + " " + Naam + " is " + BerekenLeeftijd() + " jaar oud.";
        }
    }
```

## Oefening 1.3 (nog niet nagekeken)

### Klasse Program

```csharp
class Program
    {
        static void Main(string[] args)
        {
            Auto auto = new Auto();
            Console.WriteLine(auto + " Na 10 jaar heeft de auto " + auto.BerekenKilometers().ToString("N0") + " kilometers.");
        }
    }
```

### Klasse Auto

```csharp
internal class Auto
{
    private const uint KILOMETERS_PER_JAAR = 20000;
    public string Merk { get; set; }
    public string Type { get; set; }
    public string Nummerplaat { get; set; }
    public uint Kilometers { get; set; }

    public Auto(string merk, string type, string nummerplaat, uint kilometers)
    {
        Merk = merk;
        Type = type;
        Nummerplaat = nummerplaat;
        Kilometers = kilometers;
    }
    public Auto() : this("ONBEKEND", "ONBEKEND", "1-AAA-000", 0)
    {

    }

    public uint BerekenKilometers(uint jaren)
    {
        return Kilometers + jaren * KILOMETERS_PER_JAAR;
    }
    public uint BerekenKilometers()
    {
        return BerekenKilometers(10);
    }

    public override string ToString()
    {
        return "De auto met nummerplaat " + Nummerplaat + " heeft " + Kilometers + " kilometers.";
    }
}
```
