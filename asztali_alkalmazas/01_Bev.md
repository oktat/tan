# Asztali alkalmazások fejlesztése - Bevezetés

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A Java története

A Java nyelvet a Sun Microsystem programozói kezdték fejleszteni 1991-ben, fordítóval, futtató keretrendszerrel. Később az Oracle felvásárolta a céget, így a Java eszközök fejlesztője a jelenleg az Oracle.

* Sun Microsystem
* Oracle

A Java az 1-s főverziónál tart. Amikor azt mondjuk 17 Java, akkor valójában a 1.17-ről van szó. Az főverziót a 1-t elszokás hagyni.

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

A Java keretrendszer, kétféle technológiával jelenik meg:

* Java SE
* Java EE

A Java Standard Edition és a Java Enterprise Edition. A Standard Edition egyszerűbb alkalmazások fejlesztésére használható, amíg az Enterprise Edition megkönnyíti az összetettebb alkalmazások írását.

A két technolóigából is kétféle kiadás létezik:

* Java JRE - csak futtatásra alkalmas
* Java JDK - fejlesztés és futtatásra alkalmas

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
