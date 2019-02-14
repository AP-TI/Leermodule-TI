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
## Oefening 2.2
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Persoon eigenaar1 = new Persoon("Janssens", "Maxim", new DateTime(2000, 8, 24), Geslacht.Man);
            Auto auto1 = new Auto("Tesla", "Model X", "mixxamm", 0, eigenaar1);
            Auto auto2 = new Auto();

            Console.WriteLine("{0}\n\n{1}", auto1, auto2);
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
            return Voornaam + " " + Naam + " is " + BerekenLeeftijd() + " jaar oud.";
        }
    }
```
### Klasse Auto
```csharp
internal class Auto
    {
        private const int KILOMETERS_PER_JAAR = 20000;
        public string Merk { get; set; }
        public string Type { get; set; }
        public string Nummerplaat { get; set; }
        public int Kilometers { get; set; }
        public Persoon Eigenaar { get; set; }

        public Auto(string merk, string type, string nummerplaat, int kilometers, Persoon eigenaar)
        {
            Merk = merk;
            Type = type;
            Nummerplaat = nummerplaat;
            Kilometers = kilometers;
            Eigenaar = eigenaar;
        }
        public Auto(string merk, string type, string nummerplaat, int kilometers) : this(merk, type, nummerplaat, kilometers, null)
        {

        }
        public Auto() : this("ONBEKEND", "ONBEKEND", "1-AAA-000", 0, null)
        {

        }

        public int BerekenKilometers(int jaren)
        {
            return Kilometers + jaren * KILOMETERS_PER_JAAR;
        }
        public int BerekenKilometers()
        {
            return BerekenKilometers(10);
        }

        public override string ToString()
        {
            if(Eigenaar != null)
            return $"De auto met nummerplaat {Nummerplaat} heeft {Kilometers} kilometers. De gegevens van de eigenaar zijn:\n{Eigenaar}";
            return "De auto heeft geen eigenaar.";

            //Onderstaande is ook een optie die exact hetzelfde doet, maar vaak is het logischer om te checken op goede flow.
            //Uiteraard kan je zelf kiezen hoe je hiermee omgaat

            //if (Eigenaar == null)
            //return "De auto heeft geen eigenaar.";
            //return $"De auto met nummerplaat {Nummerplaat} heeft {Kilometers} kilometers. De gegevens van de eigenaar zijn:\n{Eigenaar}";
        }
    }
```
## Oefening 2.3
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Persoon eigenaar1 = new Persoon("Janssens", "Maxim", new DateTime(2000, 8, 24), Geslacht.Man);
            Auto auto1 = new Auto("Tesla", "Model X", "mixxamm", 20);
            Auto auto2 = new Auto();
            eigenaar1.AutoToevoegen(auto1);
            eigenaar1.AutoToevoegen(auto2);

            Console.WriteLine(eigenaar1);
        }
    }
```
### Klasse auto
```csharp
internal class Auto
    {
        private const int KILOMETERS_PER_JAAR = 20000;
        public string Merk { get; set; }
        public string Type { get; set; }
        public string Nummerplaat { get; set; }
        public int Kilometers { get; set; }

        public Auto(string merk, string type, string nummerplaat, int kilometers)
        {
            Merk = merk;
            Type = type;
            Nummerplaat = nummerplaat;
            Kilometers = kilometers;
        }
        public Auto() : this("ONBEKEND", "ONBEKEND", "1-AAA-000", 0)
        {

        }

        public int BerekenKilometers(int jaren)
        {
            return Kilometers + jaren * KILOMETERS_PER_JAAR;
        }
        public int BerekenKilometers()
        {
            return BerekenKilometers(10);
        }

        public override string ToString()
        {
            return $"De auto met nummerplaat {Nummerplaat} heeft {Kilometers} kilometers.";
        }
    }
```
### Klasse Persoon
```csharp
enum Geslacht { Man, Vrouw};
    class Persoon
    {
        List<Auto> autoLijst = new List<Auto>();
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

        public bool AutoToevoegen(Auto auto)
        {
            if(auto != null)
            {
                autoLijst.Add(auto);
                return true;
            }
            return false;


        }
        public bool AutoVerwijderen(Auto auto)
        {
            if(auto != null)
            {
                autoLijst.Remove(auto);
                return true;
            }
            return false;
        }

        public string AutoLijst(List<Auto> autoLijst)
        {
            string autoLijstString = "";
            foreach(Auto auto in autoLijst)
            {
                autoLijstString += auto + "\n\n";
            }
            return autoLijstString;
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
            return $"{Voornaam} {Naam} is {BerekenLeeftijd()} jaar oud. En heeft de volgende auto's: \n\n{AutoLijst(autoLijst)}";
        }
    }
```
## Oefening 2.4
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Persoon passagier1 = new Persoon("Janssens", "Maxim", new DateTime(2000, 8, 24), Geslacht.Man);
            Vlucht vlucht1 = new Vlucht(Bestemmingen.Duitsland, new DateTime(2019, 2, 13, 15, 17, 28), new DateTime(2019, 2, 13, 16, 54, 21));

            vlucht1.PassagierToevoegen(passagier1);

            Console.WriteLine(vlucht1);
            Console.Write("Type de achternaam van een passagier om info te krijgen: ");
            Console.WriteLine(vlucht1.PassagierOpzoeken(Console.ReadLine()));           
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
            return Voornaam + " " + Naam + " is " + BerekenLeeftijd() + " jaar oud.";
        }
    }
