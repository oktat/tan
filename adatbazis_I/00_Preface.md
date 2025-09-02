# Adatbázis-kezelés I

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Szükséges szoftverek](#szükséges-szoftverek)
* [Útvonabeállíáts](#útvonabeállíáts)
* [Scriptek](#scriptek)

## Szükséges szoftverek

* Chocolatey
* XAMPP
* Dia
* Total Commander
* Geany

### Chocolatey

Telepítse a Chocolatey csomagkezelőt. Továbbiakban ezt a csomagkezelőt használjuk, de a tankönyv használható nélküle is.

A csomagkezelő weboldala:
[https://chocolatey.org/](https://chocolatey.org/)

Bővebb leírása:
[https://szit.hu/](https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey)

### XAMPP

Szükségünk van egy adatbázis-kezelő rendszerre. Egy MySQL kompatiblis rendszert fogunk használni, aminek a neve MariaDB. Telepítéshez használhatjuk a choco parancsot:

Telepítés:

```cmd
choco install xampp-74
```

Rendelkezésre áll már az xampp-80 csomag is, amiben PHP 8-van.
Használjuk inkább a 7.4-s verziót.

### Dia

A Dia egy nyílt forráskódú diagrammszerkesztő program.

Telepítés:

```cmd
choco install dia
```

## Útvonabeállíáts

A PATH környezeti változóba vegyük fel a bin könyvtárat:

* C:\XAMPP\mysql\bin

Ellenőrzésképpen nyissunk egy új parancsablakaot, majd kérdezzük le a verziószámot:

```cmd
mysql -V
```

## Scriptek

Ha az útvonalbeállítás nem megy, akkor használjuk az alábbi scriptet ha a mysql paranccsal szeretnénk az adatbázis-kezelőhöz kapcsolódni:

```cmd
@echo off

c:\XAMPP\mysql\bin\mysql -u root

pause
```

Tegyük egy **mysql.bat** nevű fájlba, majd futtassuk.
