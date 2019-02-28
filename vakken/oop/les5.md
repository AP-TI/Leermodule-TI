# Les 5
## Oefening 5.1
Om te beginnen; zorg ervoor dat je Toolbox zichtbaar is. Standaard is dit niet het geval, zoals in onderstaand screenshot

![geen toolbox](afbeeldingen/knipsel.png)

Om de Toolbox te openen, maak je gebruik van de sneltoets `ctrl` + `alt` + `x`.
Je kan deze dan ook vastpinnen door op de pinknop te drukken.

![toolbox](afbeeldingen/knipsel0.png)

Sleep nu een Button uit de Toolbox naar de Form. Eens dit gebeurd is kan je de naam en andere eigenschappen ervan aanpassen. Dit doe je rechtsonder;

![properties knop](afbeeldingen/knipsel1.png)

De tekst die op de knop zelf staat kan je aanpassen als je naar onder scrollt, en zoekt achter de property `Text`.

Sleep nu ook een Label vanuit de Toolbox naar de Form en pas hiervan ook de naam aan. Maak ook de `Text`-property leeg.

Als je het programma start, zou dat er ongeveer zo moeten uitzien;

![programma](afbeeldingen/knipsel2.png)

Maar dan zonder het Saldo, want de code daarvoor moeten we nog aanmaken.

#### De code
### Klasse Program
Hebben we voor het eerst gewoon standaard gelaten.
### Klasse Dobbelspel (Form1.cs)
Opgelet: dit is enkel het code-deel van de klasse (daarvan partial class). Het design-deel wordt automatisch aangemaakt door Visual Studio en daar blijven we af.
```csharp
public partial class Dobbelspel : Form
    {
        private const decimal START_GELD = 100.00m;
        private Geld geld = new Geld(START_GELD);
        private Dobbelsteen dobbelsteen = new Dobbelsteen();
        public Dobbelspel()
        {
            InitializeComponent();
            labelSaldo.Text = geld.ToString();//Om een reden moet ik dit converteren ondanks dat er een ToString()-methode is overridden in de klasse Geld.
        }

        private void KnopGooi_Click(object sender, EventArgs e)
        {
            int worp = dobbelsteen.Gooi();
            if (geld.PasSaldoAan(worp) && geld.Saldo != 0)
                labelSaldo.Text = $"U hebt {worp} gegooid. {geld.ToString()}";
            else
            {
                labelSaldo.Text = "Geld is op.";
                KnopGooi.Enabled = false;
            }

        }
    }
```
### Klasse Geld
```csharp
internal class Geld
    {
        public decimal Saldo { get; set; }

        public Geld(decimal saldo)
        {
            Saldo = saldo;
        }

        public bool PasSaldoAan(int aantal)
        {
            decimal aanpassing;
            switch (aantal)
            {
                case 1:
                    aanpassing = 20;
                    break;
                case 6:
                    aanpassing = 15;
                    break;
                default:
                    aanpassing = -10;
                    break;
            }
            if (Saldo + aanpassing < 0)
                return false;
            Saldo += aanpassing;
            return true;
        }

        public override string ToString()
        {
            return $"Huidig saldo: {Saldo}";
        }
    }
```
### Klasse Dobbelsteen
```csharp
class Dobbelsteen
    {
        Random random = new Random();
        public int Gooi()
        {
            return random.Next(1, 7);
        }
    }
```
Het uiteindelijke resultaat zou er ongeveer zo moeten uitzien;
![worp](afbeeldingen/knipsel3.png)
![geld op](afbeeldingen/knipsel4.png)

## Oefening 5.2
Maak gebruik van Knoppen, Een Textbox en een Label om het programma er als volgt uit te laten zien;

![bankrekening](afbeeldingen/bankrekening.png)

