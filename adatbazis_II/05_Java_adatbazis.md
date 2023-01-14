# Adatbázis-kezelés II - Java adatbázis-kezelés

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## MariaDB driver

A MariaDB a MySQL egy elágazásából született. Vannak, akik úgy tudják MySQL-t használnak, de a háttérben MariaDB fut. A MariaDB gyakran használt megoldás webhelyek vagy asztali alkalmazások adattárolójaként.

Java esetén a kapcsolódáshoz szükség van a MariaDB Connector/J programozói könyvtárra.

* [https://mariadb.com/kb/en/about-mariadb-connector-j/](https://mariadb.com/kb/en/about-mariadb-connector-j/)

Egy mariadb-java-client-x.y.z.jar fájlt kapunk, az x, y és z helyén a megfelelő verziószámokat értjük. A letöltött fájl 3.1.1 esetén 621.93 KB.

Visual Studio Code esetén a Java projekt lib könyvtárba helyezhetjük vagy a "JAVA PROJECTS" nézetben felvehetjük függőségként.

## Kapcsolat

### Csomagok

A kapcsolódáshoz használjuk a következő osztályokat és kivételt:

* SQLException - hibakezelő kivétel
* Connection - a kapcsolatott ilyen objektumban tartjuk
* Statement - az SQL futtatáshoz szükséges objektum létrehozása
* PreparedStatement - adatok beszúrásához "prepared" utasítás
* ResultSet - lekérdezéskor az eredményt ilyen objektumban kapjuk
* DriverManager - kapcsolódáshoz használt osztály

Minden osztály a java.sql csomagban található. Példa:

```java
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;

//...
```

### Kaplcsolódás Java nyelven

Kapcsolódás az adatbázishoz:

```java
String url = "jdbc:mariadb://localhost:3306/adatbazisnev";
Connection con = DriverManager.getConnection(url, "surubt", "titok");
```

## Hibakezelés

```java
try {
    //Ide jön az kapcsolódás és majd a lekérdezések is
}catch(SQLException ex) {
    System.err.println("Hiba! Az SQL művelet sikertelen");
}
```

Kiegészíthetjük lezárórésszel:

```java
try {
    //kapcsolódás és lekérdezések
}catch(SQLException ex) {
    System.err.println("Hiba! Az SQL művelet sikertelen!");
    System.err.println(ex.getMessage());
}finally {
    try {
        conn.close();
    }catch(SQLException ex) {
        System.err.println("Hiba! A bezárás sikertelen!");
    }
}
```

## Lekérdezések

Lekérdezés:

```java
String sql = "select az, nev, telepules, fizetes from dolgozok";
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery(sql);
List<Dolgozo> dolgozok = new ArrayList<>();
while(rs.next()) {            
    Dolgozo dolgozo = new Dolgozo();
    dolgozo.az = rs.getInt("az");
    dolgozo.nev = rs.getString("nev");
    dolgozo.fizetes = rs.getDouble("fizetes");            
    dolgozok.add(dolgozo);
}
```

Beszúrás

```java
String sql2 = "insert into dolgozok" +
    " (nev, telepules, szuletes) values" +
    " (?, ?, ?)";        
PreparedStatement pstmt = conn.prepareStatement(sql2);
pstmt.setString(1, "Termet Laura");
pstmt.setString(2, "Szeged");
pstmt.setDate(3, java.sql.Date.valueOf("1998-01-20"));
pstmt.execute();
```

## Adatok megjelenítése

Az előző részben a ResultSet tartalmát egy listába tettük, ami Dolgozok osztály objektumokat tartalmaz. A bejárás így egy foreach szerkezettel lehetséges:

```java
for(Dolgozo dolgozo: dolgozok) {
    System.out.println(dolgozo.nev);
} 
```

## A komplett példa

```java
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.util.List;
import java.util.ArrayList;
 
class Dolgozo {
    int az;
    String nev;
    String telepules;    
    double fizetes;
}
 
class Program01 {
    public static void main(String[] args) {
 
        Connection conn = null;
        try {
            String url = "jdbc:mariadb://localhost:3306/surubt";
            conn = DriverManager.getConnection(url, 
            "surubt", "titok");
 
            String sql = "select az, nev, telepules, fizetes from dolgozok";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            List<Dolgozo> dolgozok = new ArrayList<>();
            while(rs.next()) {            
                Dolgozo dolgozo = new Dolgozo();
                dolgozo.az = rs.getInt("az");
                dolgozo.nev = rs.getString("nev");
                dolgozo.fizetes = rs.getDouble("fizetes");            
                dolgozok.add(dolgozo);
            }
            for(Dolgozo dolgozo: dolgozok) {
                System.out.println(dolgozo.nev);
            }        
            String sql2 = "insert into dolgozok" +
                " (nev, telepules, szuletes) values" +
                " (?, ?, ?)";        
            PreparedStatement pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, "Termet Laura");
            pstmt.setString(2, "Szeged");
            pstmt.setDate(3, java.sql.Date.valueOf("1998-01-20"));
            pstmt.execute();
 
 
        }catch(SQLException ex) {
            System.err.println("Hiba! Az SQL művelet sikertelen!");
            System.out.println(ex.getMessage());
        }finally {
            try {
                conn.close();
            }catch(SQLException ex) {
                System.err.println("Hiba! A bezárás sikertelen!");
            }
 
        }
 
    }
}
```
