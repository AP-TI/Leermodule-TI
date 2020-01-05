# Oefening Adapter Pattern
> We willen een Turkey maken die net zoals een eend geluid kan maken en kan vliegen. Alleen vinden we de oude code niet meer goed en willen we een nieuwe manier van coderen gebruiken. In plaats van alles te herschrijven gaan we een Adapter implementeren.

> We maken een abstract class 'Turkey' met een class WildTurkey die daar van overerft. Deze classes vragen geen parameters.

> We maken een class TurkeyAdapter die overerft van 'Duck'. De constructor vraagt uiteraard een Turkey om die vervolgens te 'adapten'. Omdat we overerven van 'Duck', roepen we de super-constructor aan en geven we (null, null) mee als parameters. We gebruiken namelijk geen behaviors meer in onze nieuwe manier van coderen. De turkey die we als parameter vroegen kunnen we nu geven aan een private variabele 'private Turkey turkey;'. Zo hebben we onze turkey om methodes op aan te roepen. 

## Code:
> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: 'package edu.ap.mathiasv.dp_adapterpattern;'

### Main
```java
public class Main {
    public static void main(String[] args) {
        Turkey wildturkey = new WildTurkey();
        Duck turkey = new TurkeyAdapter(wildturkey);
		turkey.quack();
    }
}
```
### Abstract class Turkey
```java
public abstract class Turkey {
    public final String gobble(){
        return "Gobble gobble";
    }
    abstract String fly();
}
```

### Class WildTurkey
```java
public class WildTurkey extends Turkey{
    public WildTurkey(){}
    public String fly(){
        return "I'm flying a short distance";
    }
}
```

### Class TurkeyAdapter
```java
public class TurkeyAdapter extends Duck {
    private Turkey turkey;
    public TurkeyAdapter(Turkey turkey) {
        super(null, null);
        this.turkey = turkey;
    }
    
    @Override
    public String quack() {
        return this.turkey.gobble();
    }

    @Override
    public String fly() {
        return this.turkey.fly();
    }
}
```