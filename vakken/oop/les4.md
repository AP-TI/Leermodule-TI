# Les 4
## Oefening 4.1
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Hond hond = new Hond("Luka", 20, 2000, Oorgroottes.Kort);
            Huisdier huisdier = new Huisdier("dier", 1, 2019);
            Kat vlekkie = new Kat("Vlekkie", 4.1, 2016, Vachtlengtes.Kort);

            Console.WriteLine($"{hond}\n\n{huisdier}\n\n{vlekkie}");
        }
    }
```
### Klasse Huisdier
```csharp
internal class Huisdier
    {
        public Huisdier(string naam, double gewicht, int geboortejaar)
        {
            Naam = naam;
            Gewicht = gewicht;
            Geboortejaar = geboortejaar;
        }

        public string Naam { get; set; }
        public double Gewicht { get; set; }
        public int Geboortejaar { get; set; }

        public int BerekenLeeftijd()
        {
            return DateTime.Today.Year - Geboortejaar;
        }

        public virtual string Geluid()
        {
            return "grom grom";
        }

        public override string ToString()
        {
            return $"Naam: {Naam}\nGewicht: {Gewicht}\nGeboortejaar: {Geboortejaar}\nGeluid: {Geluid()}";
        }
    }
```
### Klasse Hond
```csharp
internal enum Oorgroottes { Kort, Lang }

    internal class Hond : Huisdier
    {
        public Hond(string naam, double gewicht, int geboortejaar, Oorgroottes oorgrootte) :base(naam, gewicht, geboortejaar)
        {
            Oorgrootte = oorgrootte;
        }
        public Oorgroottes Oorgrootte { get; set; }

        public override string Geluid()
        {
            return "waf waf";
        }
        public override string ToString()
        {
            return $"{base.ToString()}\nOorgrootte: {Oorgrootte}";
        }
    }
```
### Klasse Kat
```csharp
enum Vachtlengtes { Kort, Lang}
    class Kat : Huisdier
    {
        public Kat(string naam, double gewicht, int geboortejaar, Vachtlengtes vachtlengte) :base(naam, gewicht, geboortejaar)
        {
            Vachtlengte = vachtlengte;
        }

        public Vachtlengtes Vachtlengte { get; set; }

        public override string Geluid()
        {
            return "miauw miauw";
        }

        public override string ToString()
        {
            return $"{base.ToString()}\nVachtlengte: {Vachtlengte}";
        }
    }
```
