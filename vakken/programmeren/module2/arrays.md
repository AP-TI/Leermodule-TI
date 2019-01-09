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

### Oefening 20
```csharp
class Program
{
    static void Main(string[] args)
    {
        const int RIJEN = 2;
        const int KOLOMMEN = 3;

        int[,] matrix1 = new int[RIJEN, KOLOMMEN];
        int[,] matrix2 = new int[RIJEN, KOLOMMEN];
        int[,] uitkomst = new int[RIJEN, KOLOMMEN];

        Console.WriteLine("Eerste array");

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                matrix1[teller, teller2] = int.Parse(Console.ReadLine());
            }
        }

        Console.WriteLine("Tweede array");

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                matrix2[teller, teller2] = int.Parse(Console.ReadLine());
            }
        }

        Console.WriteLine("Bewerking");

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                uitkomst[teller, teller2] = matrix1[teller, teller2] + matrix2[teller, teller2];
            }
        }

        Console.WriteLine("Uitkomst");

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                Console.Write(uitkomst[teller, teller2]);
                Console.Write(" ");
            }
            Console.WriteLine();
        }
    }
}
```

### Oefening 21
```csharp
class Program
{
    static void Main(string[] args)
    {
        const int RIJEN = 2;
        const int KOLOMMEN = 3;

        int[,] matrix = new int[RIJEN, KOLOMMEN];
        int[,] matrixT = new int[KOLOMMEN, RIJEN];

        Console.WriteLine("Eerste array ingeven");

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                matrix[teller, teller2] = int.Parse(Console.ReadLine());
            }
        }

        Console.WriteLine("Eerste array:");

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                Console.Write(matrix[teller, teller2]);
                Console.Write(" ");
            }
            Console.WriteLine();
        }

        Console.WriteLine("Getransponeerde matrix:");

        for (int teller = 0; teller < KOLOMMEN; teller++)
        {
            for (int teller2 = 0; teller2 < RIJEN; teller2++)
            {
                matrixT[teller, teller2] = matrix[teller2, teller];
                Console.Write(matrixT[teller, teller2]);
                Console.Write(" ");
            }
            Console.WriteLine();
        }
    }
}
```

### Oefening 22
```csharp
class Program
{
    static void Main(string[] args)
    {
        const int RIJEN = 3;
        const int KOLOMMEN = 3;
        bool symmetrisch = true;

        int[,] matrix = new int[RIJEN, KOLOMMEN];

        Console.WriteLine("Eerste array ingeven");

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                matrix[teller, teller2] = int.Parse(Console.ReadLine());
            }
        }

        Console.WriteLine("Eerste array:");

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                Console.Write(matrix[teller, teller2]);
                Console.Write(" ");
            }
            Console.WriteLine();
        }

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                if (matrix[teller, teller2] != matrix[teller2, teller])
                     symmetrisch = false;
            }
        }

        Console.WriteLine("symmetrisch: {0}", symmetrisch);
    }
}
```

### Oefening 23
```csharp
class Program
{
    static void Main(string[] args)
    {
        const int RIJEN = 3;
        const int KOLOMMEN = 3;

        bool diagonaal = true;

        int[,] matrix = new int[RIJEN, KOLOMMEN];

        Console.WriteLine("Eerste array ingeven");

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                matrix[teller, teller2] = int.Parse(Console.ReadLine());
            }
        }

        Console.WriteLine("Eerste array:");

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                Console.Write(matrix[teller, teller2]);
                Console.Write(" ");
            }
            Console.WriteLine();
        }

        for (int teller = 0; teller < RIJEN; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN; teller2++)
            {
                if ((teller == teller2) && (matrix[teller, teller2] == 1))
                    diagonaal = true;
                else if (matrix[teller, teller2] == 0)
                    diagonaal = true;
                else
                    diagonaal = false;
            }
        }
        Console.WriteLine("Diagonaal matrix: {0}", diagonaal);
    }
}
```

