# Oefening Strategy Pattern: MiniDuckSimulator
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