# Les 3
## Oefening 3.1 (nog niet gecontroleerd)
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Film interstellar = new Film("Interstellar", "Legendary Pictures", "Christopher Nolan", "Sciencefiction", 2014, 5);
            Serie spongebob = new Serie("Spongebob", 10, 5);

            Console.WriteLine(interstellar);
            Console.WriteLine();
            Console.WriteLine(spongebob);
        }
    }
```
### Klasse Film
```csharp
class Film
    {
        public string Titel { get; set; }
        public string Producer { get; set; }
        public string Regisseur { get; set; }
        public string Genre { get; set; }
        public int Jaar { get; set; }
        private double rating;

        public double Rating
        {
            get { return rating; }
            set
            {
                if (value <= 5 && value >= 1)
                    rating = value;
                else
                    rating = 2.5;
            }
        }


        public Film(string titel, string producer, string regisseur, string genre, int jaar, double rating)
        {
            Titel = titel;
            Producer = producer;
            Regisseur = regisseur;
            Genre = genre;
            Jaar = jaar;
            Rating = rating;
        }
        public Film(string titel, string producer, string regisseur, string genre, int jaar) : this(titel, producer, regisseur, genre, jaar, 2.5) { }

        public override string ToString()
        {
            return $"Titel: {Titel}\nProducer: {Producer}\nRegisseur: {Regisseur}\nGenre: {Genre}\nJaar: {Jaar}\nRating: {Rating}";
        }

    }
```
### Klasse Serie
```csharp
class Serie
    {
        public string Titel { get; set; }
        public int Seizoenen { get; set; }
        private double rating;

        public double Rating
        {
            get { return rating; }
            set
            {
                if (value <= 5 && value >= 1)
                    rating = value;
                else
                    rating = 2.5;
            }
        }

        public Serie(string titel, int seizoenen, double rating)
        {
            Titel = titel;
            Seizoenen = seizoenen;
            Rating = rating;
        }

        public Serie(string titel, int seizoenen) : this(titel, seizoenen, 2.5) { }

        public override string ToString()
        {
            return $"Titel: {Titel}\nSeizoenen: {Seizoenen}\nRating: {Rating}";
        }

    }
```
#### Extra oefening 1: ratings toevoegen
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Film interstellar = new Film("Interstellar", "Legendary Pictures", "Christopher Nolan", "Sciencefiction", 2014, 5);
            Serie spongebob = new Serie("Spongebob", 10, 5);

            interstellar.VoegRatingToe(4);
            interstellar.VoegRatingToe(5);
            interstellar.VoegRatingToe(5);
            interstellar.VoegRatingToe(5);
            interstellar.VoegRatingToe(5);
            interstellar.VoegRatingToe(4);
            interstellar.VoegRatingToe(5);
            interstellar.VoegRatingToe(5);
            spongebob.VoegRatingToe(4);
            Console.WriteLine(interstellar);
            Console.WriteLine();
            Console.WriteLine(spongebob);
        }
    }
```
### Klasse Film
```csharp
class Film
    {
        List<double> ratings = new List<double>();
        public string Titel { get; set; }
        public string Producer { get; set; }
        public string Regisseur { get; set; }
        public string Genre { get; set; }
        public int Jaar { get; set; }
        private double rating;

        public double Rating
        {
            get { return rating; }
            set
            {
                if (value <= 5 && value >= 1)
                    rating = value;
                else
                    rating = 2.5;
            }
        }

        public Film(string titel, string producer, string regisseur, string genre, int jaar, double rating)
        {
            Titel = titel;
            Producer = producer;
            Regisseur = regisseur;
            Genre = genre;
            Jaar = jaar;
            VoegRatingToe(rating);
        }
        public Film(string titel, string producer, string regisseur, string genre, int jaar) : this(titel, producer, regisseur, genre, jaar, 2.5) { }

        public bool VoegRatingToe(double rating)
        {
            if(rating >= 1 && rating <= 5)
            {
                ratings.Add(rating);
                BerekenGemiddelde();
                return true;
            }
            return false;            
        }

        public void BerekenGemiddelde()
        {
            Rating = ratings.Average();
        }

        public override string ToString()
        {
            return $"Titel: {Titel}\nProducer: {Producer}\nRegisseur: {Regisseur}\nGenre: {Genre}\nJaar: {Jaar}\nRating: {Rating}";
        }

    }
```
### Klasse Serie
```csharp
class Serie
    {
        List<double> ratings = new List<double>();
        public string Titel { get; set; }
        public int Seizoenen { get; set; }
        private double rating;

        public double Rating
        {
            get { return rating; }
            set
            {
                if (value <= 5 && value >= 1)
                    rating = value;
                else
                    rating = 2.5;
            }
        }



        public Serie(string titel, int seizoenen, double rating)
        {
            Titel = titel;
            Seizoenen = seizoenen;
            VoegRatingToe(rating);
        }

        public Serie(string titel, int seizoenen) : this(titel, seizoenen, 2.5) { }

        public bool VoegRatingToe(double rating)
        {
            if (rating >= 1 && rating <= 5)
            {
                ratings.Add(rating);
                BerekenGemiddelde();
                return true;
            }
            return false;
        }

        public void BerekenGemiddelde()
        {
            Rating = ratings.Average();
        }

        public override string ToString()
        {
            return $"Titel: {Titel}\nSeizoenen: {Seizoenen}\nRating: {Rating}";
        }

    }
```
#### Extra oefening 2: laagste en hoogste ratings niet laten meetellen
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Film interstellar = new Film("Interstellar", "Legendary Pictures", "Christopher Nolan", "Sciencefiction", 2014, 5);
            Serie spongebob = new Serie("Spongebob", 10, 5);

            interstellar.VoegRatingToe(4);
            interstellar.VoegRatingToe(4.5);
            interstellar.VoegRatingToe(4.9);
            interstellar.VoegRatingToe(1);
            interstellar.VoegRatingToe(5);
            spongebob.VoegRatingToe(4);
            spongebob.VoegRatingToe(1.3);
            spongebob.VoegRatingToe(4.7);
            Console.WriteLine(interstellar);
            Console.WriteLine();
            Console.WriteLine(spongebob);
        }
    }