### Oefening 26, 27
```csharp
class Program
{
    static void Main(string[] args)
    {
        const int RIJEN_MATRIX1 = 4;
        const int KOLOMMEN_MATRIX1 = 3;
        const int RIJEN_MATRIX2 = 3;
        const int KOLOMMEN_MATRIX2 = 2;

        int[,] matrix1 = new int[RIJEN_MATRIX1, KOLOMMEN_MATRIX1];
        int[,] matrix2 = new int[RIJEN_MATRIX2, KOLOMMEN_MATRIX2];
        int[,] uitkomst = new int[RIJEN_MATRIX1, KOLOMMEN_MATRIX2];

        Console.WriteLine("Enter Matrix 1: ");

        for (int teller = 0; teller < RIJEN_MATRIX1; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN_MATRIX1; teller2++)
            {
                matrix1[teller, teller2] = int.Parse(Console.ReadLine());
            }
        }

        Console.WriteLine("Enter Matrix 2: ");

        for (int teller = 0; teller < RIJEN_MATRIX2; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN_MATRIX2; teller2++)
            {
                matrix2[teller, teller2] = int.Parse(Console.ReadLine());
            }
        }

        Console.WriteLine("Matrix 1: ");

        for (int teller = 0; teller < RIJEN_MATRIX1; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN_MATRIX1; teller2++)
            {
                Console.Write(matrix1[teller, teller2]);
                Console.Write(" ");
            }
            Console.WriteLine();
        }

        Console.WriteLine("Matrix 2: ");

        for (int teller = 0; teller < RIJEN_MATRIX2; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN_MATRIX2; teller2++)
            {
                Console.Write(matrix2[teller, teller2]);
                Console.Write(" ");
            }
            Console.WriteLine();
        }

        Console.WriteLine("Uitkomst: ");

        for (int teller = 0; teller < RIJEN_MATRIX1; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN_MATRIX2; teller2++)
            {
                //Dit kan ook zonder de for(met teller3) dan natuurlijk maar dan werkt dit niet meer voor oefening 27
                //uitkomst[teller, teller2] = (matrix1[teller, 0] * matrix2[0, teller2]) + (matrix1[teller, 1] * matrix2[1, teller2])
                for (int teller3 = 0; teller3 < KOLOMMEN_MATRIX1 /*Dit mag ook RIJEN_MATRIX2 zijn*/; teller3++)
                {
                    uitkomst[teller, teller2] += (matrix1[teller, teller3] * matrix2[teller3, teller2]);
                }
            }
        }

        for (int teller = 0; teller < RIJEN_MATRIX1; teller++)
        {
            for (int teller2 = 0; teller2 < KOLOMMEN_MATRIX2; teller2++)
            {
                Console.Write(uitkomst[teller, teller2]);
                Console.Write(" ");
            }
            Console.WriteLine();
        }
    }
}
```

