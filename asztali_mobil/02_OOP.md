# Haladó Objektum Orientált Programozás

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Ismétlő gyakorlatok](#ismétlő-gyakorlatok)
* [Absztrakt osztály](#absztrakt-osztály)
* [Interfész](#interfész)
* [Laza függőség létrehozása](#laza-függőség-létrehozása)
* [Többalakúság](#többalakúság)
* [Módosítók](#módosítók)
* [Csomagok](#csomagok)
* [A this és a super](#a-this-és-a-super)
* [OOP feladat](#oop-feladat)

## Ismétlő gyakorlatok

1. Kérdezze meg az egyik **LLM**-t, mi a különbség a VSCode és a Netbeans között.

2. Készítsen a VSCode-ban Maven projektet, amiben megold egy programozási feladatot. [Feladatgyűjtemény](https://szit.hu/doku.php?id=oktatas:programozas:feladatok:altalanos)

3. Készítsen VSCode-ban "no build tools" módban projektet, oldjon meg vele egy programozási feladatot. [Feladatgyűjtemény](https://szit.hu/doku.php?id=oktatas:programozas:feladatok:altalanos)

4. Készítsen Java programban egy Employee osztályt, amiben tárolja a dolgozó nevét, települését és fizetését.

5. Kérdezze meg az egyik **LLM**-t, mi a különbség a java és a javac parancsok között?

6. Kérdezze meg az egyik **LLM**-t, mire jó a JRE és a JDK?

## Absztrakt osztály

Az absztrakt angolul abstract, elvontat, összefoglalást jelent. Az absztrak osztályok öröklésre szánt osztályok, vagyis nem hozhatók létre belőlük példány.

Absztrakt osztályt az abstract kulcsszóval hozunk létre:

```java
public abstract class Dolgozo {}
```

Az absztrakt osztályokban absztrakt metódusokat hozhatunk létre:

```java
public abstract class Dolgozo {
    public abstract void munkavegzes();
}
```

Figyeljük meg a **munkavegzes()** nevű metódust. A metódus törzsét nem valósítottuk meg. Viszont előírtuk, hogy a származtatott osztályban létre kell hozni egy munkavegzes() metódust, ami public elérésű, és nincs bemenő paramétere.

Használjuk örökléssel az osztályt:

```java
public class Mernok extends Dolgozo {
    public void munkavegzes() {
        System.out.println("munka...");
    }
}
```

Az absztrakt osztálynak lehetnek nem absztrakt metódusai is:

```java
public abstract class Dolgozo {
    public abstract void munkavegzes();
    public void pihen() {
        System.out.println("pihenés...");
    }
}
```

A származtatott osztályban nem kötelező a pihen() nevű metódus megvalósítása.

Az absztrakt osztály tulajdonságai:

* Egy osztály metódusa csak akkor lehet absztrakt, ha maga az osztály is absztrakt.
* Egy absztrakt osztálynak nem kötelező minden metódusának absztraknak lennie.
* Egy absztrakt osztályt nem lehet final vagy private módosítóval ellátni.
* Egy absztrakt osztály absztrakt metódusát nem lehet az absztrakt osztályon belül megvalósítani.
* Az örökölt oszálytban, ha az nem absztrakt kötelező megvalósítani az ősosztály absztrakt metódusát.

### Absztrakt osztály gyakorlat

#### Az absztrak osztály gyakorlat 01

Adott az Animal nevű osztály:

```java
abstract class Animal {
    abstract void makeSound();
    
    void move() {
        System.out.println("Az állat mozog");
    }
}
```

* Készítsen egy Dog és egy Cat osztályt, ami örökíti az Animal osztályt.
* Mutassa be az osztályok használatát.

#### Az absztrak osztály gyakorlat 02

Adott a következő osztály:

```java
abstract class Shape {
    abstract double calculateArea();
}
```

* Készítsen Circle és Rectangle alosztályt.
* Mutassa be az osztályok használatát.

#### Az absztrak osztály gyakorlat 03

Adott a következő osztály:

```java
abstract class Vehicle {
    abstract void start();

    void stop() {
        System.out.println("A jármű megállt.");
    }
}
```

* Készítsen Bike és Car alosztályt.
* Mutassa be az osztályok használatát.

#### Az absztrak osztály gyakorlat 04

1. Kérdés: Mi az absztrakt osztályok angol megfelelője?
     * A) Concrete
     * B) Abstract
     * C) Virtual
     * D) Interface  

2. Kérdés: Milyen célra vannak tervezve az absztrakt osztályok?
    * A) Példányok létrehozására
    * B) Adatok tárolására
    * C) Öröklésre
    * D) Hibakezelésre  

3. Kérdés: Mi a következménye annak, ha megpróbálunk példányt létrehozni egy absztrakt osztályból?
    * A) Az osztály létrejön
    * B) Fordítási hiba lép fel
    * C) Futási hiba lép fel
    * D) A példány létrejön, de a metódusok nem működnek  

