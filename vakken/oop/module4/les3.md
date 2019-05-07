# Les 3
## Oefening 1
Gewoon de klasse 'Stof' abstract maken door het `abstract`-keyword ervoor te zetten. `abstract class Stof`
De rest van de klasse blijft hetzelfde.

Hetzelfde voor oefening 5.4 van module 3. `internal abstract class Wagen`
## Oefening 2
![oefening 2](afbeeldingen/streaming.png)
### Abstracte klasse Medium
```csharp
abstract class Medium
{
    public string Naam { get; set; }
    public string Regisseur { get; set; }
    public List<Acteur> Acteurs { get; set; }

    public abstract string Afspelen();
    public abstract string Stoppen();
}
```
### Klasse Film
```csharp
class Film : Medium
{
      public Film(string naam, string regisseur, List<Acteur> acteurs)
      {
          Naam = naam;
          Regisseur = regisseur;
          Acteurs = acteurs;
      }

      public override string Afspelen()
      {
          return "Gestart vanaf het begin.";
      }

      public override string Stoppen()
      {
          return "Gestopt met spelen.";
      }

      public override string ToString() => $"Film - {Naam}";
}
```
### Klasse Serie
```csharp
class Serie : Medium
{
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

      public override string Afspelen()
      {
          if(HuidigeAflevering < AantalAfleveringen + 1)
              return $"Gestart vanaf aflevering {HuidigeAflevering++}";
          HuidigeAflevering = 1;
          return $"Terug opnieuw begonnen vanaf aflevering {HuidigeAflevering++}";
      }

      public override string Stoppen() => $"Gestopt met spelen van aflevering {HuidigeAflevering - 1}";

      public override string ToString() => $"Serie - {Naam}";
}
```
### Klasse Acteur
```csharp
class Acteur
{
    public string Voornaam { get; set; }
    public string Naam { get; set; }

    public Acteur(string voornaam, string naam)
    {
        Voornaam = voornaam;
        Naam = naam;
    }

    public override string ToString() => $"{Voornaam} {Naam}";
}
```
### Klasse StreamingApplicatie (Form1)
```csharp
public partial class StreamingApplicatie : Form
{
    List<Medium> media;
    List<string> kanSpelenIn;
    public StreamingApplicatie()
    {
        InitializeComponent();
        media = new List<Medium>
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
        Medium geselecteerdMedium = (Medium)listBoxMedia.SelectedItem;
        labelResultaat.Text = geselecteerdMedium.Afspelen();
    }

    private void ButtonStop_Click(object sender, EventArgs e)
    {
        Medium geselecteerdMedium = (Medium)listBoxMedia.SelectedItem;
        labelResultaat.Text = geselecteerdMedium.Stoppen();
    }
}
```