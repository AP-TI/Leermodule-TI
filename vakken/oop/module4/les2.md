# Les 2
## Oefening 1
![Oefening 1](les2_oefening1.png)

![Vertraging toegevoegd messagebox](les2_oefening1_messagebox.png)

### Klasse Form1
```csharp
public partial class Form1 : Form
{
    List<Trein> treinen;
    public Form1()
    {
        InitializeComponent();
        treinen = new List<Trein>
        {
            new Trein(1, Eindbestemmingen.AntwerpenCentraal, new DateTime(2019, 4, 9, 21, 26, 14)),
            new Trein(2, Eindbestemmingen.BrusselZuid, new DateTime(2019, 4, 9, 21, 29, 16)),
            new Trein(3, Eindbestemmingen.Mechelen, new DateTime(2019, 4, 9, 22, 50, 14))
        };
        listBoxTreinen.DataSource = treinen;
    }

    private void ButtonVertragingToevoegen_Click(object sender, EventArgs e)
    {
        Trein geselecteerdeTrein = (Trein)listBoxTreinen.SelectedItem;
        geselecteerdeTrein.Vertraging += int.Parse(textBoxVertraging.Text);
        MessageBox.Show($"De aankomst in {geselecteerdeTrein.Eindbestemming} van trein {geselecteerdeTrein.Nummer} was gepland om {geselecteerdeTrein.Aankomst.ToLongTimeString()} en wordt verwacht om {geselecteerdeTrein.Aankomst.AddMinutes(geselecteerdeTrein.Vertraging).ToLongTimeString()}. Er is momenteel een totale vertraging van {geselecteerdeTrein.Vertraging} minuten.", "Vertraging toegevoegd", MessageBoxButtons.OK, MessageBoxIcon.Information);
        listBoxTreinen.DataSource = null;
        listBoxTreinen.DataSource = treinen;
    }
}
```
### Klasse Trein
```csharp
enum Eindbestemmingen { BrusselZuid, AntwerpenCentraal, Mechelen}
    class Trein
    {
        public int Nummer { get; }
        public Eindbestemmingen Eindbestemming { get; }
        public DateTime Aankomst { get; }
        public int Vertraging { get; set; }

        public Trein(int nummer, Eindbestemmingen eindbestemming, DateTime aankomst)
        {
            Nummer = nummer;
            Eindbestemming = eindbestemming;
            Aankomst = aankomst;
        }

        public override string ToString()
        {
            StringBuilder result = new StringBuilder();
            result.Append($"{Nummer} - Eindbestemming: {Eindbestemming}, Aankomst: {Aankomst.ToLongTimeString()}");
            if (Vertraging > 0)
                result.Append($" (+{Vertraging:00})");
            return result.ToString();
        }
    }
```
