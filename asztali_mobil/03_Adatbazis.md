# Adatbázis-elérés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Bevezetés](#bevezetés)
* [Adatbázis elérése](#adatbázis-elérése)
* [Adatbázis létrehozása](#adatbázis-létrehozása)
* [Lekérdezés adatbázisból](#lekérdezés-adatbázisból)
* [Beszúrás adatbázisba](#beszúrás-adatbázisba)
* [Modell osztály](#modell-osztály)
* [Példa](#példa)

## Bevezetés

A tartós tárolás biztosítására többféle megoldás is van, például a fájlba írhatjuk az adatokat. Nagy mennyiségű adatok strukturált tárolására és kapcsolatok kezelésére legmegfelelőbb a relációs adatbázis. Olyan adatbázis rendszereket szokás használni mint:

* MariaDB (MySQL)
* PostgreSQL
* Oracle Database

A relációs adatbázisok megfelelő struktúrát biztosítanak az adatok tárolására, lekérdezésére, felhasználókezelésre, tranzakciókra.

A Java alkalmazások és az adatbázisok között a kapcsolatot (hidat) a JDBC API szolgáltatja. A JDBC a Java platform része. Szabványos osztályokat és interfészeket biztosít az adatbázissal való kommunikációhoz. Például:

* Connection
* Statement
* PreparedStatement
* ResultSet

A JDBC segítségével ugyanazt a kódot használhatjuk különböző adatbázisrendszerekhez.

A tényleges adatbázis-specifikus kommunikációt a JDBC illesztő program (driver) végzi. Mivel minden adatbázisrendszerhez más illesztő program szükséges, ezek nem részei a Java platformnak.

## Adatbázis elérése

### Kezdeti adatbázis

Kétféle adatbázist fogunk használni: SQLite és MariaDB. Hozzuk létre ezeket az adatbázisokat.

Adatbázis és felhasználó létrehozása MariaDB-ben:

_database/mariadb_database.sql_:

```sql
create database test01;

grant all privileges
on test01.*
to test01@localhost
identified by 'titok';
```

Futtassuk az adatbázisrendszeren, MariaDB esetén használhatjuk a PhpMyAdmin-t. Ha el van indítva az adatbázis és az Apache webszerever (például: XAMPP rendszeren), a PhpMyAdmin elérése:

* `http://localhost/phpmyadmin/`

### Projekt létrehozása

Készítsünk egy Java projektet, például **dbcon** néven. Ajánlott projekt típus például **Maven**.

VSCode esetén:

* F1 > Java: Create Java Project
* Maven > No archetype
* com.example
* dbcon

### Illesztőprogram beszerzése

A JDBC driver beszerzéséhez látogassuk meg a következő webhelyet:

* [https://central.sonatype.com/](https://central.sonatype.com/)

A keresőbe írjuk be:

* **mariadb-java-client**

Ellenőrizzük, hogy a megtalált csomag a **org.mariadb.jdbc** szervezethez tartozzon. Ha kattintunk a **mariadb-java-client** találatra, az áttekintő fülön találunk egy XML bejegyzést:

```xml
<dependency>
    <groupId>org.mariadb.jdbc</groupId>
    <artifactId>mariadb-java-client</artifactId>
    <version>3.5.6</version>
</dependency>
```

Ezt másoljuk a projekt **pom.xml** állományába.

Ha nincs benne <dependencies> bejegyzés vegyük fel, és másoljuk ebbe az illesztő program adatatit.

```xml
<dependencies>
    <dependency>
        <groupId>org.mariadb.jdbc</groupId>
        <artifactId>mariadb-java-client</artifactId>
        <version>3.5.6</version>
    </dependency>
</dependencies>
```

A teljes kód így nézhet ki:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>

    <groupId>com.example</groupId>
    <artifactId>dbcon</artifactId>
    <version>1.0-SNAPSHOT</version>

    <properties>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
    </properties>

    <dependencies>
        <dependency>
            <groupId>org.mariadb.jdbc</groupId>
            <artifactId>mariadb-java-client</artifactId>
            <version>3.5.6</version>
        </dependency>        
    </dependencies>

</project>
```

### Az osztály elkészítése

Ezt követően írjunk egy **Database** nevű osztályt, ami kapcsolódik a MariaDB adatbázishoz. Három osztályra lesz szükségünk:

* Connection
* DriverManager
* SQLException

A szöveges változóban feljegyzünk egy URL-t, amiben leírjuk az adatbáziskapcsolatot. A kapcsolatot egy **conn** nevű objektumban fogjuk tárolni. A kapcsolatot a **DriverManager.getConnection** metódussal építjük ki. A kapcsolatot egy try..catch szerkezetbe ágyazzuk, így reagálhatunk a kapcsolódás során fellépő hibákra.

Database.java:

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
  public void solution() {    
    String url = "jdbc:mariadb://localhost:3306/test01";
    Connection conn = null;
    try {
      conn = DriverManager.getConnection(url, "test01", "titok");  
      System.out.println("OK");  
      conn.close();
    }catch (SQLException e) {
      System.err.println("Hiba! A kapcsolódás sikertelen!");
      System.err.println(e.getMessage());
    }

  }
}
```

A példánkban az **OK** szöveg csakk sikeres kapcsolódás során íródik ki a konzolra.

## Adatbázis létrehozása

Az adatbázist kiegészítjük táblákkal. Dolgozók adatait fogjuk tárolni. Az adatbázis létrehozása táblákkal:

_database/mariadb_create.sql_:

```sql
create database surubt
collate utf8_hungarian_ci
character set utf8;

grant all privileges
on surubt.*
to surubt@localhost
identified by 'titok';

use surubt;

-- A dolgozók táblája
create table employees(
    id int not null primary key auto_increment,
    name varchar(50),
    city varchar(50),
    salary double
);
```

SQLite adatbázisban is használunk, ezért lássuk az SQLite adatbázisban hogyan hozzuk létre a táblát:

_database/sqlite_create.sql_:

```sql
create table employees (
    id integer not null primary key autoincrement,
    name text,
    city text,
    salary real
);
```

Mindkét adatbázisba beszúrhatunk dolgozókat, a következő utasítással:

_database/insert.sql_:

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

## Lekérdezés adatbázisból

Ha már vannak adatok az adatbázisban, nézzünk egy lekérdezést. Kezdetnek a lekérdezést a **Database** osztályban fogjuk elvégezni. A lekérdezéshez szükség lesz a **conn** objektumra, a **Statement** osztályra, a **ResultSet**-re.

_Database.java_:

```java
package lan.zold;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Database {
  public void solution() {    
    String url = "jdbc:mariadb://localhost:3306/surubt";
    Connection conn = null;
    try {
      conn = DriverManager.getConnection(url, "surubt", "titok");  
      System.out.println("OK");

      Statement statement = conn.createStatement();
      String sql = "select * from employees";
      ResultSet rs = statement.executeQuery(sql);
      while(rs.next()) {
        String name = rs.getString("name");
        System.out.println(name);
      }
      conn.close();
    }catch (SQLException e) {
     System.err.println("Hiba! A kapcsolódás sikertelen!");
     System.err.println(e.getMessage());
    }
  }
}
```

A lekérdezés eredményeként a dolgozói nevei a képernyőre íródnak.

## Beszúrás adatbázisba

Az adatoka eddig egy SQL utasítással vittük be az adatbázisba. Nézzük meg, hogyan tudjuk ezt programozottan megtenni.

_Database.java_:

```java
package lan.zold;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Database {
  public void solution() {    
    String url = "jdbc:mariadb://localhost:3306/surubt";
    Connection conn = null;
    try {
      conn = DriverManager.getConnection(url, "surubt", "titok");  
      System.out.println("OK");
      PreparedStatement ps = conn.prepareStatement("""
          insert into employees 
          (name, city, salary) 
          values (?, ?, ?)    
        """
      );
      ps.setString(1, "Csonka Ernő");
      ps.setString(2, "Miskolc");
      ps.setDouble(3, 392.0);
      ps.executeUpdate();      
      
      conn.close();
    }catch (SQLException e) {
     System.err.println("Hiba! A kapcsolódás sikertelen!");
     System.err.println(e.getMessage());
    }
  }
}
```

## Modell osztály

A további munkához modelleket fogunk használni.

Adatok tárolásához hozzuk létre az Employee osztályt.

_src/Employee.java_:

```java
public class Employee {
    int id;
    String name;
    String city;
    double salary;
    
    public Employee(int id, String name, String city, double salary) {
        this.id = id;
        this.name = name;
        this.city = city;
        this.salary = salary;
    }
    public Employee(String name, String city, double salary) {
        this.name = name;
        this.city = city;
        this.salary = salary;
    }
    public Employee() {
    }    
}
```

Hozzunk létre egy interfészt, ami megmondja mit kell tudni adatbázishoz kapcsolódás esetén.

_src/iDatabase.java_:

```java
import java.sql.Connection;
 
public interface iDatabase {
    public Connection connectDb();
    public void closeDb(Connection conn);
}
```

Egyéb lehetséges interfész nevek:

* DatabaseConnector
* ConnectionProvider
* ConnectionManager
* DatabaseConnectionManager

MariaDB kapcsolathoz, hozzunk létre egy Mariadb osztályt.

_src/Mariadb.java_:

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class Mariadb implements iDatabase {
 
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
    private Connection tryConnectDb() throws SQLException {
        String url = "jdbc:mariadb://localhost:3306/surubt";
        return DriverManager.getConnection(url, 
                "surubt", "titok");
    }    

    public void closeDb(Connection conn){        
        try {
            tryCloseDb(conn);
        }catch(SQLException e) {
            System.err.println("Hiba! A kapcsolat zárása sikertelen!");
            System.err.println(e.getMessage());
        }
    }
    private void tryCloseDb(Connection conn) throws SQLException {
        conn.close();
    }
    
}
```

SQLite adatbázis eléréshez hozzunk létre egy Sqlite osztályt:

_src/Sqlite.java_:

```java
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 
public class Sqlite implements iDatabase {

    public Connection connectDb() {
        Connection conn = null;
        try {
            conn = tryConnectDb();
        }catch(SQLException e) {
            System.err.println("Hiba! A kapcsolódás sikertelen!");
            System.out.println(e.getMessage());
        }
        return conn;
    }
    public Connection tryConnectDb() throws SQLException {
        String url = "jdbc:sqlite:database.sqlite";
        return DriverManager.getConnection(url);
    }

    public void closeDb(Connection conn) {
        try {
            tryCloseDb(conn);
        } catch (SQLException e) {
            System.err.println("Hiba! A bezárás sikertelen!");
            System.out.println(e.getMessage());
        }
    }
    public void tryCloseDb(Connection conn) throws SQLException {
        conn.close();
    }

}
```

A lekérdezéseket a DataSource osztályban fogjuk megvalósítani.

_src/DataSource.java_:

```java
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
 
public class DataSource {
    iDatabase database;
    
    public DataSource(iDatabase database) {
        this.database = database;
    }

    public List<Employee> getEmployees() {
        List<Employee> employeeList = new ArrayList<>();
        try {
            employeeList = tryGetEmployees();
        }catch(SQLException e) {
            System.err.println("Hiba! A lekérdezés sikertelen!");
            System.err.println(e.getMessage());
        }
        return employeeList;
    }
    private List<Employee> tryGetEmployees() throws SQLException {
        List<Employee> dolgozok = new ArrayList<>();
        String sql = "select id, name, city, salary from employees";
        Connection conn = database.connectDb();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        while(rs.next()) {
            Employee dolgozo = new Employee();
            dolgozo.id = rs.getInt("id");
            dolgozo.name = rs.getString("name");
            dolgozo.city = rs.getString("city");
            dolgozo.salary = rs.getDouble("salary");
            dolgozok.add(dolgozo);
        }
        database.closeDb(conn);
        return dolgozok;
    }

    public Employee getEmployee(int id) {
        Employee employee = new Employee();
        try {
            employee = tryGetEmployee(id);
        } catch (SQLException e) {
            System.err.println("Hiba! A dolgozó lekérdezése sikertelen!");
            System.err.println(e.getMessage());
        }
        return employee;
    }
    private Employee tryGetEmployee(int id) 
            throws SQLException {
        Employee employee = new Employee();
        Connection conn = database.connectDb();
        String sql = "select id, name, city, salary " +
            "from employees where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        ResultSet result = pstmt.executeQuery();
        result.next();
        employee.id = result.getInt("id");
        employee.name = result.getString("name");
        employee.city = result.getString("city");
        employee.salary = result.getDouble("salary");
        database.closeDb(conn);
        return employee;
    }

    public void insertEmployee(Employee employee) {
        try {
            tryInsertEmployee(employee);
        } catch (SQLException e) {
            System.err.println("Hiba! A beszúrás sikertelen!");
            System.err.println(e.getMessage());
        }
    }
    private void tryInsertEmployee(Employee employee)
            throws SQLException {
        Connection conn = database.connectDb();
        String sql = "insert into employees " +
                "(name, city, salary) values " +
                "(?, ?, ?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, employee.name);
        pstmt.setString(2, employee.city);
        pstmt.setDouble(3, employee.salary);
        pstmt.execute();
        database.closeDb(conn);
    }

    public void updateEmployee(Employee employee) {
        try {
            tryUpdateEmployee(employee);
        } catch (SQLException e) {
            System.err.println("Hiba! A módosítás sikertelen!");
            System.err.println(e.getMessage());
        }
    }
    private void tryUpdateEmployee(Employee employee) 
            throws SQLException {
        Connection conn = database.connectDb();
        String sql = "update employees set " +
            "name=?, " +
            "city=?, " +
            "salary=? " +
            "where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, employee.name);
        pstmt.setString(2, employee.city);
        pstmt.setDouble(3, employee.salary);
        pstmt.setInt(4, employee.id);
        pstmt.execute();

        database.closeDb(conn);
    }
    public void deleteEmployee(int id) {        
        try {
            tryDeleteEmployee(id);    
        } catch (SQLException e) {
            System.err.println("Hiba! A törlés sikertelen!");
            System.err.println(e.getMessage());
        }
    }
    private void tryDeleteEmployee(int id) 
            throws SQLException {
        Connection conn = database.connectDb();
        String sql = "delete from employees where id=?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, id);
        pstmt.execute();
        database.closeDb(conn);
    }
}
```

_src/App.java_:

```java
public class App {
    public static void main(String[] args) throws Exception {
        
        // DataSource data = new DataSource(new Sqlite());
        DataSource data = new DataSource(new Mariadb());

        // java.util.List<Employee> empList = data.getEmployees();        
        // for(Employee emp : empList) {
        //     System.out.println(emp.id + " " + emp.name);
        // }

        Employee employee = data.getEmployee(1);
        System.out.println(employee.id + " " + employee.name);

        // data.insertEmployee(new Employee("Park Elemér", "Szolnok", 397));
        // data.updateEmployee(new Employee(3, "Csőre Tibor", "Szombathely", 358));
        // data.deleteEmployee(4);
    }
}
```

## Példa

* [https://github.com/oktat/jemp_moredb](https://github.com/oktat/jemp_moredb)
