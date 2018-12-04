# Deel 4
## Oefening 1: Getaltoestand
```
class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Voer een getal in: ");
            int invoerGetal = int.Parse(Console.ReadLine());
            string toestand;

            if (invoerGetal < 0)
            {
                toestand = "negatief";
            }
            else if (invoerGetal > 0)
            {
                toestand = "positief";
            }
            else
            {
                toestand = "0";
            }
            Console.WriteLine("Het getal is {0}", toestand);
        }
    }
```

## Oefening 2: Deelbaar door 2 
```
class Program
    {
        static void Main(string[] args)
        {
            string toestand = "deelbaar door ";
            Console.WriteLine("Voer een getal in: ");
            int invoerGetal = int.Parse(Console.ReadLine());
            
            if (invoerGetal % 8 == 0)
            {
                toestand += "8, 4 en 2";
            }
            else if (invoerGetal % 4 == 0)
            {
                toestand += "4 en 2";
            }
            else if (invoerGetal % 2 == 0)
            {
                toestand += "2";
            }
            else
            {
                toestand = "niet deelbaar door 2, 4 of 8";
            }
            Console.WriteLine("Het getal is {0}.", toestand);
        }
    }
```

## Oefening 3: Karakter inlezen
```
class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Voer een karakter in: ");
            char karakter = char.Parse(Console.ReadLine());
            string soortKarakter ="";

            if (char.IsNumber(karakter))
            {
                soortKarakter = "cijfer";
            }
            else if (char.IsUpper(karakter))
            {
                soortKarakter = "hoofdletter";
            }
            else if (char.IsLower(karakter))
            {
                soortKarakter = "kleine letter";
            }
            else if (karakter == '*' || karakter == '/' || karakter == '+' || karakter == '-' || karakter == '%')
            {
                soortKarakter = "operand";
            }
            else
            {
                soortKarakter = "ander karakter";
            }

            Console.WriteLine("Het karakter {0} is een {1}", karakter, soortKarakter);
        }
    }
```

## Oefening 4: Getal 1-2-3-4 cijfers
```
class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Voer een getal van 1 t/m 4 cijfers in: ");
            const int DELER = 10;
            const int END = 0;
            int getal = int.Parse(Console.ReadLine());
            int rest = 0;
            int aantalCijfers = 0;
            do
            {
                rest = getal % DELER;
                getal = getal / DELER;
                aantalCijfers += 1;
            } while (getal != END);
            Console.WriteLine("Totaal aantal cijfers: {0}", aantalCijfers);
        }
    }
```

## Oefening 5: ZIE OEF 4
## Oefening 6: ZIE OEF 3

## Oefening 7: Hexadecimaal
```
class Program
    {
        enum Hexa { A = 10, B, C, D, E, F}
        static void Main(string[] args)
        {
            const int GRONDWAARDE = 16;
            StringBuilder result = new StringBuilder();
            Console.WriteLine("Geef een geheel getal in.");
            long decimaalGetal = long.Parse(Console.ReadLine());
            do
            {
                long rest = decimaalGetal % GRONDWAARDE;
                decimaalGetal = decimaalGetal / GRONDWAARDE;
                result.Insert(0, (Hexa)rest);
            } while (decimaalGetal > 0);
            Console.WriteLine("Hex: {0}", result);
            //maak var aan
            Hexa a = Hexa.A;
            //sw tab tab
            switch (a)
                // var ingeven
                // achter var staan en enter
            {
                case Hexa.A:
                    break;
                case Hexa.B:
                    break;
                case Hexa.C:
                    break;
                case Hexa.D:
                    break;
                case Hexa.E:
                    break;
                case Hexa.F:
                    break;
                default:
                    break;
            }
        }
    }
```

## Oefening 8: Som aantal getallen
```
class Program
    {
        static void Main(string[] args)
        {
            const int END = 0;
            Console.WriteLine("Geef getallen in, druk 0 om te stoppen en de som wordt berekend.");
            int ingevoerdGetal;
            int totaal = 0;
            do
            {
                ingevoerdGetal = int.Parse(Console.ReadLine());
                totaal += ingevoerdGetal;
            } while (ingevoerdGetal != END);
            Console.WriteLine("totaal: {0}",totaal);
        }
    }
```