## Interfész

Az interfészek **metódusok és állandók egy halmazát** adják meg. Az osztályok, amikor implementálnak egy ilyen interfészt, a benne található metódusokat kötelesek megvalósítani.

Legyen például egy Jarmu interfész, amiben előírjuk milyen viselkedéseket kell egy járműnek megvalósítani adott programban.

```java
interface Jarmu {
    public void halad();
}
```

Írjunk programot, ami megvalósítja a Jarmu nevű interfészt.

```txt
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

App.java fájl

```java
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Interfész");

        Szemelygepkocsi lada1 = new Szemelygepkocsi();
        lada1.halad();
    }
}
```

Szemelygepkocsi.java:

```java
public class Szemelygepkocsi implements Jarmu {
    public void halad() {
        System.out.println("x");
    }
}
```

### Gyakorlás 1

1.) Írjon programot, ahol egy idegsejtet szimulál. A szimulátorban használjon interfészt, amiben meghatározza a sejt egy tevékenységét. A program valósítsa meg az interfészt. A program fő osztálya külön állományban legyen.

Vegyünk egy egyszerű esetet: Az idegsejtek ingerületet fogadnak és ingerültete küldenek.

2.) Írjon programot, ami egy járművet szimulál. A szimulátorban interfésszel határozza meg a jármű mozgásait. A programban valósítsa meg az elkészített interfészt.

## Laza függőség létrehozása

Vegyünk egy osztályt, ami a konstruktorán keresztül paraméterként fogadott objektumot, amivel beállítja egyik adattagját.

Példánkban, a **DataService** osztály **függ a Mariadb** osztálytól:

```java
class DataService {
    Mariadb mariadb;
    public DataService(Mariadb mariadb) {
        this.mariadb = mariadb;
    }
}
```

A függőség ábrázolása UML ábrán:

![Függőség ábrázolása UML ábrán](images/oop/dataservice_fuggoseg.png)

A kapcsolat a két osztály között UML ábrán:

![A kapcsolat a két osztály között UML ábrán](images/oop/datasource_kompozicio.png)

A DataService **erőteljesen függ** a Mariadb osztálytól, mivel más osztály nem adható meg.

Egy **interfésszel lazafüggőséget** alakíthatunk ki. A következő példákban üres interfész és osztályt használunk, mert most nem fontos mi van benne:

```java
interface DataSource {

}

class Mariadb implements DataSource {

}

class DataService {
    DataSource source;
    public DataService(DataSource source) {
        this.source = source;
    }
}
```

De mitől laza? Amikor példányosítjuk DataService osztályt paraméterként megadhatjuk a Mariadb osztályt:

```java
DataService service = new DataSercie(new Mariadb());
```

Azért adhatjuk meg, mert implementálta a DataSrouce osztályt, és DataService esetén ezt adtuk bemenő paraméternek. Ezzel együtt bármely osztály ami implementálja a DataSource interfészt, az megadható paraméterként. Legyen például egy Sqlite osztályt is:

```java
interface DataSource {}

class Mariadb implements DataSource {}

class Sqlite implements DataSource {}

class DataService {
    DataSource source;
    public DataService(DataSource source) {
        this.source = source;
    }
}
```

A DataService példányosítása során **megadható** a **Mariadb** osztály és az **Sqlite** osztály is:

```java
DataService service1 = new DataSercie(new Mariadb());
DataService service2 = new DataSercie(new Sqlite());
```

A DataService ezért lazán függ a Mariadb és az Sqlite osztályoktól.

A DataService számára befecskendztük a függőséget, ezért szokás függőség befecskendezésről beszélni a fenti példánkban.

![Függőség befecskendezés](images/oop/dataservice_befecskendezes.png)

### Beszélő emberek példa

Egy programot szeretnénk írni, ahol embereket szimulálunk. Minden ember más-más nyelvet beszélhet. A példány létrehozása helyén dől el, milyen nyelvet fog beszélni.

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

App.java:

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

Beszed.java:

```java
public interface Beszed {
    public void beszel();
}
```

Ember.java:

```java
public class Ember {
    Beszed beszed;
    public Ember(Beszed beszed) {
        this.beszed = beszed;
    }
}
```

Magyar.java:

```java
public class Magyar implements Beszed {
    public void beszel() {
        System.out.println("igen");
    }
}
```

## Többalakúság

### Metódus túlterhelése

```java
public class Triangle {
    public double calcArea(double base, double height) {
        return 0.5 * base * height;
    }
    public double calcArea(
            double sideA, 
            double sideB, 
            double angleInDegress) {
        double angleInRadius = angleInDegress * Math.PI / 180;
        return 0.5 * sideA * sideB * Math.sin(angleInRadius);
    }
    public double calcArea(
            float sideA, 
            float sideB, 
            float sideC) {
        double s = (sideA + sideB + sideC)/2;
        return Math.sqrt(s*(s-sideA)*(s-sideB)*(s-sideC));
    }
}

