# Haladó Objektum Orientál Programozás

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Ismétlő gyakorlatok

1. Kérdezze meg az egyik AI-t, mi a különbség a VSCode és a Netbeans között.

2. Készítsen a VSCode-ban Maven projektet, amiben megold egy programozási feladatot.

3. Készítsen VSCode-ban "no build tools" módban projektet, oldon meg vele egy programozási feladatot.

4. Készítsen Netbeans-ben konzolos programot. Oldjon meg egy bekérős programozási feladatot.

5. Készítsen Netbeans-ben GUI alkalmazást, amely egy bekérős feladatot old meg.

## Interfész

Az interfészek metódusok és állandók egy halmazát adják meg. Az osztályok, amikor implementálnak egy ilyen interfészt, a benne található metódusokat kötelesek megvalósítani.

Legyen például egy Jarmu interfész, amiben előírjuk milyen viselkedéseket kell egy járműnek megvalósítani adott programban.

```java
interface Jarmu {
    public void halad();
}
```

Írjunk programot, ami megvalósítja a Jarmu nevű interfészt.

```txt
app01/
  |-bin/
  |-lib/
  |-src/
  |  |-App.java
  |  |-Jarmu.java
  |  `-Szemelygepkocsi.java
  `-README.md
```

A program állományai:

Jarmu.java fájl:

```java
public interface Jarmu {
    public void halad();
}

```

App.java fájl

```java
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Interfész");

        Szemelygepkocsi lada1 = new Szemelygepkocsi();
        lada1.halad();
    }
}
```

Szemelygepkocsi.java fájl:

```java
public class Szemelygepkocsi implements Jarmu {
    public void halad() {
        System.out.println("x");
    }
}
```

### Gyakorlás 1

1.) Írjon programot, ahol egy idegsejtet szimulál. A szimulátorban használjon interfészt, amiben meghatározza a sejt egy tevékenységét. A program valósítsa meg az interfészt. A program fő osztálya külön állományban legyen.

2.) Írjon programot, ami egy járművet szimulál. A szimulátorban interfésszel határozza meg a jármű mozgásait. A programban valósítsa meg az elkészített interfészt.

## Interfésszel több lehetőség

Egy programot szeretnénk írni, ahol embereket szimulálunk. Minden ember más-más nyelvet beszélhet. A példány létrehozása helyén dől el, milyen nyelvet fog beszélni.

A projekt szerkezete:

```txt
app01/
  |-bin/
  |-lib/
  |-src/
  |  |-Angol.java
  |  |-App.java
  |  |-Beszed.java
  |  |-Ember.java
  |  `-Magyar.java
  `-README.md
```

Angol.java fájl:

```java
public class Angol implements Beszed {
    public void beszel() {
        System.out.println("yes");
    }
}
```

App.java fájl:

```java
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Interfész");

        Ember dani = new Ember(new Angol());
        dani.beszed.beszel();
        Ember jani = new Ember(new Magyar());
        jani.beszed.beszel();
    }
}
```

Beszed.java fájl:

```java
public interface Beszed {
    public void beszel();
}
```

Ember.java fájl:

```java
public class Ember {
    Beszed beszed;
    public Ember(Beszed beszed) {
        this.beszed = beszed;
    }
}
```

Magyar.java fájl:

```java
public class Magyar implements Beszed {
    public void beszel() {
        System.out.println("igen");
    }
}
```

## Adatbázis-elérés

Adatbázis (database/create.sql):

```sql
create database surubt
collate utf8_hungarian_ci
character set utf8;

grant all privileges
on surubt.*
to surubt@localhost
identified by 'titok';

use surubt;

create table employees(
    id int not null primary key auto_increment,
    name varchar(50),
    city varchar(50),
    salary double
);
```

database/insert.sql:

```sql
insert into employees
(name, city, salary)
values
('Para Béla', 'Szolnok', 342),
('Fele Irén', 'Szeged', 332),
('Nora Imre', 'Szeged', 362),
('Szal Katalin', 'Szolnok', 372),
('Endő Lajos', 'Miskolc', 334),
('Tengi Mária', 'Szolnok', 329);
```

Adatok:

```java
public class Dolgozo {
    int az;
    String nev;
    String telepules;
    double fizetes;    
}
```

Az interfész:

```java
import java.sql.Connection;
 
public interface iDatabase {
    public Connection connectDb();
    public void closeDb(Connection conn);
}
```

MariaDB kapcsolat

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class Mariadb implements iDatabase {
 
    private Connection tryConnectDb() throws SQLException {
        String url = "jdbc:mariadb://localhost:3306/surubt";
        return DriverManager.getConnection(url, 
                "surubt", "titok");
    }
 
    public Connection connectDb(){
        Connection conn = null;
        try {
            conn = tryConnectDb();
        }catch(SQLException e) {
            System.err.println("Hiba! A kapcsolódás sikertelen");
            System.err.println(e.getMessage());
        }
        return conn;
    }
 
    private void tryCloseDb(Connection conn) throws SQLException {
        conn.close();
    }
 
    public void closeDb(Connection conn){        
        try {
            tryCloseDb(conn);
        }catch(SQLException e) {
            System.err.println("Hiba! A kapcsolat zárása sikertelen!");
            System.err.println(e.getMessage());
        }
    }
 
}
```

SQLite:

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class Sqlite implements iDatabase {
    public Connection tryConnectDb() throws SQLException {
        String url = "jdbc:sqlite:surubt.sqlite";
        return DriverManager.getConnection(url);
    }
    public Connection connectDb() {
        Connection conn = null;
        try {
            conn = tryConnectDb();
        }catch(SQLException ex) {
            System.err.println("Hiba! A kapcsolódás sikertelen!");
        }
        return conn;
    }
    public void tryCloseDb(Connection conn) throws SQLException {
        conn.close();
    }
    public void closeDb(Connection conn) {
        try {
            tryCloseDb(conn);
        } catch (SQLException ex) {
            System.err.println("Hiba! A bezárás sikertelen!");
        }
    }
}
```

