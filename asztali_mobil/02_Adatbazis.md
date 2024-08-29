# Adatbázis-elérés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Adatbázis létrehozása](#adatbázis-létrehozása)
* [Példa](#példa)

## Adatbázis létrehozása

Adatbázis létrehozása táblákkal:

database/mariadb_create.sql:

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

database/sqlite_create.sql:

```sql
create table employees (
    id integer not null primary key autoincrement,
    name text,
    city text,
    salary real
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

Adatok tárolásához hozzuk létre az Employee osztályt.

src/Employee.java:

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

src/iDatabase.java:

```java
import java.sql.Connection;
 
public interface iDatabase {
    public Connection connectDb();
    public void closeDb(Connection conn);
}
```

MariaDB kapcsolathoz, hozzunk létre egy Mariadb osztályt.

src/Mariadb.java:

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

src/Sqlite.java:

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

src/DataSource.java:

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

src/App.java:

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