```
### Klasse Vlucht
```csharp
internal enum Bestemmingen { Frankrijk, Engeland, Duitsland }

    internal class Vlucht
    {
        private static int vluchtnummer = 1;
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

        private List<Persoon> passagierLijst = new List<Persoon>();
        public bool PassagierToevoegen(Persoon passagier)
        {
            if (passagier != null)
            {
                passagierLijst.Add(passagier);
                return true;
            }
            return false;
        }
        public bool PassagierVerwijderen(Persoon passagier)
        {
            if (passagier != null)
            {
                passagierLijst.Remove(passagier);
                return true;
            }
            return false;
        }
        public Persoon PassagierOpzoeken(string naam)
        {
            foreach (Persoon passagier in passagierLijst)
            {
                if (passagier.Naam == naam)
                    return passagier;
            }
            return null;
        }
        public int BerekenPassagierAantal()
        {
            int result = 0;
            foreach (Persoon passagier in passagierLijst)
            {
                result++;
            }
            return result;
        }

        public override string ToString()
        {
            return "Vluchtnummer: " + Vluchtnummer + "\nVertrekplaats: " + PlaatsVertrek + "\nBestemming: " + PlaatsBestemming + "\nVertrektijd: " + DatumVertrek + "\nAankomsttijd: " + DatumAankomst + "\nVluchtduur: " + Vluchtduur() + /*Vanaf hier gebruik ik het dollar-teken om variabeles binnen de string te kunnen gebruiken*/$"\n\nAantal passagiers: {BerekenPassagierAantal()}";
        }
    }
