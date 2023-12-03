# Adatbázis-kezelés I - Lekérdezések

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Kiegészítő parancsok

Adatbázisok lekérdezése:

```sql
show databases;
```

Adatbázis használatbavétele:

```sql
use dbname;
```

Táblák lekérdezése:

```sql
show tables;
```

Az employees tábla szerkezetének lekérdezése:

```sql
desc employees;
```

## A select

A select adatbázisok lekérdezésére használható. Az adatokat egy vagy több táblából kérdezhetjük le. A lekérdezés során meg kell adjuk milyen mezőket szeretnénk látni, melyik táblából.

Szintaxis:

```sql
select oszlop1, oszlop2, ...
from tábla
where feltétel;
```

Az SQL utasíátsok több sorba is írhatók, így a ";" pontosvesszővel jelezzük az utasítás végét. Erra azonban csak akkor van szükség, ha több SQL utasítást id megadunk, vagy a bevitel helyén ez meg van követelve.

Vegyünk egyetlen táblát employees néven, ami dolgozók adatait tárolja. Az összes mező lekérdezése:

```sql
select * from employees;
```

A "*" az összes mezőt jelenti, vagyis az eredményben minden mező meg fogj jelenni.

Tegyük fel, hogy a következő mezőket tartalmazza a tábla:

```txt
employees(id, name, city, salary)
```

Szeretnénk a neveket és a településeket megjeleníteni:

```sql
select name, city
from employees;
```

Csak a név megjelenítése:

```sql
select name from employees;
```

```sql
select name, city, salary from employees;
```

## Feltételek

Feltételeket a WHERE kulcsszó után adhatjuk meg.

Szegedi dolgozók adatai:

```sql
select * 
from employees
where city="Szeged";
```

Dolgozók, akikenek a fizetése több mint 390:

```sql
select * 
from employees
where salary>390;
```

## Aggregáló függvények

Összesítő adatok kinyerését aggregáló függvényekkel tudjuk megtenni. Ilyenek a következők:

* count()
* sum()
* avg()
* min()
* max()

## Csoportosítás

Az adatok egy vagy több oszlop alapján csoportosíthatók, így ezekre a csoportokra külön alkalmazhatók az aggregáló függvények.

```sql
select oszlop1, count(oszlop2)
from tabla
group by oszlop1;
```

## Rendezés

Az eredmények rendezését az ORDER BY kulcsszóval végezhetjük el.

```sql
select oszlop1, oszlop2, ...
from tabla
order by oszlop1 asc/desc, oszlop2 asc/desc, ...;
```

Lásd még:

* [https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:sql](https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:sql)
