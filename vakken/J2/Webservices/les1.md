# Les 1

Creëeren van een maven project:
`mvn archetype:generate -Dfilter=org.glassfish.jersey.archetypes:jersey-quickstart-webapp`
Vervolgens: 1, 84, edu.ap.jaxrs, enter, enter, enter

> Little note: Als dit niet werkt via VSC, probeer dit dan in de cmd van Windows te doen.

De nodige dependencies:

```xml
<dependency>
   <groupId>javax.json</groupId>
   <artifactId>javax.json-api</artifactId>
   <version>1.1.4</version>
</dependency>
<dependency>
   <groupId>org.glassfish</groupId>
   <artifactId>javax.json</artifactId>
   <version>1.1.4</version>
</dependency>
<dependency>
   <groupId>javax.servlet</groupId>
   <artifactId>javax.servlet-api</artifactId>
   <version>4.0.1</version>
</dependency>
```