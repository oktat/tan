# Webprogramozás - JavaScript II

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Objektumok és tömbök kezelése ES6

```javascript
class Jarmu {
    constructor() {
        this.rendszam = 'ismeretlen';
        this.szin = 'ismeretlen';
        this.ar = 0;
    }
}

jarmu1 = new Jarmu();
jarmu1.rendszam = 'ABC-123';
console.log(jarmu1.rendszam);
```

### A for/of operátorok

```javascript
let mondat = 'körte';

for(let ch of mondat) {
    console.log(ch);
}
```

## Hibakeresés JavaScriptben

A böngészők lehetővé teszik a hibakeresést a változók tartalmának megmutatásával.
Lássunk egy egyszerű JavaScript kódot:

```javascript
var szam = 35;
szam = 40;
szam = 45;
szam = 50;
```

A második sorba állítsunk be töréspontot egy kattintással. Az alábbi ábrán látható jelölés kerül a második sor elé.

![images/javascript_debug_chrome.png](images/javascript_debug_chrome.png)

A böngésző weblapján megjelenik egy léptetődoboz:

![images/leptetes_chrome_nyiljeloles.png](images/leptetes_chrome_nyiljeloles.png)

## Szinkron futtatás

A JavaScript kódók egymás után sorba futnak le, szinkronban.
Amíg az egyik le nem fut a következő várakozik.

Néhány utasítás aszinkron módon fut le, vagyis nem sorba a többi kóddal. Ilyen a setTimeout() függvény. Lássunk egy kódot:

```javascript
function valami() {
    console.log('kettő')
}
console.log('egy');
setTimeout(valami, 5000);
console.log('három');
```

A futtatás eredménye:

```txt
egy
három
kettő
```

A három szót kiíró utasítás késleltetve hajtódik végre, aszinkron módon.

## Promise

A Promise segítségével aszinkron folyamatok eredményét várhatjuk és értékelhetjük.

Promise létrehozása:

```javascript
var p = new Promise((resolve, reject) => {
    let a = 30;
    if(a < 60) {
        resolve('Success');
    }else {
        reject('Failed');
    }
});
```

Kövessük a témát a következő helyen:

* [https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_promise](https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_promise)

## JSON

A JSON a JavaScript Object Notation rövidítése. Egy szabvány, amit
adatok strukturálására szántak egy szöveges állományban.

Az RFC 4627 szabványban van leírva. Állományban kiterjesztése **.json** .
MIME típusként **application/json** .

A JSON formátumot Douglas Crockford határozta meg és népszerűsíttette.

```JSON
{
    "név": "Nagy János",
    "cím": {
        "település": "Szolnok",
        "közterület": "Fenyő utca 42."
    },
    "fizetés": 370
}
```

Ha készítettünk egy JSON struktúrát online is megvizsgálhatjuk érvényességét:

* [https://jsonlint.com/](https://jsonlint.com/)

Lásd még:

* [https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_json](https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_json)

## REST API

Szerveren létrehozott végpontok, amelyen keresztül kezelhetők egy adott adatbázis adatai.

Lásd:

* [https://szit.hu/doku.php?id=oktatas:web:rest:rest_api](https://szit.hu/doku.php?id=oktatas:web:rest:rest_api)

## AJAX

Az AJAX az Asynchronous JavaScript and XML rövidítése. AJAX esetén JavaScript segítségével hozunk el adatokat egy szerverről. Erre az XMLHttpRequest objektumot használjuk. Az adatok elhozhatók JSON, XML, HTML vagy szöveges formában.

A jelenlegi divat szerint REST API-t használunk, ahol a JSON a szokásos formátum.

Az ES6 szabványban megjelent a fetch() függvény, amit Promise alapon hoztak létre. A fetch függvénnyel is adatokat hozhatunk el szerverről JavaScript kóddal.

A fetch() függvényről lásd tovább:

* [https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_fetch:egyszeru_lancolt](https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_fetch:egyszeru_lancolt)
