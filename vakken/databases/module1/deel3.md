# Deel 3
## Oefening 1
### 1A
```sql
create table L2_T1
(
    k1 char(10) not null primary key
)
default character set utf8
;
```
### 1B
```sql
create table L2_T2
(
    k1 char(10) not null primary key
)
default character set ascii
;
```
### 1C & D
```sql
insert into L2_T1 value ('école');
```
--> dit werkt bij de UTF8 tabel, maar niet bij de ASCII tabel. Het karakter `é` is niet inbegrepen in de ASCII character set.
## Oefening 2
```sql
ALTER TABLE L2_Bestuursleden
change functie bestuursfunctie char(30),
add betaald tinyint default false,
add primary key(spelersnr, begin_datum)
;
```
## Oefening 3
```sql
CREATE TABLE WEDSTRIJDEN
(
    wedstrijdnr int primary key,
    teamnr int,
    spelersnr int,
    gewonnen tinyint,
    verloren tinyint,
    divisie char(6)
);
```
```sql
SELECT
	WEDSTRIJDNR,
	TEAMNR,
	DIVISIE
FROM
	wedstrijden
;
```
## oefening 4
```sql
create database FIRMAX;
```
```sql
create table /*firmax.*/klant
(
    klantid int primary key,
    naam varchar(50) not null unique,
    contactpersoon varchar(50),
    telefoonnr char(13)
);
```
```sql
create table werknemer
(
    werknemerid int primary key,
    omschrijving varchar(100) not null,
    voornaam varchar(50),
    rsznr char(13) unique
);
```
```sql
create table product
(
    productid int primary key,
    omschrijving varchar(100),
    prijspereenheid dec(10,2) default 0.00,
    voorradig tinyint default false
);
```
```sql
create table leverancier
(
    leverancierid int primary key,
    naam varchar(50),
    contactpersoon varchar(50),
    telefoonnr char(13)
);
```
```sql
/*Houdt een lijst bij van alle leveranciers voor een product -> oef: e.iv. Een lijst van leveranciers die het product kunnen aanleveren*/
create table product_leverancier
(
    productid int,
    leverancierid int,
    primary key(productid, leverancierid),
    foreign key (productid)
    	references /*firmax.*/product(productid)
    	on update cascade
        on delete cascade,
    foreign key (leverancierid)
        references leverancier(leverancierid)
        on update cascade
        on delete cascade
);
```
```sql
create table orders
(
    orderid int primary key,
    klantid int not null,
    werknemerid int not null,
    productid int not null,
    datum date not null,
    aantal dec(10,2) not null,
    unique (klantid, productid, datum),
    foreign key (productid)
    references product(productid)
        on update cascade
        on delete restrict,
    foreign key (werknemerid)
        references werknemer(werknemerid)
        on update cascade
        on delete restrict,
    foreign key (klantid)
        references klant(klantid)
        on update cascade
        on delete restrict
);
```
