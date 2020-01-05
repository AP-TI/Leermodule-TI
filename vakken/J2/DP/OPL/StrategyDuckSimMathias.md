# Oefening Strategy Pattern: MiniDuckSimulator
>We maken gebruik van een abstract 'Duck'-class, waarvan de classes 'ModelDuck' en 'MallardDuck' overerven.

>Om deze eendjes te laten vliegen en geluid te laten maken, maken we de 'FlyBehavior'-interface en de 'QuackBehavior'-interface. De 'FlyBehavior'-interface bevat een methode 'fly()'. De 'QuackBehavior'-interface bevat een methode 'quack()'.

> De twee 'FlyBehavior'-classes 'FlyWithWings' en 'FlyNoWay' implementeren de 'FlyBehavior'-interface. Ze overriden de fly()-methode.

> De drie 'QuackBehavior'-classes 'Quack', 'Squeak' en 'MuteQuack' implementeren de 'QuackBehavior'-interface. Ze overriden de 'quack()'-methode.

>De class 'Duck' heeft de interfaces 'FlyBehavior' en 'QuackBehavior' als properties. Dit zorgt ervoor dat een eend een vlieggedrag en een kwaakgedrag heeft. Verder hebben we een constructor die een standaard gedragingen instelt voor ons eendje, en de methoden performFly() & performQuack() welke respectievelijk de fly() en quack()-methoden van de behaviors oproepen.

> De rubberduck kan in dit voorbeeld standaard niet vliegen, maar dankzij de setFlyBehavior()-methode kunnen we dit dynamisch wijzigen!
## Code:
> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: `package edu.ap.mathiasv.dp_strategyducksimulator;`

### MiniDuckSimulator (Main)
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
### Abstract class Duck
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
    
    public void setFlyBehavior(FlyBehavior flyBehavior){
        this.flyBehavior = flyBehavior;
    }
    
    public void setQuackBehavior(QuackBehavior quackBehavior){
        this.quackBehavior = quackBehavior;
    }
    
    public FlyBehavior getFlyBehavior(){
        return this.flyBehavior;
    }

    public QuackBehavior getQuackBehavior() {
        return this.quackBehavior;
    }
    
    @Override
    public String toString() {
        return "No specific duck found.";
    }
}
```
### Subclasses van Duck
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
#### RubberDuck
```java
public class RubberDuck extends Duck{
    public RubberDuck() {
        super(new FlyNoWay(), new Squeak());
    }

    @Override
    public String fly() {
        return "Rubber duck " + super.fly();
    }

    @Override
    public String quack() {
        return "Rubber duck " + super.quack();
    }

    public void setFlyable(){
        this.setFlyBehavior(new FlyWithWings());
    }
    
    public void setUnflyable(){
        this.setFlyBehavior(new FlyNoWay());
    }
    
    @Override
    public String toString() {
        return "A Rubber duck.";
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