```
### Klasse Film
```csharp
internal class Film
    {
        private List<double> ratings = new List<double>();
        public string Titel { get; set; }
        public string Producer { get; set; }
        public string Regisseur { get; set; }
        public string Genre { get; set; }
        public int Jaar { get; set; }
        private double rating;

        public double Rating
        {
            get { return rating; }
            set
            {
                if (value <= 5 && value >= 1)
                    rating = value;
                else
                    rating = 2.5;
            }
        }

        public Film(string titel, string producer, string regisseur, string genre, int jaar, double rating)
        {
            Titel = titel;
            Producer = producer;
            Regisseur = regisseur;
            Genre = genre;
            Jaar = jaar;
            VoegRatingToe(rating);
        }
        public Film(string titel, string producer, string regisseur, string genre, int jaar) : this(titel, producer, regisseur, genre, jaar, 2.5) { }

        public bool VoegRatingToe(double rating)
        {
            if (rating >= 1 && rating <= 5)
            {
                ratings.Add(rating);
                BerekenGemiddelde();
                return true;
            }
            return false;
        }

        public void BerekenGemiddelde()
        {
            if (ratings.Count() > 2)
            {
                double ratingsTotaal = 0;
                int aantalRatings = 0;
                foreach (double rating in ratings)
                {
                    if (rating != ratings.Min() && rating != ratings.Max())
                    {
                        aantalRatings++;
                        ratingsTotaal += rating;
                    }
                }
                Rating = ratingsTotaal / aantalRatings;
            }
            else
                Rating = ratings.Average();
        }

        public override string ToString()
        {
            return $"Titel: {Titel}\nProducer: {Producer}\nRegisseur: {Regisseur}\nGenre: {Genre}\nJaar: {Jaar}\nRating: {Rating}";
        }

    }
```
### Klasse Serie
```csharp
internal class Serie
    {
        private List<double> ratings = new List<double>();
        public string Titel { get; set; }
        public int Seizoenen { get; set; }
        private double rating;

        public double Rating
        {
            get { return rating; }
            set
            {
                if (value <= 5 && value >= 1)
                    rating = value;
                else
                    rating = 2.5;
            }
        }



        public Serie(string titel, int seizoenen, double rating)
        {
            Titel = titel;
            Seizoenen = seizoenen;
            VoegRatingToe(rating);
        }

        public Serie(string titel, int seizoenen) : this(titel, seizoenen, 2.5) { }

        public bool VoegRatingToe(double rating)
        {
            if (rating >= 1 && rating <= 5)
            {
                ratings.Add(rating);
                BerekenGemiddelde();
                return true;
            }
            return false;
        }

        public void BerekenGemiddelde()
        {
            if (ratings.Count() > 2)
            {
                double ratingsTotaal = 0;
                int aantalRatings = 0;
                foreach (double rating in ratings)
                {
                    if (rating != ratings.Min() && rating != ratings.Max())
                    {
                        aantalRatings++;
                        ratingsTotaal += rating;
                    }
                }
                Rating = ratingsTotaal / aantalRatings;
            }
            else
                Rating = ratings.Average();
        }

        public override string ToString()
        {
            return $"Titel: {Titel}\nSeizoenen: {Seizoenen}\nRating: {Rating}";
        }

    }
