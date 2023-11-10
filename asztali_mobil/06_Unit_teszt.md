# Unit tesztek

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A tesztelés szintjei

* komponensteszt
* integrációs teszt
* rendszerteszt
* átvételi teszt

## TestNG teszt

A TestNG a **JUnit** és az **NUnit** által **inspirált** tesztelő keretrendszer.

### Szükséges

Függőségek, vagyis szükséges programozói könyvtárak:

* jcommander-x.y.jar
* slf4j-api-x.y.z.jar
* testng-x.y.z.jar

**A 7.8.0-ás testng számára, 1.7.36-os slf4j-api szükséges.**

A programozói könyvtárak a következő helyről szerezhetők be:

* [https://central.sonatype.com/](https://central.sonatype.com/)  (2023)

Például keresőbe írjuk be: testng.
Uátan: testng > Versin > Browse > testng-7.8.0.jar

### Projekt készítése

Készítsünk egy Java projektet. No build tools választása ajánlott.

```txt
app01/
  |-lib/
  |-src/
  |  `-App.java
  `-README.md
```

### Az App.java megnyitása

Meg kell nyitni az App.java fájlt. Várjuk meg, amíg a Java bővítmények aktíválódnak.

### Teszt fájl létrehozása

```txt
app01/
  |-lib/
  |-src/
  |  `-App.java
  |-test/
  |  `-TestPelda.java
  `-README.md
```

### Testkönyvtár útvonalba

A test könyvtárat tegyük útvonalba.

```txt
test/TestPelda.java
```

Az EXPLORER-ben a test könyvtáron jobb egér gomb, majd:

* Add Folder to Java Source Path

Ellenőrzésként az oldalsávon a JAVA PROJECTS nézetben keressük meg a test könyvtárat.

### Első teszt

```java
import org.testng.Assert;
import org.testng.annotations.Test;
 
public class TestTriangle {
 
    @Test
    public void testCalcAreaGoodData1() {
        Assert.assertTrue(true);
    }
    @Test
    public void testCalcAreaGoodData2() {
        Assert.assertTrue(true);
    }
}
```

### Háromszög tesztelése

test/TestTriangle.java:

```java
import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;
 
public class TestTriangle {
 
    Triangle tri;
 
    @BeforeTest
    public void initTriangle() {
        tri = new Triangle();
    }
 
    @Test
    public void testCalcAreaGoodData1() {
        double actual = tri.calcArea(30, 35);
        double expected = 525;
        Assert.assertEquals(actual, expected, 0.9, "Hiba!");
    }
    @Test
    public void testCalcAreaGoodData2() {
        double actual = tri.calcArea(100, 130);
        double expected = 6500;
        Assert.assertEquals(actual, expected, 0.9, "Hiba!");        
    }
}
```

## JUnit teszt

A JUnit egy egységtesztelő rendszer, amit programozói könyvtárak formájában érhetünk el.

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
