# Adatbázis-kezelés II

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Szükséges szoftverek

* Chocolatey
* XAMPP
* Dia
* Total Commander
* Geany

### Chocolatey

Telepítse a Chocolatey csomagkezelőt. Továbbiakban ezt a csomagkezelőt használjuk.

A csomagkezelő weboldala:
[https://chocolatey.org/](https://chocolatey.org/)

Bővebb leírása:
[https://szit.hu/](https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey)

### XAMPP

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

## Útvonalbeállítás

A PATH változóba:

* C:\XAMPP\mysql\bin

## Scriptek

Ha az útvonalbeállítás nem megy,
használjuk az alábbi scriptet:

```cmd
@echo off

c:\XAMPP\mysql\bin\mysql -u root

pause
```

Tegyük egy **mysql.bat** nevű fájlba, majd
futtassuk.
