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
            return (VERBRUIK / 100.0) * (20000 * ((DateTime.Today - Ingebruiknamedatum).Days / 365.0));
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
        private const double EXTRA_VERBRUIK = 1.2;
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
                return base.BerekenBrandstofVerbruik() * EXTRA_VERBRUIK;
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
        private const double EXTRA_VERBRUIK = 1.1;
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
                return base.BerekenBrandstofVerbruik() * EXTRA_VERBRUIK;
            return base.BerekenBrandstofVerbruik();
        }

        public override string ToString()
        {
            return base.ToString() + $"Zitplaatsen: {ZitPlaatsen}\nKoffervolume: {Koffervolume}";
        }
    }
```
## Oefening 4.3
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Product product = new Product("Leverancier", "Product", 20);
            Product food = new Food("Coca Cola", "MnM's", 8.49, new DateTime(2021, 2, 26), 18);
            Product nonFood = new NonFood("Samsung", "Galaxy S10+", 1599.99, 24, true, true);

            Winkel winkel = new Winkel("Ellermanstraat 33", "AliExpress");

            winkel.VoegProductToe(product);
            winkel.VoegProductToe(food);
            winkel.VoegProductToe(nonFood);

            Console.WriteLine(winkel);
        }
    }
```
### Klasse Winkel
```csharp
class Winkel
    {
        public string Adres { get; set; }
        public string Naam { get; set; }

        public Winkel(string adres, string naam)
        {
            Adres = adres;
            Naam = naam;
        }

        private List<Product> productenlijst = new List<Product>();

        public void VoegProductToe(Product product)
        {
            productenlijst.Add(product);
        }

        public string ProductenLijst()
        {
            StringBuilder result = new StringBuilder();
            foreach(Product product in productenlijst)
            {
                result.Append(product + "\n\n");
            }
            return result.ToString();
        }

        public override string ToString()
        {
            return $"Deze winkel ({Naam}) heeft de volgende producten in zijn assortiment:\n\n{ProductenLijst()}";
        }
    }
```
### Klasse Product
```csharp
class Product
{
    public string Leverancier { get; set; }
    public string Naam { get; set; }
    public double Verkoopprijs { get; set; }

    public Product(string leverancier, string naam, double verkoopprijs)
    {
        Leverancier = leverancier;
        Naam = naam;
        Verkoopprijs = verkoopprijs;
    }

    public virtual double BepaalPrijs()
    {
        return Verkoopprijs;
    }

    public override string ToString()
    {
        return $"Leverancier: {Leverancier}\nNaam: {Naam}\nVerkoopprijs: {Verkoopprijs}\n";
    }
}
```
### Klasse Food
```csharp
class Food : Product
{
    public DateTime Vervaldatum { get; set; }
    public int Koeltemperatuur { get; set; }

    public Food(string leverancier, string naam, double verkoopprijs, DateTime vervaldatum, int koeltemperatuur) : base(leverancier, naam, verkoopprijs)
    {
        Vervaldatum = vervaldatum;
        Koeltemperatuur = koeltemperatuur;
    }

    public double BepaalPrijs(int gewicht)
    {
        return base.BepaalPrijs() * (gewicht / 1000);
    }

    public override string ToString()
    {
        return base.ToString() + $"Koeltemperatuur: {Koeltemperatuur}\nVervaldatum: {Vervaldatum}\nPrijs per kg: {BepaalPrijs(1000)}";
    }
}
```
### Klasse NonFood
```csharp
class NonFood : Product
{
    public int GarantiePeriode { get; set; }
    public bool Fragiel { get; set; }
    public bool Batterij { get; set; }

    public NonFood(string leverancier, string naam, double verkoopprijs, int garantiePeriode, bool fragiel, bool batterij) : base(leverancier, naam, verkoopprijs)
    {
        GarantiePeriode = garantiePeriode;
        Fragiel = fragiel;
        Batterij = batterij;
    }

    public override string ToString()
    {
        return base.ToString() + $"Garantieperiode: {GarantiePeriode}\nFragiel: {Fragiel}\nBatterij: {Batterij}\nPrijs: {BepaalPrijs()}";
    }
}
```
## Oefening 4.4
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Artiest artiest = new Artiest("David", "Guetta", Muziekstijlen.Dance, "EDM");
            Festivalganger festivalganger = new Festivalganger("Maxim", "Janssens", Muziekstijlen.Dance, "EDM", 18, false, "Sint-Katelijne-Waver");
            Festival tomorrowland = new Festival("Tomorrowland", "Boom", new DateTime(2019, 7, 18));

            tomorrowland.VoegArtiestToe(artiest);
            tomorrowland.VoegFestivalgangerToe(festivalganger);

            Console.WriteLine(tomorrowland);
        }
    }
