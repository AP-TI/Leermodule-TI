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
## Oefenign 4.2
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Wagen wagen = new Wagen("Citroen", "Berlingo", 20, new DateTime(2010, 2, 14), "1-ABC-302");
            Sportwagen sportwagen = new Sportwagen("Porsche", "911", 400, new DateTime(2018, 4, 12), "mixxamm", 530, 6);
            Gezinswagen gezinswagen = new Gezinswagen("Škoda", "Octavia", 200, new DateTime(2015, 2, 19), "1-CSP-137", 450, 7);

            Console.WriteLine($"{wagen}\n\n{sportwagen}\n\n{gezinswagen}");
        }
    }
```
### Klasse Wagen
```csharp
internal class Wagen
    {
        protected const int VERBRUIK = 5;
        public string Merk { get; set; }
        public string Type { get; set; }
        public int Kilometers { get; set; }
        private DateTime ingebruiknamedatum;

        public DateTime Ingebruiknamedatum
        {
            get { return ingebruiknamedatum; }
            set
            {
                if (value >= new DateTime(1886, 1, 1) && value <= DateTime.Today)
                    ingebruiknamedatum = value;
            }
        }

        private string nummerplaat;

        public string Nummerplaat
        {
            get { return nummerplaat; }
            set
            {
                if (value.Length >= 1 && value.Length <= 9)
                    nummerplaat = value;
                else
                    nummerplaat = "1-AAA-000";
            }
        }

        public Wagen(string merk, string type, int kilometers, DateTime ingebruiknamedatum, string nummerplaat)
        {
            Merk = merk;
            Type = type;
            Kilometers = kilometers;
            Ingebruiknamedatum = ingebruiknamedatum;
            Nummerplaat = nummerplaat;
        }

        public virtual double BerekenBrandstofVerbruik()
        {
            return VERBRUIK * (20000 * ((DateTime.Today - Ingebruiknamedatum).Days / 365.0));
        }

        public override string ToString()
        {
            return $"Merk: {Merk}\nType: {Type}\nKilometers: {Kilometers}\nIngebruiknamedatum: {Ingebruiknamedatum}\nNummerplaat: {Nummerplaat}\nBrandstofverbruik: {BerekenBrandstofVerbruik()}\n";
        }
    }
```
### Klasse Sportwagen
```csharp
class Sportwagen : Wagen
    {
        public int PK { get; set; }
        private int aantalVitessen;

        public int AantalVitessen
        {
            get { return aantalVitessen; }
            set
            {
                if (value <= 6 && value >= 1)
                    aantalVitessen = value;
                else
                    aantalVitessen = 5;
            }
        }


        public Sportwagen(string merk, string type, int kilometers, DateTime ingebruiknamedatum, string nummerplaat, int pk, int aantalVitessen) : base(merk, type, kilometers, ingebruiknamedatum, nummerplaat)
        {
            PK = pk;
            AantalVitessen = aantalVitessen;
        }

        public override double BerekenBrandstofVerbruik()
        {
            if(AantalVitessen == 6)
                return base.BerekenBrandstofVerbruik() * 1.2;
            return base.BerekenBrandstofVerbruik();
        }

        public override string ToString()
        {
            return base.ToString() + $"PK: {PK}\nAantal vitessen: {AantalVitessen}";
        }
    }
```
### Klasse Gezinswagen
```csharp
internal class Gezinswagen : Wagen
    {
        public int Koffervolume { get; set; }
        private int zitPlaatsen;

        public int ZitPlaatsen
        {
            get { return zitPlaatsen; }
            set
            {
                if (value >= 4 && value <= 7)
                    zitPlaatsen = value;
                else
                    zitPlaatsen = 5;
            }
        }

        public Gezinswagen(string merk, string type, int kilometers, DateTime ingebruiknamedatum, string nummerplaat, int kofferVolume, int zitPlaatsen) : base(merk, type, kilometers, ingebruiknamedatum, nummerplaat)
        {
            Koffervolume = kofferVolume;
            ZitPlaatsen = zitPlaatsen;
        }

        public override double BerekenBrandstofVerbruik()
        {
            if(ZitPlaatsen == 7)
                return base.BerekenBrandstofVerbruik() * 1.1;
            return base.BerekenBrandstofVerbruik();
        }

        public override string ToString()
        {
            return base.ToString() + $"Zitplaatsen: {ZitPlaatsen}\nKoffervolume: {Koffervolume}";
        }
    }
```
