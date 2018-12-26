# Belangrijke begrippen
kardinaliteit: aantal elementen van een verzameling, wordt genoteerd met het #-teken. Bijvoorbeeld: #(int)=4 294 967 296

overflow: het resultaat van een bewerking past niet meer binnen de getalbreedte. Bijvoorbeeld:
```
250 + 10 = 260
    1 1 1 1  1 0 1 0
    0 0 0 0  1 0 1 0
+   ----------------
  1(0 0 0 0  0 1 0 0) --> Enkel de bits binnen de haakjes worden opgeslagen, we verkrijgen dus 4 in plaats van 260.
```