## Oefening 9: Aantal positief / negatief
```
class Program
    {
        static void Main(string[] args)
        {
            const int END = 0;
            Console.WriteLine("Geef getallen in, druk 0 om te stoppen en het aantal positieve en negatieve getallen zal worden berekend");
            int ingevoerdGetal;
            int totaalPositief = 0;
            int totaalNegatief = 0;
            do
            {
                ingevoerdGetal = int.Parse(Console.ReadLine());
                if (ingevoerdGetal > END)
                {
                    totaalPositief += 1;
                }
                else if (ingevoerdGetal < END)
                {
                    totaalNegatief += 1;
                }
            }  while (ingevoerdGetal != END);
            Console.WriteLine("Totaal aantal positieve getallen: {0}\nTotaal aantal negatieve getallen: {1}", totaalPositief, totaalNegatief);
        }
    }
```

## Oefening 10: Aantal positief / negatief met 0
```
class Program
    {
        static void Main(string[] args)
        {
            const int END = -32768;
            Console.WriteLine("Geef getallen in, druk 0 om te stoppen en het aantal positieve en negatieve getallen zal worden berekend");
            int ingevoerdGetal;
            int totaalPositief = 0;
            int totaalNegatief = 0;
            int totaalNul = 0;
            do
            {
                ingevoerdGetal = int.Parse(Console.ReadLine());
                if (ingevoerdGetal > 0)
                {
                    totaalPositief += 1;
                }
                else if (ingevoerdGetal < 0 && ingevoerdGetal != END)
                {
                    totaalNegatief += 1;
                }
                else if (ingevoerdGetal == 0)
                {
                    totaalNul += 1;
                }
            } while (ingevoerdGetal != END);
            Console.WriteLine("Totaal aantal positieve getallen: {0}\nTotaal aantal negatieve getallen: {1}\nTotaal aantal keer \"0\": {1}", totaalPositief, totaalNegatief, totaalNul);
        }
    }
```

## Oefening 11: Product
```
class Program
    {
        static void Main(string[] args)
        {
            bool end = false;
            Console.WriteLine("Geef getallen in, druk 0 om te stoppen en het product van de getallen zal worden berekend");
            int totaal = 1;
            do
            {
                int ingevoerdGetal = int.Parse(Console.ReadLine());
                if (ingevoerdGetal != 0)
                {
                    totaal *= ingevoerdGetal;
                }
                else
                {
                    end = true;
                }
            } while (!end);
            Console.WriteLine("Totaal: {0}", totaal);
        }
    }
```

## Oefening 12: Som van cijfers 
```
class Program
    {
        static void Main(string[] args)
        {
            const int DELER = 10;
            const int END = 0;
            int rest = 0, som = 0;
            Console.WriteLine("Geef getallen in, druk 0 om te stoppen en het product van de getallen zal worden berekend");
            int invoerGetal = int.Parse(Console.ReadLine());
            do
            {
                rest = invoerGetal % DELER;
                invoerGetal = invoerGetal / DELER;
                som += rest;
            } while (invoerGetal != END);
            Console.WriteLine("Som: {0}", som);
        }
    }
```

## Oefening 13: Gemiddelde
```
class Program
    {
        static void Main(string[] args)
        {
            bool isNeg = false;
            Console.WriteLine("Geef positieve getallen in, geef negatieve om te stoppen en het gemiddelde van de positieve getallen zal worden berekend");
            int invoerGetal, gemiddelde = 0, aantalGetallen = 0;
            double som = 0;
            do
            {
                invoerGetal = int.Parse(Console.ReadLine());
                if (invoerGetal >= 0)
                {
                    som += invoerGetal;
                    aantalGetallen += 1;
                    gemiddelde = (int)Math.Round(som / aantalGetallen);
                }
                else
                {
                    isNeg = true;
                }
            } while (!isNeg);
            Console.WriteLine("Gemiddelde: {0}", gemiddelde);
        }
    }
```