```
#### Extra oefening 3: functionaliteit om acteurs toe te voegen aan films/series
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Film interstellar = new Film("Interstellar", "Legendary Pictures", "Christopher Nolan", "Sciencefiction", 2014, 5);
            Serie spongebob = new Serie("Spongebob", 10, 5);

            interstellar.VoegRatingToe(4);
            interstellar.VoegRatingToe(4.5);
            interstellar.VoegRatingToe(4.9);
            interstellar.VoegRatingToe(1);
            interstellar.VoegRatingToe(5);
            interstellar.VoegActeurToe(new Acteur("Matthew", "McConaughey"));
            interstellar.VoegActeurToe(new Acteur("Anne", "Hathaway"));
            interstellar.VoegActeurToe(new Acteur("Jessica", "Chastain"));
            interstellar.VoegActeurToe(new Acteur("Michael", "Caine"));
            interstellar.VoegActeurToe(new Acteur("Mackenzie", "Foy"));
            spongebob.VoegRatingToe(4);
            spongebob.VoegRatingToe(1.3);
            spongebob.VoegRatingToe(4.7);
            Console.WriteLine(interstellar);
            Console.WriteLine(spongebob);
        }
    }
```
### Klasse Acteur
```csharp
class Acteur
    {
        public Acteur(string voornaam, string naam)
        {
            Voornaam = voornaam;
            Naam = naam;
        }

        public string Voornaam { get; set; }
        public string Naam { get; set; }

        public override string ToString()
        {
            return $"Voornaam: {Voornaam}\nAchternaam: {Naam}";
        }
    }
```
### Klasse Film
```csharp
internal class Film
    {
        private List<double> ratings = new List<double>();
        private List<Acteur> acteurs = new List<Acteur>();
        public string Titel { get; set; }
        public string Producer { get; set; }
        public string Regisseur { get; set; }
        public string Genre { get; set; }
        public int Jaar { get; set; }
        private double rating;

        public double Rating
        {
            get { return rating; }
            set
            {
                if (value <= 5 && value >= 1)
                    rating = value;
                else
                    rating = 2.5;
            }
        }

        public Film(string titel, string producer, string regisseur, string genre, int jaar, double rating)
        {
            Titel = titel;
            Producer = producer;
            Regisseur = regisseur;
            Genre = genre;
            Jaar = jaar;
            VoegRatingToe(rating);
        }
        public Film(string titel, string producer, string regisseur, string genre, int jaar) : this(titel, producer, regisseur, genre, jaar, 2.5) { }

        public bool VoegRatingToe(double rating)
        {
            if (rating >= 1 && rating <= 5)
            {
                ratings.Add(rating);
                BerekenGemiddelde();
                return true;
            }
            return false;
        }

        public bool VoegActeurToe(Acteur acteur)
        {
            acteurs.Add(acteur);
            return true;
        }

        public string ActeurLijst()
        {
            string result = "";
            if (acteurs.Count() != 0)
            {
                foreach (Acteur acteur in acteurs)
                {
                    result += $"{acteur}\n\n";
                }
            }
            else
                result = "Geen acteurs gevonden.";
            return result;
        }

        public void BerekenGemiddelde()
        {
            if (ratings.Count() > 2)
            {
                double ratingsTotaal = 0;
                int aantalRatings = 0;
                foreach (double rating in ratings)
                {
                    if (rating != ratings.Min() && rating != ratings.Max())
                    {
                        aantalRatings++;
                        ratingsTotaal += rating;
                    }
                }
                Rating = ratingsTotaal / aantalRatings;
            }
            else
                Rating = ratings.Average();
        }

        public override string ToString()
        {
            return $"Titel: {Titel}\nProducer: {Producer}\nRegisseur: {Regisseur}\nGenre: {Genre}\nJaar: {Jaar}\nRating: {Rating}\n\nActeurlijst:\n{ActeurLijst()}";
        }

    }
```
### Klasse Serie
```csharp
internal class Serie
    {
        private List<double> ratings = new List<double>();
        private List<Acteur> acteurs = new List<Acteur>();
        public string Titel { get; set; }
        public int Seizoenen { get; set; }
        private double rating;

        public double Rating
        {
            get { return rating; }
            set
            {
                if (value <= 5 && value >= 1)
                    rating = value;
                else
                    rating = 2.5;
            }
        }



        public Serie(string titel, int seizoenen, double rating)
        {
            Titel = titel;
            Seizoenen = seizoenen;
            VoegRatingToe(rating);
        }

        public Serie(string titel, int seizoenen) : this(titel, seizoenen, 2.5) { }

        public bool VoegRatingToe(double rating)
        {
            if (rating >= 1 && rating <= 5)
            {
                ratings.Add(rating);
                BerekenGemiddelde();
                return true;
            }
            return false;
        }

        public bool VoegActeurToe(Acteur acteur)
        {
            acteurs.Add(acteur);
            return true;
        }

        public string ActeurLijst()
        {
            string result = "";
            if (acteurs.Count() != 0)
            {
                foreach (Acteur acteur in acteurs)
                {
                    result += $"{acteur}\n\n";
                }
            }
            else
                result = "Geen acteurs gevonden.";
            return result;
        }

        public void BerekenGemiddelde()
        {
            if (ratings.Count() > 2)
            {
                double ratingsTotaal = 0;
                int aantalRatings = 0;
                foreach (double rating in ratings)
                {
                    if (rating != ratings.Min() && rating != ratings.Max())
                    {
                        aantalRatings++;
                        ratingsTotaal += rating;
                    }
                }
                Rating = ratingsTotaal / aantalRatings;
            }
            else
                Rating = ratings.Average();
        }

        public override string ToString()
        {
            return $"Titel: {Titel}\nSeizoenen: {Seizoenen}\nRating: {Rating}\n\nActeurlijst:\n{ActeurLijst()}";
        }

    }
```
## Oefening 3.2 (Nog niet nagekeken)
#### Met alle extra's:
### Klasse Program
```csharp
class Program
    {
        static void Main(string[] args)
        {
            Werknemer mixxamm = new Werknemer("Maxim", "Janssens", 5, 2000);
            Werknemer mixxamm1 = new Werknemer("Maxim", "Janssens", 2000);
            Werknemer mixxamm2 = new Werknemer("Maxim", "Janssens", 2000);
            Departement departement1 = new Departement("Departement 1");

            mixxamm.VoegPrestatieToe(Prestaties.Goed);
            mixxamm1.VoegPrestatieToe(Prestaties.Voldoende);
            mixxamm2.VoegPrestatieToe(Prestaties.Voldoende);
            mixxamm2.VoegPrestatieToe(Prestaties.Onvoldoende);
            departement1.VoegWerknemerToe(mixxamm);
            departement1.VoegWerknemerToe(mixxamm1);
            departement1.VoegWerknemerToe(mixxamm2);
            Console.WriteLine(departement1);
            Console.WriteLine();
            Console.Write("Geef een aantal jaar in om de salarissen in de toekomst te weergeven: ");
            Console.WriteLine(departement1.WerknemerLijst(int.Parse(Console.ReadLine())));
        }
    }
```
### Klasse Werknemer
```csharp
public enum Prestaties { Onvoldoende, Voldoende, Goed}
    class Werknemer
    {
        public Werknemer(string voornaam, string naam, int ancienniteit, int basisSalaris)
        {
            Voornaam = voornaam;
            Naam = naam;
            Personeelsnummer = personeelsnummer++;
            Ancienniteit = ancienniteit;
            BasisSalaris = basisSalaris;
        }
        public Werknemer(string voornaam, string naam, int basisSalaris) : this(voornaam, naam, 1, basisSalaris)
        {

        }

        private List<Prestaties> prestatieLijst = new List<Prestaties>();
        static private int personeelsnummer = 1;
        public int Personeelsnummer { get; private set; }
        public string Voornaam { get; set; }
        public string Naam { get; set; }
        public int Ancienniteit { get; set; }
        public int BasisSalaris { get; set; }

        public void VoegPrestatieToe(Prestaties prestatie)
        {
            prestatieLijst.Add(prestatie);
        }

        public bool GeenOnvoldoende()
        {
            if (prestatieLijst.Contains(Prestaties.Onvoldoende))
                return false;
            return true;
        }

        public override string ToString()
        {
            return $"Voornaam: {Voornaam}\nAchternaam: {Naam}\nPersoneelsnummer: P{Personeelsnummer.ToString("D5")}\nAncienniteit: {Ancienniteit}\n";
        }
    }
```
### Klasse Departement
```csharp
internal class Departement
    {
        public Departement(string naam)
        {
            Naam = naam;
        }
        public string Naam { get; set; }

        private List<Werknemer> werknemerLijst = new List<Werknemer>();

        public void VoegWerknemerToe(Werknemer werknemer)
        {
            werknemerLijst.Add(werknemer);
        }

        public int BerekenSalaris(Werknemer werknemer, int jaarVooruit)
        {
            if (werknemer.GeenOnvoldoende())
                return werknemer.BasisSalaris + (werknemer.Ancienniteit + jaarVooruit) * 200;
            return werknemer.BasisSalaris;
        }


        public string WerknemerLijst(int jaarVooruit)
        {
            string result = "";
            foreach(Werknemer werknemer in werknemerLijst)
            {
                result += $"{werknemer}{BerekenSalaris(werknemer, jaarVooruit)}\n\n";
            }
            return result;
        }
        public string WerknemerLijst()
        {
            return WerknemerLijst(0);
        }

        public override string ToString()
        {
            return $"Departement: {Naam}\n\nWerknemerlijst: \n{WerknemerLijst()}";
        }
    }
```
