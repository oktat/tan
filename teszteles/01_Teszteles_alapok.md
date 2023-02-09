# Szoftvertesztelés

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A szoftvertesztelés alapjai

### Fogalmak

* verifikáció: ami elkészült, az jól működik?
* validáció: amit készítünk, megfelel az ügyfél elvárásainak?

A validáció már a tervezési fázisban is használható.

#### Automatikus és kézi

* automatikus - szoftver végzi
* kézi - ember végzi

A kézi tesztelés során olyan hibákra is fényderülhet, amire a teszt szoftver írásakor nem gondoltunk.

#### Szisztematikus és ad-hoc

* szisztematikus - előre meghatározott
* ad-hoc - nincs előre meghatározva

#### Fekete és fehérdobozos

* fehér dobozos - a tesztelőnek rendelkezésre áll a kód
* fekete dobozos - a tesztelőnek nem áll rendelkezésre a kód

#### Típusok

* funkcionális tesztek - adott funkció működik?
* nem funkciónális teszek - például teljesítmény, kinézet
* regressziós teszt - újratesztelés

Ha javítunk valamit egy szoftveren, az újratesztelést regressziós tesztelésnek hívjuk.

### Tesztpiramis

![images/tesztpiramis.png](images/tesztpiramis.png)

### A szoftverek életciklusa

* projekt elhatározása
* elemzés
* tervezés
* megvalósítás
* tesztelés
* terjesztés
* oktatás és támogatás
* karbantartás

A szoftver életciklusa egy verzión belül:

* pre-alfa
* alfa
* béta
* kiadásra jelölt - release candidate - RC
* kiadott - released

A változatok számmal megadása:

* 0.01
* 0.1
* 0.3
* ...
* 0.5
* 0.9
* 0.9.1
* 1.0 első kiadás
* 1.01 hibajavítás
* 2.0 második kiadás

A szoftverek sorsa:

* 2 % - azonnal fut
* 3 % - javítás után fut
* 20 % - alapos átdolgozás után futott
* 30 % - kifizették, de sosem futott
* 45 % - sosem futott rendesen

### Statisztikák

A megírt programkódokat mérjük, általában sorok alapján.
Így alakult ki a LOC vagy SLOC mértékegység.

* Lines Of Code
* Source Lines Of Code

100 LOC, száz megírt kódsort jelent.

SI prefixumokat is szokás használni:

1000 LOC egyenlő 1 kLOC

### A tesztelés szintjei

* egységteszt
* integrációs teszt
* rendszerteszt
* elfogadási teszt

Az első három tesztet az IT végzi. Az utolsó tesztet a
megrendelő, illetve annak tesztelői.

## Gyakorlat

### Kérdések

1.)
Mit jelenet a LOC mértékegység?

* A kifogható halak mérete
* A szilícium tartalom mértékegysége
* A kódsorok száma
* A helyi változók száma

2.)
Mit jelent a release candidate? Válasszon.

* hosszú ideig támogatott kiadás
* kiadásra jelölt
* nem lesz továbbfejlesztve
* vizsgát kell tennie

3.)
Milyen tesztről beszélünk, ha újratesztelünk egy szoftvert?

* előtesztelés
* egyszer tesztelünk csak
* visszatérünk egy korábbi verziószámhoz
* regressziós

4.)
Mi a refaktorálás

* A kód újraírása.
* A kód tesztelése.
* A kód üres sorainak törlése.
* A programot előlről kezdjük.

5.)
Melyik teszttel szokás egy függvényt vizsgálni, ami egy számítst végez?

* átvételi
* rendszer
* egység
* kerekítés

6.)
Melyik assert utasítással hasonlítjuk össze az elvárt eredményt az aktuális eredménnyel, ha az egy szám?

* assertBear
* assertLarge
* assertEquals
* assertTrump

7.)
Mit használunk Java nyelvhez egységteszteléshez?

* GUnit
* AUnit
* CUnit
* JUnit

8.)
Mi a verifikáció?

* ami elkészült az megfelel az ügyfélnek?
* amit tervezünk az megfelel az ügyfélnek?
* az adatbázis vizsgálata
* ami elkszült, az jól mûködik?