## Oefening 14: Grootste getal
```
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Geef getallen in, -32768 om te stoppen en het grootste getal zal worden weergegeven");
            const int AFSLUITWAARDE = -32768;
            int getal = int.Parse(Console.ReadLine());
            int aantalGetallen = 0;
            int grootsteGetal = getal;
            while (getal != AFSLUITWAARDE)
            {
                if (getal > grootsteGetal)
                {
                    grootsteGetal = getal;
                    aantalGetallen = 1;
                }
                else if (grootsteGetal == getal)
                {
                    aantalGetallen += 1;
                }
                getal = int.Parse(Console.ReadLine());

            }
            if (aantalGetallen > 0)
            {
                Console.WriteLine("Grootste waarde: {0} komt {1}x voor", grootsteGetal, aantalGetallen);
            }
            else
            {
                Console.WriteLine("Geen invoer");
            }
        }
    }
```

## Oefening 15: Kleinste getal
```
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Geef getallen in, -32768 om te stoppen en het kleinste getal zal worden weergegeven");
            const int AFSLUITWAARDE = -32768;         
            int getal = int.Parse(Console.ReadLine());
            int aantalGetallen = 0;
            int kleinsteGetal = getal;
            while (getal != AFSLUITWAARDE)
            {               
                if (getal < kleinsteGetal )    
                {
                    kleinsteGetal = getal;
                    aantalGetallen = 1;
                }
                else if (kleinsteGetal == getal)
                {
                    aantalGetallen += 1;
                }
                getal = int.Parse(Console.ReadLine());
                
            }
            if (aantalGetallen > 0)
            {
                Console.WriteLine("Kleinste waarde: {0} komt {1}x voor", kleinsteGetal, aantalGetallen);
            }
            else
            {
                Console.WriteLine("Geen invoer");
            }
        }
    }
```

## Oefening 16: Stijgende volgorde
```
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Geef een reeks getallen gesorteerd van klein naar groot in, het programma stopt indien er een fout ingegeven is. ");
            int getal , grootsteGetal;
            grootsteGetal = int.Parse(Console.ReadLine());
            do
            {
                getal = int.Parse(Console.ReadLine());
            } while (getal > grootsteGetal);
            Console.WriteLine("Fout!");
        }
    }
```

## Oefening 17: Gemiddelde aantal getallen
```
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Geef een aantal getallen in en het gemiddelde van de getallen zal worden berekend. Druk 2x 0 om te stoppen.");
            double  gemiddelde = 0;
            double getal = double.Parse(Console.ReadLine());
            int aantalGetallen = 1;
            double som = getal;
            double vorigGetal;
            do
            {
                vorigGetal = getal;
                getal =  double.Parse(Console.ReadLine());
                aantalGetallen += 1;
                som += vorigGetal;
                            
            } while (getal != 0 || vorigGetal != 0);
            aantalGetallen -= 2;
            som = som - 2 * getal;
            if (aantalGetallen>0)
            {
                gemiddelde = som / aantalGetallen;
                Console.WriteLine("Gemiddelde: {0}", gemiddelde);
            }
            else
            {
                Console.WriteLine("Geen invoer");
            }
        }
    }
```

## Oefening 18: Dezelfde getallen
```
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Geef een aantal getallen in en het gemiddelde van de getallen zal worden berekend. Druk 2x 0 om te stoppen.");
            double gemiddelde = 0;
            double getal = double.Parse(Console.ReadLine());
            int aantalGetallen = 1;
            double som = getal;
            double vorigGetal;
            do
            {
                vorigGetal = getal;
                getal = double.Parse(Console.ReadLine());
                aantalGetallen += 1;
                som += vorigGetal;

            } while (getal != vorigGetal);
            aantalGetallen -= 2;
            som = som - 2 * getal;
            if (aantalGetallen > 0)
            {
                gemiddelde = som / aantalGetallen;
                Console.WriteLine("Gemiddelde: {0}", gemiddelde);
            }
            else
            {
                Console.WriteLine("Geen invoer");
            }
        }
    }
```

