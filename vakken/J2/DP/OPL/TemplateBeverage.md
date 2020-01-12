# Oefening Facade Pattern

> Uitleg niet voorzien wegens te weinig tijd, maar zo moeilijk is het niet...

## Code

> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: 'package edu.ap.mathiasv.dp_templatepattern;'
> Hier zouden nog 'toString()' methodes bij moeten, maar die zijn weggelaten om tijd te besparen.

### Main

```java
public class Main {
    public static void main(String[] args) {
        Coffee koffie = new Coffee();
        koffie.prepareRecipe();
        Tea tea = new Tea();
        tea.prepareRecipe();
    }
}
```

### Abstract Class CaffeineBeverage

```java
public abstract class CaffeineBeverage {
    final void prepareRecipe(){
        boilWater();
        brew();
        pourInCup();
        if(customerWantsCondiments()){
            addCondiments();
        }
    }

    public void boilWater(){
        System.out.println("The water is boiling");
    }
    abstract void brew();
    public void pourInCup(){
        System.out.println("Pouring the brew in a cup");
    }
    abstract void addCondiments();
    public boolean customerWantsCondiments(){
        return false;
    }
}
```

### Beverages

### Class Coffee

```java
public class Coffee extends CaffeineBeverage {
    public Coffee() {
    }

    @Override
    void brew() {
        System.out.println("Dripping Coffee through filter");
    }

    @Override
    void addCondiments() {
        System.out.println("NO!! We like it black");
    }
}
```

### Class Tea

> Vereist de volgende imports:

```java
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
```

```java
public class Tea extends CaffeineBeverage {
    public Tea() {
    }

    @Override
    void brew() {
        System.out.println("Steeping the tea");
    }

    @Override
    void addCondiments() {
        System.out.println("Adding lemon");
    }

    @Override
    public boolean customerWantsCondiments(){
        String input = getUserInput();

        if (input.toLowerCase().startsWith("y")) {
            return true;
        }else{
            return false;
        }
    }

    private String getUserInput(){
        String input = null;

        System.out.println("Would you like to add condiments yes/no ");
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        try{
            input = in.readLine();
        }catch(IOException ioe) {
            System.err.println("IOException trying to read your input");
        }
        if (input == null) {
            return "no";
        }
        return input;
    }
}
```