### Klasse Bank (Form1.cs)
```csharp
public partial class Bank : Form
    {
        Bankrekening bankrekening = new Bankrekening(100.00m);
        public Bank()
        {
            InitializeComponent();
            UpdateSaldo();
        }


        private void KnopStorten_Click(object sender, EventArgs e)
        {
            bankrekening.WijzigSaldo(decimal.Parse(textBoxHoeveelheid.Text));
            UpdateSaldo();
        }

        private void KnopAfhalen_Click(object sender, EventArgs e)
        {
            bankrekening.WijzigSaldo(-decimal.Parse(textBoxHoeveelheid.Text));
            UpdateSaldo();
        }

        private void UpdateSaldo()
        {
            if (bankrekening.Saldo < 0)
            {
                labelSaldo.ForeColor = Color.Red;
                MessageBox.Show("Je bankrekenign staat negatief!", "Opgelet!", MessageBoxButtons.OK);
            }

            else
                labelSaldo.ForeColor = Color.Black;
            labelSaldo.Text = bankrekening.ToString();//Iemand die weet waarom ik hier .ToString() moet doen? Pls leg uit thanks
        }
    }
```
De `MessageBox` zorgt ervoor dat er een melding wordt getoond aan de gebruiker als zijn bankrekening negatief staat. Het zou er ongeveer zo moeten uitzien;
![bankrekening foutmelding](afbeeldingen/bankrekening1.png)
### Klasse Bankrekening
```csharp
class Bankrekening
    {
        public decimal Saldo { get; private set; }
        public Bankrekening(decimal saldo)
        {
            Saldo = saldo;
        }

        public void WijzigSaldo(decimal hoeveelheid)
        {
            Saldo += hoeveelheid;
        }

        public override string ToString()
        {
            return $"Huidig saldo: {Saldo}";
        }
    }
```
## Oefening 5.3
Bij alle oefeningen hiervoor was het maken van een layout nog redelijk simpel. Nu komt er echter een extra moeilijkheidsgraad. Je moet namelijk verschillende elementen verbergen of tonen afhankelijk van wat de gebruiker wilt doen.

Om te beginnen moet je scherm er ongeveer zo uitzien om series toe te kunnen voegen;

![startpagina imdb series](afbeeldingen/imdb.png)

En voor films;

![startpagina imdb films](afbeeldingen/imdb1.png)

In de designer ziet dat er dan als volgt uit;

![imdb designer](afbeeldingen/imdb2.png)

Natuurlijk is er ook code nodig om de zichtbaarheid van elementen aan te passen, deze schrijven we allemaal in de klasse die gelinked is aan onze form. In dit geval de (partial) klasse Imdb.

Nog een bijkomende aanpassing tegenover de Console-versie van deze oefening is dat de gebruiker altijd informatie moet kunnen opvragen over Films & Series. Hiervoor maken we gebruik van een `ComboBox`.

![combobox](afbeeldingen/imdb3.png)

Bovendien moet je een beoordeling kunnen toevoegen aan de geselecteerde Film of Serie

![beoordeling](afbeeldingen/imdb4.png)

