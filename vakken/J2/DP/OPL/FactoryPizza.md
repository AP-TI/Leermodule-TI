# Oefening Abstract Factory Pattern
>Deze keer in het engels omdat ik het eerst in het Engels heb geschreven bij Summary en ik heb geen zin om het terug te vertalen... Moest je het toch niet snappen: pm Mathias op Discord of maak een Issue aan op Github.

>Here’s our hero: PIZZA. We’ve got Cheesepizza, Clampizza, Pepperonipizza and Veggiepizza. Pizza can be made in New York (NY) and Chicago. Pizza exists of Dough, Sauce, Cheese, Veggies, Pepperoni and Clams. We have different doughs, sauces, cheeses, veggies, pepperonis and clams.

>We have an abstract class PizzaStore. This is where we are able to order a pizza, and where the pizzas are produced. We have an order and abstract create method here. The create method is abstract because we have different stores which makes the pizza in another way. The classes which inherit from Pizzastore (NYPizzaStore and ChicagoPizzaStore) will override that create method to be able to use their components.

>We have an abstract class Pizza with the basic methods to cut, bake, slice… the pizza.
We have classes that inherit from Pizza: CheesePizza, ClamPizza, PepperoniPizza and VeggiePizza. They all have properties like dough, sauce, … There’s a method ‘prepare()’ too. To make such a Pizza, you’ll need to give a FACTORY as a parameter (explanation of factory is down here).

>We’ve got an interface PizzaIngredientFactory which has methods to create components. Ofcourse there are classes which implement this interface: NYPizzaIngredientFactory and ChicagoPizzaIngredientFactory. They implement those methods to create their own components.

>Last but not least: the components and ingredients. Different stores have the same components, but they use different ingredients to make them. This means we have different sauces, different doughs, different veggies… That’s why we have an interface for each component: An interface Dough, Sauce, Veggies, Clams, Pepperoni. Then we have classes which implement them and specify them, like ThickCrustDough and ThinCrustDough.

>Extra explanation: some stores use other veggies in their veggie-component. That’s why we use an array for this component, which is filled with different veggie-classes like Garlic, Mushrooms, Onion, RedPepper...


## Code:
> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: 'package edu.ap.mathiasv.dp_factorypattern;'
> Enkel het NY gedeelte is uitgewerkt. Je kan als oefening proberen om zelf het Chicago-gedeelte uit te werken.
> Enkel de Dough- en Veggiescomponent worden hier uitgewerkt. Dough is de standaard, dus die methode kan je kopiëren naar Clams, Sauce, Pepperoni... Veggies is een beetje specialer omdat het een array is, vandaar dat ik er enkele groentes bij zet. Je kan in de code zien hoe de aparte groentes in de veggies-array worden gestoken.

