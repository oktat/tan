# Unit tesztek

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Szerkesztve: 2024
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [A tesztelés szintjei](#a-tesztelés-szintjei)
* [TestNG teszt](#testng-teszt)
* [Visual Studio Code bővítmény](#visual-studio-code-bővítmény)

## A tesztelés szintjei

* komponensteszt (ide tartozik a Unit teszt)
* integrációs teszt
* rendszerteszt
* átvételi teszt

## TestNG teszt

A TestNG a **JUnit** és az **NUnit** által **inspirált** tesztelő keretrendszer.

### Szükséges

#### No build tools használata esetén

Függőségek, vagyis szükséges programozói könyvtárak:

* jcommander-x.y.jar
* slf4j-api-x.y.z.jar
* testng-x.y.z.jar

**A 7.8.0-ás testng számára, 1.7.36-os slf4j-api szükséges.**

A programozói könyvtárak a következő helyről szerezhetők be:

* [https://central.sonatype.com/](https://central.sonatype.com/)  (2024)

Például keresőbe írjuk be: testng.
Utána: testng > Version > Browse > testng-7.8.0.jar

#### Maven projekt esetén

```xml
<dependency>
    <groupId>org.testng</groupId>
    <artifactId>testng</artifactId>
    <version>7.10.2</version>
    <scope>test</scope>
</dependency>
```

Tegyük a pom.xml fájlba.

Elég megadni a testng-t a függőségeket automatikusan kezeli.

### Projekt készítése

Készítsünk egy Java projektet. Érdemes Maven projektet választani "No Archetype" választással.

```txt
app01/
  |-src/
  |  |-main/
  |  |  |-java/lan/zold/
  |  |  |           `-Main.java
  |  |  `-resouces/
  |  `-test/java/
  |-target/
  `-pom.xml
```

### A Main.java megnyitása

Meg kell nyitni az Main.java fájlt. Várjuk meg, amíg a Java bővítmények aktíválódnak.

### Teszt fájl létrehozása

```txt
app01/
  |-src/
  |  |-main/
  |  |  |-java/lan/zold/
  |  |  |           `-Main.java
  |  |  `-resouces/
  |  `-test/java/
  |           `-TestPelda.java
  |-target/
  `-pom.xml
```

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

## Visual Studio Code bővítmény

* Test Runner for Java
