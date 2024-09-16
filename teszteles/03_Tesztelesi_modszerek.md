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
