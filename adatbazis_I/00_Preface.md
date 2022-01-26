# Adatbázis-kezelés I

* Sallai András
* 2022

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