```
## Oefening 2.5 (nog niet nagekeken)
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Dictionary<string, string> afkortingen = new Dictionary<string, string>();

            afkortingen.Add("BTW", "Belasting Over Toegevoegde waarde");

            Console.Write("Geef de key van een afkorting die je wilt opzoeken: ");
            if (afkortingen.TryGetValue(Console.ReadLine(), out string result))
            {
                Console.WriteLine("De waarde die bij de key hoort is: {0}", result);
            }
            else
            {
                Console.WriteLine("Er is geen waarde gevonden voor de key");
            }
        }
    }
```
## Oefening 2.6 (nog niet nagekeken)
### Klasse Program
```csharp
internal class Program
    {
        private static void Main(string[] args)
        {
            Persoon passagier1 = new Persoon("Janssens", "Maxim", new DateTime(2000, 8, 24), Geslacht.Man);
            Vlucht vlucht1 = new Vlucht(Bestemmingen.Duitsland, new DateTime(2019, 2, 13, 15, 17, 28), new DateTime(2019, 2, 13, 16, 54, 21));

            vlucht1.PassagierToevoegen(passagier1);

            Console.Write("Geef een vluchtnummer: ");
            Console.WriteLine(Vlucht.VluchtInfo(int.Parse(Console.ReadLine())));
        }
    }
```
### Klasse Persoon
```csharp
internal enum Geslacht { Vrouw, Man }

    internal class Persoon
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
            return Voornaam + " " + Naam + " is " + BerekenLeeftijd() + " jaar oud.";
        }
    }
```
### Klasse Vlucht
```csharp
internal enum Bestemmingen { Frankrijk, Engeland, Duitsland }

    internal class Vlucht
    {
        private static int vluchtnummer = 1;
        private int Vluchtnummer { get; set; }
        public Bestemmingen PlaatsBestemming { get; set; }
        public string PlaatsVertrek { get; set; }
        public DateTime DatumVertrek { get; set; }
        public DateTime DatumAankomst { get; set; }
        private static Dictionary<int, Vlucht> vluchtDictionary = new Dictionary<int, Vlucht>();

        public Vlucht(Bestemmingen bestemming, DateTime vertrekDatum, DateTime aankomstDatum)
        {
            Vluchtnummer = vluchtnummer++;
            PlaatsBestemming = bestemming;
            PlaatsVertrek = "België";
            DatumVertrek = vertrekDatum;
            DatumAankomst = aankomstDatum;
            vluchtDictionary.Add(Vluchtnummer, this);
        }

        public Vlucht() : this(Bestemmingen.Duitsland, new DateTime(2019, 5, 2, 14, 49, 20), new DateTime(2019, 5, 2, 16, 47, 30))
        {

        }

        public TimeSpan Vluchtduur()
        {
            return DatumAankomst - DatumVertrek;
        }

        private List<Persoon> passagierLijst = new List<Persoon>();
        public bool PassagierToevoegen(Persoon passagier)
        {
            if (passagier != null)
            {
                passagierLijst.Add(passagier);
                return true;
            }
            return false;
        }
        public bool PassagierVerwijderen(Persoon passagier)
        {
            if (passagier != null)
            {
                passagierLijst.Remove(passagier);
                return true;
            }
            return false;
        }
        public Persoon PassagierOpzoeken(string naam)
        {
            foreach (Persoon passagier in passagierLijst)
            {
                if (passagier.Naam == naam)
                    return passagier;
            }
            return null;
        }
        public int BerekenPassagierAantal()
        {
            int result = 0;
            foreach (Persoon passagier in passagierLijst)
            {
                result++;
            }
            return result;
        }
        public static string VluchtInfo(int vluchtNummer)
        {
            if (vluchtDictionary.ContainsKey(vluchtNummer))
                return $"De vluchtinformatie is: {vluchtDictionary[vluchtNummer]}";
                return "Geen vluchtinformatie gevonden.";
        }

        public override string ToString()
        {
            return "Vluchtnummer: " + Vluchtnummer + "\nVertrekplaats: " + PlaatsVertrek + "\nBestemming: " + PlaatsBestemming + "\nVertrektijd: " + DatumVertrek + "\nAankomsttijd: " + DatumAankomst + "\nVluchtduur: " + Vluchtduur() + /*Vanaf hier gebruik ik het dollar-teken om variabeles binnen de string te kunnen gebruiken*/$"\n\nAantal passagiers: {BerekenPassagierAantal()}";
        }
    }
```
## Oefening 2.7
```csharp
internal class Program
    {
        private static void Main(string[] args)
        {
            Stack<char> karakterLijst = new Stack<char>();

            bool goOn = true;

            while (goOn)
            {
                Console.Write("Geef een karakter: ");
                char input = char.Parse(Console.ReadLine());
                if (input != 'Z')
                    karakterLijst.Push(input);
                else
                {
                    if (karakterLijst.Count == 2)
                        goOn = false;
                    karakterLijst.Pop();
                    Console.WriteLine(karakterLijst.Peek());
                }
            }
        }
    }
```
