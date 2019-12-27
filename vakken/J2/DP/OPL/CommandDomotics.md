# Oefening Command Pattern
> We maken gebruik van een interface 'Command'. Elk command kan je uitvoeren en ongedaan maken met de methods 'execute()' en 'undo()'.

> We maken voorwerpen aan die we willen automatiseren, bijvoorbeeld de garagepoort en de lichten van het huis. Maak de klasses 'GarageDoor' en 'Light'. De garagedeur heeft methodes op open en toe te gaan en om te stoppen. De lichten kunnen aan en uit.

> Voor elke methode bij de voorwerpen maken we een aparte klasse, bijvoorbeeld 'GarageDoorCloseCommand'. Hier implementeren we de 'Command'-interface. We hebben hier dus een methode 'execute' die methode aanroept die de garagedeur laat sluiten. De 'undo'-method laat die terug openen.

> We gebruiken een remote controller om de functies van op afstand uit te voeren. We kunnen commando's configureren met 'setCommand()' en commando's uitvoeren met 'buttonWasPressed(int slot)'. 

## Code:
> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: 'package edu.ap.mathiasv.dp_commandpattern;'

### Main
```java
public class Main {
    public static void main(String[] args) {
        SimpleRemoteControl remote = new SimpleRemoteControl();
        
        Light light = new Light();
        LightOnCommand lightOn = new LightOnCommand(light);
        LightOffCommand lightOff = new LightOffCommand(light);
        remote.setCommand(lightOn, 0);
        remote.setCommand(lightOff, 1);
        
        GarageDoor garageDoor = new GarageDoor();
        GarageDoorOpenCommand garageDoorOpen = new GarageDoorOpenCommand(garageDoor);
        GarageDoorCloseCommand garageDoorClose = new GarageDoorCloseCommand(garageDoor);
        GarageDoorStopCommand garageDoorStop = new GarageDoorStopCommand(garageDoor);
        remote.setCommand(garageDoorOpen, 2);
        remote.setCommand(garageDoorClose, 3);
        remote.setCommand(garageDoorStop, 4);
        
        System.out.println(remote.buttonWasPressed(0));
        System.out.println(remote.buttonWasPressed(1));
        System.out.println(remote.buttonWasPressed(2));
        System.out.println(remote.buttonWasPressed(3));
        System.out.println(remote.buttonWasPressed(4));
    }
}
```
### Command-interface
```java
public interface Command {
    public String execute();
    public String undo();
}
```
### Remote class
```java
public class SimpleRemoteControl {
    final int SLOTS = 5;
    Command[] commands = new Command[SLOTS];
    
    public SimpleRemoteControl(){}
    
    public void setCommand(Command command, int slot){
        commands[slot] = command;
    }
    
    public String buttonWasPressed(int slot){
        return commands[slot].execute();
    }
}
```
### GarageDoor
#### GarageDoor Class
```java
public class GarageDoor {
    public String Stop(){
        return "Garage Door Stopped Moving.";
    }
    
    public String Up(){
        return "Garage Door is Open.";
    }
    
    public String Down(){
        return "Garage Door is Closed.";
    }

    @Override
    public String toString() {
        return "GarageDoor";
    }
}
```
#### GarageDoorOpenCommand
```java
public class GarageDoorOpenCommand implements Command {

    private GarageDoor garageDoor;
    public GarageDoorOpenCommand(GarageDoor garageDoor) {
        this.garageDoor = garageDoor;
    }
    
    @Override
    public String execute() {
        return garageDoor.Up();
    }

    @Override
    public String undo() {
        return garageDoor.Down();
    }

    @Override
    public String toString() {
        return "GarageDoorOpenCommand";
    }
}
```
#### GarageDoorCloseCommand
```java
public class GarageDoorCloseCommand implements Command{
 
    private GarageDoor garageDoor;
    public GarageDoorCloseCommand(GarageDoor garageDoor) {
        this.garageDoor = garageDoor;
    }
    
    @Override
    public String execute() {
        return garageDoor.Down();
    }

    @Override
    public String undo() {
        return garageDoor.Up();
    }

    @Override
    public String toString() {
        return "GarageDoorCloseCommand";
    }
}
```
#### GarageDoorStopCommand
```java
public class GarageDoorStopCommand implements Command{
    private GarageDoor garageDoor;
    public GarageDoorStopCommand(GarageDoor garageDoor) {
        this.garageDoor = garageDoor;
    }
    
    @Override
    public String execute() {
        return garageDoor.Stop();
    }

    @Override
    public String undo() {
        return garageDoor.Up();
    }

    @Override
    public String toString() {
        return "GarageDoorStopCommand";
    }
}
```
### Light
#### Light Class
```java
public class Light {
    public String on(){
        return "Lights are On.";
    }
    
    public String off(){
        return "Lights are Off.";
    }
}
```
#### LightOnCommand
```java
public class LightOnCommand implements Command{

    Light light;
    public LightOnCommand(Light light) {
        this.light = light;
    }

    @Override
    public String execute() {
        return light.on();
    }

    @Override
    public String undo() {
        return light.off();
    }

    @Override
    public String toString() {
        return "LightOnCommand";
    }
}
```
#### LightOffCommand
```java
public class LightOffCommand implements Command{

    Light light = new Light();
    public LightOffCommand(Light light) {
        this.light = light;
    }

    @Override
    public String execute() {
        return light.off();
    }

    @Override
    public String undo() {
        return light.on();
    }

    @Override
    public String toString() {
        return "LightOffCommand";
    }
}
```