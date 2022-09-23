# Python - Bevezetés a Python programozásba

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A Python bemutatása

A Python egy népszerű és sokoldalú programozási nyelv, amit használnak a tudományos adatfeldolgozásban, webfejlesztésben, automatizálásban, és még sok más területen.

A Python nagyon jó kezdők számára, mivel könnyen tanulható, olvasható és írható a kóddal dolgozunk.

## Helló Világ

```python
print("Helló Világ!")
```

Nyissunk egy könyvtárat a Visual Studio Code programmal, amjd készítsünk egy main.py nevű fájlt. Tartalma a fenti kód legyen. Futtassuk a kódot.

A program a képernyőre írja, hogy "Helló Világ!", idézőjelek nélkül. A programban az idézőjelek között adunk meg szöveget. A print utasítás egy függvény, ami paraméterként megadott szöveget kiíjra. A paramétert mindig zárójelek () között adjuk meg. Később látni fogjuk, hogy a print() utasítással nem csak szöveget tudunk kiíratni.

A programozás nem olyan nehéz mint azt egy kezdő elsőre gondolja. Foglalkozni kell vele, a befektetett idő megtérül.

A program segítségével kapcsolatba lépünk a számítógéppel, aminek utasításokat tudunk megadni. Ehhez meg kell tanulnunk néhány utasítást és szabályt.

## Megjegyzések

Az utasításokat, mint a print() egy állományba írjuk. Leírt utasítás sorokat forráskódnak nevezzük. A forráskódba a fejlesztő időnként megjegyzéseket ír önmagának vagy másoknak a leírt utasításokkal kapcsolatban. Ezeket a megjegyzéseket a számítógép nem próbálja meg feldolgozni. 

Egy soros megjegyzés:

```python
# egy soros megjegyzés
```

Példa:

```python
# ez az utasítás a "Helló Világ!" szöveget a képernyőre írja
print("Helló Világ!")
```

Az egysoros megjegyzések az utasítások után is írhatók:

```python
# Szám kiíratása
print(35) # a kimenet 35
```

## Kivitel

Kivitel alatt a képernyőre írást értjük. Fentebb már láttuk, hogy a Python nyelvben erre a print() függvény az egyik lehetséges utasítás. Kiírathatunk vele többféle típusú adatot, számokat, szöveget stb.

A Python programban megkülönböztetjük az egész és a valós számokat.

Egész szám kiíratása:

```python
print(30)
```

Valós szám kiíratása:

```python
print(30.5)
```

Szöveget megadhatunk idézőjelek között és aposztrófok között:

```python
"valami szöveg"
'másik szöveg'
```

A print() függvénnyel kiírathatunk több adatot is:

```python
print(30, 35)
print(-30, 47, -5)
print('alma', 'körte')
```

Egymás után akár több print() függvény is írható.
Több adat esetén, azokat vesszővel tagoljuk. Szöveget idézőjel vagy apsztróf nélkül azonban nem lehet kiíratni.
Próbáljuk meg futtatni a következő hibás kódot:

```python
print(alma)
```

## Gyakorló feladatok a kivitelhez

1.)  Milyen típusú adat a következő: 0.5

* egész
* valós
* szöveg
* egyik sem

2.)  Milyen típusú adat a következő: '0.5'

* egész
* valós
* szöveg
* egyik sem

3.) Írj egy programot, mondat.py fájlba, ami kiírja a következő mondatot: A négyzet egy síkidom. A képernyőn a következő kell megjelenjen:

```cmd
A négyzet egy síkidom
```

4.) Írj egy programot, amely a következőket csinálja: 

* Kiírja a A négyzet egy síkidom szöveget.
* Kiírja 35 számot a következő sorba.

5.) Adott a következő kód:

```python
print(45) # a kimenet 45
```

Az utasítás, melyik részét nem veszi figyelembe a számítógép?

* print(45)
* &num; a kimenet 45
* az előbbi mindkettő
* egyik sem

## Escape szekvenciák

Ha egy karaktert kiíratok, az megjelenik a képernyőn. Vegyük a "ringló" szót:

```python
print("ringló")
```

Mindegyes karakter kiíródik. Egyes karaktereknek speciális értelmet adhatunk. Vegyük szóból az "n" betűt. Speciális jelentést adhatunk a karakternek egy "\" karakterrel:

```python
print("ri\ngló")
```

Az "n" betű már nem íródik ki képernyőre. Helyette valami más történik. Az "ri" szó után a szövegkurzor a következő sorba ugrik. Másként szólva soremelés történik.

Ha egy karakternek ilyen speciális jelentést adunk, akkor escape szekvenciának hívjuk. Az alábbi táblázat esacpe szekvenciákat tartalmaz, amely használható Python nyelvben.

