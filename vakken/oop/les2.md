# Les 2
## Oefening 2.1
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Vlucht vlucht1 = new Vlucht();
            Vlucht vlucht2 = new Vlucht(Bestemmingen.Engeland, new DateTime(2019, 2, 5, 14, 38, 10), new DateTime(2019, 2, 5, 15, 54, 29));
            Persoon passagier1 = new Persoon("Janssens", "Maxim", new DateTime(2000, 8, 24), Geslacht.Man, vlucht1);
            Persoon passagier2 = new Persoon("Janssens", "Maxim", new DateTime(2000, 8, 24), Geslacht.Man);

            Console.WriteLine("Passagier 1: {0}\n\nPassagier 2: {1}", passagier1, passagier2);
        }
    }
```
### Klasse Vlucht
```csharp
enum Bestemmingen { Frankrijk, Engeland, Duitsland }
    class Vlucht
    {
        static private int vluchtnummer = 1;
        private int Vluchtnummer { get; set; }
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

        public Vlucht() : this(Bestemmingen.Duitsland, new DateTime(2019, 5, 2, 14, 49, 20), new DateTime(2019, 5, 2, 16, 47, 30))
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
### Klasse Persoon
```csharp
enum Geslacht { Man, Vrouw};
    class Persoon
    {
        public string Naam { get; set; }
        public string Voornaam { get; set; }
        public DateTime Geboortedatum { get; set; }
        public Geslacht Geslacht { get; set; }
        public Vlucht Vlucht { get; set; }


        public Persoon(string naam, string voornaam, DateTime geboortedatum, Geslacht geslacht, Vlucht vlucht)
        {
            Naam = naam;
            Voornaam = voornaam;
            Geboortedatum = geboortedatum;
            Geslacht = geslacht;
            Vlucht = vlucht;
        }
        public Persoon(string naam, string voornaam, DateTime geboortedatum, Geslacht geslacht) : this(naam, voornaam, new DateTime(2000, 1, 1), Geslacht.Vrouw, null)
        {

        }

        public int BerekenLeeftijd(DateTime datum)
        {
            int leeftijd = DateTime.Now.Year - Geboortedatum.Year;
            if (datum < new DateTime(datum.Year, Geboortedatum.Month, Geboortedatum.Day))
                leeftijd--;
            return leeftijd;
        }
        public int BerekenLeeftijd()
        {
            return BerekenLeeftijd(DateTime.Today);
        }



        public override string ToString()
        {
            if(Vlucht != null)
            return Voornaam + " " + Naam + " is " + BerekenLeeftijd() + " jaar oud. \nVluchtinformatie: " + Vlucht;
            return "Geen vluchtinformatie meegegeven.";
        }
    }
```
