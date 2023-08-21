# Adatbázis-kezelés I - Adatkezelés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Adatok beszúrása

```sql
insert into dolgozok
(name)
values
("Szabó János");
```

```sql
insert into dolgozok
(name)
values
("Erős István");
```

```sql
insert into dolgozok
(name)
values
("Piros Katalin"),
("Csendes Mária");
```

## Adatok frissítése

```sql
update dolgozok
set name="Lantos Katalin"
where name="Piros Katalin"
```

```sql
update dolgozok
set name="Harmat Katalin"
where id=3
```

## Adatok törlése

Szúrjunk be egy újabb rekordot:

```sql
insert into dolgozok
(name)
values
("Erős István");
```

Rájövünk, hogy mára az adatbázisban van. Töröljük:

```sql
delete from dolgozok
where id=5
```

Lásd még:

* [https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:mariadb:sql:dml](https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:mariadb:sql:dml)
