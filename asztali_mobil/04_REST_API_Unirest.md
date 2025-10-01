# REST API elérés

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Bevezetés](#bevezetés)
* [Használható REST API](#használható-rest-api)
* [Unirest alapok](#unirest-alapok)
* [A Gson](#a-gson)
* [Gyakorlás 1](#gyakorlás-1)
* [Gyakorlás 2](#gyakorlás-2)
* [Azonosítás](#azonosítás)
* [Hibakezelés](#hibakezelés)
* [Tesztelés](#tesztelés)
* [Források](#források)

## Bevezetés

### A REST API

A **REST** A **Representational State Trasfer**, az **API** az **Application Programming Interface** rövidíétse. A webszolgáltatások megvalósításához fejlesztett architektúra. A REST API használata során URL-ek és HTTP protokollokkal (GET, POST, PUT, DELETE) dolgozunk.

Errőforrások:

A REST API-t erőforrásokba szervezzük, amelyek egyedi URL-en keresztül érhetők el. A felhasználók például a **/users** címen érhetők el. Egyetlen felhasználó **/users/{id}** címen érhető el.

A HTTP metódusok:

A REST API létrehozása során a HTTP szabványos metódusait használjuk:

* GET: erőforrás olvasása
* POST: új elem létrehozása az erőforráson
* PUT: egy elem frissítése az erőforráson
* PATCH: létező elem egy részének frissítése
* DELETE: elem törlése

Állapotmentesség:

A REST API állapotmentes, ezért minden kérés tartalmazza minden egyes kéréshez szükséges összes infomrációt.

Adatformátumok:

A REST API különböző formában dolgozat adatokkal:

* JSON
* XML
* HTML

Leggyakrabban JSON formátumot használjuk, mivel könnyen olvasható, és kevésbé terheli a hálózatot.

HTTP státuszkódok:

* 200 OK: Kérés sikeres
* 201 Created: Új elem létrehozva
* 204 No content: A kérés sikeres, de nincs mit visszaadni
* 400 Bad request: A kérés hibás
* 404 Not found: Az erőforrás nem található
* 500 Internal server error: Szerver oldali hiba

Kliens-szerver felépítés:

A REST API általában kliens-szerver felépítésű. A kliens lehet:

* web
* mobil
* asztali alkalmazás

### Miért Unirest?

Az Unirest egy könnyen használható HTTP kliens programozói könyvtár.

Tulajdonságok:

* egyszerű
* könnyen integrálható; például Gson, Jackson
* a gyakran használt HTTP metódusok támogatása
* aszinkron támogatás
* testreszabható HTTP fejlécek
* könnyű hibakezelés
* jól dokumentált
* közösségi támogatás
* könnyen bővíthető

## Használható REST API

Néhány használható REST API megvalósítás és helyettesítő REST API hai-server-rel.

PHP:

* [https://github.com/oktat/zoldhum.git](https://github.com/oktat/zoldhum.git)
* [https://github.com/oktat/jarat.git](https://github.com/oktat/jarat.git)
* [https://github.com/oktat/emp.git](https://github.com/oktat/emp.git)

JavaScript:

* [https://github.com/oktat/empjs.git](https://github.com/oktat/empjs.git)
* [https://github.com/oktat/empjs_simple.git](https://github.com/oktat/empjs_simple.git)

C#:

* [https://github.com/oktat/emp_dotnet_tablejoin.git](https://github.com/oktat/emp_dotnet_tablejoin.git)
* [https://github.com/oktat/emp_dotnet_crud.git](https://github.com/oktat/emp_dotnet_crud.git)

Spring Boot:

* [https://github.com/oktat/empsb.git](https://github.com/oktat/empsb.git)

Hai-server:

* [https://github.com/oktat/patients_haiapi.git](https://github.com/oktat/patients_haiapi.git)
* [https://github.com/oktat/gepida_bike.git](https://github.com/oktat/gepida_bike.git)
* [https://github.com/oktat/shipsale.git](https://github.com/oktat/shipsale.git)

## Unirest alapok

### Unirest telepítése és konfigurálása

Az Unirest használatát elkezdhetjük a következő helyeken:

* [https://github.com/Kong/unirest-java](https://github.com/Kong/unirest-java) (2024)
* [https://kong.github.io/unirest-java/](https://kong.github.io/unirest-java/) (2024)

#### JAR fájlok használata

Ha szeretnénk letölteni a függőségeket, például egy Library nevű könyvtárba, a következőkre van szükség:

* commons-logging
* httpasyncclient
* httpclient
* httpcore
* httpcore-nio
* unirest-java
* httpmime
* gson

Esetleg még hiányolhatja:

* commons-codec
* guava
* jackson-databind
* jackson-datatype-guava
* junit-jupiter-api

Keressük meg a Maven Central Repository-ban:

* [https://central.sonatype.com/](https://central.sonatype.com/)

Keressünk a **unirest-java** kifejezésre, válasszuk azt, ami **com.konghq** szervezethez tartozik.

#### Mavan használata

Mivel az Unirest-nek jó sok függősége van függőségkezelő részt is meg kell adnunk a pom.xml állományban:

```xml
<dependencyManagement>
    <dependencies>
        <!-- https://mvnrepository.com/artifact/com.konghq/unirest-java-bom -->
        <dependency>
            <groupId>com.konghq</groupId>
            <artifactId>unirest-java-bom</artifactId>
            <version>4.3.0</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>

<dependencies>
<!-- https://mvnrepository.com/artifact/com.konghq/unirest-java-core -->
<dependency>
    <groupId>com.konghq</groupId>
    <artifactId>unirest-java-core</artifactId>
</dependency>

<!-- pick a JSON module if you want to parse JSON include one of these: -->
<!-- Google GSON -->
<dependency>
    <groupId>com.konghq</groupId>
    <artifactId>unirest-modules-gson</artifactId>
</dependency>

<!-- OR maybe you like Jackson better? -->
<dependency>
    <groupId>com.konghq</groupId>
    <artifactId>unirest-modules-jackson</artifactId>
</dependency>
</dependencies>
```

#### Gradle használata

```gradle
dependencies {
    // Ellenőrizze a legfrissebb verziót
    implementation 'com.konghq:unirest-java:3.13.6'

    // JSON támogatás (opcionális)
    // Ellenőrizze a legfrissebb verziót
    implementation 'com.fasterxml.jackson.core:jackson-databind:2.12.3' 
}
```

### Egyszerű GET kérés

_UnirestExample.java_:

```java
import unirest.HttpResponse;
import unirest.Unirest;

public class UnirestExample {
  public static void main(String[] args) {
    String url = "http://localhost:8000/api/employees";
    HttpResponse<String> response = Unirest.get(url)
      .header("accept", "application/json")
      .asString();

    System.out.println("Státusz: " + response.getStatus());
    System.out.println("Válasz: " + response.getBody());
  }
}
```

### A POST kérés

_App.java_:

```java
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;

public class App {
    public static void main(String[] args) throws Exception {
        String url = "http://localhost:8000/api/employees";
        String emp = """
                {
                    "name": "Erős István",
                    "city": "Szeged",
                    "salary": 397.0
                }
                """;
        HttpResponse<JsonNode> response = Unirest.post(url)
            .header("accept", "application/json")
            .header("Content-Type", "application/json")
            .body(emp)
            .asJson();

        System.out.println("Státusz: " + response.getStatus());
        System.out.println("Válasz: " + 
        response
            .getBody()
            .toPrettyString());
    }
}
```

### A PUT kérés

_App.java_:

```java
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;

public class App {
    public static void main(String[] args) throws Exception {
        String url = "http://localhost:8000/api/employees/5";
        String emp = """
                {
                    "name": "Csopak Ernő",
                    "city": "Pélcs",
                    "salary": 395.2
                }
                """;
        HttpResponse<JsonNode> response = Unirest.put(url)
            .header("accept", "application/json")
            .header("Content-Type", "application/json")
            .body(emp)
            .asJson();

        System.out.println("Státusz: " + response.getStatus());
        System.out.println("Válasz: " + 
        response
            .getBody()
            .toPrettyString());
    }
}
```

### A DELETE kérés

_App.java_:

```java
import kong.unirest.HttpResponse;
import kong.unirest.Unirest;

public class App {
    public static void main(String[] args) throws Exception {
        String url = "http://localhost:8000/api/employees/3";
        HttpResponse<String> response = Unirest.delete(url)
            .asString();

        System.out.println("Státusz: " + response.getStatus());
        System.out.println("Válasz: " + 
        response
            .getBody()
            .toString());
    }
}
```

## A Gson

### A Gsonről

A Gson a Google által fejlesztett Java programozói könyvtár, amely lehetővé teszi Java objektumok könnyű konvertálását JSON formátumba és visszafelé.

Jellemzők:

* széleskörben használt
* könnyű használat
* adattípusok támogatása
* jó teljesítmény

### Gson telepítése

A _pom.xml_ fájlba:

```xml
<dependencies>
    <dependency>
        <groupId>com.google.code.gson</groupId>
        <artifactId>gson</artifactId>
        <!-- Ellenőrizze a legfrissebb verziót -->        
        <version>2.10.1</version>
    </dependency>
</dependencies>
```

Gradle esetén:

```gradle
dependencies {
    // Egyéb függőségek

    // Gson függőség
     // Ellenőrizze a legfrissebb verziót
    implementation 'com.google.code.gson:gson:2.10.1'
}
```

Kézi telepítés esetén a **gson** csomagot használja, a com.googele.code.gson szervezeti azonosítóval.

### A GET kérés átalakítása Java objektummá

_Employee.java_:

```java
public class Employee {
  Integer id;
  String name;
  String city;
  Double salary;
}
```

_App.java_:

```java
import kong.unirest.HttpResponse;
import kong.unirest.Unirest;

public class App {
    public static void main(String[] args) throws Exception {
        String url = "http://localhost:8000/api/employees/1";
        HttpResponse<Employee> response = Unirest.get(url)
        .header("Accept", "application/json")
        .asObject(Employee.class);

        Employee employee = response.getBody();
  
        System.out.println("ID: " + employee.id);
        System.out.println("Név: " + employee.name);
        System.out.println("Varos: " + employee.city);
        System.out.println("Fizetés: " + employee.salary);
    }
}
```

### A GET kérés átalakítása objektumtömbbé

_App.java_:

```java
import java.util.ArrayList;
import java.util.Arrays;

import kong.unirest.HttpResponse;
import kong.unirest.Unirest;

public class App {
    public static void main(String[] args) throws Exception {
        String url = "http://localhost:8000/api/employees";
        HttpResponse<Employee[]> response = Unirest.get(url)
        .header("Accept", "application/json")
        .asObject(Employee[].class);

        Employee[] employees = response.getBody();  
        ArrayList<Employee> list = new ArrayList<Employee>(Arrays.asList(employees));

        for (Employee employee : list) {
            System.out.println(employee.city);
        }        
    }
}
```

### A POST kérés objektumból

_App.java_:

```java
import com.google.gson.JsonObject;

import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;

public class App {
    public static void main(String[] args) throws Exception {
        String url = "http://localhost:8000/api/employees";
        Employee emp = new Employee();
        emp.name = "Poros Árpád";
        emp.city = "Szeged";
        emp.salary = 381.0;

        JsonObject json = new JsonObject();
        json.addProperty("name", emp.name);
        json.addProperty("city", emp.city);
        json.addProperty("salary", emp.salary);

        HttpResponse<JsonNode> response = Unirest.post(url)
        .header("Accept", "application/json")
        .header("Content-Type", "application/json")
        .body(json)
        .asJson();

        System.out.println(response.getBody().toPrettyString());       
    }
}
```

### PUT kérés objektummal

_App.java_:

```java
import com.google.gson.JsonObject;

import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;

public class App {
    public static void main(String[] args) throws Exception {
        String url = "http://localhost:8000/api/employees/12";
        Employee emp = new Employee();
        emp.name = "Poros Árpád";
        emp.city = "Szeged";
        emp.salary = 381.0;

        JsonObject json = new JsonObject();
        json.addProperty("name", emp.name);
        json.addProperty("city", emp.city);
        json.addProperty("salary", emp.salary);

        HttpResponse<JsonNode> response = Unirest.put(url)
        .header("Accept", "application/json")
        .header("Content-Type", "application/json")
        .body(json)
        .asJson();

        System.out.println(response.getBody().toPrettyString());       
    }
}
```

## Gyakorlás 1

_Employee.java_:

```java
public class Employee {
  Integer id;
  String name;
  String city;
  Double salary;

  public Employee(Integer id, String name, String city, Double salary) {
    this.id = id;
    this.name = name;
    this.city = city;
    this.salary = salary;
  }
  public Employee() {
  }
  public Employee(String name, String city, Double salary) {
    this.name = name;
    this.city = city;
    this.salary = salary;
  }
}
```

_EmployeeApi.java_:

```java
import java.util.ArrayList;
import java.util.Arrays;

import kong.unirest.HttpResponse;
import kong.unirest.Unirest;

public class EmployeeApi {

  String url = "http://localhost:8000/api/employees";

  public ArrayList<Employee> getEmployees() {
    HttpResponse<Employee[]> response = Unirest.get(url)
    .header("Accept", "application/json")
    .asObject(Employee[].class);
    Employee[] employees = response.getBody();  
    ArrayList<Employee> list = 
    new ArrayList<Employee>(Arrays.asList(employees));
    return list;
  }
  public Employee addEmployee(Employee employee) {
    HttpResponse<Employee> response = Unirest.post(url)
    .header("Accept", "application/json")
    .header("Content-Type", "application/json")
    .body(employee)
    .asObject(Employee.class);
    Employee newEmployee = response.getBody();
    return newEmployee;
  }

  public Employee updateEmployee(Employee employee) {
    HttpResponse<Employee> response = Unirest.put(url + "/" + employee.id)
    .header("Accept", "application/json")
    .header("Content-Type", "application/json")
    .body(employee)
    .asObject(Employee.class);
    Employee newEmployee = response.getBody();
    return newEmployee;
  }

  public String deleteEmployee(int id) {
    HttpResponse<String> response = Unirest.delete(url + "/" + id)
    .header("Accept", "application/json")
    .asString();
    return response.getBody();
  }
}
```

_App.java_:

```java
import java.util.ArrayList;

public class App {
    public static void main(String[] args) throws Exception {
        // readEmployees();
        // createEmployee();
        // updateEmployee();
        deleteEmployee();
    }

    public static void readEmployees() {
        EmployeeApi api = new EmployeeApi();
        ArrayList<Employee> list = api.getEmployees();
        for (Employee employee : list) {
            System.out.println(employee.name);
        }
    }
    public static void createEmployee() {
        EmployeeApi api = new EmployeeApi();
        Employee emp = new Employee();
        emp.name = "John Doe";
        emp.city = "New York";
        emp.salary = 1000.0;
        Employee newEmployee = api.addEmployee(emp);
        System.out.println(newEmployee.id);
    }
    public static void updateEmployee() {
        EmployeeApi api = new EmployeeApi();
        Employee emp = new Employee();
        emp.id = 1;
        emp.name = "John Doe";
        emp.city = "New York";
        emp.salary = 1000.0;
        Employee newEmployee = api.updateEmployee(emp);
        System.out.println(newEmployee.id);
    }
    public static void deleteEmployee() {
        EmployeeApi api = new EmployeeApi();
        String response = api.deleteEmployee(6);
        System.out.println(response);
    }
}
```

## Gyakorlás 2

### Java objektum JSON formátumba alakítása

_GsonExample.java_:

```java
import com.google.gson.Gson;

class User {
    String name;
    int age;

    // Konstruktor
    public User(String name, int age) {
        this.name = name;
        this.age = age;
    }
}

public class GsonExample {
    public static void main(String[] args) {
        Gson gson = new Gson();
        
        // Java objektum létrehozása
        User user = new User("Alice", 25);
        
        // Java objektum konvertálása JSON-ra
        String json = gson.toJson(user);
        System.out.println(json); // Kimenet: {"name":"Alice","age":25}
    }
}
```

### JSON objektum Java objektumra alakítása

_GsonExample.java_:

```java
import com.google.gson.Gson;

class User {
    String name;
    int age;
}

public class GsonExample {
    public static void main(String[] args) {
        Gson gson = new Gson();
        
        // JSON szöveg
        String json = "{\"name\":\"Alice\",\"age\":25}";
        
        // JSON konvertálása Java objektummá
        User user = gson.fromJson(json, User.class);
        System.out.println(user.name); // Kimenet: Alice
        System.out.println(user.age);   // Kimenet: 25
    }
}
```

## Azonosítás

_App.java_:

```java
import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;

public class App {
    public static void main(String[] args) throws Exception {
        String url = "http://localhost:8000/api/employees";
        String token = "WrlcZ";
        String emp = """
                {
                    "name": "Erős István",
                    "city": "Szeged",
                    "salary": 397.0
                }
                """;
        HttpResponse<JsonNode> response = Unirest.post(url)
            .header("accept", "application/json")
            .header("Content-Type", "application/json")
            .header("Authorization", "Bearer " + token)
            .body(emp)
            .asJson();

        System.out.println("Státusz: " + response.getStatus());
        System.out.println("Válasz: " + 
        response
            .getBody()
            .toPrettyString());
    }
}
```

Most tegyük a HTTP fejlécet külön objektumba:

```java
import java.util.HashMap;
import java.util.Map;

import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;

public class App {
    public static void main(String[] args) throws Exception {
        String url = "http://localhost:8000/api/employees";
        String token = "WrlcZ";
        String emp = """
                {
                    "name": "Erős István",
                    "city": "Szeged",
                    "salary": 394.0
                }
                """;
        Map<String, String> headers = new HashMap<>();
        headers.put("Authorization", "Bearer " + token);
        headers.put("accept", "application/json");
        headers.put("Content-Type", "application/json");

        HttpResponse<JsonNode> response = Unirest.post(url)
            .headers(headers)
            .body(emp)
            .asJson();

        System.out.println("Státusz: " + response.getStatus());
        System.out.println("Válasz: " + 
        response
            .getBody()
            .toPrettyString());
    }
}
```

## Hibakezelés

### A HTTP válaszkódok kezelése

_App.java_:

```java
import kong.unirest.HttpResponse;
import kong.unirest.Unirest;

public class App {
  public static void main(String[] args) throws Exception {
    String url = "http://localhost:8000/api/employees";
    HttpResponse<String> response = Unirest.get(url).asString();
    if(response.getStatus() == 200) {
      System.out.println("Siker!");
    }else {
      System.out.println("Hiba!");
    }
  }
}
```

```java
int statusCode = response.getStatus();

switch (statusCode) {
    case 200:
        System.out.println("Sikeres válasz: " + 
        response.getBody());
        break;
    case 404:
        System.out.println("Hiba: Az erőforrás nem található.");
        break;
    case 500:
        System.out.println("Hiba: Szerverhiba lépett fel.");
        break;
    default:
        System.out.println("Hiba: Ismeretlen válasz (" 
        + statusCode + ").");
}
```

### Kivételek kezelése

```java
try {
    // JSON válasz deszerializálása User objektummá
    User user = gson.fromJson(response.getBody().toString(), User.class);
    System.out.println(user);
} catch (JsonSyntaxException e) {
    System.err.println("Hiba! A JSON feldolgozása sikertelen");
    System.err.println(e.getMessage());
}
```

## Tesztelés

### Egységtesztek írása Unirest és Gson használatával

tests/EmployeeApiTest.java:

```java
import org.testng.Assert;
import org.testng.annotations.BeforeSuite;
import org.testng.annotations.Test;
import java.util.ArrayList;

public class EmployeeApiTest {
  
  EmployeeApi api;

  @BeforeSuite
  public void setup() {
    api = new EmployeeApi();
  }
  @Test
  public void testGetEmployees() {
    ArrayList<Employee> list = api.getEmployees();
    Assert.assertNotNull(list);
  }
}
```

## Források

* [https://kong.github.io/unirest-java/](https://kong.github.io/unirest-java/)
* [https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)

Példa GitHubon:

* [https://github.com/oktat/java_unirest.git](https://github.com/oktat/java_unirest.git)
