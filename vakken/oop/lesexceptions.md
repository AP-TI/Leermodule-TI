# Les exceptions
## Oefening 1
```csharp
class Program
    {
        static void Main(string[] args)
        {
            int getal;
            Console.Write("Geef een getal: ");
            try
            {
                getal = int.Parse(Console.ReadLine());
                Console.WriteLine("Het getal is {0}", getal);
            }
            catch (Exception)
            {
                Console.WriteLine("Er is iets fout gegaan");
            }
        }
    }
```
#### Extra 1: FormatException + OverflowException
```csharp
class Program
    {
        static void Main(string[] args)
        {
            int getal;
            Console.Write("Geef een getal: ");
            try
            {
                getal = int.Parse(Console.ReadLine());
                Console.WriteLine("Het getal is {0}", getal);
            }
            catch (FormatException e)
            {
                Console.WriteLine("Je mag enkel cijfers gebruiken");
            }
            catch(OverflowException e)
            {
                Console.WriteLine("Je getal is te groot");
            }
        }
    }
```
#### Extra 2: Blijven vragen tot de gebruiker een getal meegeeft
```csharp
class Program
    {
        static void Main(string[] args)
        {
            bool getalOk = false;

            do
            {
                int getal;
                Console.Write("Geef een getal: ");
                try
                {
                    getal = int.Parse(Console.ReadLine());
                    Console.WriteLine("Het getal is {0}", getal);
                    getalOk = true;
                }
                catch (FormatException e)
                {
                    Console.WriteLine("Je mag enkel cijfers gebruiken");
                }
                catch (OverflowException e)
                {
                    Console.WriteLine("Je getal is te groot");
                }
            }while(!getalOk);

        }
    }
```
#### Extra 3: Som van 3 getallen
```csharp
internal class Program
    {
        private static void Main(string[] args)
        {
            bool getalOk = false;

            int[] getallen = new int[3];
            for (int i = 0; i < 3; i++)
            {
                int getal;
                Console.Write($"Geef getal {i + 1}/3: ");

                do
                {
                    try
                    {
                        getal = int.Parse(Console.ReadLine());
                        getallen[i] = getal;
                        getalOk = true;
                    }
                    catch (FormatException)
                    {
                        Console.WriteLine("Je mag enkel cijfers gebruiken");
                    }
                    catch (OverflowException)
                    {
                        Console.WriteLine("Je getal is te groot");
                    }
                } while (!getalOk);
                getalOk = false;
                int som = 0;
                foreach (int x in getallen)
                    som += x;
                Console.WriteLine(som);
            }
        }
    }
```
