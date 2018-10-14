# Deel 2
## DEEL2_1A
```
create database ap;
```
```
create table afdeling 
(
    afdnr char(5) unique primary key,
    budget dec NOT NULL,
    locatie varchar(30),
    telcontact char(13),
    isactief bool default false,
    gempunten decimal(4,2)
);
```
```
INSERT INTO afdeling (afdnr, budget, locatie, telcontact, isactief, gempunten)
VALUES ('12345', 2000.25, 'Antwerpen', '(123)45 89 12', false, 12.43);
```

## DEEL2_1B
```
create table tblopleiding
(
    opleidingscode char(10) primary key,
    omschrijving varchar(8000),
    duur tinyint(4)
);
```
```
create table tblafdeling
(
    afdelingnr int auto_increment primary key, /*auto_increment: default start-waarde = 1*/
    naam varchar(100),
    replicatiecode char(32)
);
```
```
create table tblmedewerker
(
    medewerkernr int auto_increment primary key,
    naam varchar(100),
    adres varchar(200),
    afdelingnr int,
    foreign key (afdelingnr) references tblafdeling(afdelingnr)
);
```
```
create table tblgevolgdeopleidingen
(
    medewerkernr int,
    foreign key (medewerkernr) references tblmedewerker(medewerkernr),
    opleidingscode char(10),
    foreign key (opleidingscode) references tblopleiding(opleidingscode),
    datum date,
    voltooing timestamp
);
```

# DEEL2_1C
```
Create database renting;
```
```
create table tblFaciliteiten 
(
    Faciliteitcode char(20) primary key,
    kookgelegenheid bool,
    douche_bad bool,
    aantalkamers tinyint
);
```
```
create table tblkamerbestand 
(
    kamernr int primary key,
    adres varchar(50),
    plaats varchar(50),
    huurprijs dec,
    faciliteitcode char(20),
    foreign key (faciliteitcode) references tblfaciliteiten(faciliteitcode)
);
```
```
create table tblstudent 
(
    studentnr int primary key,
    naam varchar(50),
    studentadres varchar(50),
    studentplaats varchar(50)
);
```
```
create table tblhuurcontract 
(
    studentnr int,
    foreign key (studentnr) references tblstudent(studentnr),
    kamernr int,
    foreign key (kamernr) references tblkamerbestand(kamernr),
    contractduur timestamp,
    datumeindecontract date
);
```
