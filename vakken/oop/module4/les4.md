# Les 4
## Oefening 1
De eerste stap is de Interface `IComparable` implementeren in de klasses Serie & Film. Daarna passen we de `CompareTo()`-methode aan zodat we op basis van de naam kunnen vergelijken.
### Klasse Serie
```csharp
class Serie : IMedium, IComparable
{
    public string Naam { get; set; }
    public string Regisseur { get; set; }
    public List<Acteur> Acteurs { get; set; }
    public int AantalAfleveringen { get; set; }
    public int HuidigeAflevering { get; set; }

    public Serie(string naam, string regisseur, int aantalAfleveringen, List<Acteur> acteurs)
    {
        Naam = naam;
        Regisseur = regisseur;
        AantalAfleveringen = aantalAfleveringen;
        HuidigeAflevering = 1;
        Acteurs = acteurs;
    }

    public string Afspelen()
    {
        if(HuidigeAflevering < AantalAfleveringen + 1)
            return $"Gestart vanaf aflevering {HuidigeAflevering++}";
        HuidigeAflevering = 1;
        return $"Terug opnieuw begonnen vanaf aflevering {HuidigeAflevering++}";
    }

    public string Stoppen() => $"Gestopt met spelen van aflevering {HuidigeAflevering - 1}";

    public override string ToString() => $"Serie - {Naam}";

    public int CompareTo(object obj)
    {
        IMedium medium = (IMedium)obj;
        return Naam.CompareTo(medium.Naam);
    }
}
```
### Klasse Film
```csharp
class Film : IMedium, IComparable
{
    public string Naam { get; set; }
    public string Regisseur { get; set; }
    public List<Acteur> Acteurs { get; set; }

    public Film(string naam, string regisseur, List<Acteur> acteurs)
    {
        Naam = naam;
        Regisseur = regisseur;
        Acteurs = acteurs;
    }



    public string Afspelen()
    {
        return "Gestart vanaf het begin.";
    }

    public string Stoppen()
    {
        return "Gestopt met spelen.";
    }

    public override string ToString() => $"Film - {Naam}";

    public int CompareTo(object obj)
    {
        IMedium medium = (IMedium)obj;
        return Naam.CompareTo(medium.Naam);
    }
}
```
Vervolgens sorteren we de films en series door de lijst te sorteren. Gewoon `media.Sort();` toevoegen dus.
### Klasse StreamingApplicatie (Form)
```csharp
public partial class StreamingApplicatie : Form
    {
        List<IMedium> media;
        List<string> kanSpelenIn;
        public StreamingApplicatie()
        {
            InitializeComponent();
            media = new List<IMedium>
            {
                new Serie("Spongebob", "Stephen Hillenburg", 20, new List<Acteur>{new Acteur("Tom", "Kenny"), new Acteur("Bill", "Fagerbakke"), new Acteur("Clancy", "Brown") }),
                new Film("Interstellar", "Christopher Nolan", new List<Acteur>{ new Acteur("Matthew", "McConaughey"), new Acteur("Anne", "Hathaway") })
            };
            kanSpelenIn = new List<string>
            {
                "België",
                "Nederland",
                "Frankrijk"
            };
            string huidigLand = System.Globalization.RegionInfo.CurrentRegion.DisplayName;
            if (kanSpelenIn.Contains(huidigLand))
            {
                labelLand.Text = $"U bevindt zich momenteel in {huidigLand}";
                media.Sort();
                listBoxMedia.DataSource = media;
            }
            else
            {
                MessageBox.Show($"We zijn helaas niet actief in {huidigLand}. De applicatie gaat nu sluiten.");
                Close();
            }

        }

        private void ButtonStart_Click(object sender, EventArgs e)
        {
            IMedium geselecteerdMedium = (IMedium)listBoxMedia.SelectedItem;
            labelResultaat.Text = geselecteerdMedium.Afspelen();
        }

        private void ButtonStop_Click(object sender, EventArgs e)
        {
            IMedium geselecteerdMedium = (IMedium)listBoxMedia.SelectedItem;
            labelResultaat.Text = geselecteerdMedium.Stoppen();
        }
    }
```
