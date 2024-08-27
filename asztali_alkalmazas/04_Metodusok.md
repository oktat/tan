# Asztali alkalmazások fejlesztése - Metódusok

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [A metódusokról](#a-metódusokról)
* [Metódusok definiálása](#metódusok-definiálása)
* [Kód struktúrálása](#kód-struktúrálása)
* [Osztályváltozó elérése](#osztályváltozó-elérése)
* [Statikus metódusok](#statikus-metódusok)
* [Példánymetódusok](#példánymetódusok)
* [Scope](#scope)
* [Paraméterátadás](#paraméterátadás)
* [Visszatérési érték](#visszatérési-érték)

## A metódusokról

A metódusok létrehozásával egy utasításnak újabb nevet adhatunk, vagy összefogunk vele több utasítást, amit egyetlen néven futtatok.

## Metódusok definiálása

Az osztályon belül létrehozhatunk több metódust is. Legyen egy print() metódus, ami bármit kiír, hasonlóan a System.out.println() metódushoz:

```java
class App {
    static void print(obj) { 
        System.out.println(Object obj) 
    }
    public static void main(String[] args) {
        print("Valami");
    }
}
```

Több utasítást is összefoghatok egy metódussal:

```java
class App {
    static void about() {
        System.out.println("-------------");
        System.out.println("Nagy János");
        System.out.println("Valahol");
        System.out.println("-------------");
    }
    public static void main(String[] args) throws Exception {
        about();
    }
}
```

### Gyakorlat a metódusok definiálásához

* Készítsen egy Square nevű osztályt.
* Készítsen egy print metódus, ami négyzetet rajtzol a képernyőre.

## Kód struktúrálása

A metódusokat használjuk arra is, hogy több részre bontsuk az osztályunkat. A következő példában a main() metóduson kívül, a calcTriangleArea() metódusban végzem el számításokat. A névjegy is külön about() nevű metódusban kapott helyet.

```java
class App {
    static void calcTriangleArea() {
        double base = 30;
        double height = 35;
        double area = base * height / 2;
        System.out.println("Terület: " + area);
    }
    static void about() {
        System.out.println("-------------");
        System.out.println("Nagy János");
        System.out.println("Valahol");
        System.out.println("-------------");
    }
    public static void main(String[] args) throws Exception {
        about();
        calcTriangleArea();
    }
}
```

### Gyakorlat a kódstruktúráláshoz

* Készíts egy programot, amelyben a következő metódusokat implementálod:
  1. calcCircleArea(double radius)
     * Ez a metódus számolja ki és adja vissza egy kör területét a megadott sugár (radius) alapján.
     * A kör területének képlete a következő: PI \* radius \* radius
  2. about() - Ez a metódus egyszerűen kiírat egy névjegyet a konzolra a következő információkkal:
     * Név: Írd ide a neved
     * Lakcím: Írd ide a lakcímed
     * E-mail: Írd ide az e-mail címed

## Osztályváltozó elérése

A következő példában az osztály változói statikusak, így hivaktozhatunk rájuk statikus környezetből.

```java
class App {
    static double base = 30;
    static double height = 35;
    static double area;
    static void calcTriangleArea() {
        area = base * height / 2;     
    }
    static void writeArea() {
        System.out.println("Terület: " + area);        
    }
    static void about() {
        System.out.println("-------------");
        System.out.println("Nagy János");
        System.out.println("Valahol");
        System.out.println("-------------");
    }
    public static void main(String[] args) throws Exception {
        about();
        calcTriangleArea();
    }
}
```

### Gyakorlás az osztályváltozokhoz

Készíts egy Java programot, amelyben a következő osztályváltozókat és metódusokat implementálod a CounterApp osztályban:

* Osztályváltozók:
  * static int count - Az események számát tároló változó, az alapértelmezett értéke 0.
* Metódusok:
  * static void increment()
    * Ez a metódus növeli a count változót 1-gyel minden alkalommal, amikor meghívják.
  * static void reset() - Ez a metódus visszaállítja a count változót 0-ra.
  * static void displayCount() - Ez a metódus kiírja a jelenlegi számot a képernyőre.

## Statikus metódusok

Az osztály céljától függően a metódusaik lehetnek statikus és példánymetódusok. Az osztályok a világunkat reprezentálják. Ha egy osztály olyan dolgot reprezentál, amiből csak egy van, akkor statikus metódusokat szoktunk létrehozni. Egy alkalmazásból csak egy van világon, és annak egy tulajdonsa van. Most eltekintünk a hasonló alkalmazásoktól. Ennek következtében célszerű statikus metódusokat használni.

```java
class App {
    public static String getAuthor() { 
        return "Nagy János"; 
    }
    public static void main(String[] args) {
        System.out.println(App.getAuthor());
    }
}
```

Matematikából is csak egy van, így azt is felesleges lenne példányosítani.

```java
class ExtraMath {
    public static final double PI = 3.14;
    public static double pow(double base, double exponent) {
        double result = 1;
        if (exponent == 0);
        if (exponent == 1) result = base;        
        if (exponent > 1) {
            for(int i=0; i<exponent; i++) {
                result *= base;
            }
        }
        return result;
    }
}
public class App {
    public static void main(String[] args) {
        System.out.println(ExtraMath.PI);
        System.out.println(ExtraMath.pow(2,8));
    }
}
```

A Földből is csak egy van. Ha bolygóról lenne szó, az más lenne.

```java
class Earth {
    public static double getRadius() {
        return  6371; //km
    }
    public static String getShape() {
        return "ellipszoid";
    };
}
class App {
    public static void main(String[] args) {
        System.out.println(Earth.getRadius());
        System.out.println(Earth.getShape());
    }
}
```

### Gyakorló a statikus metódusokhoz

1 )

Készíts egy Java programot, amely statikus metódusokat használ az alábbi követelmények szerint.

* Autó osztály létrehozása: Készíts egy Car nevű osztályt, amely tartalmaz egy statikus metódust, ami visszaadja az osztály nevét.
* Ezen kívül legyen egy statikus metódus, amely megadja, hogy hány kerekű az autó (az autók általában 4 kerekűek).

2 )

* Készíts egy Geography nevű osztályt
* amely egy statikus metódust tartalmaz, ami visszaadja a Föld területét (kb. 510.1 millió km²)
* és egy másik statikus metódust, amely megadja a legmagasabb pont magasságát (Mount Everest, kb. 8848 m).

3 )

Hozz létre egy App osztályt, amely a main metódusában kiíratja a következő adatokat, az előző osztályok használatával:

* Az autó osztály neve
* Az autó kerekeinek száma
* A Föld területe
* A legmagasabb pont magassága

## Példánymetódusok

Dolgozóból több is van, ezért egy Dolgozo vagy angolul Employee osztályt úgy használjuk, hogy abból példányokat hozunk létre.

```java
class Employee {
    String name;
    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
}
class App {
    public static void main(String[] args) {
        Employee emp = new Employee();
        emp.setName("Béla")
        System.out.println(emp.getName());
    }
}

```

Vegyük észre, hogy az Emplyoee osztályban nem használtuk a static kulcsszót.

### Gyakorló a példánymetódusokhoz

Dolgozók nyilvántartása

I. Lépés: Készíts egy Employee (vagy magyarul Dolgozó) osztályt, amely a következő tulajdonságokat tartalmazza:

* name: dolgozó neve (String)
* age: dolgozó kora (int)

Az Employee osztályhoz hozzá kell adni a következő metódusokat:

* getName(): visszatér a dolgozó nevével.
* setName(String name): beállítja a dolgozó nevét.
* getAge(): visszatér a dolgozó korával.
* setAge(int age): beállítja a dolgozó korát.

II. Lépés: A main metódusban hozz létre néhány Employee példányt, állítsd be a tulajdonságaikat, és írd ki a képernyőre a dolgozók nevét és korát.

Kiegészítő feladatok:

További metódusok: Készíts egy toString() metódust az Employee osztályon, amely visszaadja az alkalmazott nevét és korát egy formázott szövegben.

Tömb vagy lista használata: Hozz létre egy tömböt vagy listát, amelyben több Employee példány található, és írd ki az összes dolgozó nevét és korát egy ciklus segítségével.

Érvényesítés: Ellenőrizd a setAge() metódusban, hogy a kor pozitív szám legyen. Ha a megadott kor negatív, akkor dobj egy IllegalArgumentException-t.

## Scope

A metóduson belül létrehozott változók és objektumok csak a metóduson belül érhetők el. Az osztály adattagjai az összes metódusból elérhetők.

A következő példában osztály adattagokat használok a base, a height és az area.

```java
class Triangle {
    double base = 30;
    double height = 35;
    double area;
    void calcArea() {
        area = base * height / 2;     
    }
    void writeArea() {
        System.out.println("Terület: " + area);        
    }
}

class App {
    public static void main(String[] args) throws Exception {
        Triangle tri = new Triangle();
        tri.calcArea();
        tri.writeArea();
    }
}
```

Újabb példa a helyi és osztályváltozóra:

```java
public class Triangle {
    double base = 30;
    double height = 35;
    double area;
    void calcArea() {
        double area = base * height / 2;;
        this.area = area; // osztályváltozó és helyi változó!
    }
    void writeArea() {
        System.out.println("Terület: " + area);        
    }    
}
```

Előfordul, hogy ugyanazon a néven létrehozunk oszhtályváltozót és helyi változót is. Az előbbi programunkban ilyen az "area". Ha az osztályváltozóra akarok hivatkozni, egyszerűen a this kulcsszot használjuk.

### Gyakorló a scope-hoz

Hozz létre egy Rectangle (téglalap) osztályt, amely tartalmazza a width (szélesség) és height (magasság) adattagokat! Az osztályban készíts két metódust:

* calcArea(): amely kiszámítja a téglalap területét, és elmenti egy osztályváltozóba area.
* writeArea(): amely kiírja a téglalap területét.

Helyi változó: A calcArea() metódusban használj egy helyi változót is, amely tartalmazza a terület értékét, de kezdd el helyesen a számítást, majd használd a this kulcsszót az osztályváltozó frissítésére.

Teszteld az osztályt: Készíts egy App osztályt, amelyben példányosítod a Rectangle osztályt, beállítod az width és height értékeket, majd meghívod a calcArea() és writeArea() metódusokat.

## Paraméterátadás

A metódusok átvehetenk értékeket. A következő metóuds például egy num változón keresztül egy egész értéket vesz át. Az ilyen bejövő paramétert nevezzük formális paraméternek.

```java
void doubleNumber(int num) {
    System.out.println(num * 2);
}
```

A következő példában két formális paraméterünki van:

```java
void sumNumbers(int num1, int num2) {
    System.out.println(num1 + num2);
}
```

### Gyakorló a paraméterátadáshoz

Természetesen! Íme néhány gyakorlófeladat a metódusok paraméterátadásával kapcsolatban. Ezeket a feladatokat a diákok önállóan vagy csoportos munkában is megoldhatják.

### Gyakorlófeladatok

1. **Többszöröző Metódus**
   * Írj egy metódust, amely egy valós számot vesz át paraméterként, és visszaadja a szám négyzetét (azaz a számot önmagával szorozza meg).
   * Metódus neve: `squareNumber`
   * Paraméter: `double num`
   * Visszatérési érték: `double`

   **Példa hívás:**

   ```java
   double result = squareNumber(3.5);
   System.out.println(result); // 12.25
   ```

2. **Legnagyobb Szám Kiválasztása**
   * Írj egy metódust, amely két egész számot fogad paraméterként, és visszaadja közülük a nagyobbat.
   * Metódus neve: `maxNumber`
   * Paraméterek: `int num1, int num2`
   * Visszatérési érték: `int`

   **Példa hívás:**

   ```java
   int max = maxNumber(10, 20);
   System.out.println(max); // 20
   ```

3. **Karakterek Számlálása**
   * Írj egy metódust, amely bemenetként egy sztringet kap, és visszaadja a benne található karakterek számát.
   * Metódus neve: `countCharacters`
   * Paraméter: `String str`
   * Visszatérési érték: `int`

   **Példa hívás:**

   ```java
   int count = countCharacters("Hello, World!");
   System.out.println(count); // 13
   ```

4. **Ötszörös Kiszámítása**
   * Írj egy metódust, amely egy egész számot kap paraméterként, és kiszámítja az ötödik hatványát.
   * Metódus neve: `fifthPower`
   * Paraméter: `int num`
   * Visszatérési érték: `int`

   **Példa hívás:**

   ```java
   int power = fifthPower(2);
   System.out.println(power); // 32
   ```

5. **Egyenlet Megoldása**
   * Írj egy metódust, amely két szám és egy operátor (pl. +, \*, /) bemenetként kap, és visszaadja a művelet eredményét.
   * Metódus neve: `calculate`
   * Paraméterek: `double num1`, `double num2`, `char operator`
   * Visszatérési érték: `double`

   **Példa hívás:**

   ```java
   double result = calculate(5, 3, '+');
   System.out.println(result); // 8.0
   ```

## Visszatérési érték

A metódusoknak lehetnek visszatérési értékeik. A visszatérés értékét a return utasítás után adjuk meg. A metódus neve előtt meg kell adnunk a visszatérés típusát.

```java
int doubleNumber(int num) {
    int result = num * 2;
    return result;
}
```

```java
int doubleNumber(int num) {
    return num * 2;
}
```

### Gyakorló a visszatérési értékhez

1. Írj egy Java-metódust, amely egy `double` értéket vesz át bemenetként és visszatér az érték négyzetével. A metódus neve `négyzet` legyen és `double` visszatérési típusú legyen.

2. Írj egy Java-metódust, amely két `int` értéket vesz át bemenetként és visszatér a két érték összegeként. A metódus neve `összead` legyen és `int` visszatérési típusú legyen.

3. Írj egy Java-metódust, amely egy `String`-et vesz át bemenetként és visszatér a sztring hosszával. A metódus neve `hossz` legyen és `int` visszatérési típusú legyen.
