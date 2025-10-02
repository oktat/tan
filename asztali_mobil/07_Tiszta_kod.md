# Tiszta kód

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Szerkesztve: 2022, 2023
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [A tisztakódról](#a-tisztakódról)
* [Elnevezések](#elnevezések)
* [Gyakorlat elnevezésekre](#gyakorlat-elnevezésekre)
* [Függvények](#függvények)
* [Megjegyzések](#megjegyzések)
* [Formázás](#formázás)
* [Objektumok és adatszerkezetek](#objektumok-és-adatszerkezetek)
* [Hibakezelés](#hibakezelés)
* [Határok](#határok)
* [Unit tesztek](#unit-tesztek)
* [Osztályok](#osztályok)
* [S.O.L.I.D. elvek](#solid-elvek)

## A tisztakódról

**Robert C. Martin** fogalmazta meg a tiszta kód elveit a **"Tiszta kód"** című könyvében.

A zavaros kód a szoftverfejlesztő kedvét is elveszi a fejlesztői munkától. A fejlesztők több kódot szoktak olvasni, mint írni, így nem mindegy milyen a kód amit olvasnak.

A jó kódra kevés időt kell fordítani a megértéshez.

Robert C. Martin idézi könyvében **Grady Booch** szavait, amiből a lényeg:

* Egyszerű, közvetlen, olyan mint egy prózai mű.

## Elnevezések

### Beszédes nevek

A változók, állandók, függvények, osztályok, interfészek és más szimbólumok a forráskódban rosszul elnevezve egy pokoli élmény felé viszik a programozókat.

A beszédes nevekhez vizsgáljuk meg a következőket:

* Miért létezik az adott valami?
* Milyen szerepe van?
* Hogyan használjuk?

Legyen például egy változó, amiben valakinek a fizetését tároljuk:

```java
int b; //A dolgozó fizetése
```

Ha úgy érezzük, hogy a "b" változóhoz megjegyzést kell fűzni, az elnevezés biztosan rossz. **Néhány pokoli példa**:

```java
/* A függvénye egy rombusz területét számítja ki 
   Az a formális paraméter az oldal
   A b formális paraméter a béta szög*/
function cs(double a, double b) {
    double c = b * Math.PI / 180; //A c-ben kapjuk radiánban a szöget
    return Math.pow(a, 2) * Math.sin(b);
}
```

```java
public class E { //Dolgozó osztálya
    String a; //név
    double b: //fizetés
}
```

### Félrevezetés

A közismert elnevezések félrevezetőek lehetnek, ha az alatt több dolgot is érhetünk.

Ilyenek lehetnek:

* lib
* tmp
* cache
* data
* bin
* model
* stb.

```java
String lib; // A megyei könyvtár nevét tároljuk benne
```

```java
String lib; // A használt programozói könyvtár neve
```

```java
String countyLib;
```

```java
String progLib;
```

### A nevek kimondhatósága

A nehezen kimondható nevek megnehezítik a rövidtávú memorizálást is:

```java
String clb; //countyLib
```

### A nevek kereshetősége

Minél rövidebb egy név, annál nehezebb keresni rá.

```java
int a;
int ar;
```

Az "a" és az "ar" nevű változó névre nehéz keresni. Minél nagyobb az állomány, annál nehezebb.

### Típuskódolás

Régen indokolt volt a típuskódolás. Ilyen volt a magyar jelölés is. Manapság használt nyelvekben ez nem indokolt.

```java
String sName;
String sCity;
double dSalary;
```

A tagváltozók jelölése sem indokolt:

```java
class Product {
    //tagváltozó-jelölés
    String m_Name;
    double m_Price;
    double m_Piece;
}
```

A felületek (interfész) nevében sem szerencsés az "i".

```java
interface iSale {
    public void saleProduct();
}
class Sale implement iSale {
    public void saleProduct() {}
}
```

Helyette:

```java
interface Sale {
    public void saleProduct();
}
class SaleImpelement implement Sale {
    public void saleProduct() {}
}
```

### Osztályok neve

Az osztálynevek főnevek vagy főnévi kifejezések legyenek.

Helytelen mivel ige:

```java
class Working {}
```

### Tagfüggvények

A tagfüggvények legyenek igék vagy igei kifejezések.

Az elérő függvények előtagjai legyenek egységesen:

* set
* get
* is

Helytelen:

```java
class Employee {
    String name;
    public String fetchName() {
        return this.name;
    }
}
```

Helyes példa:

```java
class Product {
    String name;
    public String getName() {
        return this.name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public boolean isEmptyName() {
        boolean isEmpty = true;
        if (this.name.length > 0) {
            empty = false;
        }
        return isEmpty;
    }
}
```

Ha tagfüggvény első része angol, a második része magyar, nem valami szép:

```java
public String getNev() {}
```

Akkor már inkább legyen a név is angolul:

```java
public String getName() {}
```

### Jófejkedés

Nem ajánlott:

```java
class Termek {
    double aracska;
    int valamennyi;
}
```

Helyette:

```java
class Termek {
    double ar;
    int mennyiseg;
}
```

### Egy fogalomra, ugyanaz a szó

Helyetelen:

```java
public class Product {
    String name;
    double price;
    int quantity;
    public String getName() {
        return name;
    }
    public double fetchPrice() { //Helytelen
        return price;
    }
    public int takeQuantity() { //Helytelen
        return quantity;
    }    
}
```

Helyes:

```java
public class Product {
    String name;
    double price;
    int quantity;
    public String getName() {
        return name;
    }
    public double getPrice() {
        return price;
    }
    public int getQuantity() {
        return quantity;
    }    
}
```

### Szóviccek

Kerüljük a szóvicceket.

Szóviccről akkor beszélünk, ha két vagy több eltérő fogalmat ugyanazzal a névvel illetjük.

Rossz példa az egyenleg tárolása:

```java
class Wallet {
    double size();
}
```

Helyes:

```java
class Wallet {
    double balance();
}
```

### Megoldás és feladattartományok

Ha megoldástartományból van bevált név, azt használjuk és ne mást.

Nem ajánlott:

```java
class Vizsgalat {
    String betegEloelet;
}
```

Ajánlott:

```java
class Vizsgalat {
    String anamnezis;
}
```

## Gyakorlat elnevezésekre

Adott a következő kód. Javítsa a tisztakód elvei alapján.

```java
// Egy könyv adatainak tárolása
public class Read {
    String a; //A könyv szerzője
    String b; //A könyv címe
    double c; //A könyv ára
    public String fetchA() {
        return this.a;
    }
    public void setupAu(String a) {
        this.a = a;
    }
}
```

## Függvények

### Függvények mérete

Egy 3-4 soros függvény már jó. Legyen minél kisebb. Ha 3-4 soros a függvényünk, akkor lehet, hogy egy if vagy egy for törzsében csak egyetlen függvényhívás van, de ez jó.

Rossz példa:

```java
public void calculateSumAndAverage(List<Integer> nums) {
    double sum = 0;
    double count = 0;

    for(int num : nums) {
        sum += num;
        count++;
    }
    double average = sum / count;

    System.out.println("Összeg: " + sum);
    System.out.println("Átlag: " + average);
}
```

Jó példa:

```java
public double sumNums(List<Integer> nums) {
    double sum = 0;
    for(int num: nums) {
        sum += num;
    }
    return sum;
}
public double countNums(List<Integer> nums) {
    return nums.size();
}
public double calcAverage(double sum, double count) {        
    return sum / count;
}
public void printSumAndAverage(double sum, double average) {
    System.out.println("Összeg: " + sum);
    System.out.println("Átlag: " + average);
}
public void startCalculation(List<Integer> nums) {
    double sum = sumNums(nums);
    double count =  countNums(nums);
    double average = calcAverage(sum, count);
    printSumAndAverage(sum, average);
}
```

### Egyetlen feladat

Egy függvény egyetlen feladatot valósítson meg.

Az előbbi "Függvények méret" részben is egy olyan függvényt láttunk, amely nem csak egy feladatot hajtott végre. Végül szét bontottuk és minden függvény csak egyetlen feladattal foglalkozott.

De legyen itt egy újabb rossz példa:

```java
public class Product {
    String name;
    double price;
    boolean quantity;
    boolean expensive;
    public void setPrice(double price) {
        this.price = price;
        if(price > 100) {
            this.expensive = true;
        }else {
            this.expensive = false;
        }
    }
}
```

A setPrice() azt gondolnák, hogy csak beállítja a price adattagot. De nem csak ezt teszi.

### Sorrend

A függvényeket és metódusokat fentről lefele írjuk. Ez a szabály a leszálló szabály.

A következő függvényeket már jó példaként írtuk, de most állítsuk sorrendbe a leszálló szabály alapján:

```java
public void startCalculation(List<Integer> nums) {
    double sum = sumNums(nums);
    double count =  countNums(nums);
    double average = calcAverage(sum, count);
    printSumAndAverage(sum, average);
}
public double sumNums(List<Integer> nums) {
    double sum = 0;
    for(int num: nums) {
        sum += num;
    }
    return sum;
}
public double countNums(List<Integer> nums) {
    return nums.size();
}
public double calcAverage(double sum, double count) {        
    return sum / count;
}
public void printSumAndAverage(double sum, double average) {
    System.out.println("Összeg: " + sum);
    System.out.println("Átlag: " + average);
}

```

### Beszédes függvénynevek

A Beszédes nevek részben a függvényekre is gondoltunk, de itt most megismételjük.

A függvények nevei legyenek igék vagy igei kifejezések. Ha nem találjuk a megfelelő nevet próbálkozzunk többször, és adjunk bátran hosszabb neveket.

Rossz név:

```java
public void ag() {
    //A függvény kifejtése
}
```

### Függvények paraméterei

A legjobb ha egy függvénynek egyáltalán nincs paramétere, de legalábbis legyen minél kevesebb.

Adott egy Triangle osztály, amelynek a calcArea() metódusa kiszámítja egy háromszög területét. Hogyan tudnánk átírni az osztályt, hogy egyetlen paramétere se legyen a calcArea() metódusnak?

Az eredeti Triangle osztály:

```java
public class Triangle {    
    public double calcArea(double base, double height) {
        return base * height / 2;
    }
}
```

Átírva:

```java
public class Triangle {   
    double base;
    double height;
    double area;
    public void setBase(double base) {
        this.base = base;
    }
    public void setHeight(double height) {
        this.height = height;
    }
    public double getArea() {
        return this.area;
    }
    public void calcArea() {
        this.area = base * height / 2;
    }
}
```

Rossz példa:

```java
public class Triangle {    
    //...
    public double calc(CalcType type ) {
        //számítások
    }
}
```

Az ilyen szerkezeteket kerüljük. Írjunk helyette két függvényt.

A paraméter elkerülhető:

```java
public class Triangle {
    //...
    public double calcArea() {
        //számítások
    }
    public double calcPerimeter() {
        //számítások
    }
}
```

### Mellékhatások

Vegyük elő a Triangle osztályunkat:

```java
public class Triangle {   
    //...
    public double calcArea() {
        double result = base * height / 2;
        this.area = result;
        return result;
    }
}
```

A calaArea() metódus létrehozásának célja, hogy kiszámolja a területet. De számítás mellett megváltoztatja annak állapotát is (írja az area adattagot). Ha az állapot megváltoztatása a cél, akkor miért van visszatérési-értéke? A visszatérési, az objektum megváltoztatása mellett, arra utal, hogy mellékhatása van a metódusnak.

Szétválasztva:

```java
public class Triangle {   
    //...
    public void startCalcArea() {        
        this.area = calcArea();        
    }
    public double calcArea() {
        return this.base * this.height / 2;
    }
}
```

A kimeneti paraméterek is kerülendők. Kerüljük a használatát. Egy függvénynek vagy metódusnak akkor van kimeneti paramétere, ha megváltoztatja a megadott paraméter értékét.

### Ismétlődések

Egy-egy algoritmus a kódban többször is ismétlődhet. Ha javítani kell, egyszerre több helyen kell javítani. Kerülendő.

Adott egy kezdetleges kockapóker. Dobni kell 5 dobókockával az embernek és a gépnek is.

App.java:

```java
public class App {
    public static void main(String[] args) throws Exception {
        Dice dice = new Dice();
        dice.fiveRoolsHuman();
        dice.fiveRoolsMachine();
    }
}
```

Dice.java:

```java
import java.util.Random;

public class Dice {
    Random random = new Random();
    private int diceRoll() {
        return random.nextInt(6)+1;
    }
    public void fiveRoolsHuman() {
        Integer[] dices1 = new Integer[5];
        dices1[0] = diceRoll();
        dices1[1] = diceRoll();
        dices1[2] = diceRoll();
        dices1[3] = diceRoll();
        dices1[4] = diceRoll();
        System.out.printf("%10s: ", "Ember");
        for(int dice : dices1) {
            System.out.print(dice);
            System.out.print(" ");
        }
        System.out.println();        
    }
    public void fiveRoolsMachine() {
        Integer[] dices1 = new Integer[5];
        dices1[0] = diceRoll();
        dices1[1] = diceRoll();
        dices1[2] = diceRoll();
        dices1[3] = diceRoll();
        dices1[4] = diceRoll();
        System.out.printf("%10s: ", "Gép");
        for(int dice : dices1) {
            System.out.print(dice);
            System.out.print(" ");
        }
        System.out.println();        
    }
}
```

Külön metódus dob az embernek és külön a gépnek, mivel mindkét más dobásokra van szükség a mindkettőnél és mást kell kiírni a dobások előtt. Az algoritmus viszont ugyanaz.

Javított verzió:

App.java:

```java
public class App {
    public static void main(String[] args) throws Exception {
        Dice dice = new Dice();
        dice.startGame();        
    }
}
```

Dice.java:

```java
import java.util.Random;

public class Dice {
    Random random = new Random();
    
    public void startGame() {
        Integer[] dices1 = fiveRools();
        Integer[] dices2 = fiveRools();
        printResult("Ember", dices1);
        printResult("Gép", dices2);
    }

    private Integer[] fiveRools() {
        Integer[] dices = new Integer[5];
        dices[0] = diceRoll();
        dices[1] = diceRoll();
        dices[2] = diceRoll();
        dices[3] = diceRoll();
        dices[4] = diceRoll();
        return dices;
    }

    private int diceRoll() {
        return random.nextInt(6)+1;
    }

    private void printResult(String role, Integer[] dices) {
        System.out.printf("%10s: ", role);
        for(int dice : dices) {
            System.out.print(dice);
            System.out.print(" ");
        }
        System.out.println();
    }
}
```

### Strukturált programozás

Ahogy azt Edsger Dijkstra is meghatározta, arra kell törekednünk, hogy minden programnak, függvénynek és metódusnak egyetlen kilépési pontja legyen. Nem használunk ugró utasításokat.

## Megjegyzések

Ha nincs megjegyzés, az a legjobb. Ha megjegyzés van a kódban, akkor valószínűleg nem tudtunk magunkat kifejezni.

### Jó megjegyzések

* jogi megjegyzések
* TODO megjegyzések
* szándék magyarázata
* tisztázás - pl. homályos paraméterek
* javadoc nyilvános API-hoz
* következményekre figyelmeztetés - pl. sok idő a futtatás

Jog megjegyzés:

```java
/*
  Szerző: Nagy János, 2023-08-01
  Copyright (c) 2023, Nagy János
  Licenc: MIT
*/
```

```java
/*
* File: ButtonPanel.java
* Author: Nagy János
* Copyright: 2021, Nagy János
* Group: Szoft V
* Date: 2021-09-03
* Github: https://github.com/janos12345/
* Licenc: GNU GPL
*/
```

### Rossz megjegyzések

* felesleges megjegyzés - a kód önmagában is érhető
* rizsázás - túl sok szöveg
* kódrészlet megjegyzésben
* személyes megjegyzések
* félrevezető - már nem érvényes; ott maradt
* helyzetjelzők
* bezáró zárójelnél
* feleslegessé vált átalakítás után
* HTML megjegyzés
* elcsúszott
* túl sok információ
* a megjegyzésnek homályos kapcsolat a kóddal
* kis függvény fejléccel

Felesleges megjegyzés:

```java
/* Háromszög területének számítása */
public void calcTriangleArea(double base, double height) {
    return base * height / 2;
}
```

Túl sok információ:

```java
/*
Ez a függvény a BD-328-s szabvány alapján
konvertálja a bemenő adatokat. A titkosítához
AES algoritmust használ, ahol 128 bites 
kulcsot használunk. A kódolást 82-szer végezzük
el. 152 bájtos sót alkalmazunk, amit a RIF 145
szabvány előír.
*/
public String convert(String input){
    return "";
}
```

Rizsázás:

```java
/*
  A programnak itt nagyon fontos feladatot kell
  elvégeznie, ez a program lelke, mivel itt
  kerül kiszámításra két szám összege. Az összegzés
  lehetővé teszi további számítások elvégzését,
  ami hasznos lehet a továbbfejlesztés során.
*/
int result = sum(numbers)
```

Kódrészlet a megjegyzésben:

```java
// String nev = "Erős István";
String nev = "Névtelen";
```

Személyes megjegyzések:

```java
/*
Izgalmas ezt a függvényt megvalósítani.
Vajon elsőre működik majd?
public void calculate_something() {}
*/
public void calculate_something() {}
```

Félrevezető megjegyzés:

```java
//A függvény JSON formátumban kapj az adatokat
public void validate(Employee emp) {}
```

Régen lehet valóban JSON formátumban kapta, de ma már
nem igaz.

Helyzetjelző:

```java
/*********** itt kezdődik a kiíratás ********/
public void processData(List<String> data) {
    for (String item : data) {        
        System.out.println(item);
    }
}

//...

/*************** kiíratás vége ***********/
//...
```

Bezáró zárójelnél:

```java
if(a > 0) {
   System.out.println(a);
} //if(a > 0) vége
```

Feleslegessé vált átalíktás után:

Itt még volt haszna:

```java
//Felhasználói jelszó érvényességének vizsgálata
public boolean vp(String password) {
    return password.length() >= 8;
}
```

Javítva:

```java
//Felhasználói jelszó érvényességének vizsgálata
public boolean validatePassword(String password) {
    return password.length() >= 8;
}
```

HTML a megjegyzésben:

```java
/*
<p>
Paraméterek: 
base: a háromszög alapja
height: a háromszög magassága
</p>
*/
public void calcArea(double base, doulbe height){}
```

Elszúszott megjegyzés:

```java
/*
A calcArea() a háromszög területét adja.
*/
public double calcPerimeter() {
    return 0;
}
public double calcArea() {
    return 0;
}
```

Homályos megjegyzés:

```java
/*
A 45 a maximális bájtméret:
*/
convert(input, 45, 45)
```

Kis függvény felesleges fejléccel:

```java
/* A függvény visszatére az adot szám
 kétszeresével*/
public double dupla(double num){
    return num * 2;
}
```

## Formázás

### Függőleges méret

Egyetlen fájlban maximum 200 körüli sor ideális. De legyen maximum 500.

### Függőleges elválasztás

Az összefüggő sorokat egy üres sorral válasszuk el.

### Függőleges sűrűség

A megjegyzések túl ritkává tehetik például a felsorolt adattagokat:

```java
class Product {
    /*
     * A termék neve
    */
    String name;

    /*
     * A termék ára
    */    
    double price;
}
```

### Függőleges távolság

* változók - Ahol használjuk, annak közelében vezetjük be.
* adattagok - Az osztály tetején megfelelnek.
* függvények - A hívó hívott felett legyen.

Ez utóbbi nem minden programozási nyelv támogatja.

### Vízszintes formázás

Maximális oszlopszám 80. Ha oldalra kell görgetni az nem jó.

### Vízszintes térközök

* értékadás: base = 35;
* függvénynév() - A név után nincs szóköz.
* műveletek - Az összetartozó részeket szóköz jelezheti (a+b - c*d)

### Vízszintes igazítás

Rossz kód:

```java
String   name;
double   price;
int      quantity;
```

Helyesen:

```java
String name;
double price;
int quantity;
```

### Behúzás

A kód felépítése a behúzások által látható.

Behúzások nélküli kód:

```java
import java.util.ArrayList;
public class EmployeeFactory {public Employee
findEmployee(String name, ArrayList<Employee> 
employeeList) { Employee foundEmployee = new 
Employee(); for (Employee employee: employeeList)
{ if ( employee.name.equals(name)) { foundEmployee
 = employee; } } return foundEmployee; } }
```

Ugyanaz olvasható formában:

```java
import java.util.ArrayList;
 
public class EmployeeFactory {
    public Employee findEmployee(String name, 
            ArrayList<Employee> employeeList) {
        Employee foundEmployee = new Employee();
        for (Employee employee: employeeList) {
            if ( employee.name.equals(name)) {
                foundEmployee = employee;
            }
        }
        return foundEmployee;
    }
}
```

## Objektumok és adatszerkezetek

### Demeter törvénye

Ha van egy „A” objektumunk, az elérheti B objektum szolgáltatásait; de ne vegyük igénybe rajta keresztül „C” objektum szolgáltatásait.

Rossz:

```java
D d = a.ker().ker().ker();
```

Jó:

```java
B b = a.ker();
C c = b.ker();
D d = c.ker();
```

## Hibakezelés

### Kivételek hibakód helyett

Amíg nem voltak kivételek, hiba esetén egy hibakódot dobtunk. Most hogy vannak kivételek, hasznljuk ezeket a hibakódok helyett.

Kétféle kivétel van:

* ellenőrzött - Exception - kötelező kezelni
* ellenőrizettlen - RuntimeException - nem kötelező kezelni

Legyen például a egy egész szám bekérése. Ha nem egész számot ad meg a felhasználó, akkor InputMismatchException hibát kapunk.

```java
import java.util.InputMismatchException;
import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            System.out.print("Egész szám: ");
            int number = scanner.nextInt();
            System.out.println("A szám: " + number);
        } catch (InputMismatchException e) {
            System.err.println("Hiba! Csak egész számot adható meg!");
            System.err.println(e.getMessage());
        } finally {            
            scanner.close();
        }
    }
}
```

Ha bekérés sikeres a try{} blokkban, akkkor végrehajtódik a kiíratás is. Ha sikeretelen, a kiíratás már nem hajtódik végre, helyette a catch(){} ág hajtódik végre. Akár volt kivétel, akár nem, a finally {} blokkba írt rész mindenképpen végrehajtódik.

Használjunk bátran saját kivételeket.

Vegyünk egy példát, ahol valamilyen beérkező szövegben csak számokat fogadunk el. Szeretnénk saját hibát dobni a tisztább, érthetőbb kódért.

```java
if(!szoveg.matches("[0-9]+")) {
   throw new InputTypeError("Hiba! A bemenet nem megfelelő");
}
```

Az InputTypeError kivételt le meg kell valósítani. Lássunk egy lehetséges megvalósítást:

InputTypeError.java

```java
public class InputTypeError extends RuntimeException {
    public InputTypeError(String msg) {
        super(msg);
    }
}
```

Használata:

App.java:

```java
import java.util.Scanner;

public class App {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        try {
            System.out.print("Egész szám: ");
            String  numStr = scanner.nextLine();
            if(!numStr.matches("[0-9]+")) {
                throw new InputTypeError("Hiba! A bemenet hibás!");
            }
            int num = Integer.parseInt(numStr);
            System.out.println("A szám: " + num);
        } catch (InputTypeError e) {
            System.err.println("Hiba! Csak egész számot adható meg!");
            System.err.println(e.getMessage());
        } finally {            
            scanner.close();
        }
    }
}
```

### Ellenőrizetlen kivételek használata

Mindig használjunk ellenőrizetlen kivételeket. A Java nyelvben az ellenőrizetlen kivételek a futási idejű kivételek, angolul RuntimeException. Az előző fejezetben is ellenőrizetlen kivételt használtunk, itt most egy újabb példát látunk rá.

```java
import java.util.Scanner;
 
class InputTypeError extends RuntimeException {
    private String value;
    InputTypeError(String value) {
        this.value = value;
    }
    @Override
    public String toString() {
        return "Hiba! A megadott érték hibás: " + this.value;
    }
}
public class App {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Szám: ");
        String input = scanner.nextLine();
        scanner.close();
        if(!input.matches("^[0-9]+$")) {
            throw new InputTypeError(input);
        }
 
    }
}
```

### Hibakezelés leválasztása

A hibákat kezelni kell. A hibák kezelését viszont bízzuk egy külön metódusra. Ha van egy readFile() metódus, azt nevezzük át tryReadFile()-ra. Ebben valósítjuk meg a fájlkezelést. A kivételeket viszont itt továbbdobjuk.

Ugyanakkor írunk egy readFile() metódust, amiben csak a hibakezeléssel foglalkozunk.

```java
public static ArrayList<Employee> readFile() {
    ArrayList<Employee> employeeList = new ArrayList<>();
    try {
        employeeList = tryReadFile();
    }catch(FileNotFoundException e) {
        System.err.println("Hiba! A fájl nem található!");
    }
    return employeeList;
}
private static ArrayList<Employee> tryReadFile() 
throws FileNotFoundException {
    ArrayList<Employee> employeeList = new ArrayList<>();
    FileReader fileReader = new FileReader("adat.txt");
    Scanner scanner = new Scanner(fileReader);

    while(scanner.hasNext()) {
        String line = scanner.nextLine();
        String[] array = line.split(":");
        Employee employee = new Employee();
        employee.name = array[0];
        employee.city = array[1];
        employeeList.add(employee);
    }
    scanner.close();
    return employeeList;
}
```

#### Fájl olvasása

```java
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.Scanner;

public class Solution {
  public void readFile() {
      try {
          tryReadFile();
      }catch(FileNotFoundException e) {
          System.err.println("Hiba! A beolvasás sikertelen!");
          System.err.println(e.getMessage());    
      }
  }

  public void tryReadFile() throws FileNotFoundException {
      File file = new File("data.txt");
      try(Scanner sc = new Scanner(file)) {
        while(sc.hasNextLine()) {
            System.out.println(sc.nextLine());
        }
      }
  }
}
```

#### Fájlbaírás

```java
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;

public class Solution {
    public void writeFile() {
        try {
            tryWriteFile();
        }catch(IOException e) {
            System.err.println("Hiba! A kiírás sikertelen!");
            System.err.println(e.getMessage());    
        }
    }

    public void tryWriteFile() throws IOException {
        try(
            FileWriter fw = new FileWriter(
                "data".txt", 
                Charset.forName("utf-8"), 
                true)
        ) {
            osw.write("aaaa");
            osw.write(":bbbb");
            osw.write("\n");
        }
    }
}
```

### Null érték visszaadása

Ne adjunk vissza null értéket. Ha vizsgálunk egy visszaadott értéket, ne a null értéket vizsgáljuk, inkább vizsgáljuk például a méretet.

DataService.java:

```java
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class DataService {
    String fileName = "emp.txt";
    public ArrayList<Employee> readFile() {

        // Null értékkel inicializálunk:
        ArrayList<Employee> empList = null; //<<< null érték
        
        try {
            empList = tryReadFile();
        } catch (FileNotFoundException e) {
            System.err.println("Hiba! A fájl nem található!");
            System.err.println(e.getMessage());
        }
        return empList;
    }
    private ArrayList<Employee> tryReadFile() 
            throws FileNotFoundException {
        ArrayList<Employee> empList = new ArrayList<>();
        File file = new File(fileName);
        Scanner sc = new Scanner(file);
        while(sc.hasNext()) {
            String line = sc.nextLine();
            String[] lineArray = line.split(":");
            Employee emp = new Employee(
                Integer.parseInt(lineArray[0]),
                lineArray[1],
                lineArray[2],
                Double.parseDouble(lineArray[3])
            );
            empList.add(emp);
        }
        sc.close();
        return empList;
    }    
}
```

App.java:

```java
import java.util.ArrayList;

public class App {
    public static void main(String[] args) throws Exception {
        ReDataService ds = new ReDataService();
        ArrayList<Employee> empList = ds.readFile();

        // Null értéket vizsgálunk
        if (empList != null) {
            printEmployees(empList);
        }        
    }
    private static void printEmployees(ArrayList<Employee> empList) {
        for(Employee emp : empList) {
            System.out.println(emp.name);
        }
    }
}
```

Null érték helyett:

```java
ArrayList<Employee> empList = new ArrayList<>();
```

Méretet vizsgálunk az App.java fájlban:

```java
DataService ds = new DataService();        
ArrayList<Employee> empList = ds.readFile();
if (empList.size() > 0) {
    printEmployees(empList);
}
```

Minta projekt:

* [https://github.com/oktat/example_readfile.git](https://github.com/oktat/example_readfile.git)

Egy tisztább példa:

* [https://github.com/oktat/clreadfile.git](https://github.com/oktat/clreadfile.git)

## Határok

A külső eszközöket ne építsük rögtön bele az éles alkalmazásba. Előbb próbáljuk ki.

* MariaDB Connector
* PDF generáló

## Unit tesztek

### Alapvetések

Használjunk TDD-t.

A **TDD** a **Test Driven Development**.

TDD szabályok:

* Előbb írjunk egy tesztet ami kudarcot vall.
* Csak addig fejlesszük a tesztet, amíg kudarcot vall.
* Az ipari kódból csak annyit írjunk, ami teljesíti a tesztet.

További szabályok:

* egy teszt - egy állítás
  * Egy tesztben egyetlen assert szerepeljen.
* egy teszt - egy elem
  * egy teszt csak egyetlen elemet teszteljen.

Egyetlen állítás:

```java
import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import lan.zold.Triangle;

public class TriangleTest {
    Triangle triangle;
    @BeforeTest
    public void initTriangle() {
        triangle = new Triangle();
    }
    @Test
    public void calcArea_30_35() {
        double actual = triangle.calcArea(30, 35);
        double expected = 525.0;
        Assert.assertEquals(actual, expected);
    }
    @Test
    public void calcArea_130_135() {
        double actual = triangle.calcArea(130, 135);
        double expected = 8775.0;
        Assert.assertEquals(actual, expected);
    }
}
```

Egyetlen elemet tesztelünk:

```txt
app01/
  `-test/
     |-TriangleTest.java
     `-CircleTest.java
```

### TDD gyakorlat

#### Ciklus 01

##### Tesztírás 01

src/test/java/TriangleTest.java:

```java
public class TriangleTest {
    Triangle triangle;
}
```

##### Iparikód írása 01

src/main/java/lan/zold/Triangle.java:

```java
package lan.zold;

public class Triangle {
    
}
```

##### Refaktorálás 01

Most már importálhatjuk a tesztfájlban.

src/test/java/TriangleTest.java:

```java
import lan.zold.Triangle;

public class TriangleTest {
    Triangle triangle;
    @BeforeTest
    public void initTriangle() {
        triangle = new Triangle();
    }    
}
```

#### Ciklus 02

##### Tesztírás 02

Fejlesszük a tesztet, csak annyira, hogy hibára fusson:

```java
@Test
public void calcArea_30_35() {
    triangle.calcArea(30, 35);
}
```

A teljes tesztkód:

```java
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import lan.zold.Triangle;

public class TriangleTest {
    Triangle triangle;
    @BeforeTest
    public void initTriangle() {
        triangle = new Triangle();
    }
    @Test
    public void calcArea_30_35() {
        triangle.calcArea(30, 35);
    }
}
```

##### Iparikód írása 02

src/main/java/lan/zold/Triangle.java:

```java
package lan.zold;

public class Triangle {
    public void calcArea(double base, double height) {}
}
```

##### Refaktorálás 02

Megnézzük van-e mit rafaktorálni. Nem találunk semmit.

#### Ciklus 03

##### Tesztírás 03

Fejlesszük a tesztet:

```java
@Test
public void calcArea_30_35() {
    double actual = triangle.calcArea(30, 35);
}
```

Most már visszatérési értéket is várunk.

##### Iparikód írása 03

```java
public double calcArea(double base, double height) {
    return 0;
}
```

##### Refaktorálás 03

Megnézzük van-e mit rafaktorálni. Nem találunk semmit.

#### Ciklus 04

##### Tesztírás 04

Fejlesszük a tesztet:

```java
@Test
public void calcArea_30_35() {
    double actual = triangle.calcArea(30, 35);
    Assert.assertEquals(actual, 525);
}
```

##### Iparikód írása 04

```java
public double calcArea(double base, double height) {
    return 525;
}
```

##### Refaktorálás 04

Nézzük meg mit lehet rafaktorálni:

```java
@Test
public void calcArea_30_35() {
    double actual = triangle.calcArea(30, 35);
    double expected = 525.0;
    Assert.assertEquals(actual, expected);
}
```

#### Ciklus 05

##### Tesztírás 05

Írjunk egy újabb tesztet:

```java
@Test
public void calcArea_130_135() {
    double actual = triangle.calcArea(130, 135);
    double expected = 8775.0;
    Assert.assertEquals(actual, expected);
}
```

A teljes tesztkód most:

```java
import org.testng.Assert;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import lan.zold.Triangle;

public class TriangleTest {
    Triangle triangle;
    @BeforeTest
    public void initTriangle() {
        triangle = new Triangle();
    }
    @Test
    public void calcArea_30_35() {
        double actual = triangle.calcArea(30, 35);
        double expected = 525.0;
        Assert.assertEquals(actual, expected);
    }
    @Test
    public void calcArea_130_135() {
        double actual = triangle.calcArea(130, 135);
        double expected = 8775.0;
        Assert.assertEquals(actual, expected);
    }
}
```

##### Iparikód írása 05

```java
public double calcArea(double base, double height) {
    return base * height / 2;
}
```

##### Refaktorálás 05

Megnézzük van-e refaktorálni való. Nincs.
Így folytatjuk tovább.

## Osztályok

### Osztályok szervezése

* Az osztály a változók listájával kezdődjön (adattagok).
* Az első helyen nyilvános statikus állandók.
* Ez után a privát statikus változók jönnek.
* Végül a privát példányváltozók. (Publikus példányváltozókra ritkán van szükség.)
* A változókat a nyilvános függvények kövessék.
* A privát segédfüggvények kövessék a nyilvános függvényeket közvetlenül.

Az egészet fentről lefele lehessen olvasni.

### További követelmények

* Kis osztályok
  * legyenek az osztályok kicsik
  * és még kisebbek

Egyetlen felelősségi kör elve

* Az osztálynak vagy modulnak egyetlen oka legyen a változásra.

A következő egy rossz példa. A printEmployees egy nézet megvalósítása, nincs helye az App osztályban.

App.java:

```java
import java.util.ArrayList;

public class App {
    public static void main(String[] args) throws Exception {
        DataService ds = new DataService();        
        ArrayList<Employee> empList = ds.readFile();
        if (empList.size() > 0) {
            printEmployees(empList);
        }
    }
    private static void printEmployees(ArrayList<Employee> empList) {
        for(Employee emp : empList) {
            System.out.println(emp.name);
        }
    }
}
```

Összetartás

* Az osztály minden tagfüggvénye használjon egy vagy több példányváltozót.

## S.O.L.I.D. elvek

* Single Responsibility Principle
  * Egy felelősség elve.
  * Egy osztály csak egyetlen dologért legyen felelős.
  * Egy oka legyen a létezésének.

* Open/Closed Principle
  * Nyílt/zárt elv.
  * Egy osztály legyen nyílt a kiterjesztésre, de zárt a módosításra.

* Liskov substitution principle
  * Liskov helyettesítési elv.
  * Egy osztály helyettesíthető legyen a leszármazott osztályával.
  * A helyettesítés során, a helyes működés ne változzon.

* Interface segregation principle
  * Interface elválasztási elv.
  * Több speciális interfész jobb, mint egy általános.

* Dependency inversion principle
  * Függőség megfordítási elv.

A S.O.L.I.D. elvek bővebben a következő helyen:

* [https://szit.hu/doku.php?id=oktatas:programozas:tiszta_kod#solid](https://szit.hu/doku.php?id=oktatas:programozas:tiszta_kod#solid)
