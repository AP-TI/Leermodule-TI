# Oefening Adapter Pattern
> We willen een Turkey maken die net zoals een eend geluid kan maken en kan vliegen.

> We maken een interface 'Turkey' met een class WildTurkey die daar de interface implementeerd. Deze klasse vraagt geen parameters.

> We maken een klasse TurkeyAdapter die 'Duck' implementeerd. De constructor vraagt een uiteraard een Turkey om die vervolgens te 'adapten'. Omdat we 'Duck' implementeren overriden we 'quack()' en de 'fly()' methodes. We gebruiken namelijk geen behaviors meer in onze nieuwe manier van coderen. De turkey die we als parameter vroegen kunnen we nu geven aan een private variabele 'private Turkey turkey;'. Zo hebben we onze turkey om methodes op aan te roepen. 

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
### Interface Duck
```java
public interface Duck {
    public void fly();
    public void quack();
}
```
### Interface Turkey
```java
public interface Turkey {
    public void gobble();
    public void fly();
}
```
### Class WildTurkey
```java
public class WildTurkey implements Turkey{
    public WildTurkey(){}
    @Override
    public void gobble() {
        System.out.println("Gobble gobble");
    }
    @Override
    public void fly(){
        System.out.println("I'm flying a short distance");
    }
}
```
### Class TurkeyAdapter
```java
public class TurkeyAdapter implements Duck {
    private Turkey turkey;
    public TurkeyAdapter(Turkey turkey) {
        this.turkey = turkey;
    }
    
    @Override
    public void quack() {
        this.turkey.gobble();
    }

    @Override
    public void fly() {
        this.turkey.fly();
    }
}
```