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
## Oefening Oefening 2
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            try
            {
                Persoon persoon = new Persoon("Maxim", new DateTime(2000, 8, 24));
                /*Persoon persoon1 = new Persoon("Maxim", new DateTime(2001, 8, 24));
                Console.WriteLine(persoon1);*/
                //Uncomment bovenstaande 2 lijnen om een exception te laten throwen
                Console.WriteLine(persoon);

            }
            catch(Exception e)
            {
                Console.WriteLine(e.Message);
            }
        }
    }
```
### Klasse Persoon
```csharp
internal class Persoon
{
    public Persoon(string firstName, DateTime birthday)
    {
        FirstName = firstName;
        Birthday = birthday;
    }
    public string FirstName { get; set; }
    private DateTime birthday;

    public DateTime Birthday
    {
        get => birthday;
        set
        {
            Exception e = new Exception("Je mag geen minderjarig persoon aanmaken.");
            if (Age(value) >= 18)
                birthday = value;
            else
                throw e;

        }
    }

    public int Age(DateTime date)
    {
        int age = DateTime.Today.Year - date.Year;
        if (DateTime.Today.DayOfYear < date.DayOfYear)
            age--;
        return age;
    }

    public override string ToString()
    {
        return $"Voornaam: {FirstName}\nLeeftijd: {Age(Birthday)}";
    }
}
```