```

### Több alak örökléssel

```java
class Animal {}
class Dog extends Animal {}
class Wolf extends Animal {}

public class Main {
    public static void main(String[] args) {
        Animal animal1 = new Dog();
        Animal animal2 = new Wolf();
    }    
}
```

Például egy tömb minden tagja más alakú lehet:

```java
Animal[] animalArray = new Animal[3];
animalArray[0] = new Dog();
animalArray[1] = new Wolf();
animalArray[2] = new Cat();
```

### Elvont osztályok

Az alaposztályt tegyük elvonnttá, hogy ne is lehessen példányt létrehozni belöle.

```java
abstract class Animal {}
class Dog extends Animal {}
class Wolf extends Animal {}
class Cat extends Animal {}
```

### Interfészek

Az interfészekben nem szükséges megvalósítani a metódusokat. Így használhatjuk őket paraméterként.

```java
// Interfész számításhoz
interface Calculable {
    // Kerületszámítás
    double calcPerimter();
}

// Circle, ami megvalósítja az interfészt
class Circle implements Calculable {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    @Override
    public double calcPerimter() {
        return 2 * Math.PI * radius;
    }
}

// Rectangle, ami megvalósítja az interfészt
class Rectangle implements Calculable {
    private double sideA;
    private double sideB;

    public Rectangle(double sideA, double sideB) {
        this.sideA = sideA;
        this.sideB = sideB;
    }

    @Override
    public double calcPerimter() {
        return 2 * (sideA + sideB);
    }
}

// Segédosztály: paraméterként intefészt használ
class PerimeterCalculator {
    public static double calcAndPrint(Calculable shape) {
        double perimeter = shape.calcPerimter();
        System.out.println("Az alakzat kerülete: " + perimeter);
        return perimeter;
    }
}

public class App {
    public static void main(String[] args) throws Exception {
        Circle circle = new Circle(5);
        Rectangle rectangle = new Rectangle(3, 4);

        // Átadhatok minden ami megvalósítja az interfészt
        PerimeterCalculator.calcAndPrint(circle);
        PerimeterCalculator.calcAndPrint(rectangle);
    }
}
```

## Módosítók

### Hozzáférés

* public - minden osztályból elérhető
* protected - azonos csomagból és leszármazott osztályokból érhető el
* default (nincs módosító) - azonos csomagból érhető el
* private - csak osztályon belül érhető el

### Nem hozzáférés módosítók

* static - osztályszintű tag - az osztály nevén keresztül érhető el
* final - nem írható felül
* abstract - a metódus nincs helyben megvalósítva

### Visszatérés típusa

* Valamilyen típus, amit a metódus visszaad.
* void ha nem ad vissza értéket

## Csomagok

Ha VSCode-ban készítünk egy No build tools típusú Java projektet a következő könyvtárszerkezetet kapjuk:

```txt
app01/
  |-.vscode/
  |  `-settings.json
  |-lib/
  |-src/
  |  `-App.java
  `-README.md
```

A forássfájlok útvonala az src könyvtár.

Tegyünk az src könyvtárba egy "feher" nevű újabb könyvtárat. Az App.java fájlt mozgassuk ebbe a könyvtárba.

```txt
app01/
  |-.vscode/
  |  `-settings.json
  |-lib/
  |-src/
  |  `-feher/
  |      `-App.java
  `-README.md
```

Az App.java fájl most a "feher" nevű csomagon belül tudjuk használni. A VSCode felkínálja a javítást. Ha nem, akkor fel kell vegyük a fájl elejére a csomagra vonatkozó bejegyzést.

```java
package feher;
```

A teljes kód ekkor:

```java
package feher;

public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Helló");
    }
}
```

A program ugyanúgy használható.

