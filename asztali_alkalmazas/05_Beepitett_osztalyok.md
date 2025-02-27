# Asztali alkalmazások fejlesztése - Beépített osztályok

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Matematikai osztály](#matematikai-osztály)
* [Véletlen szám generálás](#véletlen-szám-generálás)
* [Konvertálás](#konvertálás)
* [Bevitel](#bevitel)
* [Karakterláncok](#karakterláncok)

## Matematikai osztály

A Math osztály matematikai kifejezések írását segíti. Készítsünk egy új Java alkalmazást a gyakorláshoz. Lehet a nevek például "matek".

A Math osztály a java.lang csomagból érhető el, így nem szükséges importálni.

### A pí értéke

A PI értékét példáu így kapjuk meg:

```java
System.out.println(Math.PI);
```

Egyszerűen leírjuk a Math osztály nevét, majd utána írjuk mit szeretnénk. A PI egy osztályállandó, ami tartalmazza PI érétéket. A kiírtáshoz csak leírjuk: Math.PI formában. Írjuk az utasítást az alkalmazásunkba, majd nézzük meg a futtatás eredményét.

### A gyökvonás

A gyökvonásnál ugyanígy használjuk a Math osztály. Az sqrt() viszont egy függvény, ezért kisbetűvel írjuk, a név után pedig kell a szokásos zárójel. A példánkban 9 gyökét szeretnénk megtudni.

```java
System.out.println(Math.sqrt(9));
```

### Hatványozás

```java
System.out.println(Math.pow(2, 8));
```

### Kerekítés

```java
System.out.println(Math.round(1.4));
System.out.println(Math.round(1.5));
```

```java
System.out.println(Math.ceil(1.1));
System.out.println(Math.floor(1.9));
```

### Trigonometria

A trigonometriai függvények radiánban várják az értéket. Ha nekünk szög értékünk van, át kell azt számolni radiánba.

```java
double szog = 1;
double rad = szog * Math.PI / 180;
System.out.println(Math.sin(rad));
System.out.println(Math.tan(rad));
System.out.println(Math.cos(rad));
```

## Véletlen szám generálás

Véletlen számot létrehozhatunk a Math osztállyal és a Random osztállya. Itt most a Random osztályt fogjuk használni. A Random osztály a java.util csomagban. A java.util osztályai nem használhatók csak importálás után. Ezért használat előtt importálni kell. Az importálás a fájl elején egy ilyen sort jelent:

```java
import java.util.Random;
```

A Random osztályt használat előtt példányosítani kell. A példányosításra példa:

```java
Random random = new Random();
```

A példányosítással létrehoztunk egy **random** nevű objektumot. Ezen az objektumon futtathatjuk a véletlenszámot generáló metódusokat. Egész szám generálása például:

```java
int veletlenSzam = random.nextInt(3);
```

Egész szám generáláshoz a 3-as értéket adtuk meg paraméterként. Ebben az esetben a következő számok jelenhetnek meg a **veletlenSzam** változóban: 0, 1, 2. Ha **nextInt(5)** formában hívom akkor a 0, 1, 2, 3, 4 számok valamelyikét kapjuk.

Foglaljuk össze mit kellett csinálni a véletlenszám generáláshoz:

```java
import java.util.Random;
//...
Random random = new Random();
int veletlenSzam = random.nextInt(3);
```

Importáltuk a Random osztályt. Valahol egy metódusban példányosítottuk a Random osztályt random néven. Ezt követően a nextInt(3) hívással generáltunk egy véletlenszámot, majd tároltuk a veletlenSzam nevű változóban.

Lehetséges teljes kód, kiíratással:

```java
import java.util.Random;
public class App {
  public static void main(String[] args) {
    Random random = new Random();
    int veletlenSzam = random.nextInt(3);
    System.out.println("Véletlen szám: " + veletlenSzam);
  }
}
```

Írjuk meg a programot, majd ellenőrizzük, milyen számokat kapunk.

### Kockadobás

Kockadobás szimulációban 1, 2, 3, 4, 5, 6-os számokat várunk. Ha nextInt() függvényt 6-os értékkel hívjuk akkor 0, 1, 2, 3, 4, 5 számokat kapjuk. Ha azonban a kapott számhoz mindig hozzáadunk 1-t, akkor a kapott számok: 1, 2, 3, 4, 5, 6, vagyis megkapjuk a kockadobásokat.

Készítsünk egy Java alkalmazást például **kocka** néven, majd írjuk meg azt a programot, ami egy kockadobást szimulál.

```java
import java.util.Random;
//...
Random random = new Random();
int dobas = random.nextInt(6) + 1;
```

A programot egészítsük kiíratással.

A lehetséges teljes kód:

```java
import java.util.Random;
public class App {
  public static void main(String[] args) {
    Random random = new Random();
    int dobas = random.nextInt(6) + 1;
    System.out.println("Kockadobás: " + dobas);
  }
}
```

## Konvertálás

Az alkalmazások írása során sokszor karakterláncként (sztringként) kapjunk valamilyen számot. Ha ezzek az értékekkel számolni szeretnénk át kell alakítanunk valamilyen szám típussá.

Készítsünk egy **konvert** nevű alkalmazast ahol kipróbálhatjuk a következő fejezetek utasításait.

### Sztring egész számmá

Ha a 45 értéket idézőjelbe tesszük, akkor az sztring lesz. Egész szám típusú változoba ha szeretnénk tárolni az Integer osztállyal konvertálhatjuk. Az Integer osztály a java.lang csomagban van, így használat előtt nem szükséges importálni. Az importálást a parseInt() függvénnyel lehet megtenni, ami egy paraméterként egy sztringet vár. Nézzük meg a következő programot:

```java
System.out.println(Integer.parseInt("45"));
```

Vegyünk fel például egy **szoveg** nevű változót, tegyük ebbe a számot sztringként, majd tároljuk egy **szam** nevű változóban:

```java
String szoveg = "45";
int szam = Integer.parseInt(szoveg);
System.out.println(szam);
```

### Sztring valós számmá

Valós szám esetén használhatjuk a Double osztály, parseDouble() metódusát. Mivel a Double osztály is a java.lang változóban van, ezt sem kell importálni. Próbáljuk meg a következő kódot:

```java
System.out.println(Double.parseDouble("45.1234567"));
```

Írjuk át a programot, használjunk változókat:

```java
String szoveg = "45.1234567";
double szam = Double.parseDouble(szoveg);
System.out.println(szam);
```

### Szám konvertálása szöveggé

Nézzük meg a konvertálást visszafelé. Számból szeretnénk szöveget. A String osztály valueOf() metódusát fogjuk használni.

```java
int szam = 30;
String szoveg = String.valueOf(szam);
System.out.println(szoveg);
```

Próbáljuk ki a programrészletet. Valós számok esetén ugyanez az eljárás.

## Bevitel

A bevitel sokkféleképpen meg lehet valósítani Java nyelven. Ebben a leírásban a Scanner osztályt fogjuk használni. a Scanner osztály a java.util csomagvan, ezért először importálni kell. Az importálást követően egy metódusban hozzunk létre egy példányt. A bekéréshez a nextLine() metódust fogjuk használni.

```java
import java.util.Scanner;
//...

Scanner scanner = new Scanner(System.in);
String nev = scanner.nextLine();
```

A nextLine() metódus egy szöveget vár, amit egy Enter billenytűvel fejezünk be.
Ajánlott a számok bekérése is szövegként, a nextInt() vagy a nextDouble() metódus helyett, mivel így könnyen ellenőrizhetjük a bevitel helyességét később.

Egész számok bekérése:

```java
Scanner scanner = new Scanner(System.in);
String korStr = scanner.nextLine();
int kor = Integer.parseInt(korStr);
```

Valós szám bekérése:

```java
Scanner scanner = new Scanner(System.in);
String hoStr = scanner.nextLine();
double kor = Double.parseDouble(hoStr);
```

## Karakterláncok

### A karakterláncokról

A karakterlácok, angolul **string** néven ismert. A magyar nyelvben is kezd meghonosodni a "sztring" megfelelője. A Java nyelvben nincs string primitív típus, így karakterlánc csak a String osztállyal hozható létre. Mivel gyakran használt osztály, ezért new hívása nélkül is létrehozható String objektum, a konstruktor ilyenkor automatikusan hívódik. Ebből következik, hogy a String objektumokat úgy hozhatunk létre mint primitív típusokat.

```java
String szoveg;
String gyumolcs = "alma";
```

A new operátor ettől függetlenül használható, de így hosszabb utasítást kapunk:

```java
String gyumolcs = new String("alma");
```

### Sztringek hossza

A length() metódussal lekérdezhetjük egy sztirng hosszát. Java nyelvben ez a karakterek számát jelenti.

```java
String szo = "alma";
System.out.println(szo.length());
```

### Karakterláncok összefűzése

A karakterláncok összefűzését konkatenálás néven ismerjük. Java nyelven a konkatenálás lehetséges a "+" operátorral és a concat() metódussal.

```java
String szoveg = "alma";
String eredmeny = szoveg + " szilva";
```

```java
String szoveg = "alma";
String eredmeny = szoveg.concat(" szilva");
```

Mindkét konkatenálás esetén az eredményt egy új változóban tároltuk. A concat() metódus nem változtatja meg az eredeti szoveg nevű változó tartalmát. A String változók ezért megváltoztathatatlanok, angolul immutable.

### Adott indexen a karakter lekérdezése

```java
String gyumolcs = "alma";
char ch = gyumolcs.charAt(2); // eredménye m betű
```

### Karakterlánc összehasonlítása

Karakterláncot az equals() metódussal hasonlítunk össze, aminek eredménye egy logikai típus. Az "==" operátor nem vezet eredményre, mert a két objektum címét hasonlítja össze.

```java
String gyumolcs = "alma";
boolean eredmeny = gyumolcs.equals("alma");
```

### Karakterláncok tartalma

A contains() metódussal megvizsgálhatjuk, hogy egy sztring objektum tartalmaz egy bizonyos karakterláncot vagy nem.

```java
String gyumolcsok = "alma körte barack";
boolean eredmeny = gyumolcsok.contains("körte");
```

### Hol található a sztring

Az első előfordulás helyét mutatja az indexOf() metódus.

```java
String gyumolcs = "alma körte barack";
int index = gyumolcs.indexOf("körte");
System.out.println(index);
```

Az utolsó előfordulás:

```java
String gyumolcs = "alma körte barack körte";
int index = gyumolcs.lastIndexOf("körte");
System.out.println(index);
```

Ha a sztring nem található az eredmény -1.

Adott szóval kezdődik egy sztring?

```java
String gyumolcs = "alma körte barack körte";
boolean igykezdodik = gyumolcs.startsWith("körte");
System.out.println(igykezdodik);
```

Hogyan végződik?

```java
String gyumolcs = "alma körte barack körte";
boolean igykezdodik = gyumolcs.endsWith("körte");
System.out.println(igykezdodik);
```

### Részsztring

Az 5-dik karaktertől:

```java
String szoveg = "kereszteződés";
String resz = szoveg.substring(5);
System.out.println(resz);
```

Az 5-s indextől a 8-s indexig:

```java
String szoveg = "kereszteződés";
String resz = szoveg.substring(5, 8);
System.out.println(resz);
```

### Szöveg csere

Cseréljünk egy szövegrészt.

```java
String szoveg = "kereszteződés";
String ujszoveg = szoveg.replace("eződés", "utak");
System.out.println(ujszoveg);
```

### Kis- és nagybetűs

A nagybetűs szövegből készítsünk kisbetűset:

```java
String szoveg = "KERESZTEZŐDÉS";
String ujszoveg = szoveg.toLowerCase();
System.out.println(ujszoveg);
```

A kisbetűs szöveget nagybetűssé a toUpperCase() függvénnyel konvertálhatjuk.

```java
String szoveg = "kereszteződés";
String ujszoveg = szoveg.toUpperCase();
System.out.println(ujszoveg);
```

### Whitespace karakterek

A whitespace karakterek a nem látható karakterek. A sztring elejéről és végéről a trim() függvénnyel törölhetjük a whitespace karaktereket.

```java
String szoveg = "   kereszteződés    ";
String ujszoveg = szoveg.trim();
System.out.println(ujszoveg);
```

### Darabolás

```java
String szoveg = "1:Para Béla:Szeged:878";
String[] szavak = szoveg.split(":");
System.out.printf("Név: %s\n", szavak[1]);
```

#### Darabolás gyakorlat

```java
String line = "Erős István:Szeged:385";
String[] parts = line.split(":");
System.out.println(Arrays.toString(parts)); 
// [Erős István, Szeged, 385]
```

```java
String line = "Erős István : Szeged : 385";
String[] parts = line.split(" *: *");
System.out.println(Arrays.toString(parts));
//[Erős István, Szeged, 385]
```

```java
String line = "Erős István; Szeged : 385";
String[] parts = line.split("[;: ]+");
System.out.println(Arrays.toString(parts));
//[Erős, István, Szeged, 385]
```

```java
String line = "   Erős István   :   Szeged   :   385   ";
String[] parts = line.trim().split(" *: *");
System.out.println(Arrays.toString(parts)); 
// [Erős István, Szeged, 385]
```

```java
String line = "Erős István;Szeged:385";
String[] parts = line.split("[;:]");
System.out.println(Arrays.toString(parts)); 
// [Erős István, Szeged, 385]
```

### A StringBuilder és a StringBuffer

A StringBuilder módosítható objektumot biztosít a porgramozó számára.

```java
StringBuilder szoveg = new StringBuilder("kereszteződés");
System.out.println(szoveg);
```

```java
StringBuffer szoveg = new StringBuffer("kereszteződés");
System.out.println(szoveg);
```

A StringBuffer szálbiztos, a StringBuilder nem. A StringBuffer használata ezért mindig lassabb. Többszálas programozás esetén a StringBuffer objektumok nem lép fel probléma, de ez többlet munkát igényel, de ezért nevezzük szálbiztosnak.

A StringBuffer és a StringBuilder osztályoknak van egy append() és egy insert() függvénye.

```java
StringBuffer szoveg = new StringBuffer("alma");
szoveg.append(" körte");
szoveg.append(" barack");
System.out.println(szoveg);
```
