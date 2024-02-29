# Adatbázis-kezelés I - C# adatbáziselérés

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Szükséges eszközök

* Illesztő program
* MariaDB szerver
* VSCode

VSCode bővítmények:

* C#
* C# Dev Kit
* C# Extensions
* C# Snippets
* NuGet Package Manager GUI For VSCode
* dotnet
* dotnet-snippets

## Adatbázis létrehozása

```sql
create database vitabt
default character set utf8
default collate utf8_hungarian_ci;
```

Felhasználó létrehozása:

```sql
grant all privileges
on vitabt.*
to vitabt@localhost
identified by 'titok';
```

Ha távolról érhető el az adatbázis-szerver akkor a felhasználó létrehozása:

```sql
grant all privileges
on vitabt.*
to vitabt@'%'
identified by 'titok';
```

Tábla léltrehozása:

```sql
create table employees(
    id int not null primary key auto_increment,
    name varchar(50),
    city varchar(50),
    salary double,
    birth date
);
```

## MariaDB adatbázis elérése

### Használt névtér és osztályok

A MariaDB eléréséhez a MySqlConnector komponenst fogjuk használni. A MySqlConnector egyben egy névtér is, amiben elérhetjük a szükésges osztályokat. Ezek az osztályok:

| Osztály | Mire használjuk |
|-|-|
| MySqlConnection | Kapcsolatobjektum létrehozása |
| MySqlCommand | Lekérdezés létrehozása |
| MySqlDataReader | Lekérdezés |
| MySqlException | Hibakezelés |

A MySqlConnector weblapja:

