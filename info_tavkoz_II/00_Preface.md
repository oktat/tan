# Informatika és távközlési alapok II

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Szükséges szoftverek

* Total Commander
* Double Commander
* VirtualBox
* Cisco Packet Tracer
* Geany
* Dia

## Chocolatey

Telepítse a Chocolatey csomagkezelőt. Továbbiakban ezt a csomagkezelőt használjuk.

A csomagkezelő weboldala:
[https://chocolatey.org/](https://chocolatey.org/)

Bővebb leírása:
[https://szit.hu/](https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey)

## Cisco Packet Tracer

A tantárgy teljesítéséhez szükség van a Cisco Packet Tracer nevű programra.

* [https://www.netacad.com/courses/packet-tracer](https://www.netacad.com/courses/packet-tracer)

Hozzáférés készíthető:

* [https://id.cisco.com](https://id.cisco.com)

Letöltés:

* [https://www.netacad.com/portal/resources/packet-tracer](https://www.netacad.com/portal/resources/packet-tracer)

## Oracle VirtualBox

* [https://www.virtualbox.org/](https://www.virtualbox.org/)

```cmd
choco install virtualbox
```

### Debian telepítő

Egy hálózati telepítő szükséges a következő weboldalról:

* [https://www.debian.org/](https://www.debian.org/)

## Kettes számrendszer

### Tízes számrendszer

A kettes számrendszer megértéséhez tekintsük át a tízes számrendszer, mivel ezt mindennap használjuk. A tízes számrendszert **decimális** számrendszernek is hívjuk.

A számok ábrázolására a következő jeleket használjuk:

* 0, 1, 2, 3, 4, 5, 6, 7, 8, 9

Vegyünk egy számot a tízes számrendszerben:

* 158

Vegyük jobbról balra a számjegyeket. Jobbról az első számjegy az egyesek darabszáma, a következő a tízesek száma, és végül a százasok száma.

Honnan ered ez a számsor? Ezek tíz hatványai, balról jobbar.

| 100 | 10 | 1 |
|-|-|-|
| 10² | 10¹ | 10⁰ |

A következő táblázat alján láthatjuk a 158 számjegyeket illesztését a megfelelő oszlopokhoz.

| 100 | 10 | 1 |
|-|-|-|
| 10² | 10¹ | 10⁰ |
| 1 | 5  | 8 |

Ha nagyobb számot szeretnénk felírni, akkor több hatvány kell vennünk.

| 1000000 | 100000 | 10000 | 1000 | 100 | 10 | 1 |
|-|-|-|-|-|-|-|
| 10⁶ | 10⁵ | 10⁴ | 10³ | 10² | 10¹ | 10⁰ |

### Kettes számrendszer levezetése

A kettes számrendszerben ugyanígy építjük fel a számokat, **bináris** számrendszernek is hívjuk.

A számok ábrázolására a következő jeleket használjuk:

* 0, 1

Ahogy tízes számrendszerben is, itt vegyük kettő hatványait.

| 256 | 128 | 64 | 32 | 16 | 8 | 4 | 2 | 1 |
|-|-|-|-|-|-|-|-|-|
| 2⁸  | 2⁷  | 2⁶ | 2⁵ | 2⁴ | 2³ | 2² | 2¹ | 2⁰ |

Vegyünk egy számot: 6.

Ha szeretnénk felírni a 2-s számrendszerben, három számjegyre van szükség.

Haladjuk megint jobbról balra. Az egyesekből 0 darab kell. A kettesekből szükségünk van 1 darabra és a négyesekből is szükség van 1 darabra:

| 4 | 2 | 1 |
|-|-|-|
| 2² | 2¹ | 2⁰ |
| 1 | 1 | 0 |

A táblázat utolsó sorában felírtuk miből mennyire van szükségünk, így megkaptuk a kettes-számrendszerbeli számot:

* 110

Ha felírjuk, hogy 110 nem tudhatjuk milyen számrendszerről van szó, ezért egy "b" betűt szokás a számok elé írni, hogy jelezzük, hogy nem száztízről van szó:

* b110

Másik felírási mód:

* 0b110

### Átváltás gyakorlat kettes számrendszerbe

* Váltsuk át 33-as számot 2-s számrendszerbe.
* Váltsuk át a 9-es számot 2-s számrendszerbe.

### Python REPL használata

Használjuk a Python REPL módban átváltásokhoz.

Indítsunk parancssort, majd gépeljük be:

```bash
python
```

Vagy:

```bash
python3
```

Elindul a Python REPL:

A kimenet ehhez hasonló lehet:

```python
$ python3
Python 3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

A 3 darab nagyob-mint jel, egy várakozási jel, várja a parancsokat.

Bináris számrendszerbe bin() függvénnyel lehet váltani. Váltsuk át a 9-s decimális számot bináris számrendszerbe.

```python
bin(9)
```

A lehetséges kimenet:

```python
>>> bin(9)
'0b1001'
```

Formázhatjuk is a kimenetet:

```python
>>> print(bin(9)[2:])
1001
>>> print(bin(9))
0b1001
>>> print("{:08b}".format(9))
00001001
```
