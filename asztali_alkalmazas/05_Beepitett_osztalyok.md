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

```java
double szog = 1;
double rad = szog * Math.PI / 180;
System.out.println(Math.sin(rad));
System.out.println(Math.tan(rad));
System.out.println(Math.cos(rad));
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

Ajánlott a számok bekérése inkább szövegként, a nextInt() vagy a nextDouble() metódus helyett.

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

A karakterlácok, angolul string néven ismert. A magyar nyelvben is kezd meghonosodni a "sztring" megfelelője. A Java nyelvben nincs string primitív típus, azt csak a String osztállyal hozható létre. Mivel gyakran használt osztály, ezért new hívása nélkül is létrehozható String objektum, a konstruktor ilyenkor automatikusan hívódik. A String objektumokat úgy hozhatunk létre mint primitív típusokat.

```java
String szoveg;
String gyumolcs = "alma";
```

A new operátor ettől függetlenül használható, de így hosszabb utasítást kapunk:

```java
String gyumolcs = new String("alma");
```

### Sztringek hossza

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

A kis betűs szöveget nagybetűssé a toUpperCase() függvény alkalmas.

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
