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

### MiniDuckSimulator (Main)
```java
public class MiniDuckSimulator {
    public static void main(String[] args) {
        Duck mallard = new MallardDuck();
        mallard.performQuack();
        mallard.performFly();
        Duck model = new ModelDuck();
        model.performFly();
        model.setFlyBehavior(new FlyRocketPowered());
        model.performFly();
    }
}
```
### Class Duck
```java
public abstract class Duck {
    FlyBehavior flyBehavior;
    QuackBehavior quackBehavior;
    
    public void setFlyBehavior(FlyBehavior flyBehavior) {
        this.flyBehavior = flyBehavior;
    }

    public void setQuackBehavior(QuackBehavior quackBehavior) {
        this.quackBehavior = quackBehavior;
    }  
    
    public Duck(){
        
    }

    public abstract void display();
    
    public void performFly(){
        flyBehavior.fly();
    }
    public void performQuack(){
        quackBehavior.quack();
    }
    public void swim(){
        System.out.println("All ducks float, even decoys!");
    }
}
```
### Subclasses van Duck
#### ModelDuck
```java
public class ModelDuck extends Duck {

    public ModelDuck(){
        flyBehavior = new FlyNoWay();
        quackBehavior = new Quack();
    }
    
    @Override
    public void display() {
        System.out.println("I'm a model duck");
    }
}

```

#### MallardDuck
```java
public class MallardDuck extends Duck{

    public MallardDuck(){
        quackBehavior = new Quack();
        flyBehavior = new FlyWithWings();
    }
    
    @Override
    public void display() {
        System.out.println("I look like a Mallard Duck.");
    }
}
```
### Interfaces
#### FlyBehavior Interface
```java
public interface FlyBehavior {
    public void fly();
}
```

#### QuackBehavior Interface
```java
public interface QuackBehavior {
    public void quack();
}
```

### FlyBehaviorclasses
#### FlyWithWings
```java
public class FlyWithWings implements FlyBehavior{

    @Override
    public void fly() {
        System.out.println("I'm flying!");
    }
}
```

#### FlyNoWay
```java
public class FlyNoWay implements FlyBehavior{

    @Override
    public void fly() {
        System.out.println("I can't fly");
    }
}
```

### QuackBehaviorclasses
#### Quack
```java
public class Quack implements QuackBehavior {

    @Override
    public void quack() {
        System.out.println("Quack");
    }
}
```

#### Squeak
```java
public class Squeak implements QuackBehavior{

    @Override
    public void quack() {
        System.out.println("Squeak");
    }
}
```

#### MuteQuack
```java
public class MuteQuack implements QuackBehavior{

    @Override
    public void quack() {
        System.out.println("<< Silence >>");
    }
}
```
### FlyRocketPowered
```java
public class FlyRocketPowered implements FlyBehavior {

    @Override
    public void fly() {
        System.out.println("I'm flying with a rocket!");
    }
}
```