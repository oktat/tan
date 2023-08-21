# Adatbázis-kezelés I

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tervezés

Az adatbázis az adatok rendszerezett gyűjteménye, amely valamilyen céllal történik.

A hagyományos adatbázisok, mint a könyvtárak hátránya:

* nagy helyigény
* a karbantartás lassú

Az adatbázisok a következő módon osztályozhatók:

* relációs
* hálós
* hierachikus
* objektumorientál
* objektumrelációs

## A relációs adatbázis

A relációs adatbázisokban valamilyen egyedekről szeretnénk információt tárolni. Egy egyedről többfélre információt tárolunk. A tárolás táblázatban történik. Minden táblázatnak van neve, vannak oszlopai és sorai. Minden oszlop rendelkezik egy névvel.

Az oszlopokat mezőknek, a sorokat rekordoknak nevezzük. Az oszlopok neveit mezőnéven használjuk.

## Kulcsok

Minden táblázatban szükség van egy olyan mezőre, ami egyértelműen azonosítja az egyedet. Legyen például dolgozókat tartalmazó tábla. Ha van két dolgozónk, és mindkettő neve Szabó János, nem tudhatjuk melyik dolgozóról van szó.

Dolgozók
| Név |
|-|
| Szabó János |
| Szabó János |

Szükség van egy olyan mezőre, ami egyértelműen azonosítja a dolgozókat. Lehet például a személyi számuk:

Dolgozók
| Név | Személyi szám |
|-|-|
| Szabó János | 120050715-2324 |
| Szabó János | 120030107-7423 |

Felmerülehet a személyi igazolvány használata. Ez azonban nem alkalmas, mivel egy ember élete során ez változik. Az egyedi azonosítók követelményei:

* nem ismétlődhet
* az egyed egész élete során változatlan kell legyen

Az is előfordulhat, hogy nemtalálunk alkalmas mezőt egyedi azonsítónak. Ilyenkor felveszünk egy újabb mezőt, ahol egyszerűen azonosítót rendelünk minden egyedhez. A dolgozók esetén például lehet a következő:

Dolgozók
| Név | Azonosító |
|-|-|
| Szabó János | 1 |
| Szabó János | 2 |

Az azonosító mezők kulcsfontosságú szerepet játszanaka a táblázatunkban, ezért kulcsmezőnek is szoktuk nevezni. Azokat a kulcsmezőket, amelyek egyedi azonosítóként használunk **elsődleges kulcsnak** nevezzük.

Tegyük fel, hogy dolgozóink projektekben vesznek részt. A **projekt** ezek szerint egy olyan egyed, amiről információt akarunk tárolni. Akkor készítünk egy Projektek nevű táblázatot.

Projektek
| Azonosító | Megnevezés | Befejezve |
|-|-|-|
| 1 | Számlázó program | igen |
| 2 | Raktár nyilvántartás | nem |
| 3 | Jármű nyilvántartás | nem |

Minden dolgozó visz egy projektet. Hogyan tároljuk ezt az információt? Vegyünk fel egy újabb mezőt, ahova beírjuk a dolgozó azonosítóját:

Projektek
| Azonosító | Megnevezés | Befejezve | Dolgozó azonosító |
|-|-|-|-|
| 1 | Számlázó program | igen | 1 |
| 2 | Raktár nyilvántartás | nem | 2 |
| 3 | Jármű nyilvántartás | nem | 1 |

A **Dolgozó azonosító** mező a táblázatban kulcsmező, mivel ez mutatja meg a másik táblázatban melyik dolgozóról van szó. Úgyis mondhatnánk, ez a mező a másik táblában elsődleges kulcs. Az ilyen mezőt idegenkulcs-mezőnek nevezzük.

Az idegenkulcs egy másik táblában elsődleges kulcs. Az elsődleges kuulcs mutatja a két tábla közötti kapcsolatot.

## Kapcsolatok

A táblák között tehát kapcsolat van. Háromféle kapcsolat lehetséges:

* egy az egyhez
* egy a többhöz
* több a többhöz

Esetünkben egy dolgozóhoz több projekt is tartozhat, de egy projekt csak egy dolgozóhoz tartozik. Ilyenkor egy a többhöz kapcsolatról beszélünk. Az adatbázis tervezése során mindig ilyen kapcsolatokat keresünk.

Mikor lenne egy az egyhez kapcsolat? Ha egy dolgozóhoz csakis egyetlen projekt tartozhat, és egy projekthez csak egyetlen dolgozó tartozhat, akkor egy az egyhez kapcsolatról beszélnénk.

Ha két táblak között egy az egyhez kapcsolat van, akkor valúszínűleg az egyik tábla nem entitást ír le, vagyis a két tábla összevonható egyetlen táblává, mivel egyetlen táblában tárolható az infomráció.

A több a többhöz kapcsolatról akkor beszélünk, ha például minden dolgozónak több projekje is lehet, és minden projekthez több dolgozó tartozhat. Az ilyen kapcsolatokat is meg kell szüntetni. Át kell alakítani az adatbázisunkat. A több a többhöz kapcsolat általában arra utal, hogy létre kell hoznunk még egy táblát.

Ha legalább három táblánk van, előfordulhat, hogy a táblák átrendezésével megszüntethető a több a többhöz kapcsolat. Ha ez nem működik, akkor egy kapcsolótáblát kell beszúrni. Esetünkben a kapcsolótáblában írnán le, hogy melyik dolgozó, milyen projektben van benne.

| Azonosító | Dolgozó azonosító | Projekt azonosító |
|-|-|-|
| 1 | 1 | 1 |
| 2 | 1 | 3 |

Ebbe a táblába is tehetünk más mezőket is. Például tárolhatjuk mikor kezdett a dolgozó az adott projektben dolgozni:

| Azonosító | Dolgozó azonosító | Projekt azonosító | Kezdés |
|-|-|-|-|
| 1 | 1 | 1 | 2023-03-01 |
| 2 | 1 | 3 | 2023-05-24 |

További információ és példák az adatbázis-tervezésről:

* [https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:tananyag](https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:tananyag)

## Adatbázis-diagramok

Lásd itt:

* [https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:adatbazis-diagramok](https://szit.hu/doku.php?id=oktatas:adatbazis-kezeles:adatbazis-diagramok)
