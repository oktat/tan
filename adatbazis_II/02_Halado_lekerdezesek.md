# Adatbázis-kezelés II - Haladó lekérdezés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Előzmények](#előzmények)
* [Egymásba ágyazott lekérdezések](#egymásba-ágyazott-lekérdezések)
* [Lekérdezések optimalizálása](#lekérdezések-optimalizálása)
* [Indexelés](#indexelés)

## Előzmények

Hozunk létre egy adatbázist a gyakorláshoz:

```sql
create database tend
character set utf8
collate utf8_hungarian_ci;

use tend

create table dolgozok(
    az int not null primary key auto_increment,
    nev varchar(50),
    telepules varchar(50),
    fizetes double
);

create table projektek(
    az int not null primary key auto_increment,
    nev varchar(50),
    kezdes date,
    vege date
);

create table reszvetelek(
    az int not null primary key auto_increment,
    dolgozoAz int,
    projektAz int
);
```

### Adatok

Vegyünk fel adatokat az adatbázisba:

```sql
insert into dolgozok
(nev, telepules, fizetes)
values
('Kerek Róbert', 'Pécs', 343),
('Erkel István', 'Szeged', 324),
('Látó Viktor', 'Miskolc', 412),
('Csond Irén', 'Pécs', 343),
('Álmos Ferenc', 'Miskolc', 343),
('Tengő Mária', 'Szolnok', 383),
('Sem Klára', 'Pécs', 343),
('Olaj Béla', 'Szeged', 343),
('Ármai Endre', 'Szeged', 382);

insert into projektek
(nev, kezdes, vege)
values
('Rámpa', '2020-01-15', '2020-05-27'),
('Csendi', '2020-03-01', null),
('Alanyi', '2020-04-05', '2022-12-01'),
('Patkó', '2020-05-15', '2022-08-17'),
('Lébec', '2020-05-30', '2022-08-25'),
('Tangó', '2020-07-19', '2022-10-11'),
('Lucsok', '2020-07-30', null),
('Erdes', '2021-01-01', '2021-05-19');

insert into reszvetelek
(dolgozoAz, projektAz)
values
(1, 1),
(2, 1),
(3, 2),
(1, 2),
(4, 3),
(5, 4),
(2, 5),
(5, 6),
(7, 7),
(8, 7),
(9, 8);
```

## Egymásba ágyazott lekérdezések

Jelenítsük meg a dolgozók neveit.
De csak azoknak, akik 2020-ban kezdődő projektekben vettek részt.

```sql
select nev 
from dolgozok inner join reszvetelek
on dolgozok.az = reszvetelek.dolgozoAz
where reszvetelek.az in (
    select reszvetelek.az 
    from reszvetelek inner join projektek
    on reszvetelek.projektAz = projektek.az
    where kezdes between "2020-01-01" and "2020-12-31"
    );
```

## Lekérdezések optimalizálása

Az optimalizálás eszközei:

* indexelés
* lekérdezés változtatása
  * például: több feltétel
* adatszerkezet módosítása
  * megfelelő mezőtípusok választása

## Indexelés

### Az indexekről

Az indexeknek négy fő típusa van:

* elsődleges kulcs (egyedi és nem lehet null)
* egyedi index (egyedi, de lehet null is)
* egyszerű indexek (nem feltétlenül egyedi)
* teljes szöveges (keresés szövegben)

### Index készítése

A gyorsabb lekérdezés érdekében egyes oszlopokat indexelünk. Az indexelés során létrehozunk egy másolatot az indexelni kívánt oszlop tartalmáról amit rendezve tárolunk. Így gyorsabban tudunk az adott oszlop feltételei alapján rekordokat keresni.

Mindezek fényében, azt gondolnánk, hogy akkor minden oszlopot kell indexelni. De ez meg lassítja a tábla írását.

Index készítése:

```sql
create index indexnév
on táblanév (mezőnév, ...);
```

Index törlése:

```sql
drop index indexnév on táblanév;
```

Indexek megtekintése egy táblán:

```sql
show indexes from táblanév\G
```

### Index típusok

Az index típusa nem tévesztendő össze a tárolás típusával.

Index típusok:

* normál
* unique
* fulltext
* spatial

### Lekérdezés analizálása

```sql
explain select * from dolgozok;
```

Lehetséges kimenet:

```sql
MariaDB [fer]> explain select * from dolgozok;
+------+-------------+----------+------+---------------+------+---------+------+------+-------+
| id   | select_type | table    | type | possible_keys | key  | key_len | ref  | rows | Extra |
+------+-------------+----------+------+---------------+------+---------+------+------+-------+
|    1 | SIMPLE      | dolgozok | ALL  | NULL          | NULL | NULL    | NULL |    9 |       |
+------+-------------+----------+------+---------------+------+---------+------+------+-------+
1 row in set (0.000 sec)
```

A "rows" nevű oszlopban látjuk, hogy 9 rekord volt érintve a lekérdezés során.

Most szűréssel:

```sql
MariaDB [fer]> explain select * from dolgozok where telepules="Szeged";
+------+-------------+----------+------+---------------+------+---------+------+------+-------------+
| id   | select_type | table    | type | possible_keys | key  | key_len | ref  | rows | Extra       |
+------+-------------+----------+------+---------------+------+---------+------+------+-------------+
|    1 | SIMPLE      | dolgozok | ALL  | NULL          | NULL | NULL    | NULL |    9 | Using where |
+------+-------------+----------+------+---------------+------+---------+------+------+-------------+
1 row in set (0.000 sec)
```

Most nincs szükség az össze rekordra, de a lekérdezés mégis mind a 9 sor érintette.

Most indexeljük a település oszlopot.

```sql
MariaDB [fer]> create index telepules_index on dolgozok(telepules);
Query OK, 0 rows affected (0.046 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

Elmezzük újra a lekérdezést:

```sql
MariaDB [fer]> explain select * from dolgozok where telepules="Szeged";
+------+-------------+----------+------+-----------------+-----------------+---------+-------+------+-----------------------+
| id   | select_type | table    | type | possible_keys   | key             | key_len | ref   | rows | Extra                 |
+------+-------------+----------+------+-----------------+-----------------+---------+-------+------+-----------------------+
|    1 | SIMPLE      | dolgozok | ref  | telepules_index | telepules_index | 53      | const |    3 | Using index condition |
+------+-------------+----------+------+-----------------+-----------------+---------+-------+------+-----------------------+
1 row in set (0.001 sec)
```

Láthatjuk, hogy most az érintett sorok száma 3.
