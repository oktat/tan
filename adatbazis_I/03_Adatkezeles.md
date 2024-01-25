# Adatbázis-kezelés I - Adatkezelés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Kinduló adatbázis

```sql
create database remek
character set utf8
collate utf8_hungarian_ci;
```

```sql
create table employees(
    id int not null primary key auto_increment,
    name varchar(50),
    city varchar(50),
    salary double
);
```

## Adatok beszúrása

Adatok beszúrása az "insert into" kifejezéssel kezdeményezhető. Például:

```sql
insert into employees
(name)
values
("Szabó János");
```

A values előtt magadtuk, milyen mezőt fogunk megadni a values után.

A használat egy másik módja:

```sql
insert into employees
set
name="Erős István";
```

Egyszerre több dolgozó beszúrása:

```sql
insert into employees
(name)
values
("Piros Katalin"),
("Csendes Mária");
```

Egyszerer több adat:

```sql
insert into employees
(name, city, salary)
values
("Csekő Tibor", "Szeged", 342);
```

```sql
insert into employees
set
name="Erős István",
city="Szeged",
salary=392;
```

Több rekord és több mező:

```sql
insert into employees
(name, city, salary)
values
("Rózsa Imre", "Szeged", 342),
("Fehér Irén", "Szolnok", 357),
("Lenti Gábor", "Szeged", 314);
```

## Adatok frissítése

```sql
update employees
set name="Lantos Katalin"
where name="Piros Katalin"
```

```sql
update employees
set name="Harmat Katalin"
where id=3
```

## Adatok törlése

Szúrjunk be egy újabb rekordot:

```sql
insert into employees
(name)
values
("Erős István");
```

Rájövünk, hogy mára az adatbázisban van. Töröljük:

```sql
delete from employees
where id=5
```

Lásd még:

* [https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:mariadb:sql:dml](https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:mariadb:sql:dml)
