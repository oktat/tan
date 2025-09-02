# Adatbázis-kezelés I - Mentés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [A mysqldump](#a-mysqldump)
* [A PhpMyAdmin](#a-phpmyadmin)
* [Helyreállítás](#helyreállítás)

## A mysqldump

Tegyük fel, hogy az XAMPP-t a C:\ gyökér könyvtárába telepítettük: C:\xampp. Ekkor a mysqldump parancs a következő helyen található:

```cmd
c:\xampp\mysql\bin\
```

A **mysqldump** parancs használatához vagy be kell lépnünk a fenti bin könyvtárba, vagy a teljes útvonalat meg kell adni. Esetleg egy .bat vagy .cmd állományt is írhatunk.

Egy adatbázis mentése, a mysqldump paranccsal:

```bash
mysqldump -u root dbnev > dbnev.sql
```

Ha jelszót is meg kell adni és szerver portját is, akkor:

```bash
mysqldump -u root -p -P 3307 dbnev > dbnev.sql
```

A -p kapcsoló hatására a mysqldump parancs bekéri a jelszót. A -P után kell megadni a szervert portját.

Ha nincs útvonalba a mysqldump parancs, akkor egy egyszerű .cmd fájl, dump.cmd-ba írjuk a következőt:

```cmd
c:\xampp\mysql\bin\mysqldump %*
```

A dump.cmd használata:

```cmd
dump -u root dbnev > dbnev.sql
```

## A PhpMyAdmin

A PhpMyAdmin használatához webszerverre is szükség van. Ha XAMPP-t használunk indítsuk el az "Apache" webszervert is.

A böngészőbe írjuk be:

```url
localhost/phpmyadmin/
```

Lépések:

* Válasszuk ki a kívánt adatbázist.
* **Exportálás** fül
* **Exportálás** gomb

Ha nem választunk ki adatbázist, akkor minden adatbázis exportálásra kerül.

A formátumnak az SQL teljesen megfelelő, mivel egy ember számára is könnyen emészthető szöveges fájlt kapunk, .sql kiterjesztéssel.

## Helyreállítás

```cmd
mysql -u root  dbnev < fajlnev.sql
```

Lásd még:

* [https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:mariadb:mentes](https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:mariadb:mentes)
