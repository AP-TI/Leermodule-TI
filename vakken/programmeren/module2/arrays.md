# Programmeren 2
## Arrays
### Oefening 1
```csharp
static void Main(string[] args)
        {
            const int AANTAL_GETALLEN = 20;
            int[] getallen = new int[AANTAL_GETALLEN];

            for(int teller = 0; teller < AANTAL_GETALLEN; teller++)
            {
                Console.Write("Getal {0}/{1}: ", teller + 1, AANTAL_GETALLEN);
                getallen[teller] = int.Parse(Console.ReadLine());
            }
            for(int teller = AANTAL_GETALLEN - 1; teller >= 0; teller--)
            {
                Console.WriteLine(getallen[teller]);
            }
        }
```
### Oefening 2
```csharp
static void Main(string[] args)
        {
            const int AANTAL_GETALLEN = 20;
            const int AANTAL_OP_TE_SCHUIVEN_GETALLEN = 1;
            int[] getallen = new int[AANTAL_GETALLEN];

            for(int teller = 0; teller < AANTAL_GETALLEN; teller++)
            {
                Console.Write("Geef getal {0}/{1}: ", teller + 1, AANTAL_GETALLEN);
                getallen[teller] = int.Parse(Console.ReadLine());
            }
            for(int teller = 0; teller < AANTAL_GETALLEN; teller++)
            {
                Console.WriteLine(getallen[(teller + AANTAL_OP_TE_SCHUIVEN_GETALLEN) % AANTAL_GETALLEN]);
            }
        }
```
### Oefening 3
```csharp
static void Main(string[] args)
        {
            const int AANTAL_GETALLEN = 20;
            const int AANTAL_GETALLEN_NAAR_ACHTER = 3;
            int[] getallen = new int[AANTAL_GETALLEN];

            for(int teller = 0; teller < AANTAL_GETALLEN; teller++)
            {
                Console.Write("Geef getal {0}/{1}: ", teller + 1, AANTAL_GETALLEN);
                getallen[teller] = int.Parse(Console.ReadLine());
            }
            for(int teller = AANTAL_GETALLEN - AANTAL_GETALLEN_NAAR_ACHTER; teller % AANTAL_GETALLEN != AANTAL_GETALLEN - (AANTAL_GETALLEN_NAAR_ACHTER + 1); teller++)
            {
                Console.WriteLine(getallen[(teller) % AANTAL_GETALLEN]);
            }
        }
```
### Oefening 4
```csharp
static void Main(string[] args)
        {
            const int AANTAL_GETALLEN = 20;
            int[] getallen = new int[AANTAL_GETALLEN];
            int rotatieGetal;
            Console.Write("Geef het getal waarover u de getalrij wilt roteren: ");
            rotatieGetal = int.Parse(Console.ReadLine());
            for(int teller = 0; teller < AANTAL_GETALLEN; teller++)
            {
                Console.Write("Geef getal {0}/{1}: ", teller + 1, AANTAL_GETALLEN);
                getallen[teller] = int.Parse(Console.ReadLine());
            }
            for (int teller = 0; teller < AANTAL_GETALLEN; teller++)
            {
                Console.WriteLine(getallen[(teller + rotatieGetal + AANTAL_GETALLEN) % AANTAL_GETALLEN]);
            }
        }
```
### Oefening 5
```csharp
static Random random = new Random();
static void Main(string[] args)
{
    const int AANTAL_GETALLEN = 100;
    int[] getallen = new int[AANTAL_GETALLEN];
    int tussenVariabele;


    for (int teller = 0; teller < AANTAL_GETALLEN; teller++)
    {
        getallen[teller] = random.Next(1000);
    }


    for (int teller = 0; teller < AANTAL_GETALLEN - AANTAL_GETALLEN % 3; teller += 3)
    {
        if (getallen[teller] > getallen[teller + 1])
        {
            tussenVariabele = getallen[teller];
            getallen[teller] = getallen[teller + 1];
            getallen[teller + 1] = tussenVariabele;
        }
        if (getallen[teller + 1] > getallen[teller + 2])
        {
            tussenVariabele = getallen[teller + 1];
            getallen[teller + 1] = getallen[teller + 2];
            getallen[teller + 2] = tussenVariabele;
        }
        if (getallen[teller] > getallen[teller + 1])
        {
            tussenVariabele = getallen[teller];
            getallen[teller] = getallen[teller + 1];
            getallen[teller + 1] = tussenVariabele;
        }
    }
    if (AANTAL_GETALLEN % 3 == 2 && getallen[AANTAL_GETALLEN - 1] < getallen[AANTAL_GETALLEN - 2])
    {
        tussenVariabele = getallen[AANTAL_GETALLEN - 1];
        getallen[AANTAL_GETALLEN - 1] = getallen[AANTAL_GETALLEN - 2];
        getallen[AANTAL_GETALLEN - 2] = tussenVariabele;
    }
    for (int teller = 0; teller < AANTAL_GETALLEN; teller += 3)
    {
        for (int teller1 = teller; teller1 < teller + 3 && teller1 < AANTAL_GETALLEN; teller1++)
            Console.Write(getallen[teller1] + "\t");
        Console.WriteLine();
    }
}
```

