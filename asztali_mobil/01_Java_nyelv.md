# Java nyelv

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Java fejlesztés](#java-fejlesztés)
* [Különleges karakterek](#különleges-karakterek)
* [Adattípusok](#adattípusok)
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

## Java fejlesztés

A Java nyelvet a **Sun Microsystem** programozói kezdték fejleszteni, 1991-ben. Később az Oracle felvásárolt a céget, így a Java most az ő tulajdona.

A Java nyelv még mindig az egyes fő verziószámnál tart. Az egyes Java verziók:

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

### Java Helló Világ program

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

Windowson szükség lehet a karakterkódolás megadására:

```bash
javac -encoding utf8 App.java
```

Megfelelő a utf8, utf-8, UTF8 és az UTF-8 is.

### Megjegyzések a Java nyelvben

```java
// egy soros
```

```java
/* több
soros 
megjegyzés
*/
```

### Kivitel

A képernyőre írni a System osztály áll rendelkezésre. Ennek van két tagja:

* out
* err

Az out és az err mezők is a képernyőt jelentik. A programot használó szakember képes szétválasztani a kétféle kimenetet. Ha egy nomál kiíratást végzünk, akkor az **out** mezőn keresztül kell kiíratni. Ha hibát írunk a képernypre, akkor az **err** mezőn keresztül kell kiíratni.

```java
System.out.println("Normál kimenet.");
System.err.println("Hiba! Ez nem lesz így jó!");
```

A kivitelhez a következő metódusok állnak rendelkezésre:

* println()
* printf()
* print()

Mi a különbség? A println() egy sortörést is a képernyőre ír. A printf() formázott kimenetet tesz lehetővé. A print() utasítás sortörés nélkül ír a képernyőre.

### Operátorok

```java
System.out.println(1 + 2);
System.out.println("1 + 2 = " + (1 + 2));
System.out.println(3 - 2);
System.out.println(3 * 2);
System.out.println(3 / 2);
System.out.println(3 % 2);
```

## Különleges karakterek

```java
System.out.println("mentés")
```

```java
System.out.println("me\ntés")
```

```java
System.out.println("men\tés")
```

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

| Típus | Szám | Tartomány |
|-|-|-|
| byte | 1 byte | -128 - 127 |
| short | 2 bytes | -32 768 - 32 767 |
| int | 4 bytes | -2 147 483 648 - 2 147 483 647 |
| long | 8 bytes | -9 223 372 036 854 775 808 - 9 223 372 036 854 775 807 |

| Típus | Szám | Tartomány |
|-|-|-|
| double | 8 bytes | 4.9e-324 - 1.7976931348623157e+308 |
| float | 4 bytes | 1.4e-45 - 3.4028235e+38 |

| Típus | Szám | Tartomány |
|-|-|-|
| boolean | 1 byte | false vagy true |

```java
boolean igaz = true;
```

| Típus | Szám | Tartomány |
|-|-|-|
| char | 2 bytes | 0 - 65535 |

```java
char karakter = 'a';
System.out.println(karakter);
```

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

### Formázott kivitel

```java
System.out.printf("1 + 2 = %d", 1 + 2);
```

Argumentum index:

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

Kerekítések:

```java
System.out.println(Math.ceil(4.1));
System.out.println(Math.floor(4.9));
System.out.println(Math.round(4.5));
```

## Véletlen szám generálás

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

A Scanner osztály használata:

```java
Scanner sc = new Scanner(System.in);
String numStr = sc.nextLine();
int num = Integer.parseInt(numStr);
```

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

```java
int i = 0;
if (i == 0) {
    System.out.println("i == 0");
}
```

```java
int i = 0;
if (i == 0) {
  System.out.println("i == 0");
}else {
  System.out.println("i != 0");
}
```

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

```java
int[] numbers = {1, 2, 3, 4, 5};
for (int i = 0; i < numbers.length; i++) {
  System.out.println(numbers[i]);
}
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

## Listák

```java
List<String> names = new ArrayList<>();
names.add("Piri");
names.add("Teri");
names.add("Lili");
for (String name : names) {
  System.out.println(name);
}
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

Szting hossza:

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

### Pufferelt sztirngek

```java
StringBuffer sb = new StringBuffer();
sb.append("Piri");
sb.append(" Teri");
sb.append(" Lili");
```

```java
StringBuilder sb = new StringBuilder();
sb.append("Piri");
sb.append(" Teri");
sb.append(" Lili");
```

## Függvények

```java
class App.java {
  public static int add(int a, int b) {
    return a + b;
  }
  public static void main(String[] args) {
    
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
    FileWriter fw = new FileWriter("file.txt");
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
    Scanner sc = new Scanner(f);
    while (sc.hasNextLine()) {
      String line = sc.nextLine();
      System.out.println(line);
    }
    sc.close();
  }
}
```
