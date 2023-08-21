# Adatbázis-kezelés I - Létrehozás

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A MariaDB

Az alkalmazások többsége manapság webes alkalmazásként készül. Webes alkalmazások legelterjedtebb adatbázis-kezelő rendszer a MariaDB, ami egy MySQL elágazásból jött létre.

A webfejlesztők egyik gyakran használt fejelsztői szervermegoldása az XAMPP. Az XAMPP már 5.5.30 és 5.6.14 verziók óta MariaDB-t csoamgagolnak a MySQL helyett.

A kész termékek általában linuxos rendszeren futnak, amin ma már szintén a MariaDB található.

A MariaDB azonban teljesen kompatibilis a MySQL adatbázis-kezelő rendszerrel, így általában nem is vesszük észre a különbséget.

## PhpMyAdmin

A MariaDB és MySQL adatbázis-szervereket leggyakrabban a PhpMyAdmin webes felületen keresztül kezeljük. Ha telepítjük az XAMPP fejlesztői szervert a PhpMyAdmin felület eléréshez a böngészőbe írjuk be:

```url
http://localhost/phpmyadmin/
```

Az adatábzisok néhány kattintásal létrehozhatók, vagy használhatunk SQL parancsokat is. Az SQL parancsok használata alkalmasabb, mivel ezek menthetők egy .sql kiterjesztésű fájlba, így a használt utasítások dokumentálhatók.

## MariaDB kliens

A kompatibilitás miatt a kliens neve mysql. A mysql egy kis parancssoros program, amit a PhpMyAdmin helyett használhatunk. Az XAMPP mysql könyvtárában találjuk.

## Adatbázis létrehozása

```sql
create database dbnev
character set utf8
collate utf8_hungarian_ci;
```

A PhpMyAdmin felületen a ; pontosvesszőnek nincs sok jelentősége, de a MariaDB kliensnek fontos, mivel ez jelzi a parancs végét, mivel a parancs több sorban is bevihető.

## Adatbázis felhasználó létrehozása

```sql
grant all privileges
on dbnev.*
to valaki@localhost
identified by 'titok';
```

## Tábla létrehozása

```sql
create table dolgozok(
    name varchar(50)
)
```

Elsődleges kulccsal:

```sql
create table dolgozok(
    id int not null primary key auto_increment,
    name varchar(50)
)
```

## Tábla átnevezése

```sql
show tables;
desc employees;
rename table dolgozok to employees;
desc employees;
```

## Mező hozzáadása

```sql
alter table employees add city varchar(50);
alter table employees add salary double;
desc employees;
```

## Mező törlése

```sql
alter table employees add valami double;
alter table employees drop valami;
```

Tovább a tananyaghoz:

* [https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:mariadb:sql:ddl](https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:mariadb:sql:ddl)
