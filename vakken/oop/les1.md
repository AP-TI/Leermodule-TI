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
        public int Vluchtnummer { get; set; }
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
#### Extra 1
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
        static private int vluchtnummer = 1;
        public int Vluchtnummer { get; set; }
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
