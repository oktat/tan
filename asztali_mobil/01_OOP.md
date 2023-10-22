# Haladó Objektum Orientál Programozás

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

[[TOC]]

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
    public String tryGet(String url) 
            throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(url))
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
        String url = "https://jsonplaceholder.typicode.com/todos";
        System.out.println(client.get(url));
    }    
}
```

A kérést a client.send() utasítással küldtük el. Ez szinkron módon fut, vagyis amíg a válasz meg nem érkezik, addig az alkalmazás mozdulatlan, nem fut tovább.

### A get() metódus darabolása

Bontsuk fel a get() metódust több részre. Nézzük hány részre osztható fel:

* A kliens létrehozása
* A kérés létrehozása
* A küldés

Vegyük ki a kérés elkészítését, tegyük egy genGetRequest() nevű metódusba.
Ugyanakkor bontsuk fel a "szerelvény". A szerelvény:

```java
        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(url))
        .build();
```

Hogyan bonthatjuk fel? A newbuilder() metódus egy Builder objektumot ad vissza.
A Java nyelvben elég sok Builder osztály van. A következőt használjuk:

* java.net.http.HttpRequest.Builder;

Ez a Builder osztály a HttpRequest osztály egy beépített (Nested) osztálya.

```java
java.net.http.HttpRequest.Builder;

//...

Builder builder = HttpRequest.newBuilder();
```

A builder objektumon futtathatjuk az uri() metódust, ami beállítja a lekérdezendő API címét.

A builder objektumon a build() metódust meghívva megkapjuk a HttpRequest objektumot.

```java
java.net.http.HttpRequest.Builder;

//...
String url = "api_cime";
Builder builder = HttpRequest.newBuilder();
builder.uri(URI.create(url));
HttpRequest request = builder.build();
```

Írjuk meg az eddigiek alapján a genGetRequest() metódust.

```java
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
```

A Client osztály használata; teljes kód:

Client.java

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
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
    public String tryGet(String url) 
            throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = genGetRequest(url);
        HttpResponse<String> response = 
        client.send(request, BodyHandlers.ofString());
        return response.body();
    }
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
}
```

A tryGet() metódusból kivehetjük a küldést is. A kivételkezelést a client.send() metódust kívánja meg, ezért azt is visszük a küldéssel együtt. Legyen a metódus neve sendRequest(). A tryGet() metódus helyi client objektumát globálissá kell tennünk, hogy később más metódusokban ne kelljen példányosítani.

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    HttpClient client;
    public Client() {
        this.client = HttpClient.newHttpClient();
    }

    public String get(String url) {
        HttpRequest request = genGetRequest(url);        
        return sendRequest(request);
    }
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
    public String sendRequest(HttpRequest request) {
        String result = "";
        try {
            result = trySendRequest(request);                     
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return result;
    }
    private String trySendRequest(HttpRequest request) 
            throws IOException, InterruptedException {
        HttpResponse<String> response = 
        this.client.send(request, BodyHandlers.ofString());        
        return response.body();
    }
}
```

### A POST metódus

A kérésgeneráló metódust újra kell írnunk, mivel a kérésbe bele kell tennük egy új TODO adatatit, fejléccel együtt:

```java
    private HttpRequest genPostRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.POST(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }
```

A küldéshez használhatjuk a már meglévő küldő metódust.

A teljes kód, az App osztály újraírásával:

Client.java:

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    HttpClient client;
    public Client() {
        this.client = HttpClient.newHttpClient();
    }

    public String get(String url) {
        HttpRequest request = genGetRequest(url);        
        return sendRequest(request);
    }
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
    
    public String post(String url, String body) {
        HttpRequest request = this.genPostRequest(url, body);        
        return this.sendRequest(request);
    }
    private HttpRequest genPostRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.POST(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String sendRequest(HttpRequest request) {
        String result = "";
        try {
            result = trySendRequest(request);                     
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return result;
    }
    private String trySendRequest(HttpRequest request) 
            throws IOException, InterruptedException {
        HttpResponse<String> response = 
        this.client.send(request, BodyHandlers.ofString());        
        return response.body();
    }
}
```

App.java:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String url = "https://jsonplaceholder.typicode.com/todos";
        // System.out.println(client.get(url));

        String newTodo = 
            "{ \"userId\":10, " +
            "\"title\":\"Eldobom a telefonom\", "+
            "\"completed\": false }";
        System.out.println(client.post(url, newTodo));
    }
}
```

### A PUT metódus

A put() és a genPutRequest() metódus:

```java
    public String put(String url, String body) {
        HttpRequest request = this.genPutRequest(url, body);
        return this.sendRequest(request);
    }
    private HttpRequest genPutRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.PUT(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }
