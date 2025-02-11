# Asztali alkalmazások fejlesztése - Tömbök és listák

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Tömbök](#tömbök)
* [Listák](#listák)

## Tömbök

A tömbökben azonos típusokat tárolhatunk. A tömbök létrehozása során, meg kell adni hány elemet szeretnénk tárolni. Bármely típusból készíthetünk tömböt. A tömbök mérete fix.

Néhány ötelemű tömb:

```java
int[] egeszek = new int[5];
double[] valosak = new double[5];
String[] nevek = new String[5];
```

A fenti példákban a new utasítás 5 elem számára foglal helyet. Minden elemnek van egy indexe 0-tól felfele. 5 elem esetén a legnagyobb index 4. Az egészeket tárolni képes tömb elemei kezdetben 0 értékkel rendelkeznek.

| 0 | 1 | 2 | 3 | 4 |
|-|-|-|-|-|
| 0 | 0 | 0 | 0 | 0 |

Valós számok esetén:

| 0 | 1 | 2 | 3 | 4 |
|-|-|-|-|-|
| 0.0 | 0.0 | 0.0 | 0.0 | 0.0 |

Karakterláncok esetén a kezdőérték null.

| 0 | 1 | 2 | 3 | 4 |
|-|-|-|-|-|
| null | null | null | null | null |

### Kezdőérték

A kezdőérték beállítható kapcsoszárójelek között:

```java
int[] egeszek = new int[] {35, 12, 87, 23, 49};
```

Vegyük észre, hogy ebben az esetben nem kell megadni a szögletes zárójelek között a méretet. A méret kapcsoszárójelek között elhelyezett elemek száma adja.

A helyfoglaló rész elhagyható:

```java
int[] egeszek = {35, 12, 87, 23, 49};
```

A tömb elemei indexükkel:

| 0 | 1 | 2 | 3 | 4 |
|-|-|-|-|-|
| 35 | 12 | 87 | 23 | 49 |

Valós számok esetén:

```java
double[] valosak = { 3.15, 4.29, 2.13, 4.98, 3.27 };
```

Karakterláncok esetén:

```java
String[] nevek = {"alma", "körte", "barack", "szilva"};
```

### Tömb elemeinek átírása

A tömbök elemei átírhatók elemenként:

```java
int[] szamok1 = new int[5];
szamok1[0] = 12;
szamok1[1] = 48;

int[] szamok2 = {35, 12, 87, 23, 49};
szamok[0] = 25;
szamok[4] = 18;
```

### Tömbök mérete

A tömbök számára lefoglalat méret lekérdezhető a length tulajdonsággal.

```java
int[] szamok = { 37, 42, 18, 31 };
System.out.println(szamok.length)
```

Vegyük észre, hogy ez nem metódus, mint a sztringeknél.

### Két dimenziós tömbök

A két dimenziós tömböket szokás mátrixnak is nevezni.

```java
int[][] matrix = = new int[3][4];
```

A mátrix elemei:

| 0 | 1 | 2 | 3 |
|-|-|-|-|
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 |

A mátrix elemei átírhatók:

```java
matrix[0][0] = 1;
matrix[1][2] = 2;
matrix[2][3] = 3;
```

A mátrix elemei:

| 0 | 1 | 2 | 3 |
|-|-|-|-|
| 1 | 0 | 0 | 0 |
| 0 | 0 | 2 | 0 |

Kétdimenziós tömbök kezdőértékkel.

Egy 3x4-s mátrix:

```java
int[][] matrix = {
    {3, 8, 0, 7},
    {5, 3, 4, 7},
    {2, 8, 0, 2}
};
```

## Listák

A listák tulajdonképpen dinamikus tömbök, ami azt jelenti a méretük automatikusan változik. Listát szoktunk létrehozni ArrayList, Vector, LinkedList típusokkal.

Ha elemet adunk egy listához, annak mérete automatikusan növekszik.

### ArrayList

Az ArrayList osztály importálni kell a **java.util** csomagból:

```java
import java.util.ArrayList;
//...

ArrayList<Integer> egeszLista = new ArrayList<>();
```

A példányosításkor meg kell adni, milyen típust szeretnénk tároli a listában. Primitív típust nem használhatunk. A típust kisebb mint jel és nagyobb mint jel karakterek között kell megadni.

Karakterláncok tárolása listában:

```java
import java.util.ArrayList;
//...

ArrayList<String> nevLista = new ArrayList<>();
```

### Elemek hozzáadása

```java
import java.util.ArrayList;
//...

ArrayList<String> nevLista = new ArrayList<>();
nevLista.add("Pali");
nevLista.add("Dani");
```

### Egy elem értékének lekérdezése

```java
import java.util.ArrayList;
//...

ArrayList<String> nevLista = new ArrayList<>();
nevLista.add("Pali");
nevLista.add("Dani");
System.out.println(nevLista.get(0));
System.out.println(nevLista.get(1));
```

### ArrayList mérete

```java
int meret = nevLista.size();
```

### Lista kezdőértéke tömbből

```java
import java.util.ArrayList;
import java.util.Arrays;
//...
Integer[] szamok = { 35, 29, 17, 48, 12 };
ArrayList<Integer> szamLista = new ArrayList<>(Arrays.asList(szamok));
System.out.println(szamLista.size());
```
