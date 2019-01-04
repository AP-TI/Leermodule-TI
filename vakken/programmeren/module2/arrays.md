# Programmeren 2
## Arrays
### Oefening 1
```csharp
static void Main(string[] args)
        {
            const int AANTALGETALLEN = 20;
            int[] getallen = new int[AANTALGETALLEN];

            for (int teller = 0; teller < AANTALGETALLEN; teller++)
            {
                Console.Write("Geef een getal({0}/{1}): ", teller + 1, AANTALGETALLEN);
                getallen[teller] = int.Parse(Console.ReadLine());
            }
            for (int teller = AANTALGETALLEN - 1; teller >= 0; teller--)
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
                Console.Write("Geef getal({0}/{1}): ", teller + 1, AANTAL_GETALLEN);
                getallen[teller] = int.Parse(Console.ReadLine());
            }
            for(int teller = 0; teller < AANTAL_GETALLEN ; teller++)
            {
                Console.WriteLine(getallen[(teller + AANTAL_OP_TE_SCHUIVEN_GETALLEN) % getallen.Length]);
            }
        }
```
### Oefening 3
```csharp
static void Main(string[] args)
        {
            const int AANTALGETALLEN = 20;
            int[] getallen = new int[AANTALGETALLEN];

            for(int teller = 0; teller < AANTALGETALLEN; teller++)
            {
                Console.Write("Geef getal({0}/{1}): ", teller + 1, AANTALGETALLEN);
                getallen[teller] = int.Parse(Console.ReadLine());
            }
            for(int teller = AANTALGETALLEN - 3; teller < AANTALGETALLEN; teller++)
            {
                Console.WriteLine(getallen[teller]);
            }
            for(int teller = 0; teller < AANTALGETALLEN - 3; teller++)
            {
                Console.WriteLine(getallen[teller]);
            }

        }
```
### Oefening 4
```csharp
static void Main(string[] args)
        {
            const int AANTALGETALLEN = 5;
            int rotatieGetal;
            int[] getallen = new int[AANTALGETALLEN];

            Console.Write("Geef het rotatiegetal: ");
            rotatieGetal = int.Parse(Console.ReadLine());
            for (int teller = 0; teller < AANTALGETALLEN; teller++)
            {
                Console.Write("Geef getal({0}/{1}): ", teller + 1, AANTALGETALLEN);
                getallen[teller] = int.Parse(Console.ReadLine());
            }
            for (int teller = 0; teller < AANTALGETALLEN; teller++)
            {
                Console.WriteLine(getallen[(teller + rotatieGetal + AANTALGETALLEN) % AANTALGETALLEN]);
            }
        }
```
### Oefening 5
```csharp
static Random random = new Random();
        static void Main(string[] args)
        {
            const int AANTALGETALLEN = 100;
            int[] getallen = new int[AANTALGETALLEN];
            int tussenVariabele;


            for(int teller = 0; teller < AANTALGETALLEN; teller++)
            {
                getallen[teller] = random.Next(1000);
            }


            for (int teller = 0; teller < AANTALGETALLEN - AANTALGETALLEN % 3; teller += 3)
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
            if (AANTALGETALLEN % 3 == 2 && getallen[AANTALGETALLEN - 1] < getallen[AANTALGETALLEN - 2])
            {
                tussenVariabele = getallen[AANTALGETALLEN - 1];
                getallen[AANTALGETALLEN - 1] = getallen[AANTALGETALLEN - 2];
                getallen[AANTALGETALLEN - 2] = tussenVariabele;
            }
            for (int teller = 0; teller < AANTALGETALLEN; teller += 3)
            {
                for (int teller1 = teller; teller1 < teller + 3 && teller1 < AANTALGETALLEN; teller1++)
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
