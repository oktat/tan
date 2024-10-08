# Rendszer szintá tesztelés

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A rendszertesztelésről

Fejelsztési folyamat végén a rendszert funkcionális és nem funkcionális részét teszteljük. A tesztelést a célgéphez hasonló gépen teszteljeük, azonos operációs rendszeren.

## A kézi tesztelésről

A kézi tesztelés az alkalmazás próbája egérrel, billentyűzettel, aminek az eredményét egy táblázatban rögzítjük.

Mit vizsgálnak?

* A specifikációnak megfelel a program?

Például: Specifikáció szerint jelentést kell tudnia generálni valamiről a programnak. Ennek ellenőrzése.

* Hány felhasználót képes kiszolgálni?
* Milyen gyorsan reagál?
* A célrendszeren problémamentesen fut?

### Eszközök

Automatizált tesztelés lehetséges eszközei:

* Puppeteer
* Selenium
* JUnit
* TestNG
* Robot Framework

Kézi tesztelés lehetséges eszközei:

* Tesztelési forgatókönyv
* Ellenőző listák
* egyéb
  
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