## Oefening 19: Stijgende getallen, stoppen met fout of 0
```
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Voer een reeks stijgende getallen in. Het programma stopt bij 0 of bij een fout.");
            const int AFSLUITWAARDE = 0;
            int vorigGetal;
            int invoerGetal = int.Parse(Console.ReadLine());
            vorigGetal = invoerGetal;

            while (vorigGetal != AFSLUITWAARDE && invoerGetal >= vorigGetal)
            {
                vorigGetal = invoerGetal;
                invoerGetal = int.Parse(Console.ReadLine());
            }
            Console.WriteLine("Programma afgesloten.");
        }
    }
```

## Oefening 20: Gemiddelde 20 getallen
```
class Program
    {
        //static Random random = new Random();
        static void Main(string[] args)
        {
            Console.WriteLine("Geef 50 getallen in. Het gemiddelde zal worden berekend.");
            const int AANTAL_GETALLEN = 50;
            double som = 0;
            double gemiddelde = 0;
            for (int i = 1; i <= AANTAL_GETALLEN; i++)
            {
                double getal = double.Parse(Console.ReadLine());
                //double getal = random.Next(0, 21);
                som += getal;
            }
            gemiddelde = som / AANTAL_GETALLEN;
            Console.WriteLine("Het gemiddelde: {0}", (int)Math.Round(gemiddelde));
        }
    }
```

## Oefening 21: Even getallen optellen
```
class Program
    {
        static void Main(string[] args)
        {
            const int SPRONG = 2;
            int som = 0;
            double getal = double.Parse(Console.ReadLine());
            int afgerondGetal = (int)Math.Floor(getal);

            if (afgerondGetal % 2 != 0)
            {
                afgerondGetal -= 1;
            }

            for (int i = 0; i < getal; i+=SPRONG)
            {
                som += afgerondGetal;
                afgerondGetal -= SPRONG;
            }
            Console.WriteLine("Som: {0}",som);
        }
    }
```

## Oefening 22: Driehoekjes (+ logo avicii voor de lol)
```
class Program
    {
        static void Main(string[] args)
        {
            const int MIN_VALUE = 2;
            const int MAX_VALUE = 20;
            Console.WriteLine("Voer de grootte in.");
            int grootte = int.Parse(Console.ReadLine());
            int lengte = grootte, reset = grootte + 1;

            if (grootte < MIN_VALUE || grootte > MAX_VALUE)
            {
                Console.WriteLine("Ongeldige invoer");
            }
            else
            {
                TekenDriehoek1(reset);
                TekenDriehoek2(reset);
                TekenDriehoek4(reset);
                TekenDriehoek3(reset);
                RipAvicii(reset);
            }
        }
        static public void TekenDriehoek1(int reset)
        {
            Console.Write("\nDriehoek 1\n");
            int grootte = reset;
            int lengte = 0;
            for (int i = 1; i <= grootte; i++)
            {
                for (int j = 1; j <= lengte; j++)
                {
                    Console.Write("*");
                }
                Console.Write("\n");
                lengte++;
            }
        }
        static public void TekenDriehoek2(int reset)
        {
            Console.Write("Driehoek 2\n");
            int grootte = reset;
            int lengte = reset;
            for (int i = grootte; i >= 1; i--)
            {
                for (int j = lengte; j > 1; j--)
                {
                    Console.Write("*");
                }
                Console.Write("\n");
                lengte--;
            }
        }
        static public void TekenDriehoek3(int reset)
        {
            Console.Write("Driehoek 3\n");
            int grootte = reset - 1;
            int lengteSpaties = reset - 1;
            int lengteKarakter = 1;
            for (int i = 1; i <= grootte; i++)
            {
                for (int j = lengteSpaties; j > 1; j--)
                {
                    Console.Write(" ");
                }
                lengteSpaties--;
                for (int j = 1; j <= lengteKarakter; j++)
                {
                    Console.Write("*"); 
                }
                lengteKarakter++;
                Console.Write("\n");
            }
        }
        static public void TekenDriehoek4(int reset)
        {
            Console.Write("Driehoek 4\n");
            int grootte = reset - 1;
            int lengteKarakter = reset - 1;
            int lengteSpaties = 0;
            for (int i = 1; i <= grootte; i++)
            {
                for (int j = 1; j <= lengteSpaties; j++)
                {
                    Console.Write(" ");
                }
                lengteSpaties++;
                for (int j = lengteKarakter; j >= 1; j--)
                {
                    Console.Write("*");
                }
                Console.Write("\n");
                lengteKarakter--;
            }
        }
        static public void RipAvicii(int reset)
        {
            Console.Write("RIP AVICII\n");
            int grootte = reset - 1;
            int lengte = reset;
            int lengteSpaties = reset - 1;
            int lengteKarakter = 1;
            const int JUMP_IN = 3;
            const int ONDER_GRENS = 5;
            const int MIDDEL_GRENS = 12;
            const int TINY_SPACE = 2;
            const int MED_SPACE = 3;
            const int LARGE_SPACE = 4;
            int space;
            if (reset <= ONDER_GRENS) { space = TINY_SPACE; }
            else if (reset > ONDER_GRENS && reset <= MIDDEL_GRENS) { space = MED_SPACE; }
            else { space = LARGE_SPACE; }
            for (int i = 1; i <= grootte; i++)
            {
                for (int j = 1; j <= JUMP_IN; j++)
                {
                    Console.Write(" ");
                }
                for (int j = lengteSpaties; j > 1; j--)
                {
                    Console.Write(" ");
                }
                lengteSpaties--;
                for (int j = 1; j <= lengteKarakter; j++)
                {
                    Console.Write("*");
                }
                lengteKarakter++;
                for (int j = 1; j <= space; j++)
                {
                    Console.Write(" ");
                }
                for (int j = lengte; j > 1; j--)
                {
                    Console.Write("*");
                }
                lengte--;
                Console.Write("\n");
            }
        }
    }
```

