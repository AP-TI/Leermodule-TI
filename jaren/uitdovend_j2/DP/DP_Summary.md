# Design Patterns

## Strategy Pattern

> Summary:

Abstract class
Specific classes which extend the abstract class
Interfaces for main functions
Classes which implement a main function and specify it
Abstract class has all main functions as a property
When created, specific class takes 2 variables which fill in the properties of abstract class

> Example:

Abstract class Duck
Class Subduck extends Duck
Interface Behavior
Behavior-classes implements Behavior
Duck has property of each Behavior
Duck sets Behavior in constructor via properties
Subduck constructor takes variable of each behavior and sends them to parent-class Duck

## Observer Pattern

> Summary:

Interface Observer (update)
Interface Observable (list of observers, add/remove observers)
Class DATA implements Observable (contains data, keeps track of observers)
Class DISPLAY implements Observer (displays data, updates data)

> Example:

Interface Observer (update)
Interface Observable (list of observers, add/remove observers)
Class WeatherData implements Observable (contains data, keeps track of observers)
Class ForecastDisplay implements Observer (displays data, updates data)

## Singleton Pattern

> Summary:

Class with private constructor and static method that always returns the same static uniqueInstance

> Example:

Class ChocolateBoiler with private constructor and static method getInstance that always returns the same static uniqueInstance, plus extra methods.

## Decorator Pattern

> Summary:

Abstract class item
Specific classes which extend item
Abstract class condiments (things you can add to the item)
Specific condiment classes which extend the condiments abstract class, having a beverage as a parameter

> Example:

Abstract class Beverage
Specific classes Decaf, DarkRoast, HouseBlend, Espresso
Abstract class CondimentDecorator
Specific condiment classes Milk, Soy, Whip and Mocha, having a beverage as a property
Main: make new beverage, then add condiment by making a new condiment with the beverage as parameter.

## Command Pattern

> Summary:

Interface ‘Command’: execute & undo methods
Class item: functionalities -> methods
Item has a few commandclasses which binds Command methods to item functionalities
Remote class which can set new commands and call existing commands

> Example:

Interface ‘Command’: execute & undo methods
Class Light: methods ‘On()’ and ‘Off()’
LightOnCommand (execute() -> On()) and LightOfCommand (execute() -> Off()). Undo does the opposite of execute.
Remote has a list with commands. You can add commands with the ‘setCommand(Command command, int slot)’-method and then execute them with the ‘buttonWasPressed(int slot)’-method.

## State Pattern

> Summary:

Interface State: basic methods
Specific classes which implements the State interface
(possible abstract classes for states with code duplication)
Item with states as property, setState method, state-getters…
Easy to add state: make new state class which implements State interface and add the state as a property to the item.

> Example:

Interface State: basic methods
Specific classes which implement State interface: NoQuarterState, HasQuarterState, SoldOutState and the abstract class GumballSoldOutState
GumballSoldState as an abstract class. SoldState and Winnerstate inherit from it (so they don’t need to implement the State interface because GumballSoldState already implements it)
GumballMachine as out item. It has properties of each state (not GumballSoldState but its ‘children’). It has a method setState to change the machines state. It has getters for each state. In this case it contains a count, company and model. We also need a getter for count to know the amount of gumballs outside the class.
New state? Make new class which implements State interface, add is as a property to GumballMachine, create a getter and you’re ready to crank.

## Factory Pattern

> Summary:

You’ve got a product which has many different species. Each species can be made on different locations, where they use different components made out of different ingredients. We’ve got five grades: the item, the species, the location, the components and the ingredients.
For the item, we’ve got an abstract class with basic methods and other classes which inherit from it to form species.
Next, an abstract class ‘Store’ where the species is made. This class has a method to be able to order a species and an abstract method to create a species. We do have classes which inherit from this abstract class. They override the create method to be able to create each species in another way (with other ingredients).
Now we need an interface for the components. We basically create a factory where they select the right ingredients for that component.
Last but not least, we need interfaces for EACH ingredient and classes which implement one interface and then specify it.

> Example:

Here’s our hero: PIZZA. We’ve got Cheesepizza, Clampizza, Pepperonipizza and Veggiepizza. Pizza can be made in New York (NY) and Chicago. Pizza exists of Dough, Sauce, Cheese, Veggies, Pepperoni and Clams. We have different doughs, sauces, cheeses, veggies, pepperonis and clams.

We have an abstract class PizzaStore. This is where we are able to order a pizza, and where the pizzas are produced. We have an order and abstract create method here. The create method is abstract because we have different stores which makes the pizza in another way. The classes which inherit from Pizzastore (NYPizzaStore and ChicagoPizzaStore) will override that create method to be able to use their components.

We have an abstract class Pizza with the basic methods to cut, bake, slice… the pizza.
We have classes that inherit from Pizza: CheesePizza, ClamPizza, PepperoniPizza and VeggiePizza. They all have properties like dough, sauce, … There’s a method ‘prepare()’ too. To make such a Pizza, you’ll need to give a FACTORY as a parameter (explanation of factory is down here).

We’ve got an interface PizzaIngredientFactory which has methods to create components. Ofcourse there are classes which implement this interface: NYPizzaIngredientFactory and ChicagoPizzaIngredientFactory. They implement those methods to create their own components.

Last but not least: the components and ingredients. Different stores have the same components, but they use different ingredients to make them. This means we have different sauces, different doughs, different veggies… That’s why we have an interface for each component: An interface Dough, Sauce, Veggies, Clams, Pepperoni. Then we have classes which implement them and specify them, like ThickCrustDough and ThinCrustDough.

Extra explanation: some stores use other veggies in their veggie-component. That’s why we use an array for this component, which is filled with different veggie-classes like Garlic, Mushrooms, Onion, RedPepper...
