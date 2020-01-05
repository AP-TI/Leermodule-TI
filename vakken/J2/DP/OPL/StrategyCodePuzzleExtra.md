# Oefening Strategy Pattern: Code Puzzle Extra

> Zelfde uitleg als [de normale opgave](./StrategyCodePuzzle.md) echter met een extra class genaamd fight.

## Code

> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: `package edu.ap.danati.codepuzzle;`

```java
public class Main {

    public static void main(String[] args) {
        final String rematchMessage = "Rematch? Enter a random character. Else enter: '/'";

        King julian = new King("King Julian");
        Troll theElder = new Troll("The elder one");
        Fight fight1 = new Fight(theElder, julian);
        Scanner scanner = new Scanner(System.in);
        System.out.println(fight1.performFight());

        System.out.println(rematchMessage);
        while (!"/".equals(scanner.next())) {
            System.out.println(fight1.performRematch());
            System.out.println(rematchMessage);
        }
    }
}
```

```java
public class AxeBehavior extends WeaponBehavior {

    public AxeBehavior() {
        super(10, 3, 50, 10);
    }

}
```

```java
public class BowAndArrowBehavior extends WeaponBehavior {

    public BowAndArrowBehavior() {
        super(15, 10, 70, 20);
    }

}
```

```java
public class Character {

    private static final int MAX_HEALTH = 100, MIN_HEALTH = 0;

    private WeaponBehavior weapon;
    private String name;
    private double hitPoints;

    public Character(WeaponBehavior weapon, String name) {
        this.weapon = weapon;
        this.name = name;
        this.hitPoints = MAX_HEALTH;
    }

    public WeaponBehavior getWeapon() {
        return weapon;
    }

    public void setWeapon(WeaponBehavior weapon) {
        this.weapon = weapon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getHitPoints() {
        return hitPoints;
    }

    private void setHitPoints(double hitPoints) {
        this.hitPoints = hitPoints;
    }

    public void revive() {
        if (this.getHitPoints() <= MIN_HEALTH) {
            this.setHitPoints(MAX_HEALTH);
        }
    }
    
    public void restoreFullHealth(){
        this.setHitPoints(MAX_HEALTH);
    }

    public String reduceHealth(double amount) {
        String message = "";

        if (isVitalHit(amount)) {
            this.setHitPoints(0);
            message = this.getName() + " just died!";
        } else {
            this.setHitPoints(this.getHitPoints() - amount);
        }

        return message;
    }

    private boolean isVitalHit(double amount) {
        return amount >= this.getHitPoints();
    }

    public boolean isAlive() {
        return this.getHitPoints() > 0;
    }

    public void fight(Character victim) {
        this.weapon.useWeaponOn(victim);
    }

    @Override
    public String toString() {
        return name + "(HP: " + hitPoints + '}';
    }

}
```

```java
public class Fight {

    private final Character fighterOne;
    private final Character fighterTwo;

    private Character winner;
    private Character loser;
    private boolean fightOver;

    public Fight(Character fighterOne, Character fighterTwo) {
        this.fighterOne = fighterOne;
        this.fighterTwo = fighterTwo;
        this.winner = null;
        this.loser = null;
        this.fightOver = false;
    }

    public Character getFighterOne() {
        return fighterOne;
    }

    public Character getFighterTwo() {
        return fighterTwo;
    }

    public Character getWinner() {
        return winner;
    }

    private void setWinner(Character winner) {
        this.winner = winner;
    }

    public Character getLoser() {
        return loser;
    }

    private void setLoser(Character loser) {
        this.loser = loser;
    }

    private boolean isFightOver() {
        return fightOver;
    }

    private void setFightOver(boolean isDone) {
        this.fightOver = isDone;
    }

    private String performOneRound() {
        String message = "";
        Character attacker;
        Character victim;

        if (fighterOneIsFirst()) {
            attacker = this.getFighterOne();
            victim = this.getFighterTwo();
        } else {
            attacker = this.getFighterTwo();
            victim = this.getFighterOne();
        }

        message += attackTheVictim(attacker, victim);

        if (didSomeoneDie()) {
            this.setFightOver(true);

            setWinnerAndLoser();

            message += "\n" + this.toString();
        }

        return message;
    }

    private boolean didSomeoneDie() {
        return !this.getFighterOne().isAlive() || !this.getFighterTwo().isAlive();
    }

    private void setWinnerAndLoser() {
        if (this.getFighterOne().isAlive()) {
            this.setWinner(this.getFighterOne());
            this.setLoser(this.getFighterTwo());
        } else {
            this.setWinner(this.getFighterTwo());
            this.setLoser(this.getFighterOne());
        }
    }

    private String attackTheVictim(Character attacker, Character victim) {
        String message = attacker.getWeapon().useWeaponOn(victim);

        if (victim.isAlive()) {
            Character tmp = attacker;
            attacker = victim;
            victim = tmp;
            message += "\n" + attacker.getWeapon().useWeaponOn(victim);
        }

        return message;
    }

    public String performRematch() {
        String message = "Rematch!\n";

        message += "Revive players...\n";
        this.getLoser().revive();
        this.getWinner().restoreFullHealth();

        this.setFightOver(false);

        message += "Reset winner and loser...\n";
        this.setLoser(null);
        this.setWinner(null);

        message += performFight();

        return message;
    }

    public String performFight() {
        String message = "";
        while (!this.isFightOver()) {
            message += performOneRound() + "\n";
        }

        return message;
    }

    private boolean fighterOneIsFirst() {
        return this.getFighterOne().getWeapon().getSpeed() > this.getFighterTwo().getWeapon().getSpeed();
    }

    @Override
    public String toString() {
        return "Fight{" + "winner=" + this.getWinner().getName() + ", loser=" + this.getLoser().getName() + '}';
    }
}
```

