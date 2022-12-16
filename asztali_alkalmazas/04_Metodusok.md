# Asztali alkalmazások fejlesztése - Metódusok

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A metódusokról

Az osztályok tartalmazhatnak adattagokat és metódusokat. A metódusok írják le egy osztály viselkedését.

A metódusok létrehozásával egy utasításnak újabb nevet adhatok, vagy összefognak vele több utasítást, amit egyetlen néven futtatok.

## Statikus metódusok

Az osztály céljától függően a metódusaik lehetnek statikus és példánymetódusok. Az osztályok a világunkat reprezentálják. Ha egy osztály olyan dolgot reprezentál, amiből csak egy van, akkor statikus metódusokat szoktunk létrehozni.

```java
class App {
    public static String getAuthor() { 
        return "Nagy János"; 
    }
    public static void main(String[] args) {
        System.out.println(App.getAuthor());
    }
}
```

```java
class ExtraMath {
    public static final double PI = 3.14;
    public static double pow(double base, double exponent) {
        double result = 1;
        if (exponent == 0);
        if (exponent == 1) result = base;        
        if (exponent > 1) {
            for(int i=0; i<exponent; i++) {
                result *= base;
            }
        }
        return result;
    }
}
public class App {
    public static void main(String[] args) {
        System.out.println(ExtraMath.PI);
        System.out.println(ExtraMath.pow(2,8));
    }
}
```

```java
class Earth {
    public static double getRadius() {
        return  6371; //km
    }
    public static String getShape() {
        return "ellipszoid";
    };
}
class App {
    public static void main(String[] args) {
        System.out.println(Earth.getRadius());
        System.out.println(Earth.getShape());
    }
}
```

## Példánymetódusok

```java
class Employee {
    String name;
    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
class App {
    public static void main(String[] args) {
        Employee emp = new Employee();
        emp.setName("Béla")
        System.out.println(emp.getName());
    }
}

```

## Paraméterátadás

## Visszatérésiérték
