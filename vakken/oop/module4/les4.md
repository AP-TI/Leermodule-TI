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
## Oefening 2
Opnieuw implementeren we de interface `IComparable`. Dit keer in de klasse passagier.
### Klasse Passagier
```csharp
enum Geslachten { Man, Vrouw, Onbekend}
class Passagier : IComparable
{
    public string Naam { get; set; }
    public string Voornaam { get; set; }
    public Adres Adres { get; set; }
    public DateTime Geboortedatum { get; set; }
    public Geslachten Geslacht { get; set; }
    private string rijksregisternummer;

    static Dictionary<DateTime, int> bisMan = new Dictionary<DateTime, int>();
    static Dictionary<DateTime, int> bisVrouw = new Dictionary<DateTime, int>();

    public string Rijksregisternummer
    {
        get { return rijksregisternummer; }
        set
        {
            if(value == "B")
            {
                StringBuilder stringBuilder = new StringBuilder();
                if (Geslacht == Geslachten.Man && bisMan.TryGetValue(Geboortedatum, out int dagteller))
                {
                    dagteller += 2;
                    bisMan[Geboortedatum] = dagteller;
                }
                else if ((Geslacht == Geslachten.Vrouw || Geslacht == Geslachten.Onbekend) && bisVrouw.TryGetValue(Geboortedatum, out dagteller))
                {
                    dagteller += 2;
                    bisVrouw[Geboortedatum] = dagteller;
                }
                else if (Geslacht == Geslachten.Man)
                {
                    dagteller = 1;
                    bisMan.Add(Geboortedatum, dagteller);
                }
                else
                {
                    dagteller = 2;
                    bisVrouw.Add(Geboortedatum, dagteller);
                }
                int maandExtra = Geslacht == Geslachten.Onbekend ? 20 : 40;
                stringBuilder.Append($"{Geboortedatum.Year.ToString().Substring(2)}.{Geboortedatum.Month + maandExtra}.{Geboortedatum.Day.ToString("00")}-{dagteller.ToString("000")}.{(Geboortedatum.Year >= 2000 ? ((2 + int.Parse(Geboortedatum.Year.ToString().Substring(2) + (Geboortedatum.Month + maandExtra).ToString() + Geboortedatum.Day.ToString("00") + dagteller.ToString("000"))) % 97).ToString("00") : (int.Parse(Geboortedatum.Year.ToString().Substring(2) + (Geboortedatum.Month + maandExtra).ToString() + Geboortedatum.Day.ToString("00") + dagteller.ToString("000")) % 97).ToString("00"))}");
                rijksregisternummer = stringBuilder.ToString();
            }
            else if (Regex.IsMatch(value, @"^\d{2}\.(0[0-9]|1[0-2])\.(0[0-9]|1[0-9]|2[0-9]|3[0-1])[-](99[0-8]|[0-9][0-8][0-9]|[0-8][0-9][0-9])\.\d{2}$"))
            {
                string zonderScheidingsTekens = Geboortedatum.Year >= 2000 ? 2 + value.Replace(".", "").Replace("-", "").Substring(0, 9) : value.Replace(".", "").Replace("-", "").Substring(0, 9);
                int rijksregisternummerGetal = int.Parse(zonderScheidingsTekens);
                if (97 - rijksregisternummerGetal % 97 == int.Parse(value.Substring(13, 2)))
                    rijksregisternummer = value;
                else
                    rijksregisternummer = "00.00.00-000.00";
            }
            else
                rijksregisternummer = "00.00.00-000.00";
        }
    }


    public Passagier(string naam, string voornaam, Adres adres, DateTime geboorteDatum, Geslachten geslacht, string rijksregisternummer)
    {
        Naam = naam;
        Voornaam = voornaam;
        Adres = adres;
        Geboortedatum = geboorteDatum;
        Geslacht = geslacht;
        Rijksregisternummer = rijksregisternummer;
    }

    public virtual string Privileges() => "Geen extra privileges";

    public override string ToString() => $"{Voornaam} {Naam} - {Adres}";

    public int CompareTo(object obj)
    {
        Passagier passagier = (Passagier)obj;
        return Naam.CompareTo(passagier.Naam);
    }
}
```
Daarna sorteren we gewoon onze lijst van passagiers, en geven we onze lijst eventueel weer in een listBox zodat we kunnen controleren of alles juist is gesorteerd.
```csharp
passagiers.Sort();
listBoxPassagiers.DataSource = passagiers;
```
