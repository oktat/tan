# Asztali alkalmazások fejlesztése - Bevezetés

* Bevezetés
* Sallai András
* 2022

## A Java története

* Sun Microsystem
* Oracle

Verziók:

* 1.1
* 1.2
* 1.3
* 1.4
* 1.5
* 1.6
* 1.7
* 1.8
* 1.9
* 1.10
* 1.11
* 1.12
* 1.13
* 1.14
* 1.15
* 1.16
* 1.17

Technológiák:

* Java SE
* Java EE

Kiadások:

* Java JRE - csak futtatás
* Java JDK - fejlesztés

Dokumentáció:

* [https://docs.oracle.com/](https://docs.oracle.com/) (2022)

## Helló Világ

Jegyzettömbben készítsünk egy App.java állományt:

```java
class App {
    public static void main(String[] args) {
        System.out.println("Helló Világ");
    }
}
```

A Java fájlok .java kiterjesztésű állományba kerülnek.
A Java nyelvben mindig osztályokkal dolgozunk.
A program főosztálya meg kell egyezzen a fájl nevével.

Fordítás parancssorból:

```bash
javac App.java
```

A dir paranccsal listázzuk az aktuális könyvtárat, nézzük meg
milyen állományt jött létre.

Futtatás:

```bash
java App
```
