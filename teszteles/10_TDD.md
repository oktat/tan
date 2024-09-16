# TDD

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A TDD

A TDD a Test-driven development rövidítése. Magyarul tesztvezérelt fejlesztésnek hívjuk. A szoftverfejlesztést egy minimális teszt írásával kezdjük. Ezt követően annyit fejlesztünk, hogy a teszt teljesüljön. Refaktorálunk ha szükséges, majd ismételjük az elejétől. Fejlesztjük a tesztet minimálisan. Annyit fejlesztünk a kódon, hogy teljesítse a tesztet. Ha szükséges refaktorálunk. Ezt ismételjük.

Lépések:

* Készítünk egy tesztet
  * Futtatjuk a teszteket
* Annyi kódot írunk, hogy teljesítse a tesztet
  * Futtatjuk a teszteket
* Ha szükséges refaktorálunk
  * Futtatjuk a tesztet

![TDD](images/TDD_3_resz.png)

## Példa

### Teszteszköz

Kétféle teszteszköz szokás használni:

* unittest
* pytest

Itt a pytest-t fogjuk használni.

Telepítsük, ha szükséges:

```bash
pip install pytest
```

### Könyvtárszerkezet

A kiinduló könyvtárszerkezet:

```txt
app01/
  |-src/
  `-tests/
```

### A pytest beállítása

Beállításra azért van szükség, mert a Python kódot az src, a teszteket tőlük külön a test könyvtárban fogjuk megírni.

Hozzunk létre a bállíátsokfájlt a projekt gyökérkönyvtárában:

```txt
app01/
  |-src/
  |-tests/
  `-pytest.ini
```

Tartalma a következő:

pytest.ini:

```ini
[pytest]
pythonpath = src
```

Ezzel a beállításokkal a tesztfájlokban nem kell megadni az **src** könyvtárat az importálás során, csak azon belü található állományneveket.

```python
from triangle import calcArea
```

### Iteráció 1

#### A teszt fejlesztése 1

Kezdjünk egy tesztet:

tests/test_haromszog.py:

```python
import haromszog
haromszog.Haromszog()
```

Futtatjuk a tesztet:

```bash
pytest
```

Ha VSCode-ban dolgozunk az akciósávon válasszuk ki a lombikot. Kattintsunk a [ Konfigure Python Code ] gombra. Válasszuk a **unittest** és a **pytest** közül a pytest-tet. Válasszuk azt a könyvtárat, ahol a tesztjeink lesznek. Esetünkben ez a **tests**. Az oldalsávon megjelenő lejátszógombbal futtassuk a tesztet.

#### Az iparikód fejlesztése 1

src/haromszog.py

```python
class Haromszog():
    pass
```

#### Refaktorálás 1

Nevezzük át a teszt fájlnevét test_triangle.py-re. A tartalomban is hívjunk angol nevű osztályt és metódust.

tests/test_triangle.py:

```python
from triangle import Triangle

Triangle()
```

Az iparikódot fájlnevét is nevezzük át, a tartalmában javítsuk angolra a neveket:

src/triangle.py:

```python
class Triangle():
    pass
```

### Iteráció 2

#### A teszt fejlesztése 2

Fejlesszünk a teszten annyit, hogy meghívja a nem létező függvényt.

tests/test_triangle.py:

```python
from triangle import Triangle

def test_calcArea():
  Triangle().calcArea()
```

#### Az iparikód fejlesztése 2

Fejlesszük az iparikódot:

src/triangle.py:

```python
class Triangle:
  def calcArea(self):
    pass
```

#### Refaktorálás 2

Ha nem találunk újraírandó részt, akkor megyünk a harmadik iterációra.

### Iteráció 3

#### Teszt fejlesztése 3

Fejlesszük a tesztet annyira, hogy adjon át két értéket, az alapot és a magasságot.

tests/test_triangle.py

```python
from triangle import Triangle

def test_calcArea():
  Triangle().calcArea(30, 35)
```

Futtassuk a tesztet. A teszt hibára fut, mivel az iparikódban a calcArea() metódus nem fogadja az értékeket.

#### Iparikód fejlesztése

