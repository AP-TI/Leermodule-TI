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
## Oefening 2
### Klasse Program
```csharp
class Program
    {
        static Random random = new Random();
        static void Main(string[] args)
        {
            Kaart kaart = new Kaart();
            Kaart[] kaarten = new Kaart[5];
            kaarten = kaart.BepaalRandomKaarten();
            for (int teller = 0; teller < 5; teller++)
                Console.WriteLine(kaarten[teller]);

            //Methode BepaalVolgendeKaart testen
            Kaart kaart1 = new Kaart(Waarden.Koning, Soorten.Ruiten);
            Console.WriteLine("****************************************");
            Console.WriteLine(kaart1);
            Console.WriteLine(kaart1.BepaalVolgendeKaart());
        }
    }
```
### Klasse Speelkaarten
```csharp
enum Waarden { Aas, Twee, Drie, Vier, Vijf, Zes, Zeven, Acht, Negen, Tien, Boerin, Dame, Koning};
    enum Soorten { Schoppen, Klaveren, Ruiten, Harten };
    class Kaart
    {
        static Random random = new Random();
        private Waarden waarde;
        const int AANTAL_WAARDEN = 5;

        private Waarden Waarde
        {
            get { return waarde; }
            set
            {
                if (value <= Waarden.Koning && value >= Waarden.Aas)
                    waarde = value;
                else
                    waarde = Waarden.Aas;
            }
        }

        private Soorten soort;

        private Soorten Soort
        {
            get { return soort; }
            set
            {
                if (value <= Soorten.Harten && value >= Soorten.Schoppen)
                    soort = value;
                else
                    soort = Soorten.Schoppen;
            }
        }


        public Kaart(Waarden waarde, Soorten soort)
        {
            Waarde = waarde;
            Soort = soort;
        }
        public Kaart() : this((Waarden)random.Next(0, 13), (Soorten)random.Next(0, 4))
        {
        }


        public Kaart BepaalVolgendeKaart()
        {
            Waarden waarde = (Waarden)(((int)Waarde + 1) % 13);
            Soorten soort = this.Soort;

            if (Waarde == Waarden.Aas)
            {
                soort = (Soorten)(((int)Soort + 1) % 4);
            }


            Kaart kaart = new Kaart(waarde, soort);
            return kaart;
        }

        public Kaart[] BepaalRandomKaarten()
        {
            Kaart[] kaarten = new Kaart[AANTAL_WAARDEN];
            for(int teller = 0; teller < AANTAL_WAARDEN; teller++)
            {
                kaarten[teller] = new Kaart();
            }
            return kaarten;
        }

        public override string ToString()
        {
            return "Waarde = " + Waarde + "\nSoort = " + Soort;
        }
    }
```
## Oefening 3
### Klasse Program
```csharp
class Program
    {
        public static void Main(string[] args)
        {
            const int AANTAL_KEREN_GOOIEN = 1000;
            PaarDobbelstenen paarDobbelstenen = new PaarDobbelstenen();
            Console.WriteLine(paarDobbelstenen.KerenDubbelZes(AANTAL_KEREN_GOOIEN));
        }
    }
```
### Klasse Dobbelsteen
```csharp
public class Dobbelsteen
    {
        static Random random = new Random();

        private int waarde;

        public int Waarde
        {
            get { return waarde; }
            set {
                    if (value <= 6 && value > 0)
                        waarde = value;
                    else
                        waarde = 1;
                }
        }

        public Dobbelsteen(int waarde)
        {
            Waarde = waarde;
        }

        public Dobbelsteen() : this(random.Next(1, 7))
        {

        }

        public bool IsZes()
        {
            return Waarde == 6;
        }

        public int Gooi()
        {
            Waarde = random.Next(1, 7);
            return Waarde;
        }

        public override string ToString()
        {
            return "Waarde: " + Waarde;
        }
    }
```
### Klasse PaarDobbelstenen
```csharp
public class PaarDobbelstenen
    {
        public Dobbelsteen Dobbelsteen1 { get; set; }
        public Dobbelsteen Dobbelsteen2 { get; set; }

        public PaarDobbelstenen(Dobbelsteen dobbelsteen1, Dobbelsteen dobbelsteen2)
        {
            Dobbelsteen1 = dobbelsteen1;
            Dobbelsteen2 = dobbelsteen2;
        }

        public PaarDobbelstenen() : this(new Dobbelsteen(), new Dobbelsteen())
        {

        }

        public bool DubbelZes()
        {
            return Dobbelsteen1.IsZes() && Dobbelsteen2.IsZes();
        }

        public void Gooien()
        {
            Dobbelsteen1.Gooi();
            Dobbelsteen2.Gooi();
        }

        public int KerenDubbelZes(int aantalKeer)
        {
            int aantalKerenZes = 0;
            for(int teller = 0; teller < aantalKeer; teller++)
            {
                this.Gooien();
                if (DubbelZes())
                    aantalKerenZes++;
            }
            return aantalKerenZes;

        }

        public override string ToString()
        {
            return "Dobbelsteen1: " + Dobbelsteen1.Waarde + "\nDobbelsteen2: " + Dobbelsteen2.Waarde;
        }
    }
```
