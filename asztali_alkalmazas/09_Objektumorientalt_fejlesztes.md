# Asztali alkalmazások fejlesztése - Objektumorientált fejlesztés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Osztályok IDE segítségével](#osztályok-ide-segítségével)
* [Scope](#scope)
* [Példányosítás](#példányosítás)
* [Konstruktorok](#konstruktorok)
* [Öröklés](#öröklés)
* [Beállító lekérdező metódusok](#beállító-lekérdező-metódusok)
* [Osztály tömbben](#osztály-tömbben)
* [Osztály listában](#osztály-listában)

## Osztályok IDE segítségével

Visual Studio Code-ban az osztályokat az oldalsáv JAVA PROJECTS nézetén érdemes létrehozni. Ha nem látszik a nézet, nyissuk meg az egyik .java kiterjesztésű fájlt, például az App.java. Az oldalsávon megjelenik JAVA PROJECTS nézet.

![Java projects nézet](images/ide/vscode_java_projects.png)

A csomagokat (könyvtárakat) fent az app01 (a projekt neve) nézetben hozzuk létre. Például views csomag.

![views csomag létrehozása](images/ide/vscode_views_package.png)

A csomag lent a JAVA PROJECTS nézetben is megjelenik.

A nézetben vigyük az egeret arra csomagnévre (könyvtárnév) ahol szeretnénk létrehozni az osztályt. A csomagnévtől jobbra megjelenik egy "+" jel ikon.

![Új osztály](images/ide/vscode_new_class.png)

A kattintás hatására megnyílik egy bevitelimező, ahol beírhatjuk az osztály, interface, enum, abstract osztály vagy annotáció nevét.

![Név beírása](images/ide/vscode_input_class_name.png)

A név megadása után ki kell választanunk mit szeretnénk:

* osztály
* interface
* enum
* abstract
* @interface (annotáció)

![Fájltípus választása](images/ide/vscode_select_type.png)

Választhatunk a le és fel billentyűkkel. A választást Enter lenyomásával véglegesítjük.

## Scope

A változókat létrehozhatjuk osztályon belül mezőként (adattag, jellemző), vagy létrehozhatjuk valamelyik metóduson belül. A metóduson belül létrehozott változó csak az adott metódusban érhető el. Az osztály mezőjeként létrehozott változó, azonban minden metódusban elérhető.

```java
class Valami {
    String mezo1;
    public void metodus1(String valtozo1) {
        String valtozo2;
    }
}
```

## Példányosítás

A példányosítás, angolul instance creation, az objektum-orientált programozás (OOP) egyik alapvető fogalma. A példányosítás során egy osztály alaján létrehozunk egy objektumot.

A példányosítás során egy memórirészt foglalunk le az új objektum számára. A Java nyelvben a példányosítás a **new** operátorral történik.

```java
String gyumolcs = new String("alma");
Random random = new Random();
Employee employee = new Emplyoee();
```

## Konstruktorok

A Java nyelvben a konstruktorok neve megyegyezik az osztály nevével és sosincs visszatérési értékük. A következő példában van egy Employee osztályunk, amiben találunk egy konstruktort Employee néven. Vegyük észre a public és az Employee szavak között nincs visszatérési érték.

```java
class Employee {
    String name;
    public Employee() {
        this.name = "Névtelen";
    }
}
```

A konstruktorok az osztály mezőinek előkészítésére használhatók. A konstruktorok fogadhatnak paramétert, mint a következő példában is:

```java
class Employee {
    String name;
    public Employee(String name) {
        this.name = name;
    }
}

//...

Employee employee = new Employee("Pele Ferenc");
```

Többalakú konstruktor:

```java
class Employee {
    String name;
    public Employee() {
        this.name = "Névtelen";
    }
    public Employee(String name) {
        this.name = name;
    }
}

//...

//Hívható így:
Emplyoee employee = new Emplyoee();

//Így is hívható:
Emplyoee employee = new Emplyoee("Tenge Albert");
```

## Öröklés

Az öröklés segítségével a már elkészült osztályokat újrafelhasználhatjuk és bővíthetjük. A következő példában készítünk egy Employee osztályt, aminek két adattagja van, a **name** és a **city**. Ha most szükségünk van egy Engineer osztályra, amiben szintén van name és city adattag, nem kell újra felvenem ezeket a mezőket, egyszerűen átörökítem azokat az extends utasítással:

```java
class Employee {
    String name;
    String city;
}

class Engineer extends Emplyee {
    String diploma;
}
```

A metódusok szintén öröklödnek.

Employee.java

```java
package models;

public class Employee {
    public String name;
    public String city;
    public Employee() {
        this.name = "Névtelen";
        this.city = "ismeretlen";
    }
    public void pihen() {
        System.out.println("prrrr");
    }
    public void lapatol() {
        System.out.println("pram, param");
    }    
}
```

Engineer.java

```java
package models;

public class Engineer extends Employee {
    public String diploma;
    public Engineer() {
        diploma = "AB-284382";
    }    
}
```

App.java

```java
import models.Engineer;

public class App {
    public static void main(String[] args) throws Exception {
        
        Engineer engineer = new Engineer();
        System.out.println(engineer.name);
        engineer.pihen();
    }
}
```

A kimenet:

```cmd
Névtelen
prrrr
```

## Beállító lekérdező metódusok

Az osztályok adattagjait nem szokás nyilvánossá tenni. Helyette beállító lekérdező metódusokat használunk:

```java
public class Employee {
    private String name;
    private String city;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getCity() {
        return city;
    }
    public void setCity(String city) {
        this.city = city;
    }
    
}
```

## Osztály tömbben

Tömbökben tárolhatunk osztállyal megadott típust is.

```java
Dolgozo[] dolgozok = new Dolgozo[5];
Dolgozo dolgozo = new Dolgozo("Park Béla", "Pécs", 345);
dolgozok[0] = dolgozo;
```

## Osztály listában

A legkényelmesebb használatot az osztályok listában való használata jelenti.

```java
ArrayList<Dolgozo> dolgozoLista = new ArrayList<>();
Dolgozo dolgozo = new Dolgozo("Park Béla", "Pécs", 345);
dolgozoLista.add(dolgozo);
System.out.println(dolgozoLista.get(0).name);
```
