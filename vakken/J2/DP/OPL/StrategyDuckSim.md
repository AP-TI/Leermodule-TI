# Oefening Strategy Pattern: MiniDuckSimulator
> We maken gebruik van een abstract 'Duck'-class, waarvan de classes 'RubberDuck', 'DecoyDuck', 'MallardDuck' en 'RedheadDuck' overerven.

> Om deze eendjes te laten vliegen en geluid te laten maken, maken we de 'FlyBehavior'-interface en de 'QuackBehavior'-interface.
> De 'FlyBehavior'-interface bevat een methode 'fly()'.
> De 'QuackBehavior'-interface bevat een methode 'quack()'.

> De twee 'FlyBehavior'-classes 'FlyWithWings' en 'FlyNoWay' implementeren de 'FlyBehavior'-interface. Ze hebben ook een override van de 'fly()'-methode en de 'ToString()'-methode.

> De drie 'QuackBehavior'-classes 'Quack', 'Squeak' en 'MuteQuack' implementeren de 'QuackBehavior'-interface. Ze hebben ook een override van de 'quack()'-methode en de 'ToString()'-methode.

> De class 'Duck' heeft de interfaces 'FlyBehavior' en 'QuackBehavior' als properties. Dit zorgt ervoor dat een eend kan vliegstatus en een quackstatus heeft. Verder hebben we een constructor die een defaultbehaviors instelt voor ons eendje, een 'fly()'-methode, een 'quack()'-methode en een 'ToString()'-override.

> De class 'RubberDuck' heeft een extra property, een boolean die bijhoudt of het rubbere eendje kan vliegen of niet. Natuurlijk hebben we dan ook de methodes 'setFlyable()' en 'setUnflyable()', en een andere 'fly()'-methode.

## Code:
> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: `package edu.ap.mathiasvs.dp_strategyducksimulator;`

### Main
```java
public class Main {
    public static void main(String[] args) {
        /* Test RubberDuck*/
        System.out.println("\nRubberDuck test");
        RubberDuck rubberDuck = new RubberDuck();
        System.out.println(rubberDuck);
        System.out.println(rubberDuck.fly());
        rubberDuck.setFlyable();
        System.out.println(rubberDuck.fly());
        rubberDuck.setUnflyable();
        System.out.println(rubberDuck.fly());
        System.out.println(rubberDuck.quack());
        
        /* Test MallardDuck*/
        System.out.println("\nMallardDuck test");
        MallardDuck mallardDuck = new MallardDuck();
        System.out.println(mallardDuck);
        System.out.println(mallardDuck.fly());
        System.out.println(mallardDuck.quack());
        
        /* Test RedheadDuck*/
        System.out.println("\nRedheadDuck test");
        RedheadDuck redheadDuck = new RedheadDuck();
        System.out.println(redheadDuck);
        System.out.println(redheadDuck.fly());
        System.out.println(redheadDuck.quack());
        
        /* Test DecoyDuck*/
        System.out.println("\nDecoyDuck test");
        DecoyDuck decoyDuck = new DecoyDuck();
        System.out.println(decoyDuck);
        System.out.println(decoyDuck.fly());
        System.out.println(decoyDuck.quack());
    }
}
```
### Class Duck
```java
public abstract class Duck {
    private FlyBehavior flyBehavior;
    private QuackBehavior quackBehavior;
    
    public Duck(FlyBehavior flyBehavior, QuackBehavior quackBehavior){
        this.quackBehavior = quackBehavior;
        this.flyBehavior = flyBehavior;
    }
    
    public String fly(){
        return flyBehavior.fly();
    }
    
    public String quack(){
        return quackBehavior.quack();
    }

    @Override
    public String toString() {
        return "No specific duck found.";
    }
}
```
### Subclasses van Duck
#### RubberDuck
```java
public class RubberDuck extends Duck{
    private boolean flyAble = false;
    
    public RubberDuck() {
        super(new FlyNoWay(), new Squeak());
    }

    @Override
    public String fly() {
        String output = "Rubber ducks ";
        if(flyAble){
            output += "fly!";
        } else {
            output += "can't fly.";
        }
        return output;
    }

    @Override
    public String quack() {
        return "Rubber ducks " + super.quack();
    }

    public String setFlyable(){
        flyAble = true;
        return "Our rubber duck can fly now!";
    }
    
    public String setUnflyable(){
        flyAble = false;
        return "Our rubber duck can't fly anymore!";
    }
    
    @Override
    public String toString() {
        return "A Rubber duck.";
    }
}
```
#### DecoyDuck
```java
public class DecoyDuck extends Duck {
    public DecoyDuck() {
        super(new FlyNoWay(), new MuteQuack());
    }

    @Override
    public String quack() {
        return "Decoy ducks " + super.quack();
    }

    @Override
    public String fly() {
        return "Decoy ducks " + super.fly();
    }

    @Override
    public String toString() {
        return "A decoy duck.";
    }
}
```
#### MallardDuck
```java
public class MallardDuck extends Duck{
    public MallardDuck() {
        super(new FlyWithWings(), new Quack());
    }

    @Override
    public String fly() {
        return "Mallard ducks " + super.fly();
    }

    @Override
    public String quack() {
        return "Mallard ducks " + super.quack();
    }

    @Override
    public String toString() {
        return "A Mallard duck.";
    }
}
```
#### RedheadDuck
```java
public class RedheadDuck extends Duck{
    public RedheadDuck() {
        super(new FlyWithWings(), new Quack());
    }

    @Override
    public String fly() {
        return "Redhead ducks " + super.fly();
    }

    @Override
    public String quack() {
        return "Redhead ducks " + super.quack();
    }

    @Override
    public String toString() {
        return "A Redhead duck.";
    }
}
```

### Interfaces
#### FlyBehavior Interface
```java
public interface FlyBehavior {
    public String fly();
}
```

#### QuackBehavior Interface
```java
public interface QuackBehavior {
    public String quack();
}
```

### FlyBehaviorclasses
#### FlyWithWings
```java
public class FlyWithWings implements FlyBehavior{
    @Override
    public String fly() {
        return "fly!";
    }

    @Override
    public String toString() {
        return "Flyable.";
    }
}
```

#### FlyNoWay
```java
public class FlyNoWay implements FlyBehavior {
    @Override
    public String fly() {
        return "can't fly!";
    }

    @Override
    public String toString() {
        return "Not flyable.";
    }
}
```

### QuackBehaviorclasses
#### Quack
```java
public class Quack implements QuackBehavior {
    @Override
    public String quack() {
        return "quack!";
    }

    @Override
    public String toString() {
        return "Quackable.";
    }
}
```

#### Squeak
```java
public class Squeak implements QuackBehavior{
    @Override
    public String quack() {
        return "squeaks!";
    }

    @Override
    public String toString() {
        return "Squeakable.";
    }
}
```

#### MuteQuack
```java
public class MuteQuack implements QuackBehavior {
    @Override
    public String quack() {
        return "can't quack!";
    }

    @Override
    public String toString() {
        return "Not quackable or squeakable.";
    }
}
```