# Asztali alkalmazások fejlesztése - Metódusok

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

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

## Statikus metódusok

Az osztály céljától függően a metódusaik lehetnek statikus és példánymetódusok. Az osztályok a világunkat reprezentálják. Ha egy osztály olyan dolgot reprezentál, amiből csak egy van, akkor statikus metódusokat szoktunk létrehozni. Egy alkalmazásból csak egy van világon, és annak egy tulajdonsoba van. Most eltekintünk a hasonló alkalmazásoktól. Ennek következtében célszerű statikus metódusokat használni.

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

## Scope

A metóduson belül létrehozott változók és objektumok csak a változón belül érhetők el. Az osztály adattagjai az összes metódusból elérhetők.

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

## Paraméterátadás

```java
void doubleNumber(int num) {
    System.out.println(num * 2);
}
```

```java
void sumNumbers(int num1, int num2) {
    System.out.println(num1 + num2);
}
```

## Visszatérésiérték

```java
void doubleNumber(int num) {
    int result = num * 2;
    retrun result;
}
```

```java
void doubleNumber(int num) {
    retrun num * 2;
}
```