```java
public class King extends Character {

    public King(String name) {
        super(new SwordBehavior(), name);
    }

}
```

```java
public class KnifeBehavior extends WeaponBehavior {

    public KnifeBehavior() {
        super(4, 2, 0, 25);
    }

}
```

```java
public class Knight extends Character {

    public Knight(String name) {
        super(new SwordBehavior(), name);
    }

}
```

```java
public class Queen extends Character {

    public Queen(String name) {
        super(new BowAndArrowBehavior(), name);
    }

}
```

```java
public class SwordBehavior extends WeaponBehavior {

    public SwordBehavior() {
        super(10, 10, 40, 12);
    }

}
```


```java
public class Troll extends Character {

    public Troll(String name) {
        super(new AxeBehavior(), name);
    }

}
```

```java
public abstract class WeaponBehavior {

    private static final Random RANDOM = new Random();
    private static final double ROLL_PERCENTAGE = 100;
    private static final double MAX_SPEED = 25, MIN_SPEED = 1;
    private static final double MAX_MISS_CHANCE = 99, MIN_MISS_CHANCE = 0;
    private static final double MAX_DAMAGE = 25, MIN_DAMAGE = 0;
    private static final double MAX_RANGE = 20, MIN_RANGE = 0;
    private static final int CRITICAL_CHANCE = 10, CRITICAL_VALUE = 9;
    private static final double CRITICAL_MODIFIER = 0.50D;

    private double damage;
    private double range;
    private double missChance;
    private double speed;

    public WeaponBehavior(double damage, double range, double missChance, double speed) {
        this.setDamage(damage);
        this.setRange(range);
        this.setMissChance(missChance);
        this.setSpeed(speed);
    }//10, 3, 50, 10

    public double getSpeed() {
        return speed;
    }

    public void setSpeed(double speed) {
        if (speed > MAX_SPEED || speed < MIN_SPEED) {
            throw new IllegalArgumentException("Speed not valid.");
        }

        this.speed = speed;
    }

    public double getMissChance() {
        return missChance;
    }

    public void setMissChance(double missChance) {
        if (missChance < MIN_MISS_CHANCE || missChance > MAX_MISS_CHANCE) {
            throw new IllegalArgumentException("Misspercentage not valid.");
        }

        this.missChance = missChance;
    }

    public double getDamage() {
        return damage;
    }

    public void setDamage(double damage) {
        if (damage > MAX_DAMAGE || damage < MIN_DAMAGE) {
            throw new IllegalArgumentException("Damage not valid.");
        }

        this.damage = damage;
    }

    public double getRange() {
        return range;
    }

    public void setRange(double range) {
        if (range > MAX_RANGE || range < MIN_RANGE) {
            throw new IllegalArgumentException("Range not valid.");
        }

        this.range = range;
    }

    public String useWeaponOn(Character victim) {
        String message = victim.toString() + " gets attacked: ";

        if (!isMis()) {
            message += "The attacker did not miss! ";
            double totalDamage = this.getDamage();

            if (isCritical()) {
                message += "Critical hit!";
                totalDamage += totalDamage * CRITICAL_MODIFIER;
            }

            message += " He dealt " + totalDamage + " damage! ";
            message += victim.reduceHealth(totalDamage);
        } else {
            message += " the attacker missed!";
        }

        return message;
    }

    private boolean isMis() {
        return RANDOM.nextInt((int) ROLL_PERCENTAGE) < this.getMissChance();
    }

    private boolean isCritical() {
        return RANDOM.nextInt(CRITICAL_CHANCE) == CRITICAL_VALUE;
    }

    public void miss() {
        System.out.println("You missed!");
    }
}
```
