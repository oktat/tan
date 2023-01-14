# Adatbázis-kezelés II - Tárolt objektumok

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Nézettáblák

Legyen egy bővebb dolgozok tábla:

```sql
create table dolgozok(
    az int not null primary key auto_increment,
    nev varchar(50),
    anyjaneve varchar(50),
    telepules varchar(50),
    cim varchar(50),
    netto double,
    juttatas double,
    belepes date,
    szuletes date,
    szulhely varchar(50)
);
```

Nézettábla létrehozása

```sql
create view simp as 
select nev, telepules, netto from dolgozok;
```

Megjelenik a nézet a táblák között, ellenőrizzük:

```sql
show tables;
```

Kérjünk információt a nézetről:

```sql
show create view simp \G
```

## Tárolt eljárások

Tárolt eljárások megtekintése

```java
show procedure status \G
```

Egyetlen eljárás lekérdezése:

```java
show create procedure proc1 \G
```

Eljárás készítése és hívása:

```java
delimiter //
    create procedure leker()
    begin
        select * from dolgozok;
    end //
delimiter ;
 
call leker();
```

Lekérdezés törlése:

```java
drop procedure leker;
```

## Triggerek

A triggerek lefuthatnak bármely esemény (beszúrás, módosítás és törlés) előtt vagy után. Használhatjuk, például, amikor a felhasználók megpróbálják módosítani az adatokat, gyakran használják tárolt eljrásokkal.

Trigger létrehozásának a szintaxisa:

```sql
create trigger trigger_neve
{before | after} {insert | update | delete }
on tabla_neve for each row
trigger_törzse;
```

Trigger törlése:

```sql
drop trigger dolgozok_bi;
```

A triggerek végrehajthatók az események előtt és után.

* before insert
* after insert
* before update
* after update
* before delete
* after delete

Állítsuk be, ha az update utasítás nagyobb fizetést állítana be, mint 500, akkor dobjunk hibát, hibakóddal és szöveggel.

```sql
delimiter //
create trigger dolgozok_bi before update
on dolgozok
for each row
if NEW.fizetes > 500 then
    signal sqlstate value '45000' set MESSAGE_TEXT = 'Hiba! Túl nagy fizetés, maximum 500';
end if;
//
delimiter ;

```

Ellenőrizzük a működést:

```sql
update dolgozok set fizetes=600 where az=1;
select * from dolgozok;
```
