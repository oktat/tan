# Adatbázis-kezelés II - Adatvezérlő utasítások

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## ACID elvek

* Atomicity - atomicitás - [ˌæ.təm.ˈɪ.sɪ.ti]
  * A műveletek egybe tartoznak. Vagy mindent végrehajtok vagy semmit.
* Consistency - konzisztencia - [kən.ˈsɪ.stən.si]
  * Konzisztens állapot - műveletek előtt naplózás.
  * Az adatok nincsenek ellentmondásban egymással.
* Isolation - izoláció - [ˌaɪ.sə.ˈleɪʃ.n̩]
  * Egy művelet nem függ másoktól
* Durability - tartósság - [ˌdjʊə.rə.ˈbɪ.lɪ.ti]
  * Az elvégzett műveletek eredménye legyen tartós.

## Tranzakciók

A tranzakció célja, hogy több SQL utasítás együtt hajtódjon végre. Ha a több SQL utasításból egy sikertelen, akkor a többi se legyen érvényesítve.

Tranzakció indítása:

```sql
start transaction
```

Az indítás után következő SQL utasítások egyként vannak kezelve, amíg nem végelegesítjük a tranzakciót, vagy elvetjük.

Véglegesítés:

```sql
commit
```

A tranzakciót megszakíthatjuk bármelyik utasítás után, így vissza jutunk a start transaction előtt állapotba:

```sql
rollback
```

### Résztranzakciók

A savepoint utasítással külön kezelhetjük a tranzakció egy részét, a visszavonás ehhez a ponthoz igazítható.

```sql
savepoint azonosító
rollback to azonosító
release savepoint azonosító
```

## Izolációs szintek

* READ UNCOMMITED
* READ COMMITED
* REPETABLE READ
* SERIALIZABLE

## Implicit végrehajtás

Ha nem használunk tranzakciót a rendszer képes automatikus tranzakció használatára, amit bekapcsolhatunk vagy kikapcsolhatunk:

```sql
SET autocommit=0;
```

```sql
SET autocommit=1;
```

Forrás:

* [https://mariadb.com/docs/server/ref/mdb/system-variables/autocommit/](https://mariadb.com/docs/server/ref/mdb/system-variables/autocommit/)

## Zárolás

A dolgozók tábla zárolása, csak olvasás engedélyezése:

```sql
lock table dolgozok read;
```

Ellenőrizzük:

```sql
show open tables;
show open tables where `Database` = 'tend';
```

Az In_use mezőben ha 1 érték szerepel, akkor zárolva van a tábla. A szűrés tovább bővíthető.

```sql
unlock table;
```

| Kulcs | Leírás
|-|-|
| read | read lock; az olvasás engedélyezett, de módosítás nem |
| wrtie | write lock; se írni, se olvasni nem lehet |

## Beépített felhasználók

A létező felhasználók megtekinthetők a mysql adatbázisban. Kapcsolódjunk az adatbázishoz:

```sql
use mysql
```

A felhasználók lekérdezése:

```sql
select user from user;
```

Több mező:

```sql
select user,password,host from user;
```

Minden telepített MySQL és MariaDB rendszeren alapértelmezetten van egy root nevű felhasználó. Megvalósítástól függően más felhasználók is szerepelhetnek egy kezdeti telepítésnél, azok opcionálisak.

## Felhasználók

Felhasználó létrehozása:

```sql
create user janos@localhost;
```

Jelszó beállítása:

```sql
set password for janos@localhost = password('titok');
```

Felhasználók törlése:

```sql
drop user janos@localhost;
```

Egyszerre hozzuk létre felhasználót és adjunk neki jelszót:

```sql
create user janos@localhost identified by 'titok';
```

## Jogok

Legyen egy tend nevű adatbázis bela felhasználóval. Hozzuk létre egyszerre a felhasználót, jelszót és adjunk jogot is a felhasználónak egy adatbázishoz:

```sql
grant all privileges 
on tend.*
to bela@localhost;
```

Az "all privileges" minden jogot beállít az adatbázison. Az on után adjuk meg, milyen adatbázison adjuk meg az engedélyt. A to után mindjuk meg melyik felhasználónak. Meg kell adni a host részt is egy @ jel után.

Ha használjuk az "identified by" záradékot, és a felhasználó nem létezik, az létrejön. Így egyetlen utasítással minden létrehozható, beállítható:

```sql
grant all privileges 
on tend.*
to bela@localhost
identified by 'titok';
```

### Select jog

Ha csak select jogot szeretnénk adni a felhasználónak az "all privileges" helyett csak írjunk a "select" szót.

```sql
grant all select
on tend.*
to bela@localhost;
```

A select helyett megadható más utasítás is:

* select
* update
* insert
* delete
* usage
* grant option
* drop
* create
* lock tables
* alter
* index
* stb.

### Adminisztrátor felhasználó

Az all privileges joggal csak az adatbázis táblákon végezhető műveletek engedélyezettek. Az ilyen felhasználók nem tudnak másik felhasználót felvenni, annak jogokat beállítani. Ehhez a grant option beállítás szükséges:

```sql
grant all privileges 
on *.* 
to admin@localhost
identified by 'titok'
with grant option;
```

Ez az utasítás az összes adatbázis, összes tábláján minden jogot megad, plusz grant jog, amivel más felhasználók létrehozhatók és azoknak jogok beállíthatók. Az "admin" elnevezés tetszőleges, más név is válaszható.

### Jogok visszavonása

```sql
revoke usage on *.* from tomi@localhost;
```

## ROLE-ok

Szerep létrehozása:

```sql
create role ujsagiro;
```

Adjunk jogot a szereplőnek:

```sql
grant show databases on *.* to ujsagiro;
```

```sql
grant ujsagiro to janos@localost;
```

### Teszt

* Lépjünk be a janos@localhost felhasználóval.
* Nézzük meg milyen adatábázisokat látunk.
* Nézzük meg az aktuális szerepet.
* Vegyük fel az ujsagiro szerepet.
* Nézzük meg újra a látható adatbázisokat.

```sql
show databases;
```

```sql
select current_role;
```

```sql
set role ujsagiro;
```

```sql
show databases;
```

Forrás:

* [https://mariadb.com/kb/en/roles_overview/](https://mariadb.com/kb/en/roles_overview/) (2023)
