# Asztali alkalmazások fejlesztése - Objektumorientált fejlesztés

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Osztályok IDE segítségével

## Scope

## Példányosítás

```java
Random random = new Random();
Employee employee = new Emplyoee();
```

## Konstruktorok

```java
class Employee {
    String name;
    public Employee() {
        this.name = "Névtelen";
    }
}
```

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
