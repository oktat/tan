# Adatbázis-kezelés I - Lekérdezések

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Kiegészítő parancsok](#kiegészítő-parancsok)
* [A select](#a-select)
* [Feltételek](#feltételek)
* [Aggregáló függvények](#aggregáló-függvények)
* [Csoportosítás](#csoportosítás)
* [Rendezés](#rendezés)
* [Egyéb lekérdezőfüggvények](#egyéb-lekérdezőfüggvények)
* [Lásd még](#lásd-még)

## Kiegészítő parancsok

Az adatbázisok lekérdezése előtt tekintsünk meg néhány kiegészítő parancsot.

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

A select adatok lekérdezésére használható. Az adatokat egy vagy több táblából kérdezhetjük le. A lekérdezés során meg kell adjuk milyen mezőket szeretnénk látni, melyik táblából.

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

A "*" az összes mezőt jelenti, vagyis az eredményben minden mező meg fog jelenni.

Tegyük fel, hogy a következő mezőket tartalmazza a tábla:

```txt
employees(id, name, city, salary)
```

Szeretnénk a neveket és a településeket megjeleníteni:

```sql
select name, city
from employees;
```

A "select" után egyszerűen felsorojuk a kívánt mezőket. A from után megadjuk milyen táblából szeretnénk lekérdezni.

Csak a név megjelenítése:

```sql
select name from employees;
```

A név, település és fizetés lekérdezése:

```sql
select name, city, salary from employees;
```

## Feltételek

Ha nem adunk meg feltételeket az összes rekordot megkapjuk. Nagy mennyiségű adatnál ez, nem előnyös.

Feltételeket a WHERE kulcsszó után adhatjuk meg.

Szegedi dolgozók adatai:

```sql
select * 
from employees
where city="Szeged";
```

A "where" után, megmondtuk, hogy akkor szeretnénk látni egy rekordot, ha a település (city) "Szeged".

Dolgozók, akikenek a fizetése több mint 390:

```sql
select * 
from employees
where salary>390;
```

Használható opetárotok:

| Operátor | Leírás |
|-|-|
| > | nagyobb mint |
| < | kisebb mint |
| = | egyenlő |
| <> | nem egyenlő |
| != | nem egyenlő |
| <= | kisebb vagy egyenlő |
| >= | nagyobb vagy egyenlő |
| between | adott tartomány  (nem szigorúan véve) |
| in | adott halmazban benne van |
| like | olyan mint |
| is null | null érték |
| is not null | nem null érték |
| and | és művelet |
| or  |  vagy művelet |
| not |  tagadás |

A "^=" operátort is ide szokták sorolni, de a MySQL nem támogatja; bitenkénti XOR művelete a jelentése.

A nem budapesti dolgozók:

```sql
select name as név
from employees
where city <> "Budapest";
```

```sql
select last_name as név
from employees
where city != "Budapest";
```

Összefűzés:

```sql
select concat(first_name, " ", last_name) as teljesnév
from employees;
```

Formázás. Jelenítsük meg 2 tizedesjegy pontossággal:

```sql
select format(salary, 2)
from employees;
```

Milyen hosszú településneveket kapunk?

```sql
select city, length(city)
from employees;
```

Irányítószámok:

```sql
select substr(address, 1,4) 
as irányítószám 
from customers;
```

A rendszergazda helyett szeretnénk a kimenetben a sysadmin szót látni.

```sql
select replace(name, 'rendszergazda', 'sysadmin')
as pozíciók
from positions;
```

Kerekítés:

```sql
select round(salary)
from employees;
```

Kerekítés 2 tizedesjeggyel:

```sql
select round(salary, 2)
from employees;
```

## Aggregáló függvények

Összesítő adatok kinyerését aggregáló függvényekkel tudjuk megtenni. Ilyenek a következők:

* count()
* sum()
* avg()
* min()
* max()

Az aggregáló függvények az eredményt egyetlen sorra szűkítik.

## Csoportosítás

Az adatok egy vagy több oszlop alapján csoportosíthatók, így ezekre a csoportokra külön alkalmazhatók az aggregáló függvények. Így annyi sort kapunk ahány csoport van.

```sql
select oszlop1, count(oszlop2)
from tabla
group by oszlop1;
```

Településenként a dolgozók átlagfizetése.

```sql
select city, avg(salary)
from employees
group by city
```

A csoportosított eredmények szűrése a HAVING direktívával lehetséges.

```sql
select city, avg(salary) as atlag
from employees
group by city
having atlag > 390
```

Szűrhetünk a csoportosítás előtt és utána egyszerre. Legyen például egy feladat, ahol hatvani, pécsi, szolnoki és szegedi dolgozók átlagfizetését szeretnénk látni, településenként, de csak ott, ahol
az átlag meghaladja a 390-t.

```sql
select city, avg(salary) as atlag
from employees
where city in ('Hatvan', 'Pécs', 'Szolnok', 'Szeged')
group by city
having atlag > 390
```

## Rendezés

Az eredmények rendezését az ORDER BY kulcsszóval végezhetjük el.

```sql
select oszlop1, oszlop2, ...
from tabla
order by oszlop1 asc/desc, oszlop2 asc/desc, ...;
```

## Egyéb lekérdezőfüggvények

### A concat

A concat() függvény a paraméterként megadott értékeket összefűzi. Legyen például egy tábla, ahol a vezetéknév és a keresztnév külön oszlopokban vannak:

```sql
create table customers(
    id int not null primary key auto_increment,
    first_name varchar(50),
    last_name varchar(50),
    address varchar(100)
);
```

A nevek megjelenítése összefűzve:

```sql
select concat(first_name, ' ', last_name)
from customers;
```

### A format függvény

```sql
select format(345.89243, 2);
```

Eredmény: 345.89

Locale beállítása:

```sql
select format(345.89243, 2, 'hu_HU');
```

```sql
select concat(format(345.89243, 2, 'hu_HU'), ' Ft');
```

### Hosszmérés

A length() függvény bájtokat számolja:

```sql
select length('árva')
```

Eredménye: 5

Ha be van állítva az Oracle mód, akkor karaktert fog számolni.

Oracle mód beállítása:

```sql
set sql_mode='oracle';
```

Lekérdezés:

```sql
select @@SQL_MODE
select @@GLOBAL.SQL_MODE
```

Az SQL módokról: [https://mariadb.com/kb/en/sql-mode/](https://mariadb.com/kb/en/sql-mode/)

A char_length() a karaktereket:

```sql
select char_length('árva');
```

Eredménye: 4

### A substr függvény

Szöveg részét vesszük.

```sql
select substr('tetőcsomag', 5);
```

Eredmény: csomag

```sql
select substr('tetőcsomag', 5, 3);
```

Eredmény: cso

* [https://mariadb.com/kb/en/substring/](https://mariadb.com/kb/en/substring/)

### A replace függvény

A replace() függvény lecserél egy sztringet egy másikra.

```sql
select replace(positoions.name, 'rendszergazda', 'sasadmin')
from positions;
```

### A round függvény

A raund() a kapott értéket kerekíti.

```sql
select round(1.4)
```

Eredmény: 1

```sql
select round(1.5)
```

Eredmény: 2

Megadhatók a megtartandó tizedeshelyek:

```sql
select round(1.44, 1)
```

Eredmény: 1.4

```sql
select round(1.45, 1)
```

Eredmény: 1.5

* [https://mariadb.com/kb/en/round/](https://mariadb.com/kb/en/round/)

### A dátum időrészének dobása

```sql
select cast(date(sysdate()) as datetime);
```

Lehetséges kimenet: 2024-03-15 00:00:00

Oracle adatbázis esetén a trunc() függvény végzi ezt a művelete, de MariaDB-ben nincs ilyen függvény.

## Lásd még

Lásd még:

* [https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:sql](https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:sql)