```

A teljes kód a put() használatával:

Client.java

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    HttpClient client;
    public Client() {
        this.client = HttpClient.newHttpClient();
    }

    public String get(String url) {
        HttpRequest request = genGetRequest(url);        
        return sendRequest(request);
    }
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
    
    public String post(String url, String body) {
        HttpRequest request = this.genPostRequest(url, body);        
        return this.sendRequest(request);
    }
    private HttpRequest genPostRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.POST(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String put(String url, String body) {
        HttpRequest request = this.genPutRequest(url, body);
        return this.sendRequest(request);
    }
    private HttpRequest genPutRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.PUT(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String sendRequest(HttpRequest request) {
        String result = "";
        try {
            result = trySendRequest(request);                     
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return result;
    }
    private String trySendRequest(HttpRequest request) 
            throws IOException, InterruptedException {
        HttpResponse<String> response = 
        this.client.send(request, BodyHandlers.ofString());        
        return response.body();
    }
}
```

App.java

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String url = "https://jsonplaceholder.typicode.com/todos";
        // System.out.println(client.get(url));

        // String newTodo = 
        //     "{ \"userId\":10, " +
        //     "\"title\":\"Eldobom a telefonom\", "+
        //     "\"completed\": false }";
        // System.out.println(client.post(url, newTodo));
        
        String modifiedTodo = 
            "{ \"userId\":10, " +
            "\"title\":\"Nem eszem cukrot 1 hónapig\", "+
            "\"completed\": false }";
        System.out.println(client.put(url + "/1", modifiedTodo));
    }
}
```

### A DELETE metódus

Írjuk meg a delete() metódust a genDeleteRequest() metódussal együtt.

Client.java:

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    HttpClient client;
    public Client() {
        this.client = HttpClient.newHttpClient();
    }

    public String get(String url) {
        HttpRequest request = genGetRequest(url);        
        return sendRequest(request);
    }
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
    
    public String post(String url, String body) {
        HttpRequest request = this.genPostRequest(url, body);        
        return this.sendRequest(request);
    }
    private HttpRequest genPostRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.POST(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String put(String url, String body) {
        HttpRequest request = this.genPutRequest(url, body);
        return this.sendRequest(request);
    }
    private HttpRequest genPutRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.PUT(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String delete(String url) {
        HttpRequest request = this.genDeleteRequest(url);
        return this.sendRequest(request);
    }
    private HttpRequest genDeleteRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.DELETE();
        return builder.build();        
    }

    public String sendRequest(HttpRequest request) {
        String result = "";
        try {
            result = trySendRequest(request);                     
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return result;
    }
    private String trySendRequest(HttpRequest request) 
            throws IOException, InterruptedException {
        HttpResponse<String> response = 
        this.client.send(request, BodyHandlers.ofString());        
        return response.body();
    }
}
```

App.java

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String url = "https://jsonplaceholder.typicode.com/todos";
        // System.out.println(client.get(url));

        // String newTodo = 
        //     "{ \"userId\":10, " +
        //     "\"title\":\"Eldobom a telefonom\", "+
        //     "\"completed\": false }";
        // System.out.println(client.post(url, newTodo));
        
        // String modifiedTodo = 
        //     "{ \"userId\":10, " +
        //     "\"title\":\"Nem eszem cukrot 1 hónapig\", "+
        //     "\"completed\": false }";
        // System.out.println(client.put(url + "/1", modifiedTodo));

        System.out.println(client.delete(url + "/1"));
    }
}
```

### Azonosítás beállítása

Client.java:

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    HttpClient client;
    public Client() {
        this.client = HttpClient.newHttpClient();
    }

    public String get(String url) {
        HttpRequest request = genGetRequest(url);        
        return sendRequest(request);
    }
    private HttpRequest genGetRequest(String url, String... args) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        if(args.length > 0) {
            String token = args[0];
            builder.header("Authorization", "Bearer " + token);            
        }
        return builder.build();
    }
    
    public String post(String url, String body, String... args) {
        HttpRequest request = this.genPostRequest(url, body, args);        
        return this.sendRequest(request);
    }
    private HttpRequest genPostRequest(String url, String body, String... args) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        if(args.length > 0) {
            String token = args[0];
            builder.header("Authorization", "Bearer " + token);            
        }        
        builder.POST(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String put(String url, String body, String... args) {
        HttpRequest request = this.genPutRequest(url, body, args);
        return this.sendRequest(request);
    }
    private HttpRequest genPutRequest(String url, String body, String... args) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        if(args.length > 0) {
            String token = args[0];
            builder.header("Authorization", "Bearer " + token);            
        }
        builder.PUT(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String delete(String url, String... args) {
        HttpRequest request = this.genDeleteRequest(url, args);
        return this.sendRequest(request);
    }
    private HttpRequest genDeleteRequest(String url, String... args) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        if(args.length > 0) {
            String token = args[0];
            builder.header("Authorization", "Bearer " + token);            
        }
        builder.DELETE();
        return builder.build();
    }

    public String sendRequest(HttpRequest request) {
        String result = "";
        try {
            result = trySendRequest(request);                     
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return result;
    }
    private String trySendRequest(HttpRequest request) 
            throws IOException, InterruptedException {
        HttpResponse<String> response = 
        this.client.send(request, BodyHandlers.ofString());        
        return response.body();
    }
}
```

