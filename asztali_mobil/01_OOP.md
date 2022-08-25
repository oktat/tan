# Haladó Objektum Orientál Programozás

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Interfész

Az interfészek metódusok és állandók egy halmazát adják meg. Az osztályok ha impelmentálnak egy ilyen interfészt, a benne található metódusokat kötelesek
megvalósítani.

Legyen például egy Jarmu interfész, amiben előírjuk milyen viselkedéseket kell egy járműnek megvalósítani adott programban.

```java
interface Jarmu {
    public void halad();
}
```

Írjunk programot, ami megvalósítja az Jarmu nevű iterfészt.

```
app01/
  |-bin/
  |-lib/
  |-src/
  |  |-App.java
  |  |-Jarmu.java
  |  `-Szemelygepkocsi.java
  `-README.md
```

A program állományai:

Jarmu.java fájl:

```java
public interface Jarmu {
    public void halad();
}

```

App.java
```java
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Interfész");

        Szemelygepkocsi lada1 = new Szemelygepkocsi();
        lada1.halad();
    }
}
```

Szemelygepkocsi.java fájl:

```java
public class Szemelygepkocsi implements Jarmu {
    public void halad() {
        System.out.println("x");
    }
}
```

## Interfésszel több lehetőség

Egy programot szeretnénk írni, ahol embereket szimulálunk. Minden ember más-más nyelvet beszélhet.
A példány létrehozása helyén dől el, milyen nyelvet fog beszélni.

A projekt szerkezete:

```txt
app01/
  |-bin/
  |-lib/
  |-src/
  |  |-Angol.java
  |  |-App.java
  |  |-Beszed.java
  |  |-Ember.java
  |  `-Magyar.java
  `-README.md
```

Angol.java fájl:

```java
public class Angol implements Beszed {
    public void beszel() {
        System.out.println("yes");
    }
}
```

App.java fájl:

```java
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Interfész");

        Ember dani = new Ember(new Angol());
        dani.beszed.beszel();
        Ember jani = new Ember(new Magyar());
        jani.beszed.beszel();
    }
}
```

Beszed.java fájl:

```java
public interface Beszed {
    public void beszel();
}
```

Ember.java fájl:

```java
public class Ember {
    Beszed beszed;
    public Ember(Beszed beszed) {
        this.beszed = beszed;
    }
}
```

Magyar.java fájl:

```java
public class Magyar implements Beszed {
    public void beszel() {
        System.out.println("igen");
    }
}
```
