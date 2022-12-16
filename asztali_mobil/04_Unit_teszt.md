# Unit tesztek

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A tesztelés szintjei

* komponensteszt
* integrációs teszt
* rendszerteszt
* átvételi teszt

## JUnit teszt

A JUnit egy egységtesztelő rendszer, amit programozói könyvtárak formájában érhetün el.

## Beszerzés

Látogassuk meg a weboldalt:

* [https://junit.org/junit5/](https://junit.org/junit5/)

A weblapon a Latest Release alatt van három link, gomb alakban:

* Jupiter
* Vitage
* Platform

Két .jar fájlra van szükségünk, egyik a Jupiter gyűjteményből, a másik a Platformokból.

### Jupiter

Keressük meg az Artifact ID oszlopban a következőt:

* junit-jupiter-api

Ebben a sorban, a Download oszlopban lévő nyílra kattintunk. Egy újabb ablakban több lehetőség jelenik meg. Válasszuk felül a "jar" lehetőséget.

Letöltődik egy junit-jupiter.api-x.y.z.jar fájl. Az x.y.z helyén az aktuális verziószámmal.

### Platform

Az Artifact ID oszlopban keressük meg a junit-platform-console-standalone sort. Ebben a sorban menjünk a Download osztlopban taláható nyílra. Kattintsunk rá, majd az előugró ablakban válasszuk a "jar" lehetőséget. Egy ehhez hasonló fájl tőltödik le:

junit-platform-console-standalone-x.y.z.jar

## Visual Studio Code bővítmény

* Test Runner for Java

## Projekt készítés

Készítsünk egy Java projektet, No build tools lehetőséggel.

A .vscode/settings.json fájlban vegyük fel a test könyvtárat:

```json
{
    "java.project.sourcePaths": ["src", "test"],
    "java.project.outputPath": "bin"
}
```

## A JUnit hozzáadása

Az oldalsávon a JAVA PROJECTS lehetőségnél válasszuk a következőt:

* Referenced Libraries

Vigyük a egeret a felirat felé, megjelenik a "+" ikon, kattintsunk. Tallózzuk ki a két .jar fájlt.

Ellenőrzés:

A .vscode/settins.json fájlban meg kell jelenjen a két projekthez adott fájl.

## Teszt osztály

A test könyvtárban hozzunk létre egy tesztosztályt.

```java
class ValamiTest {

}
```

Indítsuk újra a Visual Studo Code-t.

## Triangle tesztelése

```java
import static org.junit.jupiter.api.Assertions.assertEquals;
 
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
 
public class TriangleTest {
    Triangle triangle;
    @BeforeEach
    public void initEach() {
        triangle = new Triangle();
    }
    @Test
    void testCalcArea() {
        assertEquals(525, triangle.calcArea(30, 35));
    }
}
```

* [https://szit.hu/doku.php?id=oktatas:programozas:java:java_teszteles:junit5#a_junit](https://szit.hu/doku.php?id=oktatas:programozas:java:java_teszteles:junit5#a_junit)
