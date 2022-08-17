# Procedurális és Objektum Orientált fejlesztés

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Procedurális fejlesztés

A program egyes részeit eljárásokba,
függvényekbe szervezzük.

```python
def calcPerimeter(aSide, bSide, cSide):
    return aSide + bSide + cSide;

def calcArea(base, height):
    return base * height / 2

perimeter = calcPerimeter(30, 35, 40)
area = calcArea(30, 35)
print('Kerület:', perimeter)
print('Terület:', area)
```

## Objektum Orientál fejlesztés

A programokat osztályokba szervezzük.

```python
class Triangle:
    def calcPerimeter(aSide, bSide, cSide):
        return aSide + bSide + cSide;

    def calcArea(base, height):
        return base * height / 2

triangle = Triangle()
perimeter = triangle.calcPerimeter(30, 35, 40)
area = triangle.calcArea(30, 35)
print('Kerület:', perimater)
print('Terület:', area)
```
