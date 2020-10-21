# Oefening Decorator Pattern

> We maken gebruik van een abstracte class 'Beverage'. De specifieke soorten koffie erver hiervan over.
> Om dingen zoals melk, soja en andere toe te voegen aan je koffie maak je eerst een abstracte class 'CondimentDecorator' aan. Daarna maak je classes voor alle dingen die je kan toevoegen en die laat je overerven van de klasse 'CondimentDecorator'.
> Elk toevoegsel heeft een property 'beverage'. Zo kan je het toevoegsel aan een bestaand drankje toevoegen.
> In de main maak je eerst een nieuwe koffie aan. Om iets toe te voegen maak je een nieuw toevoegsel aan met als parameter je drankje.
> Als je een prijs wil bijhouden maak je die eerst abstract aan in de Beverage class. Daarna override je die overal en tel je de prijs van het product op bij de bestaande prijs.

## Code

> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: 'package edu.ap.mathiasv.dp_decoratorpattern;'

### Main

```java
public class Main {
    public static void main(String[] args) {
        Beverage coffee = new Decaf();
        coffee = new Milk(coffee);
        coffee = new Whip(coffee);
        System.out.println(coffee);
    }
}
```

### Abstract class Beverage

```java
public abstract class Beverage {
    public String description = "unknown beverage";

    public String getDescription(){
        return this.description;
    }

    public abstract double cost();

    @Override
    public String toString() {
        return getDescription() + " $" + this.cost();
    }
}
```

### Abstract class CondimentDecorator

```java
public abstract class CondimentDecorator extends Beverage {
    public abstract String getDescription();
}
```

### Beverage classes

#### DarkRoast

```java
public class DarkRoast extends Beverage {
    public DarkRoast(){
        description = "Dark roast coffee";
    }

    public double cost(){
        return 1.05;
    }
}
```

#### Decaf

```java
public class Decaf extends Beverage {
    public Decaf(){
        description = "Decaf coffee";
    }

    public double cost(){
        return .80;
    }
}
```

#### Espresso

```java
public class Espresso extends Beverage {
    public Espresso(){
        description = "Espresso";
    }

    public double cost(){
        return .95;
    }
}
```

#### HouseBlend

```java
public class HouseBlend extends Beverage {
    public HouseBlend(){
        description = "House blend coffee";
    }

    public double cost(){
        return .89;
    }
}
```

### Condiment classes

#### Milk

```java
public class Milk extends CondimentDecorator {
    Beverage beverage;

    public Milk(Beverage beverage){
        this.beverage = beverage;
    }

    public String getDescription(){
        return beverage.getDescription() + ", Milk";
    }

    public double cost(){
        return .10 + beverage.cost();
    }
}
```

#### Mocha

```java
public class Mocha extends CondimentDecorator {
    Beverage beverage;

    public Mocha(Beverage beverage){
        this.beverage = beverage;
    }

    public String getDescription(){
        return beverage.getDescription() + ", Mocha";
    }

    public double cost(){
        return .20 + beverage.cost();
    }
}
```

#### Soy

```java
public class Soy extends CondimentDecorator {
    Beverage beverage;

    public Soy(Beverage beverage){
        this.beverage = beverage;
    }

    public String getDescription(){
        return beverage.getDescription() + ", Soy";
    }

    public double cost(){
        return .15 + beverage.cost();
    }
}
```

#### Whip

```java
public class Whip extends CondimentDecorator {
    Beverage beverage;

    public Whip(Beverage beverage){
        this.beverage = beverage;
    }

    public String getDescription(){
        return beverage.getDescription() + ", Whip";
    }

    public double cost(){
        return .25 + beverage.cost();
    }
}
```