## Oefening 23: Rechthoekig kadertje
```
class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Geef de lengte van het kadertje in, tussen 2 en 20:");
            int lengte = int.Parse(Console.ReadLine());
            Console.Write("Geef de diepte van het kadertje in, tussen 2 en 20:");
            int diepte = int.Parse(Console.ReadLine());
            if (lengte < 2 || lengte > 20 || diepte < 2 || diepte > 20)
            {
                Console.WriteLine("Foutieve input");
            }
            else
            {
                for (int i = 1; i <= lengte; i++)
                {
                    Console.Write("*");
                }
                Console.WriteLine("");
                for (int j = 1; j <= diepte - 2; j++)
                {
                    for (int k = 1; k <= lengte; k++)
                    {
                        if (k == 1 || k == lengte)
                        {
                            Console.Write("*");
                        }
                        else
                        {
                            Console.Write(" ");
                        }
                    }
                    Console.WriteLine();
                }
                for (int i = 1; i <= lengte; i++)
                {
                    Console.Write("*");
                }
                Console.WriteLine("");
            }
        }
    }
```

## Oefening 24: Minimumgetal
```
class Program
    {
        static void Main(string[] args)
        {
            int kleinsteGetal;
            int getal;
            Console.Write("Geef het aantal in (groter dan 0):");
            int aantal = int.Parse(Console.ReadLine());
            while (aantal <= 0)
            {
                Console.Write("Geef een correct aantal in:");
                aantal = int.Parse(Console.ReadLine());
            }
            Console.WriteLine("Geef een reeks getallen in, het minimum zal worden berekend.");
            kleinsteGetal = int.Parse(Console.ReadLine());
            for (int i = 1; i < aantal; i++)
            {
                getal = int.Parse(Console.ReadLine());
                if (getal < kleinsteGetal)
                {
                    kleinsteGetal = getal;
                }
            }
            Console.WriteLine("Minimum: {0}", kleinsteGetal);
        }
    }
```

## Oefening 25: Maximumgetal
```
class Program
    {
        static void Main(string[] args)
        {
            int grootsteGetal;
            int getal;
            Console.Write("Geef het aantal in (groter dan 0):");
            int aantal = int.Parse(Console.ReadLine());
            while (aantal <= 0)
            {
                Console.Write("Geef een correct aantal in:");
                aantal = int.Parse(Console.ReadLine());
            }
            Console.WriteLine("Geef een reeks getallen in, het maximum zal worden berekend.");
            grootsteGetal = int.Parse(Console.ReadLine());
            for (int i = 1; i < aantal; i++)
            {
                getal = int.Parse(Console.ReadLine());
                if (getal > grootsteGetal)
                {
                    grootsteGetal = getal;
                }
            }
            Console.WriteLine("Maximum: {0}", grootsteGetal);
        }
    }
```