### Oefening 6
```csharp
class Program
    {
        static Random random = new Random();

        static void Main(string[] args)
        {
            const int AANTAL_GETALLEN = 100;
            const int AANTAL_KOLOMMEN = 3;
            int[][] intJaggedArray = new int[AANTAL_KOLOMMEN][];

            int overschot = AANTAL_GETALLEN % AANTAL_KOLOMMEN;

            // grootte van array bepalen
            for (int i = 0; i < intJaggedArray.Length; i++)
            {
                int getallenPerKolom = AANTAL_GETALLEN / AANTAL_KOLOMMEN;
                if (overschot > 0)
                {
                    overschot--;
                    getallenPerKolom++;
                }
                intJaggedArray[i] = new int[getallenPerKolom];
            }

            // getallen in array steken.
            for (int i = 0; i < intJaggedArray.Length; i++){
                for (int j = 0; j < intJaggedArray[i].Length; j++)
                {
                    intJaggedArray[i][j] = random.Next(100);
                }
            }

            // getallen in array sorteren
            for (int i = 0; i < intJaggedArray.Length; i++)
            {
                Array.Sort(intJaggedArray[i]);
            }

            // voor elke rij... (vb. 100 / 3 --> 33.333 --> ceiling = 34 --> tot 34 = 0 --> 33 = 34 keer.)
            for (int i = 0; i < (int)Math.Ceiling((double)AANTAL_GETALLEN / intJaggedArray.Length); i++)
            {
                // voor elke kolom...
                for (int j = 0; j < intJaggedArray.Length; j++)
                {
                    // als de lengte van de array j groter is dan i
                      // stel overschot = 1 --> (34 groter dan i = 0 t/m 34 groter dan i = 33),
                      // stel overschot = 0 --> lengte 33 is niet groter dan i=33 dus het 33e element
                        // (dat niet bestaat want array met 33 elementen = 0 --> 32) zal niet afgedrukt worden --> geen errors!
                    if (intJaggedArray[j].Length > i)
                    {
                        Console.Write(intJaggedArray[j][i] + "\t"); // druk uit kolom j het i-de element af
                    }
                }
                Console.WriteLine();
            }
        }
    }
```

### Oefening 7
```csharp
class Program
    {
        static Random random = new Random();
        static void Main(string[] args)
        {
            const int AANTAL_GETALLEN = 10;
            int[] nieuweIntarray = new int[AANTAL_GETALLEN];


            for (int i = 0; i < AANTAL_GETALLEN; i++)
            {
                nieuweIntarray[i] = random.Next(0,20);
                Console.WriteLine(nieuweIntarray[i]);
            }

            int[] origineleIntarray = nieuweIntarray;

            Console.WriteLine("-------");

            int helft = (int)(AANTAL_GETALLEN / 2.00);
            int wisselgetal;
            for (int i = 0; i < helft ; i++)
            {
                wisselgetal = nieuweIntarray[i];
                nieuweIntarray[i] = nieuweIntarray[(AANTAL_GETALLEN - 1) - i];
                nieuweIntarray[(AANTAL_GETALLEN - 1) - i] = wisselgetal;
            }
            foreach(int x in nieuweIntarray)
            {
                Console.WriteLine(x);
            }
        }
    }
```

