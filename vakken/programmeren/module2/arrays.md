# Programmeren 2
## Arrays
### Oefening 5
```csharp
static Random random = new Random();
        static void Main(string[] args)
        {
            const int AANTALGETALLEN = 101;
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