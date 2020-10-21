# Deel 1

## Oefening 1: Visitekaartje

```csharp
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Naam: ***");
            Console.WriteLine("Adres: ***");
            Console.WriteLine("Hobby: ***");
            Console.WriteLine("Waarom de opleiding IT volgen?: ***");
            Console.WriteLine("Waarom op AP?: ***");
        }
    }
```

## Oefening 2: Getallen

```csharp
class Program
    {
        static void Main(string[] args)
        {
            const short GEHEELGETAL1 = 2;
            const short GEHEELGETAL2 = 3;
            const double KOMMAGETAL1 = 2.5;
            const double KOMMAGETAL2 = 3.5;

            Console.WriteLine("2 & 3");

            Console.WriteLine(GEHEELGETAL1 + GEHEELGETAL2);
            Console.WriteLine(GEHEELGETAL1 - GEHEELGETAL2);
            Console.WriteLine(GEHEELGETAL1 * GEHEELGETAL2);
            Console.WriteLine(GEHEELGETAL1 / GEHEELGETAL2);
            Console.WriteLine(GEHEELGETAL1 % GEHEELGETAL2);

            Console.WriteLine("2.5 & 3.5");

            Console.WriteLine(KOMMAGETAL1 + KOMMAGETAL2);
            Console.WriteLine(KOMMAGETAL1 - KOMMAGETAL2);
            Console.WriteLine(KOMMAGETAL1 * KOMMAGETAL2);
            Console.WriteLine(KOMMAGETAL1 / KOMMAGETAL2);
            Console.WriteLine(KOMMAGETAL1 % KOMMAGETAL2);

            Console.WriteLine("2 & 3.5");

            Console.WriteLine(GEHEELGETAL1 + KOMMAGETAL2);
            Console.WriteLine(GEHEELGETAL1 - KOMMAGETAL2);
            Console.WriteLine(GEHEELGETAL1 * KOMMAGETAL2);
            Console.WriteLine(GEHEELGETAL1 / KOMMAGETAL2);
            Console.WriteLine(GEHEELGETAL1 % KOMMAGETAL2);

            Console.WriteLine("2.5 & 3");

            Console.WriteLine(KOMMAGETAL1 + GEHEELGETAL2);
            Console.WriteLine(KOMMAGETAL1 - GEHEELGETAL2);
            Console.WriteLine(KOMMAGETAL1 * GEHEELGETAL2);
            Console.WriteLine(KOMMAGETAL1 / GEHEELGETAL2);
            Console.WriteLine(KOMMAGETAL1 % GEHEELGETAL2);
        }
    }
```

## Oefening 3: Vierkant

```csharp
class Program
    {
        static void Main(string[] args)
        {
            const short AANTALZIJDEN = 4;

            Console.WriteLine("Lengte van de zijde van het vierkant:");
            double zijde = double.Parse(Console.ReadLine());

            Console.Write("Zijde: {0}", zijde);
            Console.Write("Omtrek: {0}", zijde * AANTALZIJDEN);
            Console.Write("Oppervlakte: {0}", zijde * zijde);
        }
    }
```

## Oefening 4: Balk

```csharp
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Lengte van de balk:");
            double lengte = double.Parse(Console.ReadLine());
            Console.WriteLine("Breedte van de balk:");
            double breedte = double.Parse(Console.ReadLine());
            Console.WriteLine("Hoogte van de balk:");
            double hoogte = double.Parse(Console.ReadLine());

            Console.Write("Lengte: {0}", lengte);
            Console.Write("Breedte: {0}", breedte);
            Console.Write("Hoogte: {0}", hoogte);
            Console.Write("Oppervlakte: {0}", lengte * breedte * 2 + lengte * hoogte * 2 + breedte * hoogte * 2);
            Console.Write("Inhoud: {0}", lengte * breedte * hoogte);
        }
    }
```

## Oefening 5: Bankrekening