### Oefening 28
#### Class Program
```csharp
class Program
{
    static void Main(string[] args)
    {
        const int RIJEN = 3;
        const int KOLOMMEN = 3;
        Matrix matrix1 = new Matrix(new int[RIJEN, KOLOMMEN]);
        Matrix matrix2 = new Matrix(new int[RIJEN, KOLOMMEN]);
        Matrix uitkomst = new Matrix(new int[RIJEN, KOLOMMEN]);


        Console.WriteLine("Enter eerste array");

        for (int teller = 0; teller < matrix1.Rows; teller++)
        {
            for (int teller2 = 0; teller2 < matrix1.Columns; teller2++)
            {
                matrix1.Array[teller, teller2] = int.Parse(Console.ReadLine());
            }
        }

        Console.WriteLine("Enter tweede array");

        for (int teller = 0; teller < matrix2.Rows; teller++)
        {
            for (int teller2 = 0; teller2 < matrix2.Columns; teller2++)
            {
                matrix2.Array[teller, teller2] = int.Parse(Console.ReadLine());
            }
        }

        Console.WriteLine("Eerste array:");

        Console.WriteLine(matrix1);

        Console.WriteLine("Tweede array:");

        Console.WriteLine(matrix2);

        Console.WriteLine("Bewerkingen: ");

        Console.WriteLine("Som");

        Console.WriteLine(Matrix.Sum(matrix1, matrix2));

        Console.WriteLine("Verschil");

        Console.WriteLine(Matrix.Difference(matrix1, matrix2));

        Console.WriteLine("Product");

        Console.WriteLine(Matrix.Product(matrix1, matrix2));

        Console.WriteLine("Transpose");

        Console.WriteLine(matrix1.Transpose());
    }
}
```
#### Class Matrix
```csharp
enum Bewerkingen { Sum, Difference, Product };
class Matrix
{
    public const int COLUMN = 1;
    public const int ROW = 0;

    public int[,] Array { get; set; }
    public int Rows { get; set; }
    public int Columns { get; set; }

    public Matrix(int[,] sArray)
    {
        this.Array = sArray;
        this.Rows = this.Array.GetLength(ROW);
        this.Columns = this.Array.GetLength(COLUMN);
    }

    public bool IsPossible(Bewerkingen bewerking, Matrix matrix1, Matrix matrix2)
    {
        bool possible = false;

        switch (bewerking)
        {
            case Bewerkingen.Sum:
                if ((matrix1.Rows == matrix1.Rows) && (matrix1.Columns == matrix2.Columns))
                    possible = true;
                break;
            case Bewerkingen.Difference:
                if ((matrix1.Rows == matrix1.Rows) && (matrix1.Columns == matrix2.Columns))
                    possible = true;
                break;
            case Bewerkingen.Product:
                if (matrix1.Columns == matrix2.Rows)
                    possible = true;
                break;
            default:
                possible = false;
                break;
        }

        return possible;
    }

    public Matrix Transpose()
    {
        int[,] tussenstap = new int[Rows, Columns];

        for (int teller = 0; teller < Columns; teller++)
        {
            for (int teller2 = 0; teller2 < Rows; teller2++)
            {
                tussenstap[teller, teller2] = Array[teller2, teller];
            }
        }

        return new Matrix(tussenstap);
    }

    public override string ToString()
    {
        StringBuilder matrixString = new StringBuilder();

        for (int teller = 0; teller < this.Rows; teller++)
        {
            for (int teller2 = 0; teller2 < this.Columns; teller2++)
            {
                matrixString.Append(this.Array[teller, teller2]);
                matrixString.Append(" ");
            }
            matrixString.AppendLine();
        }

        return matrixString.ToString();
    }

    static public Matrix Product(Matrix matrix1, Matrix matrix2)
    {
        Matrix uitkomst = new Matrix(new int[matrix1.Rows, matrix1.Columns]);

        for (int teller = 0; teller < matrix1.Rows; teller++)
        {
            for (int teller2 = 0; teller2 < matrix2.Columns; teller2++)
            {
                for (int teller3 = 0; teller3 < matrix1.Columns /*Dit mag ook RIJEN_MATRIX2 zijn*/; teller3++)
                {
                    uitkomst.Array[teller, teller2] += (matrix1.Array[teller, teller3] * matrix2.Array[teller3, teller2]);
                }
            }
        }

        return uitkomst;
    }

    static public Matrix Difference(Matrix matrix1, Matrix matrix2)
    {
        Matrix uitkomst = new Matrix(new int[matrix1.Rows, matrix1.Columns]);

        for (int teller = 0; teller < matrix1.Rows; teller++)
        {
            for (int teller2 = 0; teller2 < matrix1.Columns; teller2++)
            {
                uitkomst.Array[teller, teller2] = matrix1.Array[teller, teller2] - matrix2.Array[teller, teller2];
            }
        }

        return uitkomst;
    }

    static public Matrix Sum(Matrix matrix1, Matrix matrix2)
    {
        Matrix uitkomst = new Matrix(new int[matrix1.Rows, matrix1.Columns]);

        for (int teller = 0; teller < matrix1.Rows; teller++)
        {
            for (int teller2 = 0; teller2 < matrix1.Columns; teller2++)
            {
                uitkomst.Array[teller, teller2] = matrix1.Array[teller, teller2] + matrix2.Array[teller, teller2];
            }
        }

        return uitkomst;
    }
}
```