9.)
Mi a validáció?

* ami elkészült az megfelel az ügyfélnek?
* amit tervezünk az megfelel az ügyfélnek?
* az adatbázis vizsgálata
* ami elkszült, az jól mûködik?

10.)
Melyik tesztelési típus?

* emberközpontú
* sebezhetõ
* figyelemfelkeltõ
* kézi

11.)
Mi a fekete dobozos tesztelés?

* az eredményt fekete dobozban tároljuk
* az eredmény fekete dobozból kiolvasható
* a tesztelõnek nem áll rendelkezésre a forráskód
* a tesztelõnek rendelkezésre áll a forráskód

12.)
Mi a fehér dobozos tesztelés?

* az eredményt fehér dobozban tároljuk
* az eredmény fehér dobozból kiolvasható
* a tesztelõnek nem áll rendelkezésre a forráskód
* a tesztelõnek rendelkezésre áll a forráskód

13.)
Melyik funkciónálisteszt?

* A weblapon megjelenik-e a "számít gomb".
* A program mekkora bemenõ adat esetén mûködésképtelen.
* A program kiszámítja a területet.
* Újra vizsgáljuk, látszik-e már a számít gomb.

14.)
Milyen tesztek helyezkednek el a tesztpiramis alján?

* GUI teszt
* integrációs teszt
* átvilteli teszt
* egységteszt

15.)
A szoftverek életciklusát tekintve, melyik tevékenység van elõbb?

* terjesztés
* karbantartás
* tervezés
* elemzés

16.)
A szoftverek életciklusát tekintve, melyik tevékenység van utolsó helyen?

* terjesztés
* karbantartás
* tervezés
* elemzés

17.)
Mi a LOC?

* A tesztelési sebesség mértékegysége.
* A program készítés sebességének mértékegysége.
* Programkód sorainak száma.
* A látható sorok száma.

18.)
Mit jelent az LTS? Válasszon.

* hosszú ideig támogatott kiadás
* kiadásra jelölt
* nem lesz továbbfejlesztve
* vizsgát kell tennie

19.)
Melyik tesztet csinálja az "ügyfél"?

* integrációs
* elfogadási
* rendszer
* egység

20.)
1 kLOC, az hány kódsor?

* 500
* 1000
* 2000
* 10000

### Java egységteszt

#### Bekérős feladat megoldása

Oldjunk meg egy bekérős feladatott a szit.hu programozási feladatgyűjteményéből:

* [https://szit.hu/doku.php?id=oktatas:programozas:feladatok:altalanos](https://szit.hu/doku.php?id=oktatas:programozas:feladatok:altalanos)

Legyen például a "Feladat 0312", amiben egy rombuszba írható kör sugarát kell kiszámítani.

Készítsünk egy Rhombus nevű osztályt, ami tartalmazza a sugár számítását.

A következő megoldások mindegyikéhez készítsünk tesztet, használjunk JUnit-t:

```java
class Rhombus {
    public static duble calcRadius(double aside, double alpha) {
        double rad = alpha * Math.PI / 180;
        double radius = 1.0/2.0 * aside * Math.sin(rad);            
        return radius;
    }
}
```

```java
class Rhombus {
    public duble calcRadius(double aside, double alpha) {
        double rad = alpha * Math.PI / 180;
        double radius = 1.0/2.0 * aside * Math.sin(rad);            
        return radius;
    }
}
```

```java
class Rhombus {
    double aside;
    double alpha;
    double radius;
    public Rhombus(double aside, double alpha) {
        this.aside = aside;
        this.alpha = alpha;
        thia.radius = -1;
    }
    public void calcRadius() {
        double rad = this.alpha * Math.PI / 180;
        this.radius = 1.0/2.0 * this.aside * Math.sin(rad);            
    }
}
```

Készítsük el a Tombsug nevű osztályt ami használja a Rhombus osztályt. Legyen egy metódus, ami bekéri az oldal és az alfa szöget. Másik metódus végezze el a számítást. Egy harmadik metódus írja az eredményt fájlba, hozzáfűzéssel.
