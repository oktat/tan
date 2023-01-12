# Asztali alkalmazások fejlesztése - Beépített osztályok

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Matematikai osztály

A Math osztály matematikai kifejezések írását segíti.

### A pí értéke

```java
System.out.println(Math.PI);
```

### A gyökvonás

```java
System.out.println(Math.sqrt(9));
```

## Véletlen szám generálás

```java
import java.util.Random;
//...
Random random = new Random();
int veletlenSzam.nextInt(3);
```

Kockadobás:

```java
import java.util.Random;
//...
Random random = new Random();
int dobas = veletlen.nextInt(6) + 1;
```

## Konvertlálás

### String egész számmá

```java
System.out.println(Integer.parseInt("45"));
```

### String valós számmáa

```java
System.out.println(Double.parseDouble("45.1234567"));
```

## Bevitel

```java
import java.util.Scanner;
//...

Scanner scanner = new Scanner(System.in);
String nev = scanner.nextLine();
```

```java
import java.util.Scanner;
//...

Scanner scanner = new Scanner(System.in);
int kor = scanner.nextInt();
```

## Karakterláncok

### A karakterláncokról

A karakterlácok, angolul string néven ismert. A magyar nyelvben is kezd meghonosodni a "sztring" megfelelője. A Java nyelvben nincs string primitív típus, azt csak a String osztállyal hozható létre. Mivel gyakran használt osztály, ezért new hívása nélkül is létrehozható String objektum, a konstruktor ilyenkor automatikusan hívódik. A String objektumokat úgy hozhatunk létre mint primitív típusokat.

```java
String szoveg;
String gyumolcs = "alma";
```

A new operátor ettől függetlenül használható, de így hosszabb utasítást kapunk:

```java
String gyumolcs = new String("alma");
```

### Stringek hossza

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

Mindkét konkatenálás esetén az eredményt egy új változóban tároltuk. A concat() metódus nem változtatja meg az eredeti szoveg nevű változó tartalmát. A String változók, láthatjuk, hogy megváltoztathatatlanok, angolul immutable.

### Adott indexen a karakter lekérdezése

```java
String gyumolcs = "alma";
char ch = gyumolcs.charAt(2); // eredménye m betű
```

### Karakterlánc összehasonlítása

Karakterláncot az equals() metódussal hasonlítunk össze, eredménye egy logikai típus. Az "==" operátor nem vezet eredményre, mert a két objektum címét hasonlítja össze.

```java
String gyumolcs1 = "alma";
boolean eredmeny = gyumolcs.equals("alma");
```

### Karakterláncok tartalma

A contains() metódussal megvizsgálhatjuk, hogy egy sztring objektum tartalma-e egy bizonyos karakterláncot.

```java
String gyumolcsok = "alma körte barack";
boolean eredmeny = gyumolcsok.contains("körte");
```
