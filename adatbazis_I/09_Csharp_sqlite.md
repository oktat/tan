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

A kapcsolat sztringben az állomány elérését a következő kulccsal adjuk meg: Data Source.

Álnevek:

* DataSource
* Filename

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

#### SQLite kapcsolatsztring hivatkozások

* [Kapcsolatsztring](https://learn.microsoft.com/hu-hu/dotnet/standard/data/sqlite/connection-strings)
* [Kapcsolatsztring](https://learn.microsoft.com/en-us/dotnet/standard/data/sqlite/connection-strings)

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

```csharp
using Microsoft.Data.Sqlite;
 
var conn = new SqliteConnection ("Data Source=hello.db");
conn.Open();
```

### Hibakezelés

```csharp
using Microsoft.Data.Sqlite;

var conn = new SqliteConnection ("DataSource=/hello.db");
try {
    conn.Open();
    Console.WriteLine("Ok");

} catch (SqliteException e) {
    Console.Error.WriteLine("Hiba! A fájl megnyitása sikertelen!");
    Console.Error.WriteLine(e.Message);
}
```

Lehetséges kimenet:

```txt
Hiba! A fájl megnyitása sikertelen!
SQLite Error 14: 'unable to open database file'.
```

## Tábla létrehozása

```sqlite
create table employees(
    id integer not null primary key autoincrement,
    name text,
    city text,
    salary real    
);
```

```sqlite
create table positions(
    id integer not null primary key autoincrement,
    name text
);
```

## Adatok beszúrása

```csharp
using Microsoft.Data.Sqlite;

var conn = new SqliteConnection ("DataSource=hello.db");
try {
    conn.Open();
    Console.WriteLine("Ok");
    string sql = @"
    insert into employees
    (name, city, salary)
    values
    (@name, @city, @salary)
    ";

    var cmd = new SqliteCommand(sql, conn);

    cmd.Parameters.AddWithValue("@name", "Finom Imre");
    cmd.Parameters.AddWithValue("@city", "Hatvan");
    cmd.Parameters.AddWithValue("@salary", 391);

    cmd.ExecuteNonQuery();
} catch (SqliteException e) {
    Console.Error.WriteLine("Hiba! A fájl megnyitása sikertelen!");
    Console.Error.WriteLine(e.Message);
}
```

## Adatok olvasása

```csahrp
using Microsoft.Data.Sqlite;

var conn = new SqliteConnection ("DataSource=hello.db");
try {
    conn.Open();
    Console.WriteLine("Ok");
    string sql = "select * from employees";

    var cmd = new SqliteCommand(sql, conn);    
    var data = cmd.ExecuteReader();
    while(data.Read()) {
        Console.WriteLine(
            "{0,15} {1,15}",
            data.GetString(1),
            data.GetString(2)
            );
    }
} catch (SqliteException e) {
    Console.Error.WriteLine("Hiba! A fájl megnyitása sikertelen!");
    Console.Error.WriteLine(e.Message);
}
```

## Adat módosítása

```csharp
using Microsoft.Data.Sqlite;

var conn = new SqliteConnection ("DataSource=hello.db");
try {
    conn.Open();
    Console.WriteLine("Ok");
    string sql = @"
    update employees
    set
    name=@name,
    city=@city,
    salary=@salary
    where id=@id
    ";

    var cmd = new SqliteCommand(sql, conn);

    cmd.Parameters.AddWithValue("@name", "Oran Emese");
    cmd.Parameters.AddWithValue("@city", "Sopron");
    cmd.Parameters.AddWithValue("@salary", 365);
    cmd.Parameters.AddWithValue("@id", 2);
    
    cmd.ExecuteNonQuery();
} catch (SqliteException e) {
    Console.Error.WriteLine("Hiba! A fájl megnyitása sikertelen!");
    Console.Error.WriteLine(e.Message);
}
```

## Törlés

```csharp
using Microsoft.Data.Sqlite;

var conn = new SqliteConnection ("DataSource=hello.db");
try {
    conn.Open();
    Console.WriteLine("Ok");
    string sql = @"
    delete from employees
    where id=@id
    ";

    var cmd = new SqliteCommand(sql, conn);
    cmd.Parameters.AddWithValue("@id", 1);

    cmd.ExecuteNonQuery();    
} catch (SqliteException e) {
    Console.Error.WriteLine("Hiba! A fájl megnyitása sikertelen!");
    Console.Error.WriteLine(e.Message);
}
```
