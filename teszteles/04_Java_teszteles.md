# Java tesztelés

* **Szerző:** Sallai András
* Copyright (c) 2023, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## JUnit 5

A JUnit egy tesztelő keretrendszer Java és JVM számára.

Webhely:

* [https://junit.org/junit5/](https://junit.org/junit5/)

### Bekérős feladat megoldása

Oldjunk meg egy bekérős feladatott a szit.hu programozási feladatgyűjteményéből:

* [https://szit.hu/doku.php?id=oktatas:programozas:feladatok:altalanos](https://szit.hu/doku.php?id=oktatas:programozas:feladatok:altalanos)

Legyen például a "Feladat 0312", amiben egy rombuszba írható kör sugarát kell kiszámítani.

Készítsünk egy Rhombus nevű osztályt, ami tartalmazza a sugár számítását.

A következő megoldások mindegyikéhez készítsünk tesztet, használjunk JUnit-t:

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
