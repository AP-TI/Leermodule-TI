# Oefening Facade Pattern

> Uitleg niet voorzien wegens te weinig tijd, maar zo moeilijk is het niet...

## Code

> Bij het copy pasten: vergeet je package niet toe te voegen!
> Voorbeeld: 'package edu.ap.mathiasv.dp_facadepattern;'
> Hier zouden nog 'toString()' methodes bij moeten, maar die zijn weggelaten om tijd te besparen.

### Main

```java
public class Main {
    public static void main(String[] args) {
        Garagepoort poort = new Garagepoort();
        Licht licht = new Licht();
        Radio radio = new Radio();
        GarageFacade garage = new GarageFacade(poort, licht, radio);
        garage.openGarage();
        garage.sluitGarage();
    }
}
```

### Class GarageFacade

```java
public class GarageFacade {
    private Garagepoort poort;
    private Licht licht;
    private Radio radio;

    public GarageFacade(
            Garagepoort poort,
            Licht licht,
            Radio radio) {
        this.poort = poort;
        this.licht = licht;
        this.radio = radio;
    }

    public void openGarage(){
        poort.open();
        licht.aan();
        radio.aan();
        System.out.println("Garage gaat open, is verlicht en er is muziek!");
    }

    public void sluitGarage(){
        poort.close();
        licht.uit();
        radio.uit();
        System.out.println("Garage sluit, het licht gaat uit en de radio wordt uitgeschakeld.");
    }

    public Garagepoort getPoort() {
        return poort;
    }

    public Licht getLicht() {
        return licht;
    }

    public Radio getRadio() {
        return radio;
    }
}
```

### Garage Items

### Class Garagepoort

```java
public class Garagepoort {
    public Garagepoort(){}
    public void open(){}
    public void close(){}
}
```

### Class Licht

```java
public class Licht {
    public Licht(){}
    public void aan(){}
    public void uit(){}
}
```

### Class Radio

```java
public class Radio {
    public Radio(){}
    public void aan(){}
    public void uit(){}
}
```
