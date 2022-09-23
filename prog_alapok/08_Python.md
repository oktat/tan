# Python

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Bevezetés a Python programozásba

### A Python bemutatása

A Python egy népszerű és sokoldalú programozási nyelv, amit használnak a tudományos adatfeldolgozásban, webfejlesztésben, automatizálásban, és még sok más területen.

A Python nagyon jó kezdők számára, mivel könnyen tanulható, olvasható és írható a kóddal dolgozunk.

### Helló Világ

```python
print("Helló Világ!")
```

Nyissunk egy könyvtárat a Visual Studio Code programmal, amjd készítsünk egy main.py nevű fájlt. Tartalma a fenti kód legyen. Futtassuk a kódot.

A program a képernyőre írja, hogy "Helló Világ!", idézőjelek nélkül. A programban az idézőjelek között adunk meg szöveget. A print utasítás egy függvény, ami paraméterként megadott szöveget kiíjra. A paramétert mindig zárójelek () között adjuk meg. Később látni fogjuk, hogy a print() utasítással nem csak szöveget tudunk kiíratni.

A programozás nem olyan nehéz mint azt egy kezdő elsőre gondolja. Foglalkozni kell vele, a befektetett idő megtérül.

A program segítségével kapcsolatba lépünk a számítógéppel, aminek utasításokat tudunk megadni. Ehhez meg kell tanulnunk néhány utasítást és szabályt.

### Megjegyzések

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

### Kivitel

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

### Gyakorló feladatok a kivitelhez

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

Továbbiak a szit.hu weblapon:

* [https://szit.hu/doku.php?id=oktatas:programozas:python:python_nyelv](https://szit.hu/doku.php?id=oktatas:programozas:python:python_nyelv)

Objektum Orientált programozáshoz:

* [https://szit.hu/doku.php?id=oktatas:programozas:python:python_oop](https://szit.hu/doku.php?id=oktatas:programozas:python:python_oop)
