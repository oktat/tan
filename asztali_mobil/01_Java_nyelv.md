# Java nyelv

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Java fejlesztés](#java-fejlesztés)
* [Java Helló Világ program](#java-helló-világ-program)
* [Megjegyzések a Java nyelvben](#megjegyzések-a-java-nyelvben)
* [Kivitel](#kivitel)
* [Operátorok](#operátorok)
* [Különleges karakterek](#különleges-karakterek)
* [Adattípusok](#adattípusok)
* [Formázott kivitel](#formázott-kivitel)
* [Matematikai osztály](#matematikai-osztály)
* [Véletlen szám generálás](#véletlen-szám-generálás)
* [Konvertálás](#konvertálás)
* [Bevitel](#bevitel)
* [Szelekció](#szelekció)
* [Iteráció](#iteráció)
* [A for forEach szerű működése](#a-for-foreach-szerű-működése)
* [Tömbök](#tömbök)
* [Listák](#listák)
* [Az enum típus](#az-enum-típus)
* [Sztringkezelés](#sztringkezelés)
* [Függvények](#függvények)
* [Fájlkezelés](#fájlkezelés)
* [Argumentmok olvasása](#argumentmok-olvasása)
* [Debug](#debug)
* [Gyakorlat](#gyakorlat)

## Java fejlesztés

A Java nyelvet a **Sun Microsystem** programozói kezdték fejleszteni, 1991-ben. Később az Oracle felvásárolta a céget, így a Java most az ő tulajdona.

A Java nyelv még mindig az 1-es fő verziószámnál tart. Az egyes Java verziók:

* 1.1
* 1.2
* 1.3
* 1.4
* ...
* 1.16
* 1.17
* 1.18
* 1.19
* 1.20
* 1.21
* 1.22

Az egyes verziókra azonban a főverzió nélkül szokás hivatkozni. Az 1.17-es verzióra például csak 17-s verzióként hivatkozunk.

Java technológiák:

* Java JRE - csak futtatásra alkalmas
* Java JDK - fejlesztésre és futtatásra egyaránt alkalmas

Dokumentáció:

* [https://docs.oracle.com/javase/](https://docs.oracle.com/javase/)

## Java Helló Világ program

Készítsük el az App.java nevű fájlt.

App.java:

```java
public class App {
    public static void main(String[] args) {
        System.out.println("Helló Világ!");
    }
}
```

A forráskód fordítása:

```bash
javac App.java
```

Kapunk egy App.class állományt. Futtassuk:

```bash
java App
```

Vegyük észre, hogy a .class kiterjesztést nem szükséges megadni.

Windowson szükség lehet a karakterkódolás megadására:

```bash
javac -encoding utf8 App.java
```

Megfelelő az utf8, utf-8, UTF8 és az UTF-8 is.

## Megjegyzések a Java nyelvben

```java
// egy soros
```

```java
/* több
soros 
megjegyzés
*/
```

## Kivitel

A képernyőre írni a System osztály áll rendelkezésre. Ennek van két tagja:

* out
* err

Az out és az err mezők is a képernyőt jelentik. A programot használó szakember képes szétválasztani a kétféle kimenetet. Ha egy normál kiíratást végzünk, akkor az **out** mezőn keresztül kell kiíratni. Ha hibát írunk a képernyőre, akkor az **err** mezőn keresztül kell kiíratni.

```java
System.out.println("Normál kimenet.");
System.err.println("Hiba! Ez nem lesz így jó!");
```

A kivitelhez a következő metódusok állnak rendelkezésre:

* println()
* printf()
* print()

Mi a különbség? A println() egy sortörést is a képernyőre ír. A printf() formázott kimenetet tesz lehetővé. A print() utasítás sortörés nélkül ír a képernyőre.

```java
System.out.print("Kiíratás sortörés nélkül");
```

## Operátorok

### Aritmetikai operátorok

A Java nyelv aritmetikai operátorai a +, -, *, / és a % karakter.

```java
System.out.println(1 + 2);
System.out.println("1 + 2 = " + (1 + 2));
System.out.println(3 - 2);
System.out.println(3 * 2);
System.out.println(3 / 2);
System.out.println(3 % 2);
```

A % operátor a számok osztása során a maradékot adja.

### Egyoperandusú operátorok

| Operátor | Leírás |
|-|-|
| + | Az értéket adja |
| - | Előjelet vált |
| ++ | Inkrementálás |
| -- | Dekrementálás |
| !  | Negálás |

A + operátor csak a szimetria kedvéért jött létre még a C nyelvben.

### Összehasonlító operátor

| Operátor | Leírás |
|-|-|
| == | egyenlő |
| != | nem egyenlő |
| >  | nagyobb mint |
| >= | nagyobb vagy egyenlő |
| <  | kisebb mint |
| <= | kisebb vagy egyenlő |

### Feltételes operátorok

| Operátor | Leírás |
|-|-|
| && | ÉS művelet |
| \|\| | VAGY művelet |
| ?: | Hármas operátor |

### Bitenkénti operátorok

| Operátor | Leírás |
|-|-|
| ~ | Komplemensképzés |
| << | előjeles balra mozgatás |
| >> | előjeles jobbra mozgatás |
| >>> | elője nélküli jobbra mozgatás |
| & | bitenkénti ÉS |
| \| | bitenkénti VAGY |
| ^ | bitenkénti Kizáró VAGY |

### Precedencia

| Operátorok | Leírás |
|-|-|
| ++, --, !, ~ | Inkrementálás, dekrementálás, logikai és bitenkénti negálás |
| * / % | szorzás, osztás, moduló |
| + - | összeadás, kivonás |
| << >> >>> | bitenkénti léptetések |
| < > >= <= | összehasonlítások |
| == != | egyenlő, nem egyenlő |
| & | bitenkénti AND |
| ^ | bitenkénti XOR |
| \| | bitenkénti OR |
| && | logikai AND |
| \|\| | logikai OR |
| ?: | feltétele kifejezés |
| = += -= *= /= %= ^= &= \|= <<= >>= >>>= | értékadó operátorok |

### Inkrementálás és dekrementálás

Előbb átadja az értéket, majd inkrementálja 1-gyel az "a" értékét.

```java
int a = 30;
b = a++;
System.out.println(b); // 30
```

Előbb inkrementálja "a" értékét 1-gyel, majd átadja a megnövelt értéket.

```java
int a = 30;
b = ++a;
System.out.println(b); // 31
```

A dekrementálás ugyanígy működik.

## Különleges karakterek

Ha kiíratom a "mentés" szót, az összes karakter normál karakterként viselkedik, mindegyik megjelenik a képernyőn.

```java
System.out.println("mentés")
```

Néhány karakternek speciális jelentést adhatunk, ha elé teszünk egy "\" visszaperjel karaktert.

```java
System.out.println("me\ntés")
```

Nézzük meg mi a kiírás eredménye. Most tegyük a "t" karaktert különlegessé.

```java
System.out.println("men\tés")
```

Azokat a karaktereket, amelyeknek speciális jelentést adhatunk, **escape szekvenciáknak** nevezzük.

A következő táblázat bemutatja az escape szekvenciákat.

| Karakter | Jelentés |
|-|-|
| \n | új sor |
| \t | tabulátor |
| \' | felsővessző kiíratása |
| \" | idézőjel kiíratása |
| \\ | visszaperjel |
| \r | kocsi vissza (kiírás a sor elejéről) |
| \f | lapdobás |
| \b | visszatörlés (backspace) |
| \uxxxx | Unicode karakter (xxxx) |

## Adattípusok

### Egész számok

| Típus | Szám | Tartomány |
|-|-|-|
| byte | 1 byte | -128 - 127 |
| short | 2 bytes | -32 768 - 32 767 |
| int | 4 bytes | -2 147 483 648 - 2 147 483 647 |
| long | 8 bytes | -9 223 372 036 854 775 808 - 9 223 372 036 854 775 807 |

### Valós számok

| Típus | Szám | Tartomány |
|-|-|-|
| double | 8 bytes | 4.9e-324 - 1.7976931348623157e+308 |
| float | 4 bytes | 1.4e-45 - 3.4028235e+38 |

### Logikai típus

| Típus | Szám | Tartomány |
|-|-|-|
| boolean | 1 byte | false vagy true |

```java
boolean igaz = true;
```

### Karakter típus

| Típus | Szám | Tartomány |
|-|-|-|
| char | 2 bytes | 0 - 65535 |

```java
char karakter = 'a';
System.out.println(karakter);
```

### Burkolóosztályok

Primitív típusok burkolóosztályai

| Típus | Érték | csomagoló osztály | Tartomány |
|-|-|-|-|
| boolean | ture, false | Boolean | true vagy false |
| char | karakter | Character | 0 - 65535 |
| byte | byte | Byte | -128 - 127 |
| short | short | Short | -32 768 - 32 767 |
| int | int | Integer | -2 147 483 648 - 2 147 483 647 |
| long | long | Long | -9 223 372 036 854 775 808 - 9 223 372 036 854 775 807 |
| float | float | Float | 1.4e-45 - 3.4028235e+38 |
| double | double | Double | 4.9e-324 - 1.7976931348623157e+308 |

### Konverzió szélesítéssel

```java
byte b = 1;
short s = b;
int i = s;
long l = i;
```

### Konverzió szűkítéssel

```java
long l = 1;
int i = (int) l;
float f = (float) i;
double d = (double) f;
```

Ha megpróbáljuk "l" változó tartalmát az "i" változóba tenni, hibát kapunk, mivel long típusba akkora szám is lehet, ami nem fér bele az int típusba. Ezért típuskénykényszerítást alkalmazunk.

A típuskényszerítés esetén egy zárójelpárba írjuk azt a típust amib szeretnénk kényszerítani az utána következő változó értékét.

### Változók használata

A változókat használat előtt deklarálni kell. Ez abból áll, hogy megmondjuk milyen típusú változó hozunk létre.

```java
float f = 1.0f;
double d = 1.0;
float f2 = 1.0F;
double d2 = 1.0D;
```

Kifejezések:

```java
int i = 1;
double d = 1.0 + i;
float f = 1.0f + i + (float) d;
```

## Formázott kivitel

Formázott kimenetet a printf() függvénnyel valósíthatunk meg.

A printf() függvény első paramétere egy formátumsztring, amit kötelező megadni. A formátumsztrinben írjuk le a következő paramétereket milyen formában írjuk ki. Mindenegyes paraméter számára a formátumsztringben egy fomátumkódot kell meghatározni.

A formátumkód "%" jellel kezdődik, és egy konverziós karakterrel végződik. Egész számok kiíratása esetén például "d" betűt kell megadni. Valós számok esetén egy "f" betűt.

A következő példában a második paraméter egy kifejezés, aminek az eredménye egy egész szám. A kifejezés eredményét úgy tudjuk megkapni, hogy egy "%d" fomártumkódot adunk meg.

```java
System.out.printf("1 + 2 = %d", 1 + 2);
```

Nézzük meg, hogyan tudjunk több paramétert is kiíratni a formátumsztringben:

```java
System.out.printf("%d + %d = %d", 1, 2, 1 + 2);
```

Szélesség megadása:

```java
System.out.printf("%10d", 15);
```

Pontosság:

```java
System.out.printf("%.2f", 15.12345);
```

Ezredes elválasztó:

```java
System.out.printf("%,f\n", 1234567812345.12345678);
```

Jelzők

| Jel | Leírás |
|-|-|
| + | előjel |
| - | balra igazítás (szélesség meghatározással együtt) |
| 0 | vezető nullák megjelenítése |
| , | ezredes elválasztó |
| # | alternatív formátum (o, x és X esetén) |
| ' ' | egy vezető szóköz pozitív számok számára |
| '(' | negatív számok zárójelbe |

Konverziós karakterek

| Konverziós karakter | Leírás |
|-|-|
| 's', 'S' | Karaktersorozat |
| 'd' | egész szám |
| 'f' | valós szám |
| 'c', 'C' | karakter |
| % | százalékjel megjeleníétése |
| 'n' | platform specifikus sorelválasztó |

## Matematikai osztály

Abszolút érték:

```java
System.out.println(Math.abs(-1));
```

Gyökvonás:

```java
System.out.println(Math.sqrt(9));
```

Hatványozás:

```java
//2 a 8-dik hatványon:
System.out.println(Math.pow(2,8));
```

PI értéke:

```java
System.out.println(Math.PI);
```

Trigonometria:

```java
double szog = 1;
double rad = szog * Math.PI / 180;
System.out.println(Math.sin(rad));
System.out.println(Math.cos(rad));
System.out.println(Math.tan(rad));
```

A trigonometriai függvények radiánban várják az értéket. Ezért a szög értékeket át kell váltani radiánba.

Kerekítések:

```java
System.out.println(Math.ceil(4.1));
System.out.println(Math.floor(4.9));
System.out.println(Math.round(4.5));
```

A ceil() mindig felfelé kerekít, a floor() mindig lefelé kerekít. A round() függvény a matematikai szabályai szerint kerekít.

## Véletlen szám generálás

Használhatjuk a Math osztályt:

```java
System.out.println((int) (Math.random() * 10) + 1);
```

A Random osztály használata:

```java
Random r = new Random();
System.out.println(r.nextInt(10) + 1);
```

## Konvertálás

Sztring egész számmá:

```java
String s = "1";
int i = Integer.parseInt(s);
```

```java
int i = 1;
String s = Integer.toString(i);
```

Double típussal:

```java
double d = 1.0;
String s = Double.toString(d);
```

```java
String s = "1.0";
double d = Double.parseDouble(s);
```

## Bevitel

A bevitelt többféleképpen szokás megvalósítani. Ebben a leírásban a java.util.Scanner osztályt használjuk.

A Scanner osztály használatához, importálni kel azt a java.util csomagból:

```java
import java.util.Scanner;
```

Egész szám bekérése:

```java
Scanner sc = new Scanner(System.in);
String numStr = sc.nextLine();
int num = Integer.parseInt(numStr);
```

A Scanner osztályt példányosítjuk. A konstruktornak át kell adni, mit szeretnénk szkennelni. A System.in a billentyűzetet jelképezi.

Valós szám bekérése:

```java
Scanner sc = new Scanner(System.in);
String numStr = sc.nextLine();
double num = Double.parseDouble(numStr);
```

Név bekérése:

```java
Scanner sc = new Scanner(System.in);
String name = sc.nextLine();
```

## Szelekció

A szelekciót az if és a switch utasításokkal lehet megvalósítani. Az if után egy zárójelben adjuk meg a feltételt. A feltétel egy logikai érték, vagy kifejezés kell legyen. Ha az eredmény igaz, akkor az if törzs részében végrehajtódnak az utasítások. Ellenkező esetben nem történik semmi.

```java
int i = 0;
if (i == 0) {
    System.out.println("i == 0");
}
```

Nézzük meg "ellenben" ággal is. Ha a feltétel hamis, akkor is szertnénk valamilyen tevékenységet elvégezni.

```java
int i = 0;
if (i == 0) {
  System.out.println("i == 0");
}else {
  System.out.println("i != 0");
}
```

Több ágú szelekciót valósítható mega az else if szerkezettel:

```java
int i = 0;
if (i == 0) {
  System.out.println("i == 0");
}else if (i == 1) {
  System.out.println("i == 1");
}else if (i == 2) {
  System.out.println("i == 2");
}
```

### Switch

A switch utasítás eleve több űgú szelekcióra lett kitaláva:

```java
int i = 0;
switch (i) {
  case 0:
    System.out.println("i == 0");
    break;
  case 1:
    System.out.println("i == 1");
    break;
  case 2:
    System.out.println("i == 2");
    break;
  default:
    System.out.println("i != 0, 1, 2");
}
```

A break utasítás elhagyása esetén a következő eset utasításai is végrehajtódnak.

## Iteráció

```java
for (int i = 0; i < 10; i++) {
  System.out.println(i);
}
```

```java
int i = 0;
while (i < 10) {
  System.out.println(i);
  i++;
}
```

```java
int i = 0;
do {
  System.out.println(i);
  i++;
} while (i < 10);
```

## A for forEach szerű működése

```java
int[] numbers = {1, 2, 3, 4, 5};
for (int number : numbers) {
  System.out.println(number);
}
```

## Tömbök

Egész számok tárolása:

```java
int[] numbers = {1, 2, 3, 4, 5};
for (int i = 0; i < numbers.length; i++) {
  System.out.println(numbers[i]);
}
```

Egész számok tárolása burkoló osztály használatával:

```java
Integer[] nums = {1, 2, 3, 4, 5};
Integer[] numbers = Integer[3];
numbers[0] = 1;
numbers[1] = 2;
numbers[2] = 3;
```

Valós számok, két módon:

```java
double[] valosSzamok = double[3];
Double[] valosSzamok2 = Double[3];
valosSzamok[0] = 25;
valosSzamok2[0] = 37;
```

```java
String[] nevek = {
  "Gábor", 
  "Irén", 
  "Piri", 
  "Teri", 
  "Lili"
  };
for (int i = 0; i < numbers.length; i++) {
  System.out.println(numbers[i]);
}
```

A tömb bejárása:

```java
int[] szamok = {35, 12, 27, 18}
for(int szam : szamok) {
    System.out.println(szam);
}
```

## Listák

Számok ArrayList-ben:

```java
import java.util.List;
import java.util.ArrayList;
//...

List<Integer> nums = new ArrayList<>();
```

Lista esetén nem használhatunk primitív típust.

Vagy:

```java
import java.util.ArrayList;
//...

ArrayList<Integer> nums = new ArrayList<>();
```

Karakterláncok tárolása.

```java
List<String> names = new ArrayList<>();
names.add("Piri");
names.add("Teri");
names.add("Lili");
for (String name : names) {
  System.out.println(name);
}
```

Kiírás egyszerűen:

```java
System.out.println(names);
```

```java
import java.util.ArrayList;
import java.util.List;

public class App {
    public static void main(String[] args) throws Exception {
        List<Integer> szamLista = new ArrayList<>();
        szamLista.add(35);
        szamLista.add(27);
        szamLista.add(52);
        szamLista.add(24);
        for(Integer szam: szamLista) {
            System.out.println(szam);
        }
        
    }
}
```

Elem eltávolítása:

```java
szamLista.remove(27);
```

Méret lekérdezése:

```java
System.out.println(szamLista.size());
```

### Elem keresése

```java
List<String> names = new ArrayList<>();
names.add("Piri");
names.add("Teri");
names.add("Lili");
System.out.println(names.indexOf("Teri"));
System.out.println(names.lastIndexOf("Teri"));
System.out.println(names.contains("Teri"));
```

Az eredmény:

```txt
1
1
true
```

### Lista rendezése

```java
List<String> names = new ArrayList<>();
names.add("Piri");
names.add("Teri");
names.add("Lili");
Collections.sort(names);
System.out.println(names);
```

## Az enum típus

```java
enum Color {
  RED, GREEN, BLUE
}

public static void main(String[] args) {
  Color color = Color.RED;
  System.out.println(color);
}
```

## Sztringkezelés

Sztring hossza:

```java
String s = "Piri Teri Lili";
System.out.println(s.length());
```

Csere:

```java
String s = "Piri Teri Lili";
s = s.replace("i", "a");
System.out.println(s);
```

```java
String s = "Piri Teri Lili";
s = s.replaceAll("i", "a");
System.out.println(s);
```

Kisbetűs, nagybetűs átalakítás:

```java
String s = "Piri Teri Lili";
s = s.toLowerCase();
s2 = s.toUpperCase();
```

Darabolás a split függvénnyel:

```java
String s = "Piri Teri Lili";
String[] names = s.split(" ");
for (String name : names) {
  System.out.println(name);
}
```

Összehasonlítás:

```java
String s = "Piri Teri Lili";
System.out.println(s.equals("Piri Teri Lili"));
```

Keresés:

```java
String szoveg = "még nyílnak";
String keresett = "nyílnak";
int kezdoIndex = szoveg.indexOf(keresett);
System.out.println(kezdoIndex); // 4
```

Rész sztring:

```java
// kezdőindex megadása
String szoveg = "még nyílnak";
String resz = szoveg.substring(4); 
System.out.println(resz); //nyílnak

// kezdő- és végindex megadása
String szoveg = "még nyílnak a völgyben";
String resz = szoveg.substring(4, 8);
System.out.println(resz); //nyíl
```

Tartalmazás:

```java
String szoveg = "még nyílnak";
String keresett = "nyílnak";
boolean benneVan = szoveg.contains(keresett);
System.out.println(benneVan); // true
```

### Pufferelt sztirngek

A pufferelt sztirngek dinamikusan bővíthetők, változtathatók, szemben a String objektummal, ami immutábilis (változtathatatlan). Ha elvégzel egy értékadást akkor a Java új memóriaterületet foglal, amíg az eredeti megmarad. Ez memóriapazarló és időigényes lehet ha sok műveletet kell elvégezni.

A StringBuffer szálbiztos (thread-safe) megoldás. Több szál egyidejűleg használhatja, inkozisztencia nélkül. Minden művelet ugyanazon az objektumon lesz végrehajtva.

```java
StringBuffer sb = new StringBuffer();
sb.append("Piri");
sb.append(" Teri");
sb.append(" Lili");
```

A StringBuilder nem szálbiztos megoldás. Mint a StringBuffer egy belső pufferben tárolja az adatokat, és dinamikusan bővíthető. Egy szálon gyorsabb megoldás, mint a szálbzitos StringBuffer.

```java
StringBuilder sb = new StringBuilder();
sb.append("Piri");
sb.append(" Teri");
sb.append(" Lili");
```

Átalakítás String típusra:

```java
String s = sb.toString();
```

### Text Block

A Java 15-ben bevezették a Text Block-t, ami több soros sztringek létrehozását teszi lehetővé.

```java
String textBlock = """
első sor
második sor
harmadik sor
"""
System.out.println(textBlock);
```

```java
String name = "John";
int age = 30;
String textBlock = """
                   My name is %s and I am %d years old.
                   """.formatted(name, age);
System.out.println(textBlock);
```

## Függvények

```java
class App.java {
  public static void about() {
    System.out.println("Nagy János");
  }
  public static int add(int a, int b) {
    return a + b;
  }
  public static void main(String[] args) {
    System.out.println(add(30, 35));
  }
}
```

## Fájlkezelés

### Írás fájlba

```java
import java.io.FileWriter;
import java.io.IOException;

public class App {
  public static void main(String[] args) throws IOException {
    FileWriter fw = new FileWriter(
      "file.txt",
      Charset.forName("utf-8"),
      true
      );
    fw.write("Hello");
    fw.close();
  }
}
```

### Olvasás fájlból

```java
import java.io.File;
import java.util.Scanner;
import java.io.IOException;

public class App {
  public static void main(String[] args) throws IOException {
    File f = new File("file.txt");
    Scanner sc = new Scanner(f, "utf-8");
    while (sc.hasNextLine()) {
      String line = sc.nextLine();
      System.out.println(line);
    }
    sc.close();
  }
}
```

## Argumentmok olvasása

### Az argumentumokról

Az argumentumok azok szövegek, amiket egy program neve után gépelünk be a futtatás során.

Kétféle argumentum van:

* kapcsolók - módosítják a parancs működését
* paraméterek - megmondják min kell végrehajtani a parancsot

### A dir parancs

Vegyük például a Windows **dir** parancsát. Ha argumentumok nélkül futtatjuk, valahogy így néz ki:

```cmd
dir
```

A parancs a képernyőre listázza az aktuális könyvtár tartalmát, és náhány hozzátartozó adatot. Egy paraméterrel megmondhatjuk, hogy egyetlen állományról vagy könyvtárról mutasson adatokat. Ha az aktuális könyvtárban van egy **dev** nevű könyvtár, akkor ezt írhatjuk:

```cmd
dir dev
```

A **dev** egy paraméter. Azt közöljük a dir paranccsal, hogy a dev könyvtáron hajtsa végre a parancsot.

### Az argumentokhoz példa

Legyen egy App osztály:

```java
public class App {
  public static void main(String[] args) {
    System.out.println("Helló");
  }
}
```

Fordítás után futtatás parancssorból:

```bash
java App
```

Futtatás argumentum megadásával:

```bash
java App adat.txt
```

Most írjuk át az App osztályt, hogy írja ki az argumentumok számát:

```java
public class App {
  public static void main(String[] args) {
    System.out.println(args.length);
  }
}
```

Ha a programot argumentumok nélkül futtatjuk, 0 értéket kell kapjunk:

```bash
java App
```

Most adjunk meg tetszőleges argumentumot:

```bash
java App valami
```

Ebben az esetben 1-t kell kapjunk, mivel 1 argumentumot adtunk meg. Ellenőrizzük 3 argumentummal:

```bash
java App egy kettő három
```

Írjuk át a programot úgy, hogy vizsgálja meg, hogy van-e argumentum. Ha van, írja a képernyőre az első argumentumot. Ellenkező esetben lépjen ki a program.

```java
public class App {
  public static void main(String[] args) {
    if (args.length <= 0) {
      System.out.println("Kötelező minimum 1 paraméter");
      System.exit(1);
    }
    
    System.out.println(args[0]);
  }
}
```

### Argumentum beállítása VSCode-ban

Ha parancssorban adjuk meg a paramétereket, ez kényelmetlen lehet. Használjuk ki a VSCode adata lehetőségeket. Készítsünk egy konfigurációt:

* Run > Add configuration...

Ha nincs megnyitva .java fájl, akkor rá kérdez, milyen debuger-t választunk. Válasszuk a **Java**-t.

A menüt kiválasztva a .vscode könyvtárban elkészül egy launch.json nevű fájl. A tartalma ehhez hasonló:

```json
{
  // Use IntelliSense to learn about possible attributes.
  // Hover to view descriptions of existing attributes.
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "type": "java",
      "name": "Current File",
      "request": "launch",
      "mainClass": "${file}"
    },
    {
      "type": "java",
      "name": "App",
      "request": "launch",
      "mainClass": "App",
      "projectName": "app01_8512a664"
    }
  ]
}
```

Ha a "Prorject Manager for Java" bővítményt használjuk, akkor a .java fájl megnyitása esetén találunk egy lejátszógombot a jobb felső sarokban. De a main() függvény felett és megjelenik egy lebegő **Run** parancs. Ha ezt használjuk, akkor második konfigurációt fogja használni a VSCode. Ezért ezzel dolgozunk. Vegyünk fel egy args kulcsot:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "java",
      "name": "App",
      "request": "launch",
      "mainClass": "App",
      "projectName": "app01_8512a664",
      "args": ["adat.txt"]
    }
  ]
}
```

Így minden futtatásnál az adat.txt szöveg kerül átadásra, első paraméterként. Az args itt egy tömb, így vesszővel tagolva felvehetünk több paraméter is. Az első konfigurációt nem kell törölni, csak a rövidítés miatt nem szerepel a fenti példában.

## Debug

Készítsünk egy számológépet:

```java
import java.util.Scanner;

public class Calculator {
  static Scanner scanner = new Scanner(System.in);
  public static void main(String[] args) {

      System.out.print("Egész szám1: ");
      int firstNumber = scanner.nextInt();

      System.out.print("Egész szám2: ");
      int secondNumber = scanner.nextInt();

      System.out.println("Válaszd ki az operátort: +, -, *, /");
      char operator = scanner.next().charAt(0);

      int result = 0;
      
      // Töréspont helye, figyeljük a 'result' értékét
      switch (operator) {
          case '+':
              result = add(firstNumber, secondNumber);
              break;
          case '-':
              result = subtract(firstNumber, secondNumber);
              break;
          case '*':
              result = multiply(firstNumber, secondNumber);
              break;
          case '/':
              result = divide(firstNumber, secondNumber);
              break;
          default:
              System.out.println("Érvénytelen operátor");
              return;
      }

      System.out.println("Eredmény: " + result);
  }

  private static int add(int a, int b) {
      return a + b;
  }

  private static int subtract(int a, int b) {
      return a - b;
  }

  private static int multiply(int a, int b) {
      return a * b;
  }

  private static int divide(int a, int b) {
      if (b == 0) {
          System.err.println("Hiba! Osztás nullával!");
          return 0;
      }
      return a / b;
  }
}
```

* Jelöljünk meg töréspontot a forráskódban megadott sorban.
* Indítsuk el a Debug-t: F5

Ahogy a program elér a törésponthoz leáll, és vizsgálódhatunk.

A folyamat követési lehetőségei:

* Step Over (F10) - Egy lépés előre.
* Step Into (F11) - Belépés egy függvénybe.
* Variables: A balodlaon figyelheted a változók tartalmát.
* Watch: Megfigyelhetünk változókat.

## Gyakorlat

### Tennivalók fájlbaírása

Írjunk programot, ami egy adott tennivalót fájlbaír.

Writer.java:

```java
public class Writer {
  public void writeTodo(String fileName) 
      throws IOException{
    FileWriter fw = new FileWriter(
      fileName, Charset.forName("utf8"), true);
    
    fw.write("A feladatgyűjteményből megoldás Javaf nyelven");
    fw.close();
  }
}
```

App.java:

```java
public class App {
  public static void main(String[] args) {
    if(args.length <= 0) {
      System.err.println("Hiba! Paraméter megadása kötelező!");
      System.exit(1);
    }
    Writer writer = new Writer();
    writer.writeTodo(args[0])
  }
}
```

További teendő: Kérje be az adott feladatot.