App.java:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String url = "https://jsonplaceholder.typicode.com/todos";
        // System.out.println(client.get(url));

        // String newTodo = 
        //     "{ \"userId\":10, " +
        //     "\"title\":\"Eldobom a telefonom\", "+
        //     "\"completed\": false }";
        // System.out.println(client.post(url, newTodo));
        
        // String modifiedTodo = 
        //     "{ \"userId\":10, " +
        //     "\"title\":\"Nem eszem cukrot 1 hónapig\", "+
        //     "\"completed\": false }";
        // System.out.println(client.put(url + "/1", modifiedTodo));

        System.out.println(client.delete(url + "/1"));
    }
}
```

### Objektum JSON formátumba

Készítsünk egy Todo.java nevű osztályt:

Todo.java:

```java
package models;

public class Todo {
    private Integer id;
    private Integer userId;
    private String title;
    private Boolean completed;
    public Todo(Integer userId, String title, Boolean completed) {
        this.userId = userId;
        this.title = title;
        this.completed = completed;
    }
    public Todo(Integer id, Integer userId, String title, Boolean completed) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.completed = completed;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public Boolean getCompleted() {
        return completed;
    }
    public void setCompleted(Boolean completed) {
        this.completed = completed;
    }
    
}
```

Hivatkozzuk meg a Gson library-t.

Hozzunk létre egy gson objektumot, majd alakítsuk át a todo objektumot JSON stringgé.

```java
        Gson gson = new Gson();

        Todo todo = new Todo(10, 
            "Eldobom a telefonom", false);        
        String newTodo = gson.toJson(todo);
        System.out.println(client.post(url, newTodo));
```

### Objektumból JSON újra módosítással

```java
        //...
        Todo todo = new Todo(10,
            "Nem eszek curot 1 hónapig", false);        
        String modifiedTodo = gson.toJson(todo);
        System.out.println(client.put(url + "/1", modifiedTodo));
```

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

### Frissítés

Frissítéshez a írjuk meg a put() metódust:

```java
    public CompletableFuture<String> put(String uri, String body, String... token) {
        HttpClient client = HttpClient.newHttpClient();
        List<String> headers = new ArrayList<>();
        headers.add("Content-Type");
        headers.add("application/json");

        if(token.length > 0) {
            headers.add("Authorization");
            headers.add("Bearer " + token[0]);
        }

        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(uri))
        .headers(headers.toArray(String[]::new))
        .PUT(HttpRequest.BodyPublishers.ofString(body))
        .build();

        return client.sendAsync(request, BodyHandlers.ofString())
        .thenApply(HttpResponse::body);
    }
```

A metódus használata:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String uri = "http://[::1]:8000/employees/2";
        String body = "{ \"name\": \"Csípős Valér\", " +
         "\"city\": \"Szolnok\", " +
         "\"salary\": 381 }";
        System.out.println(body);
        System.out.println(client.put(uri, body).join());
    }    
}
```

Vegyük észre az uri objektumbana 2-s azonosítót. A client objektumon pedig a put() metódus hívást.

### Törlés

Hozzuk létre a delete() metódust, ami alkalmas törlésre:

```java
    public CompletableFuture<String> delete(String uri, String... token) {
        HttpClient client = HttpClient.newHttpClient();

        List<String> headers = new ArrayList<>();
        headers.add("Content-Type");
        headers.add("application/json");

        if(token.length > 0) {
            headers.add("Authorization");
            headers.add("Bearer " + token[0]);
        }

        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(uri))
        .headers(headers.toArray(String[]::new))
        .DELETE()
        .build();
        
        return client.sendAsync(request, BodyHandlers.ofString())
        .thenApply(HttpResponse::body);
    }
```

Használata:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String uri = "http://[::1]:8000/employees/3";
        System.out.println(client.delete(uri).join());
    }    
}

```

### Telejes kód

A teljes kódot javítva a GitHubon megtaláljuk:

* [https://github.com/oktat/empclient](https://github.com/oktat/empclient)

Lehetséges REST API:

* [https://github.com/oktat/empjs](https://github.com/oktat/empjs)

## OOP feladat

### Feladat 001

Adott a következő UML ábra:

![Termékek](images/product_uml_01.png)

Készítse el azt a programot, ami teljesíti az UML ábrán látható osztályokat.