## Oefening 26: Som van kwadraten 50 - 100
```
class Program
    {
        static void Main(string[] args)
        {
            int som = 0;
            Console.WriteLine();
            for (int i = 50; i <= 100; i += 2)
            {
                som += (int)Math.Pow(i, 2);
            }
            Console.WriteLine("Som: {0}", som);
        }
    }
```

## Oefening 27: Positief getal deelbaar door  2 - 3 - 6
```
class Program
    {
        //static Random random = new Random();
        static void Main(string[] args)
        {
            int getal;
            int aantalDeelbaarDoor2 = 0;
            int aantalDeelbaarDoor3 = 0;
            int aantalDeelbaarDoor6 = 0;
            Console.WriteLine("Voer 100 getallen in");
            for (int i = 1; i <= 100; i++)
            {
                getal = int.Parse(Console.ReadLine());
                //getal = random.Next(0,100);
                if (getal % 6 == 0)
                {
                    aantalDeelbaarDoor6 += 1;
                    aantalDeelbaarDoor2 += 1;
                    aantalDeelbaarDoor3 += 1;
                }
                else if (getal % 3 == 0)
                {
                    aantalDeelbaarDoor3 += 1;
                }
                else if (getal % 2 == 0)
                {
                    aantalDeelbaarDoor2 += 1;
                }
            }
            Console.WriteLine("Aantal deelbaar door 2: {0}\nAantal deelbaar door 3: {1}\nAantal deelbaar door 6: {2}", aantalDeelbaarDoor2, aantalDeelbaarDoor3, aantalDeelbaarDoor6);
        }
    }
```

## Oefening 28: 30 termen van 6
```
class Program
    {
        static void Main(string[] args)
        {
            TermenVan6();
            TermenVan8(); 
            TermenPlusHetDubbele();
            TermenPlusDeHelft();
            TermenPlus_NoemerMaal2();
            TermenPlus_NoemerPlus2();
            TermenPlus_NoemerPlus1_Maal2();
        }

        static void TermenVan6()
        {
            const int SPRONG_WAARDE = 6;
            int tussenWaarde = SPRONG_WAARDE;
            int som = tussenWaarde;
            for (int i = 1; i <= 30; i += 1)
            {
                tussenWaarde += 6;
                som += tussenWaarde;
            }
            Console.WriteLine("De som van de eerste 30 termen van 6: {0}", som);
        }

        static void TermenVan8()
        {
            const int SPRONG_WAARDE = 4;
            int tussenWaarde = SPRONG_WAARDE;
            int som = tussenWaarde;
            for (int i = 0; i < 30; i += 1)
            {
                tussenWaarde += 8;
                som += tussenWaarde;
            }
            Console.WriteLine("De som van de eerste 30 termen van 8: {0}", som);
        }

        static void TermenPlusHetDubbele()
        {
            const int START_WAARDE = 1;
            int tussenWaarde = START_WAARDE;
            int som = tussenWaarde;
            for (int i = 1; i <= 30; i += 1)
            {
                tussenWaarde *= 2;
                som += tussenWaarde;
            }
            Console.WriteLine("De som van de eerste 30 termen van 1 + het dubbele: {0}", som);
        }

        static void TermenPlusDeHelft()
        {
            double tussenWaarde = 1;
            double som = tussenWaarde;
            for (int i = 1; i <= 30; i += 1)
            {
                tussenWaarde /= 2;
                som += tussenWaarde;
            }
            Console.WriteLine("De som van de eerste 30 termen van 1 + de helft: {0}", som);
        }

        static void TermenPlus_NoemerMaal2()
        {
            const double VERMENIGVULDIGER = 2;
            double tussenWaarde = 1;
            double noemer = 2;
            double som = tussenWaarde;
            for (int i = 1; i <= 30; i += 1)
            {
                tussenWaarde += 1/noemer;
                som += tussenWaarde;
                noemer *= VERMENIGVULDIGER;
            }
            Console.WriteLine("De som van de eerste 30 termen van 1 + 'noemer*2': {0}", som);
        }

        static void TermenPlus_NoemerPlus2()
        {
            const double OPTELLER = 2;
            double tussenWaarde = 1;
            double noemer = 2;
            double som = tussenWaarde;
            for (int i = 1; i <= 30; i += 1)
            {
                tussenWaarde += 1 / noemer;
                som += tussenWaarde;
                noemer += OPTELLER;
            }
            Console.WriteLine("De som van de eerste 30 termen van 1 + 'noemer+2': {0}", som);
        }

        static void TermenPlus_NoemerPlus1_Maal2()
        {
            double optelWaarde = 0;
            double tussenWaarde = 1;
            double noemer = 2;
            double som = tussenWaarde;
            tussenWaarde += 1 / 2;
            som += tussenWaarde;
            tussenWaarde += 1 / (2 + 1);
            som += tussenWaarde;
            
            for (int i = 1; i <= 30; i += 1)
            {
                Console.WriteLine("1/{0}", noemer);
                tussenWaarde += 1 / (2 + optelWaarde);
                som += tussenWaarde;
                optelWaarde *= 2;
            }
            Console.WriteLine("De som van de eerste 30 termen van 1 + 'noemer+2': {0}", som);
        }
    }
```

