# Frontend - Projektmunka

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Bekérős feladat](#bekérős-feladat)
* [Minőségbiztosító rendszer](#minőségbiztosító-rendszer)

## Bekérős feladat

### Bekérős feladat kezdés

A cél egy bekérős feladat megoldása.

* Hozzunk létre csoportokat. Lehet akár 2-3 fős csoport.
* Legyen egy csoportvezető.
* A csoportvezető létrehozza a kezdeti Angular projektet.
* A csoportvezető létrehozza az komponenseket és az útválasztást.
  * Home
  * Solution
  * History
  * About

### A bekérős feladatben a komponensek szerepe

Mit is tudjanak az egyes komponensek.

* Home - Leírja mit olda meg az alkalmazás
* Solution - A megoldás. Bekérés, eredmény kiírása, kattintásra, Enter-re.
* History - Az eddig megoldott feleadat be- és kimenő paraméterinek listája.
* About - Névjegy. Kik, mikor és milyen körülmények között csinálták.

### A bekérős felat szolgáltatásai

* History - Kezeli a megoldott feladatok CRUD műveleteit.

### A bekérős feladat REST API szervere

Használhatunk helyettesítő projektet.

Szükséges csomag telepítése:

```bash
npm i -g sinto
```

Eztután kapunk egy **sin** parancsot. Ellenőrizzük:

```bash
sin --version
```

A projekt létrehozása:

```bash
mkdir app01
cd app01
sin api
pnpm i
pnpm start
```

A **sin api** parancs létrehozza a helyettesítő REST API szerver vázát.

Találunk egy **database.json** fájlt. Ebben vegyük fel a számunka megkívánt tömböt az **employees** helyett.

### Bekérős feladat egyéb követelmény

A számítás akkor is működjön, ha nem érhető el a REST API szerver.

## Minőségbiztosító rendszer

### Minőségbiztosító kezdés

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

### Minőségbiztosító komponensek szerepe

Mit is tudjanak az egyes komponensek. Általában a CRUD műveleteket.

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

### Minőségbiztosító szolgáltatások

A következő szolgáltatásokat kell megvalósítani:

* Users - Felhasználók kezelése
* Company - Cég kezelése
* Subject - Témák kezelése
* Result - Eredmények kezelése
* Question - Kérdések kezelése
* Sheet - Kérdőív kezelése (egy kérdőív kérdéseket tartalmaz)
* Answer - Válaszkezelő

### Lehetséges kérdések

A kérdőíven lehetséges kérdések:

* XY időben megjelenik a munkakezdéskor.

Ez lehetne egy 5-ös vagy 10-s skálán értékelni.

### Minta

* [https://exquality.netlify.app](https://exquality.netlify.app)
