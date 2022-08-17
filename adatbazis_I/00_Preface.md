# Adatbázis-kezelés I

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Szükséges szoftverek

* XAMPP

Telepítés:

```cmd
choco install xampp-80
```

### Útvonabeállíáts

A PATH változóba:

* C:\XAMPP\mysql\bin

### Scriptek

Ha az útvonalbeállítás nem megy,
használjuk az alábbi scriptet:

```cmd
@echo off

c:\XAMPP\mysql\bin\mysql -u root

pause
```

Tegyük egy **mysql.bat** nevű fájlba, majd
futtassuk.
