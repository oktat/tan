# Programozás alapok - Bevezetés a programozásba

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Játékos programozás

A játékos programozás növelheti a lelkesedésünket a programozást iránt. Többféle online megoldás is létezik erre a célra. Egyik ajánlott hely a lightbot.hu, ahol egy kis robotot irányíthatunk, az általunk összerakott programjainkkal.

Játékos programozáshoz ajánlott webhely:

* [https://www.lightbot.lu/](https://www.lightbot.lu/)
* [https://www.crunchzilla.com/code-maven](https://www.crunchzilla.com/code-maven)
* [https://screeps.com/a/#!/sim/tutorial/1](https://screeps.com/a/#!/sim/tutorial/1)
* [https://lab.reaal.me/jsrobot/#level=1&language=en](https://lab.reaal.me/jsrobot/#level=1&language=en)
* [https://codecombat.com/play/level/dungeons-of-kithgard?](https://codecombat.com/play/level/dungeons-of-kithgard?)

## Oktatási portálok

Önálló tanuláshoz ajánlott webhelyek:

Nagy segítség lehet a további fejlődéshez egy online oktató webhely, mint a scriba.com, codecademy.com vagy a programiz.pro.

* [https://scrimba.com/](https://scrimba.com/)
* [https://www.codecademy.com/](https://www.codecademy.com/)
* [https://programiz.pro/](https://programiz.pro/)

## Fordítás és értelmezés

Szükséges:

* compiler - fordító
* inpterpreter - értelmező

### Értelmezett nyelv

* forráskód > értelmező > gépikód

### Fordítás

* forráskód > fordító > gépikód

A fordítás több lépésből is állhat, például tárgykód készítés.

### Modern nyelvek

* forráskód > fordító > bájtkód > értelmező > gépikód

## Fejlesztés

### Szintaktikai hibák

Nem korrekt helyesírás, a program nem fordul, nem fut.

### Szemantikai hibák

A program fut, de logikailag hibás.

### Végrehajtás közben fellépő hibák

A végrehajtás közben fellépő hibákat angol neve: **Run-time error**. Ehhez a programnak speciális körülmények közzé kell kerüljenek. Például egy fájl nem létezik. Ezeket a hibákat kivételeknek hívjuk: exception. Tehát jelzik, hogy valami kivételes dolgoz történt.

### Hibakeresés

Debugolásnak is hívjuk.

## Python Shell

A Python önmagában is idnítható. A 2-s vagy 3 verziótól függően:

  python

  python3

A Python értelmez indul el. Lehetséges kimenet:

```python
python3
Python 3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> 
```

Ezt a környzetet hívjuk Read-Eval-Print Loop-nak, röviden REPL.

Használjuk a REPL-t számításokhoz:

```python
>>> 30+35
65
```

```python
>>> 30+35*2
100
```

A matematikai operátorok prioritása érvényesül.

Osztás:

```python
>>> 70/2
35.0
```

Egész osztás:

```python
>>> 8//5
1
```

Osztás:

```python
>>> 8./5
1.6
```

```python
>>> 5/3
1.6666666666666667
```

### Változók

```python
>>> szam1=35
>>> szam1
35
```

```python
>>> nev='Zoli'
>>> nev
'Zoli'
```

### Többszörös értékadás

```python
>>> alap = magassag = 30
>>> alap
30
>>> magassag
30
```

### Operátorok és kifejezések

```python
>>> res = 3*7 + 5/2
>>> res
23.5
```

Egész osztáls maradéka:

```python
>>> 5%3
2
```

Hatvány:

```python
>>> 2**8
256
```