## Oefening 29: ---
## Oefening 30: Hoger - Lager (spel)
```
class Program
    {
        static Random random = new Random();
        static void Main(string[] args)
        {
            bool nogEens = false;
            int randomgetal;
            int gok;
            int aantalKeerGegokt = 0;
            do
            {
                Console.WriteLine("Zoek het getal tussen 0 en 100!");
                randomgetal = random.Next(0, 101);
                do
                {
                    gok = int.Parse(Console.ReadLine());
                    if (gok < randomgetal)
                    {
                        Console.WriteLine("Hoger!!");
                        aantalKeerGegokt++;
                    }
                    else if (gok > randomgetal)
                    {
                        Console.WriteLine("Lager!!");
                        aantalKeerGegokt++;
                    }
                } while (gok != randomgetal);
                Console.WriteLine("U heeft het getal gevonden na {0} gok(ken), Proficiat!\nWil je nog een keer spelen? (ja/nee)", aantalKeerGegokt);
                string antwoord = Console.ReadLine().ToUpper();
                if (antwoord == "JA")
                {
                    nogEens = true;
                    aantalKeerGegokt = 0;
                }
                else if (antwoord == "NEE")
                {
                    nogEens = false;
                }
            } while (nogEens != false);
        }
    }
```

## Oefening 31: Gokautomaat
```
class Program
    {
        static Random random = new Random();
        static void Main(string[] args)
        {
            bool nogEens = true;
            do
            {
                Console.WriteLine("Druk 1 om te draaien, 0 om te stoppen.");
                int antwoord = int.Parse(Console.ReadLine());
                if (antwoord == 1)
                {
                    int getal1 = random.Next(0, 10);
                    int getal2 = random.Next(0, 10);
                    int getal3 = random.Next(0, 10);
                    Console.WriteLine("{0} {1} {2}", getal1, getal2, getal3);
                    if (getal1 == getal2 && getal2 == getal3)
                    {
                        Console.WriteLine("WINNER WINNER CHICKEN DINNER!!");
                    }
                    else if (getal1 == getal2 || getal2 == getal3)
                    {
                        Console.WriteLine("At least you got a bit of luck XD");
                    }
                    else
                    {
                        Console.WriteLine("Poor human...");
                    }
                }
                else if (antwoord == 0)
                {
                    nogEens = false;
                }
            } while (nogEens);
        }
    }
```