### Oefening 8
```csharp
class Program
    {
        static Random random = new Random();

        static void Main(string[] args)
        {
            const int AANTAL_GETALLEN = 10;
            int[] intarray = new int[AANTAL_GETALLEN];

            for (int i = 0; i < intarray.Length; i++)
            {
                intarray[i] = random.Next(0, 10);
            }

            foreach (int x in intarray)
            {
                Console.WriteLine(x);
            }
            Console.WriteLine("------");

            int randomIndexWaarde;
            int tussenVariabele;

            for (int i = 0; i < AANTAL_GETALLEN; i++)
            {
                randomIndexWaarde = random.Next(0, AANTAL_GETALLEN);
                tussenVariabele = intarray[randomIndexWaarde];
                intarray[randomIndexWaarde] = intarray[i];
                intarray[i] = tussenVariabele;
            }

            foreach (int x in intarray)
            {
                Console.WriteLine(x);
            }
        }
    }
```

### Oefening 9, 10, 11, 12
> verander gewoon de waarde van `const int VERSCHUIVING` om de code voor de andere oefeningen te hebben.
```csharp
class Program
    {
        static Random random = new Random();

        static void Main(string[] args)
        {
            const int AANTAL_GETALLEN = 10;
            const int VERSCHUIVING = 1;
            int[,] intArray = new int[2,AANTAL_GETALLEN];
            const int INIT_ARRAY = 0;
            const int VERSCHOVEN_ARRAY = 1;

            // init waardes in array 0
            for (int i = 0; i < AANTAL_GETALLEN; i++)
            {
                intArray[INIT_ARRAY, i] = random.Next(0,10);
            }

            // verschoven waardes in array 1
            for (int i = 0; i < AANTAL_GETALLEN; i++)
            {
                intArray[VERSCHOVEN_ARRAY, i] = intArray[INIT_ARRAY, ((i + VERSCHUIVING)+AANTAL_GETALLEN) % AANTAL_GETALLEN];
            }

            // print alle waardes uit beide arrays
            for (int i = 0; i < 2; i++)
            {
                for (int j = 0; j < AANTAL_GETALLEN; j++)
                {
                    Console.WriteLine(intArray[i,j]);
                }
                Console.WriteLine("------");
            }
        }
    }
```

### Oefening 13, 14
> Voeg het stukje met Array.Sort() toe om oef. 14 te verkrijgen.
```csharp
class Program
    {
        static Random random = new Random();

        static void Main(string[] args)
        {
            const int AANTAL_GETALLEN = 20;
            int[] initArray = new int[AANTAL_GETALLEN];
            int[] tussenArray = new int[AANTAL_GETALLEN];
            int[] endArray;

            // waardes initialiseren
            for (int i = 0; i < AANTAL_GETALLEN; i++)
            {
                initArray[i] = random.Next(0, 10);
            }

            // waardes checken
            int teller = 0;
            int aantalVerschillendeGetallen = 0;

            for (int i = 0; i < AANTAL_GETALLEN; i++)
            {
                if (tussenArray.Contains(initArray[i]))
                //als het voorkomt moet de tussenarray niks onthouden, teller-- om teller++ te neutraliseren.
                {
                    teller--;
                }
                else
                // als het nog niet vorkomt wordt het getal toegevoegd
                {
                    tussenArray[teller] = initArray[i];
                    aantalVerschillendeGetallen++;
                }
                teller++;
            }

            // 0 is defaultwaarde en zal altijd voorkomen in tussenarray. vandaar checken of 0 voorkomt in de init-array.
            // Zo ja, tussenArray[aantalVerschillendeGetallen] is default 0, dus aantalVerschillendeGetallen++
            if (initArray.Contains(0))
            {
                aantalVerschillendeGetallen++;
            }

            // enkele waardes in 1 array met gepaste grootte steken
            endArray = new int[aantalVerschillendeGetallen];

            for (int i = 0; i < aantalVerschillendeGetallen; i++)
            {
                endArray[i] = tussenArray[i];
            }

            /// verschillende waardes sorteren: oef 14
            Array.Sort(initArray);
            Array.Sort(endArray);

            // waardes afdrukken
            for (int i = 0; i < AANTAL_GETALLEN; i++)
            {
                Console.WriteLine(initArray[i]);
            }
            Console.WriteLine("--------");
            Console.WriteLine("Verschillende waarden (gesorteerd):");
            for (int i = 0; i < endArray.Length; i++)
            {
                Console.WriteLine(endArray[i]);
            }
        }
    }
```