```csharp
class Program
    {
        static void Main(string[] args)
        {
            const short DELENDOOR = 97;

            Console.WriteLine("Geef de eerste 3 getallen van uw bankrekeningnummer in aub.");
            string eerste3Getallenstring = Console.ReadLine();
            Console.WriteLine("Geef de volgende 7 getallen van uw bankrekeningnummer in aub.");
            string volgende7Getallenstring = Console.ReadLine();
            Console.WriteLine("Geef de laatste 2 getallen van uw bankrekeningnummer in aub.");
            short laatste2Getallen = short.Parse(Console.ReadLine());

            long eerste10Getallen = long.Parse(eerste3Getallenstring + volgende7Getallenstring);

            if (eerste10Getallen % DELENDOOR == laatste2Getallen)
            {
                Console.WriteLine("Dit is een correct rekeningnummer!");
            }
            else
            {
                Console.WriteLine("Dit is geen correct rekeningnummer!");
            }
        }
    }
```

## Oefening 6: Gemiddelde

```csharp
class Program
    {
        static void Main(string[] args)
        {
            const double aantalWaarden = 3;
            Console.WriteLine("Geef 3 getallen in zodat we het gemiddelde kunnen berekenen.");
            Console.WriteLine("Getal 1:");
            short getal1 = short.Parse(Console.ReadLine());
            Console.WriteLine("Getal 2:");
            short getal2 = short.Parse(Console.ReadLine());
            Console.WriteLine("Getal 3:");
            short getal3 = short.Parse(Console.ReadLine());

            double gemiddelde = (getal1 + getal2 + getal3) / aantalWaarden;
            //int niet double

            int afgerondGemiddelde = (int)Math.Round(gemiddelde);
            // afronden met Math.Round
            // casten met (int)

            Console.Write("Het gemiddelde: ");
            Console.WriteLine(gemiddelde);
        }
    }
```

## Oefening 7: Seconden

```csharp
class Program
    {
        static void Main(string[] args)
        {
            const short GRONDGETAL = 60;
            //int want je gaat nooit kommagetallen tegenkomen (we werken met rest (modulo)!)
            Console.WriteLine("Geef een aantal seconden in.");
            short totaalSeconden = short.Parse(Console.ReadLine());
            int uren = totaalSeconden / (GRONDGETAL * GRONDGETAL);
            int minuten = (totaalSeconden % (GRONDGETAL * GRONDGETAL)) / GRONDGETAL;
            int seconden = totaalSeconden % GRONDGETAL;
            Console.WriteLine("{0}:{1}:{2}", uren.ToString("D2"), minuten.ToString("D2"), seconden.ToString("D2"));
        }
    }
```

## Oefening 8: Munten

```csharp
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hoeveel muntstukken van 2 euro heeft u?");
            short munten2 = short.Parse(Console.ReadLine());
            Console.WriteLine("Hoeveel muntstukken van 1 euro heeft u?");
            short munten1 = short.Parse(Console.ReadLine());
            Console.WriteLine("Hoeveel muntstukken van 0.50 euro heeft u?");
            short munten050 = short.Parse(Console.ReadLine());
            Console.WriteLine("Hoeveel muntstukken van 0.20 euro heeft u?");
            short munten020 = short.Parse(Console.ReadLine());
            Console.WriteLine("Hoeveel muntstukken van 0.10 euro heeft u?");
            short munten010 = short.Parse(Console.ReadLine());
            Console.WriteLine("Hoeveel muntstukken van 0.05 euro heeft u?");
            short munten005 = short.Parse(Console.ReadLine());
            Console.WriteLine("Hoeveel muntstukken van 0.02 euro heeft u?");
            short munten002 = short.Parse(Console.ReadLine());
            Console.WriteLine("Hoeveel muntstukken van 0.01 euro heeft u?");
            short munten001 = short.Parse(Console.ReadLine());

            double totaal = /*500 * briefjes500 + 200 * briefjes200 + 100 * briefjes100 + 50 * briefjes50 + 20 * briefjes20 + 10 * briefjes10 + 5 * briefjes5
                +*/ 2 * munten2 + 1 * munten1 + 0.5 * munten050 + 0.2 * munten020 + 0.1 * munten010 + 0.05 * munten005 + 0.02 * munten002 + 0.01 * munten001;

            Console.WriteLine("Totaal: {0}", totaal.ToString("0.00"));
        }
    }
```

