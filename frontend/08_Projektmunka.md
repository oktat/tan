# Frontend - Projektmunka

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Projektfeladat

### Minőségbiztosító rendszer

#### Kezdés

Célunk egy minőségbiztosító rendszer létrehozása.

* Hozzunk létre csoportokat. Lehet akár 2-3 fős csoport.
* Legyen egy csoportvezető.
* A csoportvezető létrehozza a kezdeti Angular projektet.
* A csoportvezető létrehozza az komponenseket és az útválasztást.
  * Home
  * Login
  * Logout
  * Evaluation
  * Editor
  * Employee
  * Company
  * Admin
* A csoportvezető eltárolja egy Git szerveren a projektet.
* A csoport tagjai klónozzák a projektet.
* A csoport tagok fejlesztik az egyes komponenseket.

#### A komponensek szerepe

Mit is tudjanak az egyes komponensek.

* Home - A minőségbiztosító rendszerről leírás
* Login - Beléptető felület
* Logout - Kilépés utáni felület
* Eval - Tárgy kiválasztása, kérdőív kitöltése
* Editor - A kérőív kezelő főoldal
* Sheet - Egy kérdőívkezelő
* Question - Kérdőívkezelő
* Company - A cég értékelés megtekintése
* Result - Az értékelésének megtekintése
* Admin Home - Az admin felület főoldala
* Admin Users - Felhasználókezelés
* Admin Subject - A témák kezelése (bizonyos témákra lehet kérdőívet kitölteni)

#### Szolgáltatások

A következő szolgáltatásokat kell megvalósítani:

* Users - Felhasználók kezelése
* Company - Cég kezelése
* Subject - Témák kezelése
* Result - Eredmények kezelése
* Question - Kérdések kezelése
* Sheet - Kérdőív kezelése (egy kérdőív kérdéseket tartalmaz)
* Answer - Válaszkezelő

#### Lehetséges kérdések

A kérdőíven lehetséges kérdések:

* XY időben megjelenik a munkakezdéskor.

Ez lehetne egy 5-ös vagy 10-s skálán értékelni.

#### Minta

* [https://exquality.netlify.app](https://exquality.netlify.app)