# Oefening State Pattern

> We maken gebruik van een Interface state om de basisfuncties van een State in te stellen.
> Specifieke states maken we door klasses te gebruiken die de State interface implementeren. In dit voorbeeld is er ook een abstracte klasse die de interface implementeerd. De child-classes moeten die implementatie niet meer doen.
> De GumballMachine heeft alle States als property (behalve de abstracte class, WEL de child-classes). We houden ook het aantal beschikbare gumballs bij met een variabele 'count'. Voor zowel die variabele als alle states hebben we getters. Ook hebben we een methode setState om de state van buitenaf te kunnen veranderen. Tot slot hebben we een ToString die de staat van de machine weergeeft.
> In de main maak je eerst een nieuwe machine aan. In dit voorbeeld geef je een bedrijfsnaam, model en een aantal beschikbare gumballs mee als parameters. Nadien gebruik je de methode 'insertQuarter()' om te starten. Tot slot gebruik je 'turnCrank()' om de machine te laten beginnen.

## Code

> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: 'package edu.ap.mathiasv.dp_statepattern;'

### Main

```java
public class Main {
    final static int AANTAL_GUMBALLS = 10;
    public static void main(String[] args) {
        GumballMachine gumballMachine = new GumballMachine("Mighty Gumball, Inc", "Java-enabled Standing Gumball Model #2004", AANTAL_GUMBALLS);
        System.out.println(gumballMachine);
        for(int i = 0; i < AANTAL_GUMBALLS; i++){
            gumballMachine.insertQuarter();
            gumballMachine.turnCrank();
        }
        System.out.println(gumballMachine);
    }
}
```

### Interface State

```java
public interface State {
    public void insertQuarter();
    public void ejectQuarter();
    public void turnCrank();
    public void dispense();
}
```

### GumballMachine

```java
public class GumballMachine {
    private String company;
    private String model;
    private State soldOutState;
    private State noQuarterState;
    private State hasQuarterState;
    private State soldState;
    private State winnerState;
    private State state = soldOutState;
    private int count = 0;
    private final int WINNER_PERCENTAGE_ON_100 = 10;

    public GumballMachine(String company, String model, int numberGumballs) {
        this.company = company;
        this.model = model;
        soldOutState = new SoldOutState(this);
        noQuarterState = new NoQuarterState(this);
        hasQuarterState = new HasQuarterState(this);
        soldState = new SoldState(this);
        winnerState = new WinnerState(this);
        this.count = numberGumballs;
        if(numberGumballs > 0){
            state = noQuarterState;
        }
    }

    public void insertQuarter(){
        state.insertQuarter();
    }

    public void ejectQuarter(){
        state.ejectQuarter();
    }

    public void turnCrank(){
        state.turnCrank();
    }

    public void setState(State state){
        this.state = state;
    }

    public void releaseBall(){
        System.out.println("A gumball comes rolling out the slot...");
        if(count != 0){
            count = count - 1;
        }
    }

    // getters
    public State getNoQuarterState(){
        return noQuarterState;
    }

    public State getHasQuarterState(){
        return hasQuarterState;
    }

    public State getSoldOutState(){
        return soldOutState;
    }

    public State getSoldState(){
        return soldState;
    }

    public State getWinnerState(){
        return winnerState;
    }

    public State getState(){
        return this.state;
    }

    public int getCount(){
        return count;
    }

    public int getWinnerPercentage(){
        return WINNER_PERCENTAGE_ON_100;
    }

    @Override
    public String toString() {
        String summary =
                this.company + "\n" +
                this.model + "\n" +
                "Inventory: " + count + " gumballs\n";
                if(count > 0){
                    summary += "Machine is waiting for a quarter";
                } else {
                    summary += "Machine is sold out";
                }
                return summary;
    }
}
```

### State classes

#### State class NoQuarterState

