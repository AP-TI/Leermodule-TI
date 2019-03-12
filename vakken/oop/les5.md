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
        private Geld geld;
        private Dobbelsteen dobbelsteen;
        public Dobbelspel()
        {
            InitializeComponent();
            geld = new Geld(START_GELD);
            labelSaldo.Text = geld.ToString();//ToString-methode moet omdat de Text-property een string verwacht
            dobbelsteen = new Dobbelsteen();
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
        static Random random = new Random();
        public int Gooi()
        {
            return random.Next(1, 7);
        }
    }
```
Het uiteindelijke resultaat zou er ongeveer zo moeten uitzien;
![worp](afbeeldingen/knipsel3.png)
![geld op](afbeeldingen/knipsel4.png)

#### Nieuw:
[WPF-versie](les5wpf.md) van deze oefening

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
                MessageBox.Show("Je bankrekening staat negatief!", "Opgelet!", MessageBoxButtons.OK);
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
            comboBoxKeuze.DataSource = null;
            comboBoxKeuze.DataSource = films;
        }

        private void SeriesUpdaten()
        {
            comboBoxKeuze.DataSource = null;
            comboBoxKeuze.DataSource = series;
        }

        private void UpdateFilmRating()
        {
            Film keuze = (Film)comboBoxKeuze.SelectedItem;
            try
            {
                labelRating.Text = $"De huidige rating voor {keuze.Titel} is {keuze.Rating}";
                ChangeRatingVisibility(true);
            }
            catch (Exception)
            {
                ChangeRatingVisibility(false);
            }
        }

        private void UpdateSerieRating()
        {
            Serie keuze = (Serie)comboBoxKeuze.SelectedItem;
            try
            {
                labelRating.Text = $"De huidige rating voor {keuze.Titel} is {keuze.Rating}";
                ChangeRatingVisibility(true);
            }
            catch (Exception)
            {
                ChangeRatingVisibility(false);
            }

        }

        private void EmptyTextBoxes()
        {
            foreach (Control control in Controls)//We loopen over elke Control die op onze form staat (een Control is een TextBox, Button, of iets anders waarmee de gebruiker interactie kan hebben)
            {
                if (control is TextBox)//We checken ofdat de Control van het type TextBox is
                    control.ResetText();//We resetten de Text-property naar de standaard waarde (in dit geval leeg)
            }
        }
        private void ChangeVisibility(bool film, bool serie)//Of maak het uzelf makkelijk en gebruik iets als een groupbox, zo hoef je enkel de zichtbaarheid daarvan aan te passen.
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

        /// <summary>
        /// Verander de zichtbaarheid van alle controls die te maken hebben met het toevoegen van een Rating.
        /// </summary>
        /// <param name="visibility">true voor zichtbaar, false voor onzichtbaar</param>
        private void ChangeRatingVisibility(bool visibility)
        {
            labelRating.Visible = visibility;
            labelNieuweRating.Visible = visibility;
            buttonVoegRatingToe.Visible = visibility;
            textBoxRating.Visible = visibility;
        }

        private void ButtonVoegRatingToe_Click(object sender, EventArgs e)
        {
            if (radioButtonFilm.Checked)
            {
                Film keuze = (Film)comboBoxKeuze.SelectedItem;
                keuze.VoegRatingToe(double.Parse(textBoxRating.Text));
                textBoxRating.ResetText();
                labelRating.Text = $"De huidige rating voor {keuze.Titel} is {keuze.Rating}";
            }
            else
            {
                Serie keuze = (Serie)comboBoxKeuze.SelectedItem;
                keuze.VoegRatingToe(double.Parse(textBoxRating.Text));
                textBoxRating.ResetText();
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
## Oefening 5.4
Net zoals in de vorige oefening moeten we de zichtbaarheid van bepaalde `Control`s aanpassen afhankelijk van wat de gebruiker wilt doen. Het hoofdscherm zou er ongeveer zo moeten uitzien;

![garage gezinswagen](afbeeldingen/garage.png)

![garage sportwagen](afbeeldingen/garage1.png)

Het is je waarschijnlijk al opgevallen dat een aantal velden van naam veranderen afhankelijk van welke soort auto de gebruiker wilt toevoegen. In dit geval gaat het over de velden voor zitplaatsen, koffervolume, pk en vitessen. Je zou 1 label en 1 textbox kunnen maken voor zowel zitplaatsen & pk als koffervolume & vitessen, en dan enkel de `Text`-property van de labels aanpassen. Echter heb ik om het simpel en overzichtelijk te houden ervoor gekozen om effectief verschillende velden te gebruiken en hiervan dan de zichtbaarheid aan te passen, zo zien we in de code ook duidelijk welke gegevens we uit de TextBoxes halen. Omdat het programma opstart met Gezinswagen geselecteerd, zorgen we ervoor dat enkel de velden die voor een gezinswagen dienen zichtbaar zijn; we zetten de `Visible` property bij labelPk, textBoxPk, labelVitessen en textBoxVitessen op 'false'. Merk ook op dat 1 van de `TextBox`es geen normale `TextBox` is, maar wel een `MaskedTextBox`, zodat de gebruiker enkel een datum kan meegeven.

![properties textBox](afbeeldingen/garage3.png)

Eens alles is aangemaakt, zou het er in de designer als volgt moeten uitzien;

![designer garage](afbeeldingen/garage2.png)

Werking van het programma:
Je kan auto's toevoegen door alle velden in te vullen en vervolgens op 'Voeg gezinswagen/sportwagen toe' te klikken

![garage voeg gezinswagen toe](afbeeldingen/garage4.png)

![garage voeg sportwagen toe](afbeeldingen/garage5.png)

Deze auto's worden dan aan een `List` toegevoegd en aan de gebruiker getoond via een CheckedListBox

![lijst auto's](afbeeldingen/garage6.png)

Indien je een auto uit de lijst selecteert, wordt de verwijder-knop aangezet.

![verwijderknop](afbeeldingen/garage7.png)

En door op de verwijder-knop te drukken wordt de auto uiteraard uit de lijst verwijderd.

![lijst](afbeeldingen/garage8.png)

Oké, tijd voor de code die alles laat werken.

### Klasse Garage (Form1.cs)
```csharp
public partial class Garage : Form
    {
        private List<Wagen> autoLijst = new List<Wagen>();
        public Garage()
        {
            InitializeComponent();
        }

        private void CheckedChanged(object sender, EventArgs e)
        {
            if (IsGezin())
                ChangeVisibility(false, true);
            else
                ChangeVisibility(true, false);
        }

        private void ButtonToevoegen_Click(object sender, EventArgs e)
        {
            if (IsGezin())
                VoegWagenToe(new Gezinswagen(textBoxMerk.Text, textBoxType.Text, int.Parse(textBoxKilometers.Text), DateTime.Parse(maskedTextBoxIngebruiknamedatum.Text), textBoxNummerplaat.Text, int.Parse(textBoxKoffervolume.Text), int.Parse(textBoxZitplaatsen.Text)));
            else
                VoegWagenToe(new Sportwagen(textBoxMerk.Text, textBoxType.Text, int.Parse(textBoxKilometers.Text), DateTime.Parse(maskedTextBoxIngebruiknamedatum.Text), textBoxNummerplaat.Text, int.Parse(textBoxPk.Text), int.Parse(textBoxVitessen.Text)));
        }

        private void VoegWagenToe(Wagen wagen)
        {
            autoLijst.Add(wagen);
            VulListBox();
            foreach (Control c in groupBoxAutoGegevens.Controls)
                if (c is TextBox || c is MaskedTextBox)
                    c.Text = "";
        }

        private void VulListBox()
        {
            checkedListBoxAutos.Items.Clear();
            foreach (Wagen wagen in autoLijst)
                checkedListBoxAutos.Items.Add(wagen);
        }

        private void ChangeVisibility(bool sport, bool gezin)
        {
            labelVitessen.Visible = sport;
            textBoxVitessen.Visible = sport;
            labelPk.Visible = sport;
            textBoxPk.Visible = sport;

            labelKoffervolume.Visible = gezin;
            textBoxKoffervolume.Visible = gezin;
            labelZitplaatsen.Visible = gezin;
            textBoxZitplaatsen.Visible = gezin;

            if (gezin)
                buttonToevoegen.Text = "Voeg gezinswagen toe";
            else
                buttonToevoegen.Text = "Voeg sportwagen toe";
        }

        public bool IsGezin()
        {
            return radioButtonGezinswagen.Checked;
        }

        private void ButtonVerwijder_Click(object sender, EventArgs e)
        {
            foreach (Wagen wagen in checkedListBoxAutos.CheckedItems)
                autoLijst.Remove(wagen);
            VulListBox();
            buttonVerwijder.Enabled = false;
        }

        private void ItemCheck(object sender, ItemCheckEventArgs e)
        {
            buttonVerwijder.Enabled = true;
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
            return $"Merk: {Merk}, Type: {Type}, Kilometers: {Kilometers}, Nummerplaat: {Nummerplaat}, Brandstofverbruik: {BerekenBrandstofVerbruik()}\n";
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
        if (ZitPlaatsen == 7)
            return base.BerekenBrandstofVerbruik() * EXTRA_VERBRUIK;
        return base.BerekenBrandstofVerbruik();
    }

    public override string ToString()
    {
        return base.ToString() + $"Zitplaatsen: {ZitPlaatsen}, Koffervolume: {Koffervolume}";
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
        if (AantalVitessen == 6)
            return base.BerekenBrandstofVerbruik() * EXTRA_VERBRUIK;
        return base.BerekenBrandstofVerbruik();
    }

    public override string ToString()
    {
        return base.ToString() + $"PK: {PK}, Aantal vitessen: {AantalVitessen}";
    }
}
```