### Oefening 15, 16
> oefening 15 en 16 gecombineerd (zelfde principe). Met invoercorrectie.
```csharp
class Program
    {
        static void Main(string[] args)
        {
            // waardes in string
            string invoer = "";
            string totaalInvoer = "";
            do
            {
                Console.Write("Geef een getal in: ");
                invoer = Console.ReadLine();
                if (invoer == "")
                // voorkomen dat gebruiker geen getal invoert, voor de lol
                {
                    Console.ForegroundColor = ConsoleColor.Red;
                    Console.WriteLine("Geef een getal in a.u.b.");
                    Console.ResetColor();
                }
                else
                {
                    totaalInvoer += invoer + ",";
                }
            }
            while (invoer != "32767");
            totaalInvoer += "0"; // om geen error te krijgen door een "null" waarde na de laatste komma

            // waardes naar stringArray
            string[] stringArray = totaalInvoer.Split(',');

            // intArray aanmaken
            int aantalIngevoerdeGetallen = stringArray.Length - 2;
            int[] intArray = new int[aantalIngevoerdeGetallen]; // -2 want 32767 en 0

            // waardes in intArray
            for (int i = 0; i < aantalIngevoerdeGetallen; i++)
            {
                int getal = int.Parse(stringArray[i]);
                intArray[i] = getal;
            }

            // grootste getal, aantal grootste getal en eerste index grootste getal bepalen
            int grootsteGetal = intArray[0];
            int aantalKeerGrootsteGetal = 1;
            int indexEersteKeerGrootsteGetal = 0;
            for (int i = 1; i < intArray.Length; i++)
            {
                if (intArray[i] > grootsteGetal)
                {
                    grootsteGetal = intArray[i];
                    aantalKeerGrootsteGetal = 1;
                    indexEersteKeerGrootsteGetal = i;
                }
                else if (intArray[i] == grootsteGetal)
                {
                    aantalKeerGrootsteGetal++;
                }
                else { /* getal is kleiner. */ }
            }
            indexEersteKeerGrootsteGetal++; // mensen werken niet met index 0... sukkelaars

            // kleinste getal, aantal kleinste getal en laatste index kleinste getal bepalen
            int kleinsteGetal = intArray[0];
            int aantalKeerKleinsteGetal = 1;
            int indexLaatsteKeerKleinsteGetal = 0;
            for (int i = 1; i < intArray.Length; i++)
            {
                if (intArray[i] < kleinsteGetal)
                {
                    kleinsteGetal = intArray[i];
                    aantalKeerKleinsteGetal = 1;
                    indexLaatsteKeerKleinsteGetal = i;
                }
                else if (intArray[i] == kleinsteGetal)
                {
                    aantalKeerKleinsteGetal++;
                    indexLaatsteKeerKleinsteGetal = i;
                }
                else { /* getal is groter. */ }
            }
            indexLaatsteKeerKleinsteGetal++; // mensen werken niet met index 0... sukkelaars

            // alles afdrukken:
            Console.WriteLine("--------");
            Console.WriteLine("Het grootste getal {0} kwam {1} keer voor, de eerste keer op index {2}.", grootsteGetal, aantalKeerGrootsteGetal, indexEersteKeerGrootsteGetal);
            Console.WriteLine("Het kleinste getal {0} kwam {1} keer voor, de laatste keer op index {2}.", kleinsteGetal, aantalKeerKleinsteGetal, indexLaatsteKeerKleinsteGetal);
        }
    }
```

### Oefening 17
```csharp
class Program
    {
        static Random random = new Random();

        static void Main(string[] args)
        {
            const int AANTAL_VERSCHILLENDE_GETALLEN = 100;
            const int AFSLUITWAARDE = 32767;
            int[] intArray = new int[AANTAL_VERSCHILLENDE_GETALLEN];
            int[] endArray;
            int ingelezenGetal;
            int teller = 0;
            do
            {
                // ingelezenGetal = random.Next(0, (AFSLUITWAARDE+1));
                ingelezenGetal = int.Parse(Console.ReadLine());
                if (intArray.Contains(ingelezenGetal))
                {
                    teller--;
                }
                else
                {
                    intArray[teller] = ingelezenGetal;
                }
                teller++;
            } while (ingelezenGetal != AFSLUITWAARDE);
            teller--;

            endArray = new int[teller];

            for (int i = 0; i < teller; i++)
            {
                endArray[i] = intArray[i];
            }
            
            Console.WriteLine("Aantal verschillende getallen: {0}", endArray.Length);
            Console.WriteLine("Getallen: ");

            foreach (int x in endArray)
            {
                Console.WriteLine(x);
            }
        }
    }
```

