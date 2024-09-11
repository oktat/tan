# Terheléses tesztelése

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [A terheléses tesztelésről](#a-terheléses-tesztelésről)
* [Figyelmeztetés](#figyelmeztetés)
* [JMeter](#jmeter)
* [Teszt gyakorlat](#teszt-gyakorlat)
* [Tesztelendő szerver összeállítása](#tesztelendő-szerver-összeállítása)
* [Első teszttervünk](#első-teszttervünk)

## A terheléses tesztelésről

A terheléses teszt során a renszerre vagy az alkalmazásra egy növekvő terhelést helyezünk, hogy megvizságljuk a viselekdését.

Tesztelhetjük a hálózati terhelés, vagy a memóriafogyasztást,  vagy valamilyen konkrét célt.

## Figyelmeztetés

Terheléses tesztnek csak a saját gépeinket, szerverinket tegyük ki! Mások gépeinek terhelése, bűncselekmény és feljelentést vonhat maga után.

## JMeter

A JMeter-ben teszterveket hozunk létre, azon belül szálcsoportokat (Thread Group). A szálcsoportok a minden tesztnek a kezdőpontjai.

### Szálakcsoportok

Beállíthatjuk a szálak számát, és a lefutáis időt.

* Number of Threads (users): 10
* Ramp-up period (second): 100

Ha szálak száma 10, a lefutási idő 100, akkor 10 másodpercentként indul egy szál.

### Vezérlők

Kétféle vezérlő van:

* Mintavevő
* Logikai

A mintavevő azt mondja a JMeter-nek, hogy küldjön kéréseket a szervernek, és várja a választ.

A logikai vezérlővel testreszabható, hogy a JMeter mikor küldjön kérést.

### Mintavevő vezérlő

A következő mintavevők állnak rendelkezésre.

* FTP kérés
* HTTP-kérés
* JDBC-kérés
* Java objektum kérés
* JMS kérés
* Junit teszt kérés
* LDAP teszt kérés
* E-mail kérés
* OS Process request
* TCP kérés

Minden mintavevőnek számtalan tulajdonsága van, de felvehetünk hozzá konfigurációs elemet is.

Ebben a leírásban a HTTP kérést fogjuk használni.

### Figyelők

A figyelők hozzáférést biztosítanak a tesztesetekről összegyűjtött információkhoz. Például:

* View Results Tree

## Teszt gyakorlat

## Tesztelendő szerver összeállítása

```bash
mkdir api
cd api
sin api
pnpm i
pnpm start
```

## Első teszttervünk

A JMeter előre összeállított sablonját fogjuk használni.

Indítsuk el a JMeter-t. A File menüből válasszuk a "Templates..." lehetőséget.

* jmeter.bat
* File > Templates...
* Felül a legördülő listadobozból:
  * Simple HTTP request
* Válasszuk a [ Create ] gombot.
* Négy környezeti változót fogunk beállítani:
  * method: POST
  * body { "name": "Tibor", "city":"Pécs", "salary": 395 }
  * contentType: application/json
  * url: [http://localhost:8000/employees](http://localhost:8000/employees)
* Válasszuk újra a [ Create ] gombot
* Mentsük el a teszttervet.
* Futtassuk

A futtatáshoz találunk az eszköztáron egy lejátszógombot.
