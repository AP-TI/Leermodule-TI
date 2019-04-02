
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(Faculteit(65));
        }
        private static ulong Faculteit(ulong getal)
        {
            if (getal <= 1)
                return 1;
            return getal * Faculteit(getal - 1);
        }
    }
```