Data:

```java
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
 
public class Data {
    iDatabase database;
    public Data(iDatabase database) {
        this.database = database;
    }
    public List<Dolgozo> getEmployees() {
        List<Dolgozo> dolgozok = new ArrayList<>();
        try {
            dolgozok = tryGetEmployees();
        }catch(SQLException e) {
            System.err.println("Hiba! A lekérdezés sikertelen!");
            System.err.println(e.getMessage());
        }
        return dolgozok;
    }
    public List<Dolgozo> tryGetEmployees() throws SQLException {
        List<Dolgozo> dolgozok = new ArrayList<>();
        String sql = "select az, nev, telepules, fizetes from dolgozok";
        Connection conn = database.connectDb();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()) {
            Dolgozo dolgozo = new Dolgozo();
            dolgozo.az = rs.getInt("az");
            dolgozo.nev = rs.getString("nev");
            dolgozo.telepules = rs.getString("telepules");
            dolgozo.fizetes = rs.getDouble("fizetes");
            dolgozok.add(dolgozo);
        }
        database.closeDb(conn);
        return dolgozok;
    }
 
    public void tryInsertEmployee(String name, String city) throws SQLException {
        Connection conn = database.connectDb();
        String sql = "insert into dolgozok " +
                "(nev, telepules) values " +
                "(?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, city);
        pstmt.execute();
        database.closeDb(conn);
    }
    public void insertEmployee(String name, String city) {
        try {
            tryInsertEmployee(name, city);
        } catch (SQLException ex) {
            System.err.println("Hiba! A beszúrás sikertelen!");
        }
    }
 
}
```

Program01:

```java
import java.util.ArrayList;
import java.util.List;
 
public class Program01 {
 
    public static void main(String[] args) {
        List<Dolgozo> dolgozok = new ArrayList<>();
        Data data = new Data(new Sqlite());
 
        dolgozok = data.getEmployees();
        for(Dolgozo dolgozo : dolgozok) {            
            System.out.println(dolgozo.nev);
        }
        data.insertEmployee("Park Elemér", "Szolnok");
 
    }
 
}
```

## REST API elérés

Java 11-től használhatjuk a HttpClient osztályt HTTP kapcsolatokra. A HttpRequest osztályt egy objektumát használjuk egy kérés leírására. Paraméterként az URI osztály használhatjuk, a REST API elérésének megadására. A Egy HttpResponse objektumban fogadjuk a HTTP szerver válaszát, a BodyHandlers osztállyal mondjuk meg, hogy Sztringként szeretnénk kezelni a válaszban érkezett tartalmat.

### Szinkron kérés

Legyen egy get() nevű metódus, amelyben tetszőleges URI alapján, lekérdezzük egy teteszőleges végpontot.

Legyen egy példa, ahol a src/models/Client.java fájl tartalma a következő:

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    public String get(String uri) {
        String response = "";
        try {
            response = tryGet(uri);
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return response;
    }
    public String tryGet(String uri) 
            throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(uri))
        .build();
        HttpResponse<String> response = 
        client.send(request, BodyHandlers.ofString());
        return response.body();
    }
}
```

Ezek után a Client osztály használata az App.java fájlban:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String uri = "https://jsonplaceholder.typicode.com/todos";
        System.out.println(client.get(uri));
    }    
}
```

A kérést a client.send() utasítással küldtük el. Ez szinkron módon fut, vagyis amíg a válasz meg nem érkezik, addig az alkalmazás mozdulatlan, nem fut tovább.

### Aszinkron kérés

Aszinkron kérés esetén a válasz megérkezéstől függetlenül az program tovább fut.

Aszinkron módon megvalósított Client osztály:

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.concurrent.CompletableFuture;

public class Client {
    public CompletableFuture<String> get(String uri) 
            throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(uri))
        .build();        

        return client.sendAsync(request, BodyHandlers.ofString())
        .thenApply(HttpResponse::body);
    }
}
```

Használata App.java fájlban:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String uri = "https://jsonplaceholder.typicode.com/todos";
        System.out.println(client.get(uri).join());
    }    
}
```

### Hozzáadás

Szeretnénk felvenni új elemet. Egészítsük ki a Client osztályt egy post() metódussal.

```java
    public CompletableFuture<String> post(String uri, String body, String... token) {
        HttpClient client = HttpClient.newHttpClient();
        List<String> headers = new ArrayList<>();
        headers.add("Content-Type");
        headers.add("application/json");

        if(token.length > 0) {
            headers.add("Authorizatin");
            headers.add("Bearer " + token[0]);
        }

        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(uri))
        .headers(headers.toArray(String[]::new))
        .POST(HttpRequest.BodyPublishers.ofString(body))
        .build();

        return client.sendAsync(request, BodyHandlers.ofString())
        .thenApply(HttpResponse::body);
    }
```

Az App osztályban a használat:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String uri = "http://[::1]:8000/employees";
        String body = "{ \"name\": \"Erős István\", " +
         "\"city\": \"Szeged\", " +
         "\"salary\": 389 }";
        System.out.println(body);
        System.out.println(client.post(uri, body).join());
    }    
}
```

A headers.toArray(String[]::new) utasítás a kollekció tartalmát sztring tömbbé alakítja.

## OOP feladat

### Feladat 001

Adott a következő UML ábra:

![Termékek](images/product_uml_01.png)

Készítse el azt a programot, ami teljesíti az UML ábrán látható osztályokat.