```java
public class NoQuarterState implements State{
    GumballMachine gumballMachine;

    public NoQuarterState(GumballMachine gumballMachine) {
        this.gumballMachine = gumballMachine;
    }

    @Override
    public void insertQuarter() {
        System.out.println("You inserted a quarter");
        gumballMachine.setState(gumballMachine.getHasQuarterState());
    }

    @Override
    public void ejectQuarter() {
        System.out.println("You haven't inserted a quarter");
    }

    @Override
    public void turnCrank() {
        System.out.println("You turned, but there's no quarter");
    }

    @Override
    public void dispense() {
        System.out.println("You need to pay first");
    }
}
```

#### State class HasQuarterState

> Additional import: `import java.util.Random;`

```java
public class HasQuarterState implements State {
    Random randomWinner = new Random(System.currentTimeMillis());
    GumballMachine gumballMachine;

    public HasQuarterState(GumballMachine gumballMachine) {
        this.gumballMachine = gumballMachine;
    }

    @Override
    public void insertQuarter() {
        System.out.println("You can't insert another quarter");
    }

    @Override
    public void ejectQuarter() {
        System.out.println("Quarter returned");
        gumballMachine.setState(gumballMachine.getNoQuarterState());
    }

    @Override
    public void turnCrank() {
        System.out.println("You turned...");
        int winner = randomWinner.nextInt(gumballMachine.getWinnerPercentage());
        if((winner == 0) && (gumballMachine.getCount() > 1)){
            gumballMachine.setState(gumballMachine.getWinnerState());
        } else {
            gumballMachine.setState(gumballMachine.getSoldState());
        }
        gumballMachine.getState().dispense();
    }

    @Override
    public void dispense() {
        System.out.println("No gumball dispensed");
    }
}
```

#### Abstract state class GumballSoldState

```java
public abstract class GumballSoldState implements State {

    @Override
    public void insertQuarter() {
        System.out.println("Please wait, we're already giving you a gumball");
    }

    @Override
    public void ejectQuarter() {
        System.out.println("Sorry, you already turned the crank");
    }

    @Override
    public void turnCrank() {
        System.out.println("Turning the crank twice doesn't get you another gumball!");
    }

    @Override
    public abstract void dispense();
}
```

#### State class SoldState

```java
public class SoldState extends GumballSoldState {
    GumballMachine gumballMachine;

    public SoldState(GumballMachine gumballMachine) {
        this.gumballMachine = gumballMachine;
    }

    @Override
    public void dispense() {
        gumballMachine.releaseBall();
        if(gumballMachine.getCount() > 0){
            System.out.println("Insert quarter");
            gumballMachine.setState(gumballMachine.getNoQuarterState());
        } else {
            System.out.println("Oops, out of gumballs!");
            gumballMachine.setState(gumballMachine.getSoldOutState());
        }
    }
}
```

#### State class WinnerState

```java
public class WinnerState extends GumballSoldState {
    GumballMachine gumballMachine;

    public WinnerState(GumballMachine gumballMachine) {
        this.gumballMachine = gumballMachine;
    }

    @Override
    public void dispense() {
        System.out.println("YOU'RE A WINNER! You get two gumballs for your quarter");
        gumballMachine.releaseBall();
        if(gumballMachine.getCount() == 0){
            System.out.println("Oops, out of gumballs");
            gumballMachine.setState(gumballMachine.getSoldOutState());
        } else {
            gumballMachine.releaseBall();
            if(gumballMachine.getCount() > 0){
                System.out.println("Insert quarter");
                gumballMachine.setState(gumballMachine.getNoQuarterState());
            } else {
                System.out.println("Oops, out of gumballs");
                gumballMachine.setState(gumballMachine.getSoldOutState());
            }
        }
    }
}
```

#### State class SoldOutState

```java
public class SoldOutState implements State {
    GumballMachine gumballMachine;

    public SoldOutState(GumballMachine gumballMachine) {
        this.gumballMachine = gumballMachine;
    }

    @Override
    public void insertQuarter() {
        System.out.println("SOLD OUT = SOLD OUT");
    }

    @Override
    public void ejectQuarter() {
        System.out.println("SOLD OUT = SOLD OUT");
    }

    @Override
    public void turnCrank() {
        System.out.println("SOLD OUT = SOLD OUT");
    }

    @Override
    public void dispense() {
        System.out.println("SOLD OUT = SOLD OUT");
    }
}
```
