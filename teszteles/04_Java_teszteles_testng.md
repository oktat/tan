# Java tesztelés

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [A TestNG](#a-testng)
* [Helló Világ](#helló-világ)
* [Háromszög tesztelése](#háromszög-tesztelése)
* [Bekérős feladat megoldása](#bekérős-feladat-megoldása)
* [Kivételek tesztelése](#kivételek-tesztelése)
* [A tesztek kizárása](#a-tesztek-kizárása)

## A TestNG

A TestNG egy tesztelő keretrendszer Java alkalmazások számára.

Webhely:

* [https://testng.org/](https://testng.org/)

Minimális Java szükséglet: 11

Szükséges programozói könyvtárak:

* jcommander-x.y.jar
* slf4j-api-x.y.z.jar
* testng-x.y.z.jar

## Helló Világ

Hozzunk létre test könyvtárat benne egy TestValami.java nevű fájlt.

### A test könyvtár útvonalba

Ellenőrizzük, hogy létezik a test könyvtárban egy TestValami.java fájl.

test/TestValami.java

Az EXPLORER-ben a test könyvtáron, kattintsunk jobb egér gombbal, majd:

* Add Folder to Java Source Path

Ellenőrzésként az oldalsávon a JAVA PROJECTS nézetben keressük meg a test könyvtárat. Írjuk meg az első tesztünket:

test/TestValami.java:

```java
import org.testng.Assert;
import org.testng.annotations.Test;

public class TestValami {    
    @Test
    public void testValami() {
        Assert.assertTrue(true); 
    }
}
```

Válasszuk a lombikot baloldalon (tesztelés). Ha megnyílik az oldalsávon a tesztelés, felül a lejátszógombra kattintva futtassuk a tesztet.

## Háromszög tesztelése

Hozzuk létre a projekt gyökérkönyvtárában egy test könyvtárat. Tegyünk bele egy üres TestTriangle.java fájlt.

```java
import org.testng.Assert;
import org.testng.annotations.Test;

public class TestTriangle {

    @Test
    public void testCalcAreaGoodData1() {
        Triangle tri = new Triangle();
        double actual = tri.calcArea(30, 35);
        double expected = 525;
        Assert.assertEquals(actual, expected, 0.9, "Hiba!");        
    }
}
```

## Bekérős feladat megoldása

Oldjunk meg egy bekérős feladatott a szit.hu programozási feladatgyűjteményéből:

* [https://szit.hu/doku.php?id=oktatas:programozas:feladatok:altalanos](https://szit.hu/doku.php?id=oktatas:programozas:feladatok:altalanos)

Legyen például a "Feladat 0312", amiben egy rombuszba írható kör sugarát kell kiszámítani.

Készítsünk egy Rhombus nevű osztályt, ami tartalmazza a sugár számítását.

A következő megoldások mindegyikéhez készítsünk tesztet, használjunk TestNG-t:

```java
class Rhombus {
    public static duble calcRadius(double aside, double alpha) {
        double rad = alpha * Math.PI / 180;
        double radius = 1.0/2.0 * aside * Math.sin(rad);            
        return radius;
    }
}
```

```java
class Rhombus {
    public duble calcRadius(double aside, double alpha) {
        double rad = alpha * Math.PI / 180;
        double radius = 1.0/2.0 * aside * Math.sin(rad);            
        return radius;
    }
}
```

```java
class Rhombus {
    double aside;
    double alpha;
    double radius;
    public Rhombus(double aside, double alpha) {
        this.aside = aside;
        this.alpha = alpha;
        thia.radius = -1;
    }
    public void calcRadius() {
        double rad = this.alpha * Math.PI / 180;
        this.radius = 1.0/2.0 * this.aside * Math.sin(rad);            
    }
}
```

Készítsük el a Tombsug nevű osztályt ami használja a Rhombus osztályt. Legyen egy metódus, ami bekéri az oldalt és az alfa szöget. Másik metódus végezze el a számítást. Egy harmadik metódus írja az eredményt fájlba, hozzáfűzéssel.

## Kivételek tesztelése

```java
import org.testng.annotations.Test;

public class TriangleTest {

    @Test(expectedExceptions = NumberFormatException.class )
    public void testCalcAreaFail() throws Exception {
        Triangle triangle = new Triangle();        
        triangle.calcArea(-130, 135);
    }

}
```

### Üzenet vizsgálata

```java
import org.testng.annotations.Test;

public class TriangleTest {
    @Test(expectedExceptions = 
    NumberFormatException.class, 
    expectedExceptionsMessageRegExp = "Hiba" )
    public void testCalcAreaFail() throws Exception {
        Triangle triangle = new Triangle();        
        triangle.calcArea(-130, 135);
    }
}
```

A teszteléshez:

```java
public class Triangle {
    public double calcArea(double base, double height) {
        if(base<=0) {
            throw new NumberFormatException("Hiba!!!!");
            // throw new NullPointerException("Hiba");
        }
        return base * height / 2;
    }
}
```

## A tesztek kizárása

### Annotáció paraméter

```java
public class TestPelda {
    @Test(enabled=false)
    public void testMethod1() {}

    @Test
    public void testMethod1() {}
}
```

### Az Ignore annotáció

```java
@Ignore
public class TestPelda {
    @Test
    public void testMethod1() {}

    @Test
    public void testMethod1() {}
}
```

### Az Ignore annotáció metódusokkal

```java
public class TestPelda {
    @Ignore
    @Test
    public void testMethod1() {}

    @Test
    public void testMethod1() {}
}
```