### PizzaStore
#### Abstract class PizzaStore
```java
public abstract class PizzaStore {
    public Pizza orderPizza(String type){
        Pizza pizza;
        pizza = createPizza(type);
        pizza.prepare();
        pizza.bake();
        pizza.cut();
        pizza.box();
        return pizza;
    }
    abstract Pizza createPizza(String type);
}
```
#### Class NYPizzaStore
```java
public class NYPizzaStore extends PizzaStore {
    @Override
    protected Pizza createPizza(String type) {
        Pizza pizza = null;
        PizzaIngredientFactory ingredientFactory = new NYPizzaIngredientFactory();
        if(type.equals("cheese")){
            pizza = new CheesePizza(ingredientFactory);
            pizza.setName("New York Style Cheese Pizza");
        } else if (type.equals("veggie")){
            pizza = new VeggiePizza(ingredientFactory);
            pizza.setName("New York Style Veggie Pizza");
        } else if (type.equals("clam")){
            pizza = new ClamPizza(ingredientFactory);
            pizza.setName("New York Style Clam Pizza");
        } else if (type.equals("pepperoni")){
            pizza = new PepperoniPizza(ingredientFactory);
            pizza.setName("New York Style Pepperoni Pizza");
        }
        return pizza;
    }
}
```
### PizzaIngredientFactory
#### Interface PizzaIngredientFactory
```java
interface PizzaIngredientFactory {
    public Dough createDough();
    public Sauce createSauce();
    public Cheese createCheese();
    public Veggies[] createVeggies();
    public Pepperoni createPepperoni();
    public Clams createClams();
}
```
#### Class NYPizzaIngredientFactory
```java
public class NYPizzaIngredientFactory implements PizzaIngredientFactory {

    @Override
    public Dough createDough() {
        return new ThinCrustDough();
    }

    @Override
    public Sauce createSauce() {
        return new MarinaraSauce();
    }

    @Override
    public Cheese createCheese() {
        return new ReggianoCheese();
    }

    @Override
    public Veggies[] createVeggies() {
        Veggies veggies[] = { new Garlic(), new Onion(), new Mushroom(), new RedPepper() };
        return veggies;
    }

    @Override
    public Pepperoni createPepperoni() {
        return new SlicedPepperoni();
    }

    @Override
    public Clams createClams() {
        return new FreshClams();
    }
}
```
### Pizza
#### Abstract class Pizza
```java
public abstract class Pizza {
    private String name;
    
    abstract void prepare();
    
    void bake(){
        System.out.println("Bake for 25 minutes at 350 degrees");
    }
    
    void cut(){
        System.out.println("Cutting the pizza into diagonal slices");
    }
    
    void box(){
        System.out.println("Place pizza in official PizzaStore box");
    }
    
    void setName(String name){
        this.name = name;
    }
    
    String getName(){
        return this.name;
    }

    @Override
    public String toString() {
        return getName(); 
    }
}
```
#### class CheesePizza
```java
public class CheesePizza extends Pizza {
    private Dough dough;
    private Sauce sauce;
    private Cheese cheese;
    PizzaIngredientFactory ingredientFactory;
    
    public CheesePizza(PizzaIngredientFactory ingredientFactory){
        this.ingredientFactory = ingredientFactory;
    }

    @Override
    void prepare() {
        System.out.println("Preparing " + this.getName());
        dough = ingredientFactory.createDough();
        sauce = ingredientFactory.createSauce();
        cheese = ingredientFactory.createCheese();
    }
}
```
#### class ClamPizza
```java
public class ClamPizza extends Pizza{
    private Dough dough;
    private Sauce sauce;
    private Clams clams;
    PizzaIngredientFactory ingredientFactory;
    
    public ClamPizza(PizzaIngredientFactory ingredientFactory){
        this.ingredientFactory = ingredientFactory;
    }

    @Override
    void prepare() {
        System.out.println("Preparing " + this.getName());
        dough = ingredientFactory.createDough();
        sauce = ingredientFactory.createSauce();
        clams = ingredientFactory.createClams();
    }
}
```
#### class PepperoniPizza
```java
public class PepperoniPizza extends Pizza {
    private Dough dough;
    private Sauce sauce;
    private Pepperoni pepperoni;
    PizzaIngredientFactory ingredientFactory;
    
    public PepperoniPizza(PizzaIngredientFactory ingredientFactory){
        this.ingredientFactory = ingredientFactory;
    }

    @Override
    void prepare() {
        System.out.println("Preparing " + this.getName());
        dough = ingredientFactory.createDough();
        sauce = ingredientFactory.createSauce();
        pepperoni = ingredientFactory.createPepperoni();
    }
}
```
#### class VeggiePizza
```java
public class VeggiePizza extends Pizza{
    private Dough dough;
    private Sauce sauce;
    private Veggies veggies[];
    PizzaIngredientFactory ingredientFactory;
    
    public VeggiePizza(PizzaIngredientFactory ingredientFactory){
        this.ingredientFactory = ingredientFactory;
    }

    @Override
    void prepare() {
        System.out.println("Preparing " + this.getName());
        dough = ingredientFactory.createDough();
        sauce = ingredientFactory.createSauce();
        veggies = ingredientFactory.createVeggies();
    }
}
```
### Ingredients
> De volgende classes zijn gewoon leeg. Dit omdat het maar een voorbeeld is. In het echt zou je mis de hoeveelheid, de dikte van een laag ... als properties kunnen hebben, en uiteraard een 'toString()'.
#### Dough
##### Interface Dough
```java
public interface Dough {
    
}
```
##### ThickCrustDough
```java
public class ThickCrustDough implements Dough {
    
}
```
##### ThinCrustDough
```java
public class ThinCrustDough implements Dough {
    
}
```
#### Veggies
##### Interface Veggies
```java
public interface Veggies {
    
}
```
##### Garlic
```java
public class Garlic implements Veggies{
    
}
```
##### Onion
```java
public class Onion implements Veggies{
    
}
```