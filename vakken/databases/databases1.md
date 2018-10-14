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
