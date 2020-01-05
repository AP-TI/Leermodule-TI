# Crossword data
> Made by Luka & Mathias

## P1 Strategy
### Across
2 Encapsulate what varies
(To achieve encapsulation in Java −
Declare the variables of a class as private.
Provide public setter and getter methods to modify and view the variables values.)
4 Design Patterns Rock
6 Apis Java IO, Networking Sound
9 Rubber ducks make a Squeak
13 Bartender thought they were called Design Patterns
15 Program to this, not an implementation Interface
17 Patterns go into your Brain
18 Learn from the other guy’s Successes
19 Development constant Change
20 Patterns give us a shared Vocabulary
### Down
1 Patterns Recur in many applications
3 Favor this over inheritance Composition
(Inheritance = A cat is an animal. Composition = A car has an engine.)
5 Dan was thrilled with this pattern Observer
7 Most patterns follow from OO Principles
(Encapsulation, Data Abstraction, Polymorphism and Inheritance.)
8 Not your own Failures
10 High level libraries Frameworks
11 Joe’s favorite drink Martini
12 Pattern that fixed the simulator Strategy
13 Duck that can’t quack Decoyduck
14 Grilled cheese with bacon Jackbenny
16 Duck demo was located in Maui

## P2 Observer
### Across
1 Observerable is a Class, not an interface IN ‘java.utils’, als ge het zelf maakt -> interface
3 Devil and angel are Listening to the button
4 Implements this method to get notified Update
-> notifyObservers doet foreach op de lijst van observers en voert update uit
5 Jill got one of her own Job
6 CurrentConditionsDisplay implements this interface Observer
8 How to get yourself off the observer list Removeobserver
12 You forgot this if you’re not getting notified when you think you should be Setchanged
-> setChanged als er iets veranderd is. setChanged roept notifyObservers aan.
15 One subject likes to talk to Many observers 
18 Don’t count on this for notification Order (java.utils)
19 Temperature, humidity and Pressure
20 Observers are Dependant on the subject (inhoud van observers hangt af van de data die het subject doorgeeft)
21 Program to an Interface not an implementation (interface bevat functies)
22 A subject is similar to a Publisher. (publisher als in iemand die data publiceert)
### Down
2 Ron was both an Observer and a Subject
3 You want to keep your coupling Loose.
7 He says you should go for it Devillistener
9 Observable can manage your observers for you
-> add- remove- and notifyObservers
10 Java framework with lots of Observers Swing
11 Weather-O-Rama’s CEO named after this kind of storm Hurricane
13 Observers like to be Notified when something new happens
14 The WeatherData class Implements the Subject interface
16 He didn’t want any more ints, so he removed himself Mouse
17 CEO almost forgot the Heat index display
19 Subject initially wanted to Push all the data to Observer

## P3 Singleton
### Across
1 It was one of a kind Car
2 added to chocolate in the boiler Milk
8 an incorrect implementation caused this to overflow Boiler
10 Singleton provides a single instance and a Global access point
12 flawed multithreading approach if not using java 5 or later Double Checked
13 chocolate capital of the USA Hershey
14 one advantage over global variables: Lazy creation
15 company that produces boilers Choc-O-Holic
16 to totally defeat the new constructor we have to declare the constructor Private
### Down
1 Multiple Classloaders can cause problems.
3 A Singleton is a class that manages an instance of Itself
4 If you don’t need to worry about lazy instantiation, you can create your instance Statically
5 Prior to 1.2, this can eat your Singletons Garbage Collector
6 The Singleton was embarrassed it had no public Constructor
7 The classic implementation doesn’t handle this Multithreading
9 Singleton ensures only one of these exist Instance
11 The Singleton Pattern has one Class

## P4 Decorator
/

## P5 Command
Across
3 the waitress was one Invoker
4 A command Binds a set of actions and a receiver
7 Dr. Seuss diner food Greeneggsandham
8 Our favorite city Objectville
9 Act as the receivers in the remote control Vendorclasses
13 Object that knows the actions and the receiver Command
14 Another thing command can do Undo
15 Object that knows how to get things done Receiver
17 A command encapsulates this A request
Down
1 Role of customer in the Command Pattern Client
2 Our first command object controlled this Light
5 Invoker and receiver are decoupled
6 Company that got us word-of-mouth business Weather-o-rama
10 All commands provide this Execute
11 The cook and this person were definitely decoupled Waitress
12 Carries out a request Receiver
16 Waitress didn’t do this Cook

## P6 BESTAAT NIET
/

## P7 State
/

## P8 Factory
### Across
1 In Factory Method, each franchise is a concrete creator
4 In Factory Method, who decides which class to instantiate? PizzaStore
6 Role of PizzaStore in Factory Method Pattern Creator
7 All New York Style Pizzas use this kind of cheese Reggiano
8 In Abstract Factory, each ingredient factory is a concrete factory
9 When you use new, you are programming to an Implementation
11 createPizza() is a factory method
12 Joel likes this kind of pizza chicagostyle
13 In Factory Method, the PizzaStore and the concrete Pizzas all depend on this abstraction Pizza
14 When a class instantiates an object from a concrete class, it’s Dependent on that object
15 All factory patterns allow us to Encapsulate object creation
### Down
2 We used ObjectComposition in Simple Factory and abstract factory, and inheritance in Factory Method
3 Abstract Factory creates a Family of products
5 Not a real factory pattern, but handy nonetheless SimpleFactory
10 Ethan likes this kind of pizza NYStyle

