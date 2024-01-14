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
on surubt.*
to surubt@localhost
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

Kapcslódás:

```java

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