| Escape szekvencia | Jelentés |
|-------------------|----------|
| \\\\ | vissza-perjel megjelenítése |
| \\'  | aposztróf megjelenítése |
| \\"  | idézőjel megjelenítése |
| \a  | ASCII csengőhang |
| \b  | ASCII visszatörlés - Backspace (BS) |
| \f  | ASCII lapdobás (FF) |
| \n  | ASCII soremelés (LF) |
| \r  | ASCII kocsi vissza (CR) |
| \t  | ASCII vízszintes tabulátor (TAB) |
| \v  | ASCII függőleges tabulátor (VT) |
| \ooo | oktális érték |
| \xhh | hexadecimális érték |
| \uxxxx | karakter kiírása Unicode alapján |
| \Uxxxxxxxx | karakter kiírása Unicode alapján |
| \N{name} | karakter kiírása Unicode név alapján |

Példa a soremelésre:

```python
print("körbe\njár")
```

Tabulátorhasználat:

```python
print("körbe\tjár")
```

## Típusok

Pythonban használható típusok:

* egész - int
* valós - float
* karakterlánc - str
* logikai - bool
* None - NoneType

```python
# egész:
num1 = 30

# valós:
num2 = 35.1234

# karakterlánc:
name = 'Árpád'

# logikai típus
meleg_van = True

# None
valami = None
```

A típusok lekérdezhetők a type() függvénnyel:

```python
num = 30
print(type(num))
```

A kimenetben ilyen példákat láthatunk:

```cmd
<class 'int'>
```

## Változóhasználat

A memória egy helyét elnevezhetem és különböző típusú értékeket tárolhatok ezeken a helyeken. Ha számot szeretnénk tárolni:

```python
szam = 30
nev = 'Pali'
```

A Python nyelvben a változókat használat előtt nem szükséges deklarálni, nem kell megadni milyen típust akarunk tárolni a memóriaterületen.

Ha egy kifejezésbe illesztem a változót, annak értéke behelyettesítődik a kifejezésbe:

```python
szam = 30
eredmeny = szam + 10
print(eredmeny)
```

Minden változónak van típusa. A típus attól függ, milyen típusú értéket teszünk a változóba.

Egész típusú változó

```python
num = 30
```

Valós tipusú változó:

```python
num = 30.12345
```

Karakterlánc típus:

```python
name = 'Pali'
```

Logikai típus:

```python
it_is_hot = True
```

### Nevesített állandó

A Python nyelv nem támogatja a nevesített állandókat. A 3.8 Python verzióban viszont bekerült egy olyan modul, amely segíti az állandó jelenlétét.

```python
from typing import Final

# Állandó létrehozása:
max: Final[float] = 150
```

A max változó ugyan felülírható, de a kódszerkesztő figyelmeztet hibára.

### Literális állandó

Tegyünk egy változóba egy számot:

```python
num = 30
```

Az értékadás jobboldalán a 30 egy állandó, úgynevezett literális állandó. Állíndó mivel a program indulása után, annak leállásáig ezt a memóriaterületet nem lehet megváltoztatni. A programkódban bárhova leírunk egy értéket, az literális állandó.

A következő példában szintén a 30 egy literális állandó:

```python
num = num2 + 30
```

Számliterálisokat megadhatunk alúlvonással.

```python
num = 3_450_123
```

## Formázott kimenet

### Moduló használata

A kiírást formátum karakterlánccal formázhatjuk.

```python
num = 30
print('%d' % num)
```

A formátum karakterláncot, vagy formátum stringet, tehetjük aposztrófok és idézőjelek közé is. A formátum string és a kiíratandó változó közé moduló jelet teszünk.

A formátum stringben minden kiíratandó értékhez szükséges egy formátumkódra a formátum stringen belül. A formátumkódot moduló karakterrel "%" kezdjük és egy betű karakterrel zárjuk. Ez a karakter a formátumkarakter. Egész számmok esetén ez egy "d" betű, amit decimális egészekhez használhatunk.

Valós számok esetén a formátumkarakter "f" betű.

```python
num = 35.1234
print('%f' % num)
```

Szöveg esetén a formátumkarakter egy "s" betű.

```python
nev = 'Tibor'
print('%s' % nev)
```

### A format() függvény használata

## Tovább

Továbbiak a szit.hu weblapon:

* [https://szit.hu/doku.php?id=oktatas:programozas:python:python_nyelv](https://szit.hu/doku.php?id=oktatas:programozas:python:python_nyelv)

Objektum Orientált programozáshoz:

* [https://szit.hu/doku.php?id=oktatas:programozas:python:python_oop](https://szit.hu/doku.php?id=oktatas:programozas:python:python_oop)