### Csomagban lévő osztály importálása

Valami.java:

```java
package feher;

public class Valami {
    public void print() {
        System.out.println("Működik");
    }
}
```

App.java:

```java
import feher.Valami;

public class App {
    public static void main(String[] args) throws Exception {
        Valami valami = new Valami();
        valami.print();
    }
}
```

A Valami nevű osztályt most importálni kell a használathoz.

## A this és a super

### A this

A this mindig az aktuális osztályt jelenti.

```java
class Example {
    int adat;
    public void setup() {
        this.adat = 35;
    }
    public void print() {
        System.out.println(this.adat);
    }
}
```

### A super

Az ősosztály hívása:

```java
class Example {
    public Example() {
        System.out.println("ősosztály");
    }
}

class Sub extends Example {
    public Sub() {
        super();
    }
}

public class App {
    public static void main(String[] args) throws Exception {
        new Sub();
    }
}
```

Ősosztály metódusának hívása, az App.java:

```java
class Example {
    public void print() {
        System.out.println("ősosztály");
    }
}

class Sub extends Example {
    public Sub() {
        super.print();
    }
}

public class App {
    public static void main(String[] args) throws Exception {
        new Sub();
    }
}
```

## OOP feladat

### Feladat 001

Adott a következő UML ábra:

![Termékek](images/product_uml_01.png)

Készítse el azt a programot, ami teljesíti az UML ábrán látható osztályokat.

### Feladat 002

Adott a következő interfész:

```java
public interface Shape {
    double calculateArea();
    double calculatePerimeter();
}
```

Készítsen osztályt ami implementálja az interfészt és háromszög alakzattal dolgozik.

### Feladat 003

Adott a következő interfész:

```java
public interface Readable {
    void readContent();
}
```

Készítsen osztályt **Readfile** néven, ami megvalósítja az interfészt, és egy fájl tartalmát beolvassa egy String típusú változóba.

### Feladat 004

Adott a következő interfész:

```java
public interface Writable {
    void writeContent(String content);
}
```

Készítsen osztályt **Writer** néven, ami megvalósítja az interfészt. Az osztály, írja fájlba a kapott szöveget.

### Feladat 005

Adott a következő interfész:

```java
public interface Searchable {
    boolean containsKeyword(String keyword);
    int countWords();
}
```

Készítsen osztályt, amely megvalósítja az interfészt. Az osztály segítségével lehessen keresni egy szövegben, és lehessen megszámolni a hány szó van a szövegben.

### Feladat 006

Adott a követkeő interfész:

```java
public interface Resizable {
    void resize(int width, int height);
}
```

Készítsen osztályt **Rectangle** néven, amely megvalósítja az interfészt. Az osztály egy téglalapot jelképez, amelyenek létrehozásakor meg kell adni a méreteit, de átméretezhetőnek kell lennie.

### Feladat 007

Adott a követkeő interfész:

```java
public interface Connectable {
    void connectToNetwork(String networkName);
    void disconnectFromNetwork();
}
```

Készítsen osztályt **Network** néven, amely megvalósítja az interfészt. A program csak egy szöveg kiírásával szimulálja, hogy kapcsolódott a hálózathoz, a kapcsolat megszakítását is csak egy szöveg kiírásával tudatja.

### Feladat 008

Adott a követkeő interfész:

```java
public interface Playable {
    void play();
    void pause();
    void stop();
}
```

Készítsen osztályt **Player** néven, amely megvalósítja az interfészt. Az egyes metódusok, csak egy szöveg kiíratásával küldjenek üzenetet, hogy az adott funkció életbelép.

### Feladat 009

Adott a követkeő interfész:

```java
public interface Controllable {
    void start();
    void stop();
    void restart();
}
```

Készítsen osztályt **Controller** néven, amely megvalósítja az interfészt. Az egyes metódusok, csak egy szöveg kiíratásával küldjenek üzenetet, hogy az adott funkció elindult.

### Feladat 010

Adott a követkeő interfész:

```java
public interface Authenticatable {
    boolean authenticate(String username, String password);
}
```

Készítsen osztályt **Auth** néven, amely megvalósítja az interfészt. A metódus, csak a "bela" felhasználónevet és a "titok" jelszót fogadja el.

### Feladat 011

Adott a követkeő interfész:

```java
public interface Runnable {
    void runTask();
    void stopTask();
}
```

Készítsen osztályt **Runner** néven, amely megvalósítja az interfészt. Az egyes metódusok, csak egy szöveg kiíratásával küldjenek üzenetet, hogy az adott funkció elindult.