* [MySqlConnector weblapja](https://mysqlconnector.net/)

### Projekt létrehozása MariaDB eléréshez

Egy konzolos projektet fogunk készíteni. Hozzuk létre a projekt könyvtárát, majd lépjünk be a projekt könyvtárába.

```cmd
mkdir app01
cd app01
```

Az app01 könyvtárba való belépést a VSCode megnyitásával is elvégezehtjük.

```cmd
code app01
```

A váz létrehozása:

```cmd
dotnet new console
```

### MariaDB függőségek telepítése

Szükségünk van egy illesztőprogramra. A MySqlConnector-t fogjuk használni:

```cmd
dotnet add package MySqlConnector
```

A függőségeket a dotnet add parancs feljegyzi a következő állományban:

* app01.csproj

Egy ehhez hasonló sort kell keresni:

```xml
<PackageReference Include="MySqlConnector" Version="2.3.1" />
```

A dotnet add parancs a nuget csomagtárolóból tölti le a csomagot. A tároló webhelye:

* [nuget tároló](https://nuget.org)

Látogassuk meg a weboldat, majd keressünk rá a MySqlConnector csomagra.

### Kapcsolódás MariaDB szerverhez

A kapcsolódáshoz szükségünk van egy kapcsolati sztringre. A kapcsolati sztringben szerepelnie kell a következőknek:

| Amire szükség van | Leírás |
|-|-|
| host | Hol érhető el az adatbázis. |
| name | Az adatbázis neve, amit el szeretnénk érni. |
| user | Felhasználónév, amivel elérhető az adatbázis. |
| pass | Jelszó a felhasználónévhez. |

Elsőként vegyük használatba a MySqlConnector névteret:

```C#
using MySqlConnector;
```

Vegyük fel a kapcsolati sztringhez szükséges változókat:

```C#
string host="localhost";
string name="dbnev";
string user="usernev";
string pass="jelszo";
```

Állítsuk össze a kapcsolati sztirnget:

```C#
string connStr = @$"
    Server={host};
    Database={name};
    User ID={user};
    Password={pass}
    ";
```

Kapcsolatobjektum létrehozása:

```C#
MySqlConnection conn = new MySqlConnection(connStr);
```

```C#
try {
    conn.Open();
    Console.WriteLine("Ok");
}catch(MySqlException e) {
    Console.Error.WriteLine("Hiba! A kapcsolódás sikertelen!");
    Console.Error.WriteLine(e.Message);
}
```

A teljes kód:

```C#
using MySqlConnector;

string host="localhost";
string name="sargabt";
string user="sargabt";
string pass="titok";

string connStr = @$"
    Server={host};
    Database={name};
    User ID={user};
    Password={pass}
    ";

MySqlConnection conn = new MySqlConnection(connStr);
try {
    conn.Open();
    Console.WriteLine("Ok");
}catch(MySqlException e) {
    Console.Error.WriteLine("Hiba! A kapcsolódás sikertelen!");
    Console.Error.WriteLine(e.Message);
}
```

Futtassuk a programot:

```cmd
dotnet run
```

### Adatok lekérése

```C#
using MySqlConnector;

string host="localhost";
string name="sargabt";
string user="sargabt";
string pass="titok";

string connStr = @$"
    Server={host};
    Database={name};
    User ID={user};
    Password={pass}
    ";

MySqlConnection conn = new MySqlConnection(connStr);
try {
    conn.Open();
    Console.WriteLine("Ok");

    string sql= "select * from Employees";
    MySqlCommand cmd = new MySqlCommand(sql, conn);
    MySqlDataReader reader = cmd.ExecuteReader();
    while(reader.Read()) {
        Console.WriteLine(reader.GetString("Name"));
    }
}catch(MySqlException e) {
    Console.Error.WriteLine("Hiba! A kapcsolódás sikertelen!");
    Console.Error.WriteLine(e.Message);
}
```

### Adatok listába

Mivel dátumot is tárolunk, szükség van, a kapcsolati sztring kiegészítésére.

```C#
using MySqlConnector;

string host="localhost";
string name="sargabt";
string user="sargabt";
string pass="titok";

string connStr = @$"
    Server={host};
    Database={name};
    User ID={user};
    Password={pass};
    Convert Zero Datetime=True
    ";

MySqlConnection conn = new MySqlConnection(connStr);
try {
    conn.Open();
    Console.WriteLine("Ok");

    string sql= "select * from Employees";
    MySqlCommand cmd = new MySqlCommand(sql, conn);
    MySqlDataReader reader = cmd.ExecuteReader();
    
    List<Employee> empList = new List<Employee>();
    while(reader.Read()) {
        Employee emp = new Employee();
        emp.Id = reader.GetInt32("Id");
        emp.Name = reader.GetString("Name");
        emp.City = reader.GetString("City");
        emp.Salary = reader.GetDouble("Salary");
        emp.Birth = reader.GetDateTime("Birth");
        empList.Add(emp);
        Console.WriteLine(emp.Name);
    }
}catch(MySqlException e) {
    Console.Error.WriteLine("Hiba! A kapcsolódás sikertelen!");
    Console.Error.WriteLine(e.Message);
}
```

### Adatok beszúrása

```C#
using MySqlConnector;

string host = "localhost";
string name = "zoldzrt";
string user = "zoldzrt";
string pass = "titok";

string connstr = $"Server={host};Database={name};User ID={user};Password={pass};";
using MySqlConnection conn = new(connstr);
try {
    conn.Open();
    string sql = @"
    insert into employees 
    (name, city, salary) 
    values 
    (@name, @city, @salary)
    ";
    using MySqlCommand cmd = new MySqlCommand(sql, conn);
    cmd.Parameters.AddWithValue("name", "Toros Ernő");
    cmd.Parameters.AddWithValue("city", "Szeged");
    cmd.Parameters.AddWithValue("salary", 393);
    int rowsAffected = cmd.ExecuteNonQuery();
    Console.WriteLine($"Érintett sorok száma: {rowsAffected}");
}catch(MySqlException e) {
    Console.Error.WriteLine("Hiba! A beszúrás sikeretelen!");
    Console.Error.WriteLine(e.Message);
}
```

### Adatok módosítása

```C#
using MySqlConnector;

string host = "localhost";
string name = "zoldzrt";
string user = "zoldzrt";
string pass = "titok";

string connstr = $"Server={host};Database={name};User ID={user};Password={pass};";
using MySqlConnection conn = new(connstr);
try {
    conn.Open();
    string sql = "update employees set name=@name, city=@city where id=@id";
    using MySqlCommand cmd = new MySqlCommand(sql, conn);
    cmd.Parameters.AddWithValue("id", 3);
    cmd.Parameters.AddWithValue("name", "Cserép Tibor");
    cmd.Parameters.AddWithValue("city", "Hatvan");
    int rowsAffected = cmd.ExecuteNonQuery();
    Console.WriteLine($"Érintett sorok száma: {rowsAffected}");
}catch(MySqlException e) {
    Console.Error.WriteLine("Hiba! A frissítés sikeretelen!");
    Console.Error.WriteLine(e.Message);
}
```

### Törlés művelete

```c#
using MySqlConnector;

string host = "localhost";
string name = "zoldzrt";
string user = "zoldzrt";
string pass = "titok";

string connstr = $"Server={host};Database={name};User ID={user};Password={pass};";
using MySqlConnection conn = new(connstr);
try {
    conn.Open();
    string sql = "delete from employee where id=@id";
    using MySqlCommand cmd = new MySqlCommand(sql, conn);
    cmd.Parameters.AddWithValue("id", 4);
    int rowsAffected = cmd.ExecuteNonQuery();
    Console.WriteLine($"Érintett sorok száma: {rowsAffected}");
}catch(MySqlException e) {
    Console.Error.WriteLine("Hiba! A törlés sikeretelen!");
    Console.Error.WriteLine(e.Message);
}
```

### Dátum tárolása

Ha dátumokkal dolgozunk, a kapcsolatsztringben fel kell vennünk a Convert Zero DateTime tulajdonságot True értékkel.

```C#
string connStr = @$"
    Server={host};
    Database={name};
    User={user};
    Password={pass};
    Convert Zero Datetime=True
    ";
```

A következő típusokban tárolhatunk:

* DateOnly
* DateTime
* MySqlDateTime

```C#
public class Employee {
    public int Id {set; get;}
    public DateOnly Birth {get; set;}
}
```

Ha modellben DateOnly típust használunk:

```C#
reader.GetDateOnly("Birth");
```

```C#
public class Employee {
    public int Id {set; get;}
    public DateTime Birth {get; set;}
}
```

Ha modellben DateTime típust használunk:

```C#
reader.GetDateTime("Birth");
```

```C#
public class Employee {
    public int Id {set; get;}
    public MySqlDateTime Birth {get; set;}
}
```

Ha modellben MySqlDateTime típust használunk:

```C#
reader.GetMySqlDateTime("Birth");
```

## Gyakorló feladatok

### 1. feladat

Készítsen egy adatbázist, ami elektronikai termékeket tart nyilván. Egy Products nevű táblát kell készítenie a következő mezőkkel:

* Id: az áru neve
* Name: az áru neve
* Price: az áru ára
* Quantity: az áru mennyisége

Írjon programot, ami az adatbázisból megjeleníti az adatokat és lehetővé teszi új termék felvételét.

A program induláskor, egy menüből lehessen választani, hogy a termékek listázását, vagy új termék felvételét szeretnénk, esetleg kilépést.