## Oefening 9: BTW

```csharp
class Program
    {
        static void Main(string[] args)
        {
            const double BTWPERCENTAGE = 0.21;

            Console.WriteLine("BTW berekenen!");

            Console.WriteLine("Geef het bedrag in waarvan u de BTW wil berekenen:");
            double bedrag = double.Parse(Console.ReadLine());

            double btw = Math.Round(bedrag * BTWPERCENTAGE, 2);
            double bedragMetBtw = bedrag + btw;

            Console.WriteLine("BTW: {0} euro", btw);
            Console.WriteLine("Bedrag incl. BTW: {0} euro", bedragMetBtw);
        }
    }
```

## Oefening 10: Mosselfestijn

```csharp
class Program
    {
        static void Main(string[] args)
        {
            const double MOSSELPRIJS = 20;
            const double KONINGINNENPRIJS = 10;
            const double IJSPRIJS = 3;
            const double DRANKPRIJS = 2;
            //eigenlijk int maar prijzen kunnen naar double veranderen
            Console.WriteLine("Welkom op het Mosselfestijn!");
            Console.WriteLine("Voor hoeveel personen wilt u mosselen met frietjes (20EUR/stuk) bestellen?");
            short aantalMosselen = short.Parse(Console.ReadLine());
            Console.WriteLine("Voor hoeveel kinderen wilt u een koninginnehapje met frietjes (10EUR/stuk) bestellen?");
            short aantalKoninginnehapjes = short.Parse(Console.ReadLine());
            Console.WriteLine("Voor hoeveel personen wilt u een ijsje als nagerecht (3EUR/stuk) bestellen?");
            short aantalIjsjes = short.Parse(Console.ReadLine());
            Console.WriteLine("Hoeveel drankjes (2EUR/stuk) wilt u bestellen?");
            short aantalDrankjes = short.Parse(Console.ReadLine());

            double totaal = MOSSELPRIJS * aantalMosselen + KONINGINNENPRIJS * aantalKoninginnehapjes + IJSPRIJS * aantalIjsjes + DRANKPRIJS * aantalDrankjes;

            Console.WriteLine("Het totaal te betalen bedrag is {0}EUR", totaal.ToString("0.00"));
        }
    }
```

## Oefening 11: Stripwinkel

```csharp
class Program
    {
        static void Main(string[] args)
        {

            Console.ForegroundColor = ConsoleColor.White;
            Console.BackgroundColor = ConsoleColor.Gray;//
            Console.Clear();//

            const double BTWTARIEF = 0.06;
            const double STRIPPRIJS = 5.00;

            Console.Write("Wat is je naam?:");
            string naam = Console.ReadLine();
            Console.Write("Geef het aantal strips in:");
            short aantalStrips = short.Parse(Console.ReadLine());
            Console.ForegroundColor = ConsoleColor.Yellow;
            Console.WriteLine("##############################\n");

            Console.ForegroundColor = ConsoleColor.Blue;
            Console.WriteLine("U wordt geholpen door {0}\n", naam);

            Console.WriteLine("Eenheidsprijs exclusief BTW = 5 EUR");
            Console.WriteLine("Aantal = {0}\n", aantalStrips);

            double bedragExclBtw = aantalStrips * STRIPPRIJS;

            Console.WriteLine("Subtotaal exclusief BTW = {0} EUR\n", bedragExclBtw);

            double btw = bedragExclBtw * BTWTARIEF;

            Console.WriteLine("BTW-tarief = 6 %");
            Console.WriteLine("BTW-bedrag = {0} EUR\n", btw.ToString("0.00"));

            double bedragInclBtw = bedragExclBtw + btw;
            Console.ForegroundColor = ConsoleColor.Red;
            Console.WriteLine("Totaal inclusief BTW = {0} EUR\n", bedragInclBtw.ToString("0.00"));

            Console.ForegroundColor = ConsoleColor.White;
        }
    }
```
