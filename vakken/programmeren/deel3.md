# Deel 3
## Oefening 1: Telefoonnummer
```
class Program
    {
        static Random random = new Random();
        static void Main(string[] args)
        {
            string telefoonNummer;
            telefoonNummer = random.Next(8).ToString("D1") + random.Next(8).ToString("D1") + random.Next(8).ToString("D1") + "-" + random.Next(743).ToString("D3") + "-" + random.Next(10000).ToString("D4");
            Console.WriteLine(telefoonNummer);
            // 1 waarde: method-returnwaarde!
        }
    }
```
## Oefening 2: Random datum
```
class Program
    {
        static Random random = new Random();
        static void Main(string[] args)
        {
            const short AANTAL_MAANDEN = 12;

            int jaar = DateTime.Today.Year + 1;
            int maand = random.Next(1, AANTAL_MAANDEN + 1);
            int dag = random.Next(1, DateTime.DaysInMonth(jaar, maand) + 1);

            DateTime randomDatum = new DateTime(jaar,maand,dag);

            Console.WriteLine(randomDatum.ToShortDateString());
        }
    }
```
## Oefening 3: Bibliotheek
```
class Program
    {
        static void Main(string[] args)
        {
            const short UITLEEN_TERMIJN = 14;
           
            DateTime vandaag = DateTime.Today;

            Console.Write("Wat is uw naam? ");
            string naam = Console.ReadLine();

            Console.WriteLine("Het boek is uitgeleed op {0} en is gereserveerd door {1} tot {2}", vandaag.ToShortDateString(), naam, vandaag.AddDays(UITLEEN_TERMIJN).ToShortDateString());   
        }
    }
```
## Oefening 4: Hotelklokken
```
class Program
    {
        static Random random = new Random();
        static void Main(string[] args)
        {
            const short AANTAL_UUR = 24;
            const short AANTAL_MINUTEN_EN_SECONDEN = 60;

            const short TIJDVERSCHIL_NEW_YORK = -5;
            const short TIJDVERSCHIL_TOKYO = +9;
            const short TIJDVERSCHIL_HONG_KONG = +8;

            DateTime vandaag = DateTime.Today;
            DateTime randomTijd = vandaag + new TimeSpan(random.Next(0, AANTAL_UUR), random.Next(0, AANTAL_MINUTEN_EN_SECONDEN), random.Next(0,AANTAL_MINUTEN_EN_SECONDEN));
                              // "vandaag +" om er een datum van te maken zodat we de tijd op 4 verschillende manieren kunnen afdrukken
            //TimeSpan tijd_New_York = new TimeSpan(randomTijd.Hours + TIJDVERSCHIL_NEW_YORK, randomTijd.Minutes, randomTijd.Seconds); te lang...
            DateTime tijd_New_York = randomTijd + new TimeSpan(TIJDVERSCHIL_NEW_YORK, 0, 0);
            DateTime tijd_Tokyo = randomTijd + new TimeSpan(TIJDVERSCHIL_TOKYO, 0, 0);
            DateTime tijd_Hong_Kong = randomTijd + new TimeSpan(TIJDVERSCHIL_HONG_KONG, 0, 0);

            Console.WriteLine("{0} {1}", randomTijd.ToShortDateString(), randomTijd.ToShortTimeString());
            Console.WriteLine("{0} {1}",tijd_New_York.ToLongDateString(), tijd_New_York.ToLongTimeString());
            Console.WriteLine("{0} {1}", tijd_Tokyo.ToLongDateString(), tijd_Tokyo.ToShortTimeString());
            Console.WriteLine("{0} {1}", tijd_Hong_Kong.ToShortDateString(), tijd_Hong_Kong.ToLongTimeString());
        }
    }
```
## Oefening 5: Schaakspel
```
class Program
    {
        enum Kleur { Witte, zwarte }
        enum SpeelStuk { pion, toren, loper, king, queen, paard }
        static Random random = new Random();
        static void Main(string[] args)
        {
            const short AANTAL_STUKKEN = 3;

            for (int x = 0; x < AANTAL_STUKKEN; x++)
            {
                string stuk = ((Kleur)random.Next(2)).ToString() + " " + ((SpeelStuk)random.Next(6)).ToString();
                Console.WriteLine("stuk {0}: {1}", x+1, stuk);
            }
        }
    }
```
