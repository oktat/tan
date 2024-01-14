# Adatbázis-kezelés I - Java adatbáziselérés

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Adatbázisok

* Mariadb (MySQL)
* SQLite

## Mariadb

### Mariadb telepítése

#### Önálló telepítés

Ha van Chocolatey csomagtelepítő.

```cmd
choco install mariadb
```

#### XAMPP

Windowson az XAMMP-t használjuk Mariadb beszerzéséhez.

Ha van Chocolatey csomagtelepítő.

```cmd
choco install xampp-81
```

#### Docker Compose

Készíts egy docker-compose.yml fájlt a következő tartalommal:

```cmd
version: '3.8'

services:
  mariadb01:
    image: mariadb
    container_name: mariadb01
    environment:
      - MARIADB_ROOT_PASSWORD=titok
    ports:
      - 3307:3306
    volumes:
      - ./valami:/var/lib/mysql
```

Parancssorban indítás:

```cmd
docker-compose up
```

### Java illesztő program

* [https://mariadb.com/kb/en/about-mariadb-connector-j/](https://mariadb.com/kb/en/about-mariadb-connector-j/)

```xml
        <dependency>
            <groupId>org.mariadb.jdbc</groupId>
            <artifactId>mariadb-java-client</artifactId>
            <version>2.7.1</version>
        </dependency>
```

### Kapcsolódás Java nyelven Mariadb-hez

Legyen egy adatbázis:

```sql
create database zoldzrt
character set utf8
collate utf8_hungarian_ci;
 
grant all privileges 
on zoldzrt.*
to zoldzrt@localhost
identified by 'titok';
 
use zoldzrt;
 
create table employees (
    id int not null primary key auto_increment,
    name varchar(50),
    city varchar(50),
    salary double,
    birth date
);
```

Kapcslódás:

```java
import java.sql.Connection;
import java.sql.DriverManager;

public class App {
    public static void main(String[] args) throws Exception {
        Connection conn = null;
        try {
            String url = "jdbc:mariadb://localhost:3306/zoldzrt";
            conn = DriverManager.getConnection(url, "zoldzrt", "titok");
            System.out.println("Kapcsolat OK");
        } catch (Exception e) {
            System.err.println("Hiba! Az adatbázishoz kapcsolódás sikertelen!");
            System.err.println(e.getMessage());
        }
    }
}
```

Modell készítése

```java
import java.time.LocalDate;
 
public class Employee {
    Integer id;
    String name;
    String city;    
    double salary;
    LocalDate birth;
    public Employee(
            Integer id, 
            String name, 
            String city, 
            double salary, 
            LocalDate birth) {
        this.id = id;
        this.name = name;
        this.city = city;
        this.salary = salary;
        this.birth = birth;
    }
    public Employee(
            String name, 
            String city, 
            double salary, 
            LocalDate birth) {
        this.name = name;
        this.city = city;
        this.salary = salary;
        this.birth = birth;
    }
 
}
```

Dolgozó beszúrása:

```java
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.time.LocalDate;
 
class App {
    public static void insertEmployee(Employee employee) {
        Connection conn = null;
        try {
            String url = "jdbc:mariadb://localhost:3306/surubt";
            conn = DriverManager.getConnection(url, 
            "surubt", "titok");
 
            String sql = "insert into employees" +
                " (name, city, salary, birth) values" +
                " (?, ?, ?, ?)";        
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, employee.name);
            pstmt.setString(2, employee.city);
            pstmt.setDouble(3, employee.salary);
            pstmt.setDate(4, java.sql.Date.valueOf(employee.birth));
            pstmt.execute();
 
 
        }catch(SQLException ex) {
            System.err.println("Hiba! Az SQL művelet sikertelen!");
            System.err.println(ex.getMessage());
        }
    }
 
    public static void main(String[] args) {
        Employee emp = new Employee(
            1, 
            "Erős István", 
            "Szeged", 
            345, 
            LocalDate.parse("2001-07-15")
            );
        insertEmployee(emp);
    }
}
```

Lekérdezés:

```java
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.util.ArrayList;
 
class App {
    public static ArrayList<Employee> getEmployees() {
        ArrayList<Employee> employeeList = new ArrayList<>();
        Connection conn = null;
        try {
            String url = "jdbc:mariadb://localhost:3306/surubt";
            conn = DriverManager.getConnection(url, 
            "surubt", "titok");
 
            String sql = "select * from employees";        
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while(rs.next()) {
                Employee emp = new Employee(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("city"),
                    rs.getDouble("salary"),
                    rs.getDate("birth").toLocalDate()
                    );
                employeeList.add(emp);
            }
        }catch(SQLException ex) {
            System.err.println("Hiba! Az SQL művelet sikertelen!");
            System.err.println(ex.getMessage());
        }
        return employeeList;
    }
 
    public static void main(String[] args) {
        ArrayList<Employee> employeeList;
        employeeList = getEmployees();
        employeeList.forEach(emp -> {
            System.out.println(emp.name);
        });
    }
}
```

## SQLite

```cmd
choco install sqlite.shell
```

```cmd
.tables
create table szemelyek(az int, nev varchar(50));
.tables
```
