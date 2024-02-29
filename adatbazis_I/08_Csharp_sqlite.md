# Adatbázis-kezelés I - C# SQLite

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Szükséges eszközök

### VSCode bővítmény

* SQLite Editor

## SQLite adatbázis használata

### Az SQLite adatbázisról

Az SQLite egy könnyűsúlyú relációs adatbázis-kezelő rendszer (RDBMS). Az adatbázist egyetlen fájlként használjuk. A használathoz nincs szükség külön szerverszoftverre.

Az SQLite támogatja az ACID elveket. Atomiság, konzisztencia, izoláció, tartósság.

Felhasználási területek:

* beágyazott rendszerek
* asztali alkalmazások
* prototípus-készítés

### Típusok

| Típus |  Leírás  |
|-|-|
| NULL | érték nélkül |
| INTEGER | egész szám |
| REAL | lebegőpontos szám |
| TEXT | karakterlánc |
| BLOB | bináris adatfolyam |

* [SQLite adattípusok](https://www.sqlite.org/datatype3.html)

* [Microsoft.Data.Sqlite](https://learn.microsoft.com/hu-hu/dotnet/standard/data/sqlite/types)

### Kapcsolat sztirngek

#### Memória adatbázis

```ini
Data Source=:memory:
```

#### Alap

```ini
Data Source=Application.db
```

#### Titkosított

```ini
Data Source=Encrypted.db;Password=titok
```

#### Csak olvasható

```ini
Data Source=Reference.db;Mode=ReadOnly
```

#### Az SQLite kapcsolatsztringek leírása

* [https://learn.microsoft.com/hu-hu/dotnet/standard/data/sqlite/connection-strings](https://learn.microsoft.com/hu-hu/dotnet/standard/data/sqlite/connection-strings)

## Projekt használata

### Projekt készítése

```cmd
mkdir app01
```

Lépjünk be:

```cmd
cd app01
```

```cmd
dotnet new console
```

### Függőség telepítése

```cmd
dotnet add package Microsoft.Data.Sqlite
```

### Állomány létrehozása

```cmd
using Microsoft.Data.Sqlite;
 
var conn = new SqliteConnection ("Data Source=hello.db");
conn.Open();
```
