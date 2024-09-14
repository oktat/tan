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
* [Szoftverek](#szoftverek)
* [Gyakorlat](#gyakorlat)

## Az átvételi tesztről

Angolul **User Acceptance Testing**, röviden **UAT**.

Magyarul **Felhasználói elfogadási teszt**, vagy **Felhasználó átvételi teszt**. Röviden lehet **átvételi** vagy **elfogadási** teszt.

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

## Szoftverek

* Wapiti
  * [https://wapiti-scanner.github.io/](https://wapiti-scanner.github.io/)

* dirb
  * [https://www.kali.org/tools/dirb/](https://www.kali.org/tools/dirb/)

## Gyakorlat

### Tesztelendő szoftver beszerzése

* [https://github.com/oktat/teTodo](https://github.com/oktat/teTodo)

Töltsük le a szoftvert, majd a leírás szerint indítsuk el.

### Feladatok

#### Tesztelési terv

Egy rövid teszttervet kell készíteni. A terv tartalmazza: milyen funkciókat lesznek tesztelve. Mik az elvárt eredmények és a felhasználói igények.

#### Forgatókönyv

Készítsen tesztelési forgatókönyvet

Minimum 1 fogatókönyvet írjon meg. Tartalmazza a tesztelés lépéseit és az elvárt eredményeket.

#### Hibajegyzék

Végezze el a teszteket

Készítsen hibajegyzéket.

#### Kérdőív

* Készítsen kérdőívet a felhasználói visszajelzések gyűjtésére

Felhasználói élmény, funkciókkal elégedettséggel kapcsolatos kérdéseket legyenek.

#### Prezentáció készítése

Készítsen prezentációt, amiben szerepelnek:

* a tesztelt funkciók
* talált hibák
* felhasználói visszajelzések
* javasolt fejlesztések
