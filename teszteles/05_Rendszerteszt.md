# Rendszer szintű tesztelés

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [A rendszertesztelésről](#a-rendszertesztelésről)
* [Eszközök](#eszközök)
* [A kézi tesztelésről](#a-kézi-tesztelésről)
* [Gyakorlat](#gyakorlat)
* [Nem funkcionális teszt](#nem-funkcionális-teszt)

## A rendszertesztelésről

Angolul **System Level Testing**, röviden **SLT**.

Fejelsztési folyamat végén a rendszert funkcionális és nem funkcionális részét teszteljük. A tesztelést a célgéphez hasonló gépen teszteljeük, azonos operációs rendszeren.

Jellemzők:

* A teljes rendszert teszteljük.
* Funkcionális és nem-funkciónális tesztelés.
* Általában külső tesztelő csapat végzi.
* Általában fekete dobozos teszt.
* Lehet automatizált és kézi tesztelés is.

## Eszközök

Automatizált tesztelés néháőny lehetséges eszköze:

* Puppeteer
* Selenium
* JUnit
* TestNG
* Robot Framework

Kézi tesztelés lehetséges eszközei:

* Tesztelési forgatókönyv
* Ellenőző listák
* egyéb

## A kézi tesztelésről

A kézi tesztelés az alkalmazás próbája egérrel, billentyűzettel, aminek az eredményét egy táblázatban rögzítjük.

Mit vizsgálnak?

* A specifikációnak megfelel a program?

Például: Specifikáció szerint jelentést kell tudnia generálni valamiről a programnak. Ennek ellenőrzése.

* Hány felhasználót képes kiszolgálni?
* Milyen gyorsan reagál?
* A célrendszeren problémamentesen fut?

### Teszt forgatókönyv példa

#### TC001

Teszteset azonosító: TC001

* Teszteset neve: Érvényes bejelentkezés
* Leírás: Érvényes felhasználónévvel bejelentkezünk a webes felületen.
* Előfeltételek:
  * A felhasználó rendelkezik hozzáféréssel.
  * A rendszer elérhető.

Lépések:

* Weblap megnyitása
* Jobb felső sarokban **Bejelentkezés** gombra kattintunk
* Felhasználónév beírása
* Jelszó beírása
* Kattintás a bejelentkezésre

Várt eredmény:

* Bejelentkezés OK, átiránytás történt a főoldalra.
* A bejelentkezhés gomb helyett a felhasználó neve látszik.
* A felhasználó hozzáfér a fiókjához, böngészhet a védett oldalon.

Utófeltételek:

* A felhasználó be van jelentkezve, és hozzáfér a fiókjához.

#### TC002

Teszteset azonosító: TC002

* Teszteset neve: Érvénytelen bejelentkezés
* Leírás: Érvénytelen felhasználónévvel bejelentkezünk a webes felületen.
* Előfeltételek:
  * A rendszer elérhető.

Lépések:

* Weblap megnyitása
* Jobb felső sarokban **Bejelentkezés** gombra kattintunk
* Felhasználónév beírása
* Helytelen jelszó beírása
* Kattintás a bejelentkezésre

Várt eredmény:

* A rendszer hibát ad.
* A felhasználó nem kerül bejelentkezésre.

### Táblázat

Tesztelésre kész:

![kézi tesztelés táblázat](images/keziteszt_tablazat_01.png)

Tesztelés után:

![kézi tesztelés táblázat](images/keziteszt_tablazat_02.png)

### Letölthető táblázat

* [https://szit.hu/download/oktatas/teszt_sablon.xlsx](https://szit.hu/download/oktatas/teszt_sablon.xlsx)

## Gyakorlat

### Gúla térfogata

* [https://szit.hu/m/tepiramid/](https://szit.hu/m/tepiramid/)
* [https://github.com/oktat/tepiramid.git](https://github.com/oktat/tepiramid.git)

### Rombusz kerülete, területe

* [https://szit.hu/m/teromb/](https://szit.hu/m/teromb/)
* [https://github.com/andteki/teromb.git](https://github.com/andteki/teromb.git)

## Nem funkcionális teszt

* Teljesítmény teszt
  * Mennyit kell várni az oldal betöltödésére?
  * A számítás milyen gyorsan történik meg a kattintás után?
* Használhatósági teszt
  * UX - User Experience - felhasználói élmény
  * Mennyire intuitív a felhasználói felület?
  * Könnyen megtalálható a "Számít" gomb?
  * Első próbálkozásra sikerül használni?
* Kompatibilitás teszt
  * Különböző böngészökben is működik?
  * Különböző eszközökön jól működik? Mobil, táblagép, asztali.
* Biztonsági teszt
  * SQL injekcióra nem érzékeny?
  * Jelszókezelés mennyire jó?
* Skálázhatóság
  * Ha növekszik a felhasználók száma, hogyan reagál a weboldal?
