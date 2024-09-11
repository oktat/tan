# TDD

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A TDD

A TDD a Test-Driven Development rövidítése, vagyis Teszt vezérelt fejlesztés. Röviden, előbb fejlesztjük a tesztet és utána az iparikódot.

A TDD három részből áll:

* Elkezdem a tesztet. Minimális tesztet írok, csak annyit, hogy hibára fusson a teszt.
* Minimálisan fejlesztek, hogy teljesüljön a teszt.
* Refaktorálunk ha szükséges.

Ezt követően, ezt a három lépést ismétlem.

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
