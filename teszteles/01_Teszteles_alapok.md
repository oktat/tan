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
* nincs utasítás

#### Fekete és fehérdobozos

* fehér dobozos - a tesztelőnek rendelkezésre áll a kód
* fekete dobozos - a tesztelőnek nem áll rendelkezésre a kód

#### Típusok

* funkcionális tesztek - adott funkció működik?
* nem funkciónális teszek - például teljesítmény, kinézet
* regresszíós teszt - újratesztelés

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
