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