### Oefening 18
```csharp
class Program
    {
        static void Main(string[] args)
        {
            int STARTWAARDE = 2;
            const int EINDWAARDE = 100000;

            ArrayList nietPriem = new ArrayList();

            Console.WriteLine("Geduld aub, kan effe duren, we moeten {0} getallen doorlopen!", EINDWAARDE);

            for (int i = STARTWAARDE; i < EINDWAARDE; i++)
            {
                if (!nietPriem.Contains(i))
                {
                    for (int j = i * 2; j < EINDWAARDE; j += i)
                    {
                        if (!nietPriem.Contains(j))
                        {
                            nietPriem.Add(j);
                            Console.Write(j + " - ");
                        }
                    }
                }
            }

            for (int i = STARTWAARDE; i < EINDWAARDE; i++)
            {
                if (!nietPriem.Contains(i))
                {
                    Console.Write(i + " - ");
                }
            }
            Console.WriteLine("Dat zal het zijn :D");
        }
    }
```

### Oefening 19, a,b,c,d,e (work in progress)
```csharp
class Program
    {
        static void Main(string[] args)
        {
            const int AANTAL_LETTERS = 26;
            char[] letters = new char[AANTAL_LETTERS] { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
            const int AANTAL_KLINKERS = 6;
            char[] klinkers = new char[AANTAL_KLINKERS] { 'a', 'e', 'i', 'o', 'u', 'y' };

            string ingelezenString1 = "ik pak koekjes wanneer ik honger heb";
            string ingelezenString2 = "abcdefghijklmnopqrstuvwxyzzxwvutsrqponmlkjihgfedcba";

            //1a//Console.WriteLine(PalindroomCheck(ingelezenString2));
            //2b//Console.WriteLine(WoordenTeller(ingelezenString1));
            //3c//Console.WriteLine(AantalKeer_(ingelezenString1, char.Parse(Console.ReadLine())));
            //4d
            /*int[] waardes = AantalKeerElkeKlinker(ingelezenString1, klinkers);
            for (int i = 0; i < waardes.Length; i++)
            {
                Console.WriteLine("{0} - {1}", klinkers[i], waardes[i]);
            }*/
            //5e
            /*int[] waardes = AantalKeerElkeLetter(ingelezenString2, letters);
            for (int i = 0; i < waardes.Length; i++)
            {
                Console.WriteLine("{0} - {1}", letters[i], waardes[i]);
            }*/
            //6f
        }

        // 1
        static public bool PalindroomCheck(string controleString)
        {
            int charLeft = -1;
            int charRight = controleString.Length;

            do
            {
                charLeft++;
                charRight--;

            } while (charLeft < charRight && controleString[charLeft] == controleString[charRight]);

            if (charLeft < charRight)
                return false;
            return true;
        }

        // 2
        static public int WoordenTeller(string controleString)
        {
            return controleString.Split(" ").Length;
        }

        // 3
        static public int AantalKeer_(string controleString, char gekozenLetter)
        {
            int aantalGekozenLetter = 0;
            foreach (string woord in controleString.Split(" "))
            {
                foreach (char letter in woord)
                {
                    if (letter == gekozenLetter)
                    {
                        aantalGekozenLetter++;
                    }
                }
            }
            return aantalGekozenLetter;
        }

        // 4
        static public int[] AantalKeerElkeKlinker(string controleString, char[] klinkers)
        {
            int[] klinkersAantal = new int[klinkers.Length];
            for (int i = 0; i < controleString.Length; i++)
            {
                if (klinkers.Contains(controleString[i]))
                {
                    int index = Array.IndexOf(klinkers, controleString[i]);
                    klinkersAantal[index]++;
                }
            }
            return klinkersAantal;
        }

        // 5
        static public int[] AantalKeerElkeLetter(string controleString, char[] letters)
        {
            int[] lettersAantal = new int[letters.Length];
            for (int i = 0; i < controleString.Length; i++)
            {
                if (letters.Contains(controleString[i]))
                {
                    int index = Array.IndexOf(letters, controleString[i]);
                    lettersAantal[index]++;
                }
            }
            return lettersAantal;
        }

        // 6
        
    }
```