### Oefening 29
```csharp
class Program
{
    static Random random = new Random();
    static void Main(string[] args)
    {
        const int AANTAL_LEERLINGEN = 30;
        const int AANTAL_VAKKEN = 12;

        int[,] punten = new int[AANTAL_LEERLINGEN, AANTAL_VAKKEN];
        double[] gemStudent = new double[AANTAL_LEERLINGEN];
        double[] gemVakken = new double[AANTAL_VAKKEN];

        for (int teller = 0; teller < AANTAL_LEERLINGEN; teller++)
        {
            for (int teller2 = 0; teller2 < AANTAL_VAKKEN; teller2++)
            {
                punten[teller, teller2] = random.Next(11);
            }
        }

        for (int teller = 0; teller < AANTAL_LEERLINGEN; teller++)
        {
            for (int teller2 = 0; teller2 < AANTAL_VAKKEN; teller2++)
            {
                gemStudent[teller] += punten[teller, teller2] / 12D;
            }
        }

        for (int teller = 0; teller < AANTAL_VAKKEN; teller++)
        {
            for (int teller2 = 0; teller2 < AANTAL_LEERLINGEN; teller2++)
            {
                gemVakken[teller] += punten[teller2, teller] / 30D;
            }
        }

        for (int teller = 0; teller < AANTAL_LEERLINGEN; teller++)
        {
            Console.Write(Math.Round(gemStudent[teller], 2));
            Console.Write(' ');
        }

        Console.WriteLine();

        for (int teller = 0; teller < AANTAL_VAKKEN; teller++)
        {
            Console.Write(Math.Round(gemVakken[teller], 2));
            Console.Write(' ');
        }
    }
}
```

### Oefening 30
#### Class Program
```csharp
class Program
{
    static void Main(string[] args)
    {
        const int AFSLUIT_WAARDE = 32767;
        bool afsluiten = false;

        CheckTabel tabel = new CheckTabel(0, 99);

        do
        {
            tabel.AddNumber(int.Parse(Console.ReadLine()));
        } while (tabel.LastReceivedNumber != AFSLUIT_WAARDE);

        Console.WriteLine(tabel);
    }
}
```
#### Class CheckTabel
```csharp
class CheckTabel
{
    public const int AANTAL_KOLOMMEN = 2;
    public const int DEFAULT_RIJEN = 1;
    public int[,] Table { get; set; }
    public int Minimum { get; set; }
    public int Maximum { get; set; }
    public int LastReceivedNumber { get; set; }

    public CheckTabel(int minimum, int maximum)
    {
        this.Minimum = minimum;
        this.Maximum = maximum;
        this.Table = new int[DEFAULT_RIJEN, AANTAL_KOLOMMEN];
    }

    public int CheckIfNumberLegit(int number)
    {
        int checkNumber = 0;
        if(number <= this.Maximum && number >= this.Minimum)
        {
            for (int teller = 0; teller < this.Table.GetLength(0); teller++)
            {
                if (this.Table[teller, 0] == number)
                    checkNumber = 1;
            }
        }
        else
        {
            checkNumber = 2;
        }
        return checkNumber;
    }

    public void AddNumber(int number)
    {
        this.LastReceivedNumber = number;
        switch (CheckIfNumberLegit(number))
        {
            case 0: //Als het nummer nog niet in de tabel staat

                this.Table = CheckTabel.ExpandTabel(this.Table);
                this.Table[this.Table.GetLength(0) - 1, 0] = number;
                this.Table[this.Table.GetLength(0) - 1, 1]++;

            break;
            case 1: //Als het nummer al in de tabel staat

                for (int teller = 0; teller < this.Table.GetLength(0); teller++)
                {
                    if (this.Table[teller, 0] == number)
                        this.Table[teller, 1]++;
                }

            break;
            case 2:

            break;
            default:

            break;
        }
    }

    public static int[,] ExpandTabel(int[,] table)
    {
        int[,] cTabel = new int[table.GetLength(0) + 1, AANTAL_KOLOMMEN];

        for (int teller = 0; teller < table.GetLength(0); teller++)
        {
            for (int teller2 = 0; teller2 < table.GetLength(1); teller2++)
            {
                cTabel[teller, teller2] = table[teller, teller2];
            }
        }
        return cTabel;
    }

    public override string ToString()
    {
        StringBuilder output = new StringBuilder();
        output.Append("Nummers" + '\t' + "Aantal" + '\n');
        for (int teller = 0; teller < this.Table.GetLength(0); teller++)
        {
            for (int teller2 = 0; teller2 < this.Table.GetLength(1); teller2++)
            {
                output.Append(this.Table[teller, teller2]);
                output.Append('\t');
            }
            output.Append('\n');
        }
        return output.ToString();
    }
}
```
