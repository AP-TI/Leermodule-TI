# Oefening Singleton Pattern
> We maken gebruik van een private constructor, een static variable 'uniqueInstance' en een static method 'getInstance()'.

> De 'getInstance()'-method geeft telkens dezelfde 'uniqueInstance' mee. Indien die nog niet bestaat, maakt hij een nieuwe aan door gebruik te maken van de private constructor.

> Uiteraard heeft de boiler zelf methodes zoals 'fill()', 'drain()' en 'boil()'.

## Code:
> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: 'package edu.ap.mathiasv.dp_singletonpattern;'

### Main
```java
public class Main {
    public static void main(String[] args) {
        ChocolateBoiler boiler = ChocolateBoiler.getInstance(); // get instance
        System.out.println(boiler); // print initial boiler
        boiler.fill();
        System.out.println(boiler); 
        ChocolateBoiler boiler2 = ChocolateBoiler.getInstance(); // get another (?) boiler
        boiler2.boil();
        System.out.println(boiler2);
		// look at the output to see that both 'fill()' and 'boil()' were used on `another variable, but THE SAME instance`!!
    }
}
```
### Singleton-class ChocolateBoiler
```java
public class ChocolateBoiler {
    private static ChocolateBoiler uniqueInstance;
    private boolean empty;
    private boolean boiled;
    
    private ChocolateBoiler(){
        empty = true;
        boiled = false;
    }
    
	// This getInstance method can fail due to multi-threading. Look at the powerpoint to see how you can make this incredibly complex (but better).
    public static ChocolateBoiler getInstance(){
        if(uniqueInstance == null){
            uniqueInstance = new ChocolateBoiler();
        }
        return uniqueInstance;
    }
    
    public void fill(){
        if(isEmpty()){
            empty = false;
            boiled = false;
        }
    }
    
    public void drain(){
        if(!isEmpty() && isBoiled()){
            empty = true;
        }
    }
    
    public void boil(){
        if(!isEmpty() && !isBoiled()){
            boiled = true;
        }
    }
    
    public boolean isEmpty(){
        return empty;
    }
    
    public boolean isBoiled(){
        return boiled;
    }

    @Override
    public String toString() {
        return "Filled: " + !isEmpty() + " Boiled: " + isBoiled(); 
    }
}
```