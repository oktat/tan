# Asztali alkalmazások fejlesztése - Változók

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Megjegyzések

A megjegyzések néha zavaróak, néha segítenek. A fordítók az ilyen sorokat nem veszik figyelembe. A Java nyelvben megjegyzések lehetnek egy vagy több sorosak.

Egy soros megjegyzéseket két darab perjel segítségével állíthatunk be:

```java
// egy soros megjegyzés
```

Több soros megjeygzések

```java
/* több
soros
megjegyzés
*/
```

## Kivitel

A képernyőre a System osztállyon keresztül szokás írni. A System osztálynak van két mezőjét használjuk a kiíratásra:

* out
* err

Valójában mindegyik a képernyőt jelképezi. Tehát bármelyik mezővel íratunk ki, az a képernyőn jelenik meg. De tartsuk magunkat a következőhöz: A normál kimenetet írjuk az out mezővel, a hibakimenetet az err mezővel. A hozzáértők a program futtatásakor ezt szét tudják választani.

A kiíratásra következő metódusokat használhatjuk:

* print()
* println()
* printf()

Ezeknek a metódusoknak többféle alírása is olvashatóa dokumentációban.

Ha a println() metódust szeretnénk a képernyőre írni, így rakjuk össze:

```java
System.out.println("bármi");
```

## Különleges karakterek

Néhány karakternek lehet különleges viselkedése. Ezt a viselkedést a "\" visszaperjel karakter segítségével válthatjuk ki. Vegyük például az "n" betüt, és írassuk ki egy szóban:

```java
System.out.println("banán");
```

A képernyőn megjeleni a banán szó:

```cmd
banán
```

Most adjuk az első "n" betűnek speciálist jelentést:

```java
System.out.println("ba\nán");
```

A speciálist jelentést a "\" jel karakter elé írásával váltjuk ki. A "\" perjel mindig az utána következő karakterrel vonatkozik.

Készítsünk egy programot, futtassuk és nézzük meg az eredményt. Az eredmény ehhez hasonló lesz:

```cmd
ba
án
```

Az "n" betű sortörésként viselkedik. Ilyen betű a "t" betű is. Nézzük meg ugyanezt "t" betűvel. Javítsuk a szót "mentés"-re:

```java
System.out.println("mentés");
```

Most tegyük a "t" betűt specálissá:

```java
System.out.println("men\tés");
```

Nézzük meg az eredményt:

```cmd
men        és
```

A "t" betű helyett egy tabulátor hely íródik a képernyőre.

Ezeket a speciális karaktereket escape szekvenciáknak is nevezzük. Az Java nyelvben használható escape szekvenciák táblázatát látjuk:


| Escape szekvencia | Leírás  |
|-|-|
| \n | új sor |
| \t | tabulátor |
| \' | felső vessző kiíratása |
| \" | idézőjel kiíratása |
| \\\\ | visszaperjel kiíratása |
| \r | kocsi vissza (A kiíratás a sor elejen folytatódik) |
| \f | lapdobás (nyomtatóknál) |
| \b | visszatörlés (előtte lévő karaktert törli) |
| \uxxxx | Unicode karakterek kiíratása hexedecimális számmal (xxxx) |

## Típusok és változók

### Egészek típusok

A programozás során dolgozunk egész és valós számokkal, karakterekkel, karakterláncokkal és logikai típussal (igaz/hamis). A Java nyelvben megadható milyen típust szeretnénk tárolni. A memória helynek adunk egy nevet, például "szam1":

```java
int szam1;
```

Egy változót hoztunk létre, ahol megmondtuk, hogy egész számot szeretnénk tárolni.

Egész és valós számból is többféle van. Egészek tárolására következő típusok állnak rendelkezésre:

* byte
* short
* int
* long

Mindegyik egész típus más méretű helyet foglal a memóriában:

* byte - 1 byte
* short - 2 byte
* int - 4 byte
* long - 8 byte

Ennek megfelelően a byte típusban tárolhatjuk a legkisebb számot, a longban a legnagyobbat. A következő táblázat megmutatja, melyik típus esetén melyik számtartományból tárolhatunk számokat:

| Típus | Méret | Tartomány |
|-|-|-|
| byte | 1 byte | -128 – 127 |
| short | 2 bytes | -32 768 – 32 767 |
| int | 4 bytes | -2 147 483 648 – 2 147 483 647 |
| long | 8 bytes | -9 223 372 036 854 775 808 – 9 223 372 036 854 775 807 |

Vegyünk egy byte típusú változót, tegyünk bele a 127-es számot, majd írassuk ki:

```java
byte szam1;
szam1 = 127;
System.out.println(szam1);
```

A program fordul és fut. Ha most 128 értéket tesszük bele, fordítási hibát kapunk:

```java
byte szam1;
szam1 = 128; //Hibás!
System.out.println(szam1);
```

### Valós típusok

Valós számok esetén az double típust használhatjuk:

```java
double szam2;
```

Kétféel valós típust adhatunk meg:

* float
* double

A két típus, szintén a szám számára foglalt memróai méretében különbözik:

* float - 4 bytes
* double - 8 bytes

Nézzük mekkora számok tárolhatók:

| Típus | Méret | Tartomány |
|-|-|-|
| float | 4 byte | 1.4e-45 – 3.4028235e+38 |
| double | 8 byte | 4.9e-324 – 1.7976931348623157e+308 |

Mivel nagy számokról van szó, a tartományt tudományos alakban [^1] írtam fel.

[^1]: A tudományos alak, a számábrázolás lebegőpontos alakja egyszerűsítve. A lebegőpotos számábrázolásról a következő helyen olvashat: [https://szit.hu/doku.php?id=oktatas:szamitastechnika:szamabrazolas](https://szit.hu/doku.php?id=oktatas:szamitastechnika:szamabrazolas)

### Karakterek

Karaktereket a char típusban tárolhatunk:

```java
char karakter1 = 'a';
```

Figyeljük meg, hogy a karaktert aposztrófok közzé tettem.

### Logikai érték

Logikai érték igaz vagy hamis lehet. Java nyelvben:

* true
* false

A logikai értéket a boolean típusban tárolhatunk:

```java
boolean van_hely = true;
```

### Primitív típusok és burkolóosztályok

Minden primitív típusuhoz tartozik egy burkoló osztály. Ez annyit jelent, hogy a típusokat osztállyal is létrehozhatom. Például egy egész típus burkolóosztállyal:

```java
Integer szam1 = 45;
```

Egy byte típus esetén:

```java
Byte szam1 = 45;
```

Nézzük meg a primítv típusok helyett milyen osztályokat használhatunk, a következő táblázatban:

| Primtív | Érték | Burkoló (csomagoló) osztály | Tartomány |
|-|-|-|-|
| boolean | true, false | Boolean | true vagy false |
| char | 16 bit-es Unicode | Character | \u0000 – \uFFFF |
| byte | 8 bit-es előjeles egész | Byte | -128 – 127  |
| short | 16 bit-es előjeles egész | Short | -32768 – 32767 |
| int | 32 bit-es előjeles egész | Integer | -2147483648 – 2147483647 |
| long | 64 bit-es előjeles egész | Long | -9223372036854775808 – 9223372036854775807 |
| float | 32 bit-es lebegőpontos | Float | 1.4E-45 – 3.4028235E+38 |
| double | 64 bit-es lebegőpontos | Double | 439E-324 – 1.7976931348623157E+308 |

A Java nyelvben csak előjeles típusok vannak, angolul signed. Nincs előjel nélküli, angolul unsigned típus.

A primitív és burkoló osztállyal létrehozott változók esetén különbség, hogy a burkoló osztállyal létrehozott változókon futtathatók metódusokat, de több helyet is foglalnak.

### Karakterláncok

Karakterláncokat számára nincs primitív típus, ezeket a String osztállyal hozzuk létre:

```java
String nev = "Pala Ferenc";
```

## Változók

A változókat deklarálással hozzuk létre:

```java
int szam1;
```

A változónak ekkor még nincs definiálva az értéke.

Most tegyünk bele a 45 értéket:

```java
int szam1;
szam1 = 45;
```

Amikor értéket rendelünk a "szam1" nevű változóhoz, ezt nevezzük definiálásnak.

A Java nyelvben az értékadás "=" opetrátorral történik. A változók a deklaráció során is kaphatnak értéket:

```java
int szam1 = 45;
```

A változók értékét lekérhetjük és új változóban tárolhatjuk azt, vagy éppen kiírathatjuk:

```java
int szam1 = 45;
int szam2 = szam1;
System.out.println(szam1);
```

A kiíratás során nem változó neve, hanem annak értéke íródik ki.

A változók, később kaphatnak új értéket, ezért változók:

```java
int szam1 = 45;
System.out.println(szam1);
szam1 = 91;
System.out.println(szam1);
```

## Állandók

```java
int szam1 = 45;
```

Amikor leírom ezt az utasítást, futtatáskor a memóriában tárolásra kerül ez az utasítás, ahol szerepel a 45, és egy másik memória helyen is tárolódik a 45 érték. Az első az utasítások memóriaterületér kerül, utóbbi a változók memóraterületére.

Java nyelvben kétféle állandó van:

* literális
* nevesített

Vegyünk egy egész típust:

```java
int szam1 = 45;
```

Amikor leírom, hogy 45, ez is egy állandó. Állandó, mert azt a memóriahelyet ahol ez az utasítás tárolódik, ahol a 45 is szerepl, a program futása során nem tudom megváltoztatni. Most csak az egyenlőség jel jobboldaláról beszéltünk. Az egyenlőségjel bal oldalán egy változó van, azon a memóriaterületen is megjelenik a 45.

Az egyenlőségjel jobb oldalán szerplő 45-t **literális állandó**nak nevezem.

A változóknak adhatunk neveket is, így kapunk nevesített állandót. Az állandó deklarációt, úgy kezdjük mint a változókat, de teszünk eléjük egy "final" módosítót:

```java
final int szam1 = 45;
```

A módosító hatására az egyenlőség baloldalán szereplő szam1 is állandó lesz. A továbbiakban nem kaphat új értéket. A következő program hibát generál:

```java
final int szam1 = 45;
szam1 = 70; //Hiba!
```

## Formázott kivitel

A formázott kimenetet a printf() metódussal készíthetünk. Nézzük egy egyszerű változó kiíratást:

```java
int szam1 = 45;
System.out.printf("%d\n", szam1);
```

A printf() metódusnak az első paramétere a formátumstring. A formátumstring írja le, hogy a következő paramétereket milyen formában jelenítsük meg. Ha futtatjuk a fenti utasítást, egyszerűen kiíródik a 45, ezt megtehettük volna egy println() utasítással is.

Nézzük meg a formátumstringet. Egy formátumstring egy vagy több formátumkódot tartalmazhat. Minden formátum string utáni paraméternek szükség van egy formátumkódra. A fenti program a formátumstring után egyetlen változót szerepeltet a "szam1". Az ehhez tartozó formátukód %d. A formátumkódot mindig "%" százalékjellel kezdjük, és egy konverziós karakterrel zárjuk. A konverziós karakter mindig függ a kiíratni kívánt típustól. A "szam1" változó jelenleg egész típusú, ilyen esetben a konverziós karakter egy "d" betű.

A "d" betű után a "\n" csak a sortörést miatt van, mivel a print() utasítás nem tesz ki sörtörést, ellentétben a println() metódussal.

![formátumstring](images/printf_formatstring.png)

Minden formátumstring után írt paraméternek meg kell adnunk egy formátumkódot:

![két formátumkód](images/printf_formatstring_ketkod.png)

Az első formátumkód az első változóhoz tartozik, a második a formátumkód a második váltzóhoz:

![formátumkód és az értékek](images/printf_ketkod_ertekek.png)

A formátumkód "%" jele és a konverzióskarakter közzé újabb formázó utasításokat írhatok a következő szintaxis szerint:

```text
%[argumentum_index$][jelzők][szélesség][.pontosság]konverziós_karakter
```

A "[]" szögletes zárójelek mutatják, hogy melyek a nem kötelező elemek. Láthatjuk, hogy a "%" jel és a konverziós karakter megadása kötelező, a többi nem.

### Szélesség

Ábrázoljuk a számot 20 szélességen:

```java
int szam1 = 45;
System.out.printf("%20d\n", szam1);
```

A program a számot 20 szélességben írja ki:

```cmd
                  45
```

A formátumstring a kiírt értékhez tartalmazhat egyéb információkat:

```java
int szam1 = 45;
System.out.printf("Egységár: %20d Ft\n", szam1);
```

A program a végrehajtás utána a következőt írja a képernyőre:

```cmd
Egységár:                   45 Ft
```


```java
int szam1 = 45;
int szam2 = 25;
System.out.printf("Egységár: %5d Ft Tömeg: %5d kg\n", szam1, szam2);
```

Kimenet:

```cmd
Egységár:   45 Ft Tömeg:   25 kg
```