```
### Klasse Festival
```csharp
internal class Festival
    {
        private const double STANDAARD_KOSTPRIJS = 129.99;
        public string Naam { get; set; }
        public string Plaats { get; set; }
        private DateTime datum;

        public DateTime Datum
        {
            get { return datum; }
            set
            {
                if (value >= DateTime.Today)
                    datum = value;
                else
                    datum = DateTime.Today;
            }
        }
        private List<Festivalganger> festivalgangers = new List<Festivalganger>();
        private List<Artiest> artiesten = new List<Artiest>();

        public Festival(string naam, string plaats, DateTime datum)
        {
            Naam = naam;
            Plaats = plaats;
            Datum = datum;
        }

        public double BerekenInkomstPrijs(Festivalganger festivalganger)
        {
            if (Plaats == festivalganger.Plaats)
                return 0;
            if (festivalganger.Leeftijd >= 60 || festivalganger.Leeftijd <= 25 || festivalganger.HeeftHandicap)
                return STANDAARD_KOSTPRIJS * 0.5;
            return STANDAARD_KOSTPRIJS;
        }

        public void VoegFestivalgangerToe(Festivalganger festivalganger)
        {
            festivalgangers.Add(festivalganger);
        }
        public void VoegArtiestToe(Artiest artiest)
        {
            artiesten.Add(artiest);
        }

        public string Festivalgangers()
        {
            StringBuilder result = new StringBuilder();
            foreach (Festivalganger festivalganger in festivalgangers)
                result.Append(festivalganger + $"\nInkomstprijs: {BerekenInkomstPrijs(festivalganger).ToString("c")}");
            return result.ToString();
        }
        public string Artiesten()
        {
            StringBuilder result = new StringBuilder();
            foreach (Artiest artiest in artiesten)
                result.Append(artiest);
            return result.ToString();
        }

        public override string ToString()
        {
            return $"Naam festival: {Naam}\nPlaats: {Plaats}\nDatum: {Datum.ToShortDateString()}\n\nArtiesten:\n{Artiesten()}\n\nFestivalgangers:\n{Festivalgangers()}";
        }
    }
```
### Klasse Persoon
```csharp
enum Muziekstijlen { RAndB, Dance, Rock}
    class Persoon
    {
        public string Voornaam { get; set; }
        public string Naam { get; set; }
        public Muziekstijlen Muziekstijl { get; set; }
        public string Genre { get; set; }

        public Persoon(string voornaam, string naam, Muziekstijlen muziekstijl, string genre)
        {
            Voornaam = voornaam;
            Naam = naam;
            Muziekstijl = muziekstijl;
            Genre = genre;
        }

        public override string ToString()
        {
            return $"Voornaam: {Voornaam}\nNaam: {Naam}\nMuziekstijl: {Muziekstijl}, Genre: {Genre}";
        }
    }
```
### Klasse Artiest
```csharp
class Artiest : Persoon
    {
        public Artiest(string voornaam, string naam, Muziekstijlen muziekstijl, string genre) : base(voornaam, naam, muziekstijl, genre)
        {
        }
    }
```
### Klasse Festivalganger
```csharp
class Festivalganger : Persoon
    {
        public int Leeftijd { get; set; }
        public bool HeeftHandicap { get; set; }
        public string Plaats { get; set; }
        public Festivalganger(string voornaam, string naam, Muziekstijlen muziekstijl, string genre, int leeftijd, bool heeftHandicap, string plaats) : base(voornaam, naam, muziekstijl, genre)
        {
            Leeftijd = leeftijd;
            HeeftHandicap = heeftHandicap;
            Plaats = plaats;
        }

        public override string ToString()
        {
            return base.ToString() + $"\nLeeftijd: {Leeftijd}";
        }


    }
```