### Klasse Imdb (Form1.cs)
```csharp
public partial class Imdb : Form
    {
        private List<Film> films = new List<Film>();
        private List<Serie> series = new List<Serie>();

        public Imdb()
        {
            InitializeComponent();
        }

        private void CheckedChanged(object sender, EventArgs e)
        {
            if (radioButtonFilm.Checked)
            {
                ChangeVisibility(true, false);
                FilmsUpdaten();
            }
            else
            {
                ChangeVisibility(false, true);
                SeriesUpdaten();
            }


        }

        private void VoegToe(object sender, EventArgs e)
        {
            if (radioButtonFilm.Checked && IsFilled())
            {
                films.Add(new Film(textBoxFilmTitel.Text, textBoxFilmProducer.Text, textBoxFilmRegisseur.Text, textBoxFilmGenre.Text, int.Parse(textBoxFilmJaar.Text)));
                EmptyTextBoxes();
                FilmsUpdaten();
            }
            else if (IsFilled())
            {
                series.Add(new Serie(textBoxSerieTitel.Text, int.Parse(textBoxSerieSeizoenen.Text)));
                EmptyTextBoxes();
                SeriesUpdaten();
            }
            else
                MessageBox.Show("Niet alle velden zijn gevuld", "Opgelet!", MessageBoxButtons.OK);
        }

        private void KeuzeVeranderd(object sender, EventArgs e)
        {
            if (radioButtonFilm.Checked)
                UpdateFilmRating();
            else
                UpdateSerieRating();
        }

        private bool IsFilled()
        {
            if (radioButtonFilm.Checked)
                return textBoxFilmGenre.Text.Length != 0 && textBoxFilmJaar.Text.Length != 0 && textBoxFilmProducer.Text.Length != 0 && textBoxFilmRegisseur.Text.Length != 0 && textBoxFilmTitel.Text.Length != 0;
            else
                return textBoxSerieSeizoenen.Text.Length != 0 && textBoxSerieTitel.Text.Length != 0;
        }

        private void FilmsUpdaten()
        {
            comboBoxKeuze.Items.Clear();
            foreach (Film film in films)
                comboBoxKeuze.Items.Add(film);
        }

        private void SeriesUpdaten()
        {
            comboBoxKeuze.Items.Clear();
            foreach (Serie serie in series)
                comboBoxKeuze.Items.Add(serie);
        }

        private void UpdateFilmRating()
        {
            Film keuze = (Film)comboBoxKeuze.SelectedItem;
            labelRating.Text = $"De huidige rating voor {keuze.Titel} is {keuze.Rating}";
            labelRating.Visible = true;
            labelNieuweRating.Visible = true;
            buttonVoegRatingToe.Visible = true;
            textBoxRating.Visible = true;
        }

        private void UpdateSerieRating()
        {
            Serie keuze = (Serie)comboBoxKeuze.SelectedItem;
            labelRating.Text = $"De huidige rating voor {keuze.Titel} is {keuze.Rating}";
            labelRating.Visible = true;
            labelNieuweRating.Visible = true;
            buttonVoegRatingToe.Visible = true;
            textBoxRating.Visible = true;
        }

        private void EmptyTextBoxes()
        {
            textBoxFilmGenre.Text = "";
            textBoxFilmJaar.Text = "";
            textBoxFilmProducer.Text = "";
            textBoxFilmRegisseur.Text = "";
            textBoxFilmGenre.Text = "";
            textBoxFilmTitel.Text = "";
            textBoxSerieSeizoenen.Text = "";
            textBoxSerieTitel.Text = "";
        }
        private void ChangeVisibility(bool film, bool serie)
        {
            labelFilmGenre.Visible = film;
            labelFilmJaar.Visible = film;
            labelFilmProducer.Visible = film;
            labelFilmRegisseur.Visible = film;
            labelFilmTitel.Visible = film;
            textBoxFilmGenre.Visible = film;
            textBoxFilmJaar.Visible = film;
            textBoxFilmProducer.Visible = film;
            textBoxFilmRegisseur.Visible = film;
            textBoxFilmTitel.Visible = film;

            labelSerieSeizoenen.Visible = serie;
            labelSerieTitel.Visible = serie;
            textBoxSerieSeizoenen.Visible = serie;
            textBoxSerieTitel.Visible = serie;
        }

        private void ButtonVoegRatingToe_Click(object sender, EventArgs e)
        {
            if (radioButtonFilm.Checked)
            {
                Film keuze = (Film)comboBoxKeuze.SelectedItem;
                keuze.VoegRatingToe(double.Parse(textBoxRating.Text));
                textBoxRating.Text = "";
                labelRating.Text = $"De huidige rating voor {keuze.Titel} is {keuze.Rating}";
            }
            else
            {
                Serie keuze = (Serie)comboBoxKeuze.SelectedItem;
                keuze.VoegRatingToe(double.Parse(textBoxRating.Text));
                textBoxRating.Text = "";
                labelRating.Text = $"De huidige rating voor {keuze.Titel} is {keuze.Rating}";
            }

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
            Rating = rating;//Zo heeft de default rating geen impact op de ratings die werden ingevoerd door de gebruiker
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
            Rating = ratings.Average();
        }

        public override string ToString()
        {
            return $"{Titel} - {Jaar}";
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
            Rating = rating;//Zo heeft de default rating geen impact op de ratings die werden ingevoerd door de gebruiker
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
            return $"{Titel} - {Seizoenen}";
        }

    }
```
Zoals je misschien al hebt gemerkt, zit er enorm veel dubbele code in deze oefening. Dit komt omdat deze oefening gebaseerd is op [oefening 3.1](https://github.com/AP-TI-2018-2019/AP_2018-2019/blob/master/vakken/oop/les3.md), de onderliggende code is (bijna) volledig hetzelfde, met als enige verschil dat er een GUI aan verbonden is. Dit toont nog maar eens het nut van polymorfisme, een begrip dat we nog niet kenden in les 3, aan.
