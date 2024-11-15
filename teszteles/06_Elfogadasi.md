# Felhasználói átvételi teszt

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Az átvételi tesztről](#az-átvételi-tesztről)
* [Tesztelési "szabványok"](#tesztelési-szabványok)
* [Jellemző tevékenységek](#jellemző-tevékenységek)
* [Gyakorlat 1](#gyakorlat-1)
* [Gyakorlat 2](#gyakorlat-2)

## Az átvételi tesztről

Angolul **User Acceptance Testing**, röviden **UAT**.

Magyarul **Felhasználói elfogadási teszt**, vagy **Felhasználói átvételi teszt**. Röviden lehet **átvételi** vagy **elfogadási** teszt.

A rendszertesztelést követheti egy átvételi teszt.

Vizsgáljuk, hogy a szoftver valóban képes elvégezni a neki szánt munkát. Kik végeznek ilyen munkát?

Kik végzik:

* megrendelő
* külső hivatásos tesztelők

Az UAT célja, hogy valóban készen áll a szoftver a használatra, az üzembe helyezésre.

Valós üzleti forgatókönyvet és folyamatok szerint tesztelnek, általában kéziteszteléssel.

## Tesztelési "szabványok"

* OWASP Web Security Testing Guide
  * [https://owasp.org/www-project-web-security-testing-guide/](https://owasp.org/www-project-web-security-testing-guide/)

* NIST SP 800-115
  * [https://csrc.nist.gov/publications/detail/sp/800-115/final](https://csrc.nist.gov/publications/detail/sp/800-115/final)

* ISO/IEC 27002
  * [https://www.iso.org/standard/75652.html](https://www.iso.org/standard/75652.html)

## Jellemző tevékenységek

Technikai áttekintés

* dokumentációk áttekintése
* napló átnézése
* szabályok átnézése
* hálózati forgalom figyelése
* fájlintegráció ellenőrzése

Célok felderítése

* hálózat felderítése
* portok és szolgáltatások azonosítása
* sebezhetőség vizsgálat
* vezeték nélküli hálózat felderítése
  * passzív szkennelés
  * aktív szkennelés
  * wifi eszköz helye
  * Bluetooth felderítése

Célok sebezhetősége

* jelszótörés
* penetrációs teszt
* pszichológiai manipuláció (social engineering)

Kockázatértékelés

* biztonsági fejlesztési szabályzat
* kockázatértékelés
* adatkezelés

## Gyakorlat 1

### A tesztelendő szoftver 1

* [https://szit.hu/m/triangle_ts/](https://szit.hu/m/triangle_ts/)

### Feladatok 1

#### Tesztelési terv 1

Egy rövid teszttervet kell készíteni. A terv tartalmazza: milyen funkciókat lesznek tesztelve. Mik az elvárt eredmények és a felhasználói igények.

#### Forgatókönyv 1

Készítsen tesztelési forgatókönyvet

Minimum 1 fogatókönyvet írjon meg. Tartalmazza a tesztelés lépéseit és az elvárt eredményeket.

#### Hibajegyzék 1

Végezze el a teszteket

Készítsen hibajegyzéket.

#### Kérdőív 1

* Készítsen kérdőívet a felhasználói visszajelzések gyűjtésére

Felhasználói élmény, funkciókkal elégedettséggel kapcsolatos kérdéseket legyenek.

#### Prezentáció készítése 1

Készítsen prezentációt, amiben szerepelnek:

* a tesztelt funkciók
* talált hibák
* felhasználói visszajelzések
* javasolt fejlesztések

## Gyakorlat 2

### Tesztelendő szoftver beszerzése 2

* [https://github.com/oktat/teTodo](https://github.com/oktat/teTodo)

Töltsük le a szoftvert, majd a leírás szerint indítsuk el.

### Feladatok 2

#### Tesztelési terv 2

Egy rövid teszttervet kell készíteni. A terv tartalmazza: milyen funkciókat lesznek tesztelve. Mik az elvárt eredmények és a felhasználói igények.

#### Forgatókönyv 2

Készítsen tesztelési forgatókönyvet

Minimum 1 fogatókönyvet írjon meg. Tartalmazza a tesztelés lépéseit és az elvárt eredményeket.

#### Hibajegyzék 2

Végezze el a teszteket

Készítsen hibajegyzéket.

#### Kérdőív 2

* Készítsen kérdőívet a felhasználói visszajelzések gyűjtésére

Felhasználói élmény, funkciókkal elégedettséggel kapcsolatos kérdéseket legyenek.

#### Prezentáció készítése 2

Készítsen prezentációt, amiben szerepelnek:

* a tesztelt funkciók
* talált hibák
* felhasználói visszajelzések
* javasolt fejlesztések

### Letölthető táblázat

* [https://szit.hu/download/oktatas/teszt_sablon.xlsx](https://szit.hu/download/oktatas/teszt_sablon.xlsx)
