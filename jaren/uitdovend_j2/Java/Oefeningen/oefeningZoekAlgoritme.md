# Oefeningen sorteeralgoritmen

1) Stel een linear search voor met een gesorteerde lijst als invoer [3, 5, 6, 8, 11, 12, 14, 15, 17, 18].
   1) In hoeveel vergelijkingen zou je eigenlijk al kunnen vaststellen dat 13 niet aanwezig is in de lijst?
      1) > Na 10 vergelijkingen aangezien linear search doorheen de hele lijst zoekt naar de waarde.
      2) > Kunnen het optimaliseren door te zien of de waarde van in de lijst waar de op dit moment zitten, groter is dan de value die we zoeken of niet.
      3) > [Voor code zie theorie](../Theorie/zoekalgoritmen.md)
2) Wat is de tijdscomplexiteit voor het zoeken van een getal in het geoptimaliseerd algoritme als het getal niet aanwezig is in de lijst ?
   1) > Hangt af van situatie tot situatie. In de best-case zal dit O(1) zijn. Worst-case O(N) en average case O(N).
3) Stel je hebt een gesorteerde lijst [3, 5, 6, 8, 11, 12, 14, 15, 17, 18] en je gebruikt het binary search algorithm. Wat zijn de nummers die gebruikt worden in de vergelijkingen om 8 te vinden ?
   1) > [3, 5, 6, 8, 11, **12** *, 14, 15, 17, 18*]
      1) 0+ (10-0) /2 = 5 = mid (kleiner dan)
   2) > [*3, 5,* **6**, 8, 11, 12 *, 14, 15, 17, 18*]
      1) 0 + (5-0) / 2 = 2 = mid (groter dan)
   3) > [*3, 5,* 6, 8, **11**, *12, 14, 15, 17, 18*]
      1) (2+1) + (5- (2+1)) / 2 = 4 = mid (kleiner dan)
   4) > [*3, 5,* 6, **8**, 11, *12, 14, 15, 17, 18*]
      1) 2 + (4-2)/2 = 3 = mid (getal zelf)
4) Wat is de best case tijdscomplexiteit voor de binary search?
   1) > Best-case voor elk zoekalgoritme is dat het op zijn eerste poging de value zelf al vindt. Dus O(1).