## Oefening 32: ---
## Oefening 33: Delers van een positief getal
```
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Geef een positief getal in:");
            int ingelezenGetal = int.Parse(Console.ReadLine());
            int deler = 1;
            string antwoord = "Het ingelezen getal is deelbaar door: ";
            do
            {
                if (ingelezenGetal % deler == 0)
                {
                    antwoord += deler + ", ";
                }
                deler++;
            } while (deler <= ingelezenGetal);
            antwoord = antwoord.Remove(antwoord.Length - 2);
            Console.WriteLine(antwoord);
        }
    }
```

## Oefening 34: ---
## Oefening 35: ---
## Oefening 36: ---
## Oefening 37: Faculteit van getallen
```
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Geef een positief getal in, de faculteit zal worden berekend.");
            int getal = int.Parse(Console.ReadLine());
            int totaal = 1;
            for (int i = getal; i > 0; i--)
            {
                totaal *= i;
            }
            Console.WriteLine("De faculteit van {0} is {1}", getal, totaal);
        }
    }
```

## Oefening 38: ---
## Oefening 39: Eerste 20 getallen van Fibonnaci
```
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("De eerste 20 getallen van Fibonnaci:");
            int eersteGetal = 0;
            int tweedeGetal = 1;
            int derdeGetal = 0;
            Console.Write("{0}, {1}, ", eersteGetal, tweedeGetal);
            for (int i = 1; i <= 20; i++)
            {
                derdeGetal = eersteGetal + tweedeGetal;
                Console.Write("{0}, ", tweedeGetal);
                eersteGetal = tweedeGetal;
                tweedeGetal = derdeGetal;
            }
        }
    }
```

## Oefening 40: 10e getal van Fibonnaci
```
class Program
    {
        static void Main(string[] args)
        {
            int eersteGetal = 0;
            int tweedeGetal = 1;
            Console.WriteLine(eersteGetal);
            Console.WriteLine(tweedeGetal);
            int derdeGetal = 0;
            for (int i = 3; i <= 10; i++)
            {
                derdeGetal = eersteGetal + tweedeGetal;
                eersteGetal = tweedeGetal;
                tweedeGetal = derdeGetal;
                Console.WriteLine(derdeGetal);
            }
        }
    }
```

## Oefening 41: Som 2 cijfers van tweecijfersgetal = deler van getal
```
class Program
    {
        static Random random = new Random();
        static void Main(string[] args)
        {
            int getal = 0;
            int som = 0;
            do
            {
                getal = random.Next(0, 100);
                som = (getal / 10) + (getal % 10);
            } while (getal % som != 0);
            Console.WriteLine("Het getal {0} is deelbaar door {1}.", getal, som);
        }
    }
```

## Oefening 42: Dagnummer bepalen
```
class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Voer een dag in:");
            int dag = int.Parse(Console.ReadLine());
            Console.Write("Voer een maand in:");
            int maand = int.Parse(Console.ReadLine());
            Console.Write("Voer een jaar in:");
            int jaar = int.Parse(Console.ReadLine());
            DateTime date = new DateTime(jaar, maand, dag);
            Console.WriteLine(date.DayOfYear);
        }
    }
```

## Oefening 43: Tennis (de eenvoudige oplossing, niet met de juiste regels)
```
class Program
    {
        static void Main(string[] args)
        {
            bool gameOver = false;
            int scoreA = 0;
            int scoreB = 0;
            Console.WriteLine("Type 'C' om te stoppen, A als speler 'A' scoort en 'B' als speler B scoort.");
            while (!gameOver)
            {
                Console.WriteLine("~~~~~~");
                string goal = Console.ReadLine();
                if (goal.ToUpper() == "A")
                {
                    scoreA++;
                }
                else if (goal.ToUpper() == "B")
                {
                    scoreB++;
                }
                else if (goal.ToUpper() == "C")
                {
                    Console.WriteLine("Eindstand:");
                    gameOver = true;
                }
                else
                {
                    Console.WriteLine("ongeldige invoer");
                }
                Console.WriteLine("Score A: {0}\nScore B: {1}", scoreA, scoreB);
            }
        }
    }
```

## Oefening 44: Machten met getal
```
class Program
    {
        static void Main(string[] args)
        {
            int macht = 2;
            while (macht < 100)
            {
                macht *= 2;
                Console.WriteLine(macht);
            }
            Console.WriteLine("");
        }
    }
```
