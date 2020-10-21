# Oefening Strategy Pattern: Code Puzzle

> We maken gebruik van een abstract 'Character'-class, waarvan de classes 'King', 'Queen', 'Knight' en 'Troll' overerven.
> Om deze karakters van wapens te voorzien, maken we de 'WeaponBehavior'-interface. Deze bevat de 'useWeapon()'-methode.
> De vier behaviorclasses 'SwordBehavior', 'KnifeBehavior', 'BowAndArrowBehavior' en 'AxeBehavior' implementeren de 'WeaponBehavior'-interface. Ze hebben ook een override van de 'useWeapon()'-methode en 'ToString()'-methode.
> De class 'Character' heeft de interface 'WeaponBehavior' als property. Dit zorgt ervoor dat een karakter een wapen kan gebruiken. Verder hebben we een constructor die een defaultbehavior instelt voor ons karakter, een 'setWeapon()'-methode, een 'fight()'-methode en een 'ToString()'-override.

## Code

> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: `package edu.ap.mathiasv.dp_strategyCodePuzzle;`

### Main

```java
public class Main {
    public static void main(String[] args) {
        King king = new King();
        Queen queen = new Queen();
        Knight knight = new Knight();
        Troll troll = new Troll();

        System.out.println(king);
        System.out.println(queen);
        System.out.println(knight);
        System.out.println(troll);

        WeaponBehavior behavior = new BowAndArrowBehavior();
        knight.setWeapon(behavior);

        System.out.println(knight);
    }
}
```

### Class Character

```java
public abstract class Character {
    public WeaponBehavior behavior;

    public Character(WeaponBehavior behavior) {
        this.behavior = behavior;
    }

    void setWeapon(WeaponBehavior newBehavior){
        behavior = newBehavior;
    }

    public void fight(){
        behavior.useWeapon();
    }

    @Override
    public String toString() {
        return "I'm a character :D";
    }
}
```

### Subclasses van Character

#### King

```java
public class King extends Character {
    public King(){
        super(new SwordBehavior());
    }

    @Override
    public String toString() {
        return "King fighting with " + behavior;
    }
}
```

#### Queen

```java
public class Queen extends Character {
    public Queen(){
        super(new BowAndArrowBehavior());
    }

    @Override
    public String toString() {
        return "Queen fighting with " + behavior;
    }
}
```

#### Knight

```java
public class Knight extends Character {
    public Knight(){
        super(new AxeBehavior());
    }

    @Override
    public String toString() {
        return "Knight fighting with " + behavior;
    }
}
```

#### Troll

```java
public class Troll extends Character {
    public Troll(){
        super(new KnifeBehavior());
    }

    @Override
    public String toString() {
        return "Troll fighting with" + behavior;
    }
}
```

### WeaponBehavior Interface

```java
public interface WeaponBehavior {
    public String useWeapon();
}
```

### Behaviorclasses

#### SwordBehavior

```java
public class SwordBehavior implements WeaponBehavior{
    @Override
    public String useWeapon()
    {
        return "The sword has sweeped.";
    }

    @Override
    public String toString() {
        return "a sword";
    }
}
```

#### AxeBehavior

```java
public class AxeBehavior implements WeaponBehavior{
    @Override
    public String useWeapon()
    {
        return "The axe chopped the enemy in half.";
    }

    @Override
    public String toString() {
        return "an axe";
    }
}
```

#### KnifeBehavior

```java
public class KnifeBehavior implements WeaponBehavior{
    @Override
    public String useWeapon()
    {
        return "The knife has been thrown.";
    }

    @Override
    public String toString() {
        return "a knife";
    }
}
```

#### BowAndArrowBehaviorBehavior

```java
public class BowAndArrowBehavior implements WeaponBehavior{
    @Override
    public String useWeapon()
    {
        return "The arrow has been fired away.";
    }

    @Override
    public String toString() {
        return "a bow and arrows";
    }
}
```
