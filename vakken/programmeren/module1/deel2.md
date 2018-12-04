# Deel 2
## Oefening 1: Aantal dagen
```csharp
class Program
    {
        static void Main(string[] args)
        {
            DateTime vandaag = DateTime.Today;
            DateTime eindeVanHetJaar = new DateTime(vandaag.Year, 12, 31);
            int aantalDagenDitJaar = (eindeVanHetJaar - vandaag).Days;
            Console.WriteLine(vandaag);
            Console.WriteLine(eindeVanHetJaar);
            Console.WriteLine("Aantal dagen tot het einde van het jaar: {0}", aantalDagenDitJaar);
            Console.WriteLine("Datum van vandaag in de verschillende formaten");
            Console.WriteLine("Korte datum zonder tijd: {0}",vandaag.ToShortDateString());
            Console.WriteLine("Lange datum zonder tijd: {0}",vandaag.ToLongDateString());
            Console.WriteLine("Lange datum met korte tijd: {0} {1}",vandaag.ToLongDateString(), vandaag.ToShortTimeString());
            Console.WriteLine("Korte datum met korte tijd: {0} {1}",vandaag.ToShortDateString(), vandaag.ToShortTimeString());
        }
    }
```
## Oefening 2: Firmaconferentie
```csharp
class Program
    {
        static void Main(string[] args)
        {
            const short UUR = 14;
            const short UURVERSCHIL = -5;

            DateTime conferentieDatumLocatie = DateTime.Today.AddHours(UUR + UURVERSCHIL); //

            Console.WriteLine("Conferentie in Londen op {0}, om {1} uur.", DateTime.Today.ToShortDateString(), UUR);
            Console.WriteLine("New York heeft een tijdsverschil van {0} uren.", UURVERSCHIL);
            Console.WriteLine("De conferentie in New York zal doorgaan op {0}.", conferentieDatumLocatie);
            //aanpassen
        }
    }
```
## Oefening 3: Invoer bij oefening 2
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Waar gaat de conferentie door?");
            string conferentieLocatie = Console.ReadLine();

            Console.WriteLine("Wanneer gaat de conferentie door? Voer de datum op volgende manier in: dag/maand/jaar uur:minuut:seconde");
            DateTime conferentieDatumHuidig = DateTime.Parse(Console.ReadLine());

            Console.WriteLine("Wat is het tijdsverschil? Voer een aantal uur in op volgende manier: uur:minuut:seconde");
            TimeSpan tijdsverschil = TimeSpan.Parse(Console.ReadLine());

            DateTime conferentieDatumLocatie = conferentieDatumHuidig + tijdsverschil;

            Console.WriteLine("Conferentie in Londen op {0}", conferentieDatumHuidig);
            Console.WriteLine("{0} heeft een tijdsverschil van {1} uren", conferentieLocatie, tijdsverschil);
            Console.WriteLine("De conferentie in {0} zal doorgaan op {1}.", conferentieLocatie, conferentieDatumLocatie);
        }
    }
```
## Oefening 4: Interest
```csharp
class Program
    {
        static void Main(string[] args)
        {
            const double JAARLIJKS_INTEREST_PERCENTAGE = 0.0175;
            const short DAGEN_IN_EEN_JAAR = 365;
            
            DateTime vandaag = DateTime.Today;
            DateTime eindeVanHetJaar = new DateTime(vandaag.Year, 12, 31);

            Console.WriteLine("Wat is het bedrag dat u wilt storten?");
            double gestortBedrag = double.Parse(Console.ReadLine());

            double berekendInterestBedrag = gestortBedrag * JAARLIJKS_INTEREST_PERCENTAGE;
            double berekendJaarBedrag = berekendInterestBedrag * (eindeVanHetJaar - vandaag).Days / DAGEN_IN_EEN_JAAR + gestortBedrag;
            
            Console.WriteLine("Dit bedrag zal u tegen 31 december {0} euro interest opbrengen met een totaal van {1} euro.", berekendInterestBedrag, berekendJaarBedrag);
        }
    }
```
## Oefening 5: Stelsels
```csharp
class Program
    {
        static void Main(string[] args)
        {
            const short GRONDWAARDE = 8;

            Console.WriteLine("Geef een positief geheel decimaal getal van 3 cijfers in.");
            short ingelezenGetal = short.Parse(Console.ReadLine());

            int waarde1 = ingelezenGetal / GRONDWAARDE;
            int rest1 = ingelezenGetal % GRONDWAARDE;

            int waarde2 = waarde1 / GRONDWAARDE;
            int rest2 = waarde1 % GRONDWAARDE;

            int waarde3 = waarde2 / GRONDWAARDE;
            int rest3 = waarde2 % GRONDWAARDE;

            string octaal = waarde3.ToString() + rest3.ToString() + rest2.ToString() + rest1.ToString();

            Console.WriteLine(octaal); //1 waarde ipv 4 : method-returnwaarde
        }
    }
```
## Oefening 6: Verjaardagen
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Voer uw geboortedatum in. Vb: 08-04-2000");
            DateTime geboorteDatum = DateTime.Parse(Console.ReadLine());
            DateTime vandaag = DateTime.Today;
            DateTime verjaardag = new DateTime(vandaag.Year, geboorteDatum.Month, geboorteDatum.Day);
            if (verjaardag < vandaag)
            {
                verjaardag.AddYears(1);
            }            
            Console.WriteLine("U verjaart binnen { 0} dagen.", (verjaardag - vandaag).Days);
        }
    }
```
## Oefening 7: Geleefde dagen
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Wat is je geboortedatum?:");
            DateTime geboorteDatum = DateTime.Parse(Console.ReadLine());
            DateTime vandaag = DateTime.Today;
            Console.WriteLine("U leeft al {0} dagen.", (vandaag-geboorteDatum).Days);
        }
    }
```