Most fejlesszünk annyit az iparikódon, hogy teljesüljön a teszt.

src/triangle.py

```python
class Triangle:
  def calcArea(self, base, height):
    pass
```

Futtassuk a tesztet. A teszt most sikerre kell fusson.

#### Refaktorálás 3

A teszt nevébe tegyük bele az átadott parmétereket:

tests/test_triangle.py:

```python
from triangle import Triangle

def test_calcArea_30_35():
  Triangle().calcArea(30, 35)
```

Az iparikódon most nem írunk újra semmit.

### Iteráció 4

#### A teszt fejlesztése 4

Írjuk át a tesztet, hogy tároljuk el a visszaadott értéket. A Python nyelvben nem okoz hibát, ha nem ad vissza értéket a calcArea() metódus, ezért illesszünk be egy tartalomfigyelést:

tests/test_triangle.py:

```python
from triangle import Triangle

def test_calcArea_30_35():
  actul = Triangle().calcArea(30, 35)
  assert actul != None
```

Futtassuk a tesztet. A teszt hibára fut, mivel **None** értéket kapunk.

#### Az iparikód fejlesztése 4

Fejlesszünk annyit az iparikódon, hogy ne fusson hibára. Ehhez elég, ha visszatérünk egy 0 értékkel:

src/triangle.py:

```python
class Triangle:
  def calcArea(self, base, height):
    return 0
```

#### Refaktorálás 4

A tesztben átírhatjuk az assert rész, hogy 0-át várjon:

tests/test_triangle.py:

```python
from triangle import Triangle

def test_calcArea_30_35():
  actul = Triangle().calcArea(30, 35)
  assert actul == 0
```

### Iteráció 5

#### A teszt fejlesztése 5

Fejlesszük a tesztet, hogy annyira, hogy valós értéket várjon el. A 30 és 35 bemenetére 525-t várunk:

tests/test_triangle.py:

```python
from triangle import Triangle

def test_calcArea_30_35():
  actul = Triangle().calcArea(30, 35)
  assert actul == 525
```

#### Az iparikód fejlesztése 5

Fejlesszünk annyit az iparikódon, hogy teljesítse a tesztet:

src/triangle.py:

```python
class Triangle:
  def calcArea(self, base, height):
    return 525
```

#### Refaktorálás 5

A teszten újraírhatjuk az elvárt értéekt. Tegyük egy expected nevű változóba.

tests/test_triangle.py:

```python
from triangle import Triangle

def test_calcArea_30_35():
  actul = Triangle().calcArea(30, 35)
  expected = 525
  assert actul == expected
```

Az iparikódon nincs mit újraírni. Futtassuk a tesztet, a tesztnek sikerre kell futnia.

### Iteráció 6

#### A teszt fejlesztése 6

Fejlesszük tovább a tesztet, hogy 60, 75 bemenetre sikertelen legyen ha nem  2250-t kapunk.

tests/test_triangle.py:

```python
from triangle import Triangle

def test_calcArea_30_35():
  actul = Triangle().calcArea(30, 35)
  expected = 525
  assert actul == expected

def test_calcArea_60_75():
  actul = Triangle().calcArea(60, 75)
  expected = 2250
  assert actul == expected
```

Futtassuk a tesztet. A tesztnek most hibára kell futnia, mert mindig 525-t kapunk.

#### Az iparikód fejlesztése

Fejlesszük a tesztet, hogy teljesítse a tesztet:

```python
class Triangle:
  def calcArea(self, base, height):
    return (base * height) / 2
```

#### Refaktorálás 6

Nézzük meg mit lehet újraírni.

A tesztet osztályba teehetjük. A Triangle oszhtályt egyszer készítjük elő a setup_class metódusban.

tests/test_triangle.py:

```python
from triangle import Triangle

class TestTriangle:
  @classmethod
  def setup_class(cls):
    cls.triangle = Triangle()

  def test_calcArea_30_35(self):
    actul = self.triangle.calcArea(30, 35)
    expected = 525
    assert actul == expected

  def test_calcArea_60_75(self):
    actul = self.triangle.calcArea(60, 75)
    expected = 2250
    assert actul == expected
```
