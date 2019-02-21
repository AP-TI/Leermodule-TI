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
