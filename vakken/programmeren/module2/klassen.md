# Klassen
## Oefening 1
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Geef voornaam: ");
            string voornaam = Console.ReadLine();
            Console.Write("Geef achternaam: ");
            string achternaam = Console.ReadLine();
            Console.Write("Geef geboortedatum: ");
            DateTime geboorteDatum = DateTime.Parse(Console.ReadLine());
            Persoon persoon = new Persoon(voornaam, achternaam, geboorteDatum);
            Console.WriteLine(persoon);
        }
    }
```
### Klasse Persoon
```csharp
class Persoon
    {
        private DateTime geboorteDatum;
        private DateTime minimumGeboorteDatum = new DateTime(1990,01,01);

        public string Voornaam { get; set; }
        public string Achternaam { get; set; }
        public DateTime GeboorteDatum
        {
            get { return geboorteDatum; }
            set {
                if (value >= minimumGeboorteDatum && value <= DateTime.Today)
                    geboorteDatum = value;
                else
                    geboorteDatum = DateTime.Today;
            }
        }
        public Persoon(string voornaam, string achternaam, DateTime geboorteDatum)
        {
            this.Voornaam = voornaam;
            this.Achternaam = achternaam;
            this.GeboorteDatum = geboorteDatum;
        }

        private int BerekenLeeftijd()
        {
            int jaren = DateTime.Today.Year - geboorteDatum.Year;
            DateTime verjaardag = new DateTime(DateTime.Today.Year, geboorteDatum.Month, geboorteDatum.Day);
            if (DateTime.Today <= verjaardag)
                jaren -= 1;
            return jaren;
        }
        public override string ToString()
        {
            string uitvoer = "Voornaam: " + Voornaam + "\nAchternaam: " + Achternaam + "\nLeeftijd: " + BerekenLeeftijd();
            return uitvoer;
        }

    }
```