## P9 Adapter & P10 Facade
### Across
1 True or false, Adapters can only wrap one object False
5 An Adapter Converts an interface
6 Movie we watched RaidersOfTheLostArk
10 In Europe you might need one of these ACAdapter
11 Adapter with two roles Twoway
14 Facade still Allows low level access
15 Duck do it better than Turkeys Fly
16 Disadvantage of the Principle of Least Knowledge: too many Wrappers
17 A Facade simplifies an interface
19 New American dream HomeTheater
### Down
2 Decorator called adapter this SimplePassthrough
3 One advantage of facade Decoupling
4 Principle that wasn’t easy as it sounded Least Knowledge
7 A Decorator adds new behavior
8 Masquerading as a duck Turkey
9 Example that violates the principle of least knowledge System.out.PrintLn
12 No movie complete without this Popcorn
13 Adapter client uses the Target interface
18 An Adapter and a decorator can be said to wrap an object

## P11 Template
### Across
1 Strategy uses Composition rather than inheritance
4 Type of sort used in Arrays MergeSort
5 The JFrame hook method that we overrode to print “I Rule” Paint
6 The Template Method Pattern uses Inheritance to defer implementation to other classes
8 Coffee and Tea
9 Don’t call us, we’ll call you is known as the Hollywood Principe
12 A template method defines the steps of an Algorithm
13 In this chapter we gave you more Caffeine
14 The template method is usually defined in an Abstract class
16 Class that likes web pages Applet
### Down
2 Optional algorithm steps are implemented by hook methods
3 Factory Method is a Specialization of Template Method
7 The steps in the algorithm that must be supplied by the subclasses are usually declared Abstract
8 Huey, Louie and Dewey all weigh Two pounds
9 A method in the abstract superclass that does nothing or provide default behavior is called a hook method
10 Big headed pattern Strategy
11 Our favorite coffee shop in Objectville Starbuzz
15 The arrays class implements template method as a Static method

## Belangrijkste items (volgens ons)
Encapsulate what varies
(To achieve encapsulation in Java −
Declare the variables of a class as private.
Provide public setter and getter methods to modify and view the variables values.)
Program to this, not an implementation Interface
Favor this over inheritance Composition
(Inheritance = A cat is an animal. Composition = A car has an engine.)
High level libraries Frameworks
Pattern that fixed the simulator Strategy
Observerable is a Class, not an interface IN ‘java.utils’, als ge het zelf maakt -> interface
Implements this method to get notified Update
-> notifyObservers doet foreach op de lijst van observers en voert update uit
CurrentConditionsDisplay implements this interface Observer
How to get yourself off the observer list Removeobserver
You forgot this if you’re not getting notified when you think you should be Setchanged
-> setChanged als er iets veranderd is. setChanged roept notifyObservers aan.
One subject likes to talk to Many observers 
Don’t count on this for notification Order (java.utils)
Observers are Dependant on the subject (inhoud van observers hangt af van de data die het subject doorgeeft)
Program to an Interface not an implementation (interface bevat functies)
A subject is similar to a Publisher. (publisher als in iemand die data publiceert)
You want to keep your coupling Loose.
Observable can manage your observers for you
-> add- remove- and notifyObservers
The WeatherData class Implements the Subject interface
Subject initially wanted to Push all the data to Observer
Singleton provides a single instance and a Global access point
flawed multithreading approach if not using java 5 or later Double Checked
one advantage over global variables: Lazy creation
to totally defeat the new constructor we have to declare the constructor Private
A Singleton is a class that manages an instance of Itself
If you don’t need to worry about lazy instantiation, you can create your instance Statically
The Singleton was embarrassed it had no public Constructor
The classic implementation doesn’t handle this Multithreading
Singleton ensures only one of these exist Instance
The Singleton Pattern has one Class
the waitress was one Invoker
A command Binds a set of actions and a receiver
Object that knows the actions and the receiver Command
Another thing command can do Undo
Object that knows how to get things done Receiver
A command encapsulates this A request
Invoker and receiver are decoupled
All commands provide this Execute
Carries out a request Receiver
In Factory Method, each franchise is a concrete creator
In Factory Method, who decides which class to instantiate? PizzaStore In the cityyyy of Californiaaa
Role of PizzaStore in Factory Method Pattern Creator
In Abstract Factory, each ingredient factory is a concrete factory
When you use new, you are programming to an Implementation
createPizza() is a factory method
In Factory Method, the PizzaStore and the concrete Pizzas all depend on this abstraction Pizza
When a class instantiates an object from a concrete class, it’s Dependent on that object
All factory patterns allow us to Encapsulate object creation
We used ObjectComposition in Simple Factory and abstract factory, and inheritance in Factory Method
Not a real factory pattern, but handy nonetheless SimpleFactory
True or false, Adapters can only wrap one object False
Disadvantage of the Principle of Least Knowledge: too many Wrappers
A Facade simplifies an interface
One advantage of facade Decoupling
Principle that wasn’t easy as it sounded Least Knowledge
A Decorator adds new behavior
Masquerading as a duck Turkey
Example that violates the principle of least knowledge System.out.PrintLn
Adapter client uses the Target interface
An Adapter and a decorator can be said to wrap an object
Strategy uses Composition rather than inheritance
The Template Method Pattern uses Inheritance to defer implementation to other classes
Don’t call us, we’ll call you is known as the Hollywood Principe
A template method defines the steps of an Algorithm
The template method is usually defined in an Abstract class
Optional algorithm steps are implemented by hook methods
The steps in the algorithm that must be supplied by the subclasses are usually declared Abstract
A method in the abstract superclass that does nothing or provide default behavior is called a hook method
The arrays class implements template method as a Static method
