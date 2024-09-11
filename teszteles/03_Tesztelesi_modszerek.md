# Szoftvertesztelési módszerek

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Szerkesztve: 2022, 2023, 2024
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Egységteszt](#egységteszt)
* [Integrációs teszt](#integrációs-teszt)
* [Rendszerteszt](#rendszerteszt)

## Egységteszt

Egy függvény, metódus vagy egy komplett osztály tesztje.

## Integrációs teszt

A komponensek együttműködését teszteljük. Angolul **Integration Level Testing**, röviden **ILT**.

Megközelítések:

* Big-Bang - az összes modult összerakjuk
* Alulról felfelé - magasabb modullal teszteljük az alacsonyabb szintű modulokat
* Felülről lefelé - először a magas szintű modulok tesztelése
* Vegyes - alulról felfelé, felülről lefelé kombinálva

## Rendszerteszt

Angolul **System Level Testing**, röviden **SLT**.

Jellemzők:

* A teljes rendszert teszteljük.
* Funkcionális és nem-funkciónális tesztelés.
* Általában külső tesztelő csapat végzi.
* Általában fekete dobozos teszt.
* Lehet automatizált és kézi tesztelés is.

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
