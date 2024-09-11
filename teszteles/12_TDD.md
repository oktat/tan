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

### Példa

#### Iteráció 1

##### A teszt fejlesztése

Kezdjünk egy tesztet:

```python
import haromszog
haromszog.Haromszog()
```

Futtatjuk a tesztet.

##### Az iparikód fejlesztése

```python
class Haromszog():
    pass
```

##### Refaktorálása

triangleTest.py:

```python
from triangle import Triangle
```

triangle.py:

```python
class Triangle():
    pass
```
