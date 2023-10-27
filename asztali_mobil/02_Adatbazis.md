# Adatbázis-elérés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Adatbázis létrehozása

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

SQLite forráskódja:

Sqlite.java:

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
