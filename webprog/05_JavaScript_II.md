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

A JavaScript kódok egymás után sorba futnak le, szinkronban.
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

A **JSON** a **JavaScript Object Notation** rövidítése. Egy szabvány, amit adatok strukturálására szántak egy szöveges állományban.

Az RFC 4627 szabványban van leírva. A JSON állomány kiterjesztése:

* **.json**

MIME típusként:

* **application/json**

A JSON formátumot **Douglas Crockford** határozta meg és népszerűsítette.

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

Szerveren létrehozott HTTP végpontok, amelyen keresztül elérhetők, kezelhetők egy adott adatbázis adatai.

Lásd:

* [https://szit.hu/doku.php?id=oktatas:web:rest:rest_api](https://szit.hu/doku.php?id=oktatas:web:rest:rest_api)

## AJAX

Az **AJAX** az **Asynchronous JavaScript and XML** rövidítése. AJAX esetén JavaScript segítségével hozunk el adatokat egy szerverről. Erre az **XMLHttpRequest** objektumot használjuk. Az adatok elhozhatók JSON, XML, HTML vagy szöveges formában.

A jelenlegi divat szerint REST API-t használunk, ahol a JSON a szokásos formátum.

Az ES6 szabványban megjelent a fetch() függvény, amit Promise alapon hoztak létre. A fetch függvénnyel is adatokat hozhatunk el szerverről JavaScript kóddal.

### JSON szerver

A json-server egy Node.js csomag, amivel helyettesítő a REST API szerver. Üzemeljük be a json-server-t.

Készítsünk Node.js projektet:

```cmd
mkdir api
cd api
npm init -y
```

Kapunk egy package.json fájlt. Keressük meg a scripts tulajdonságot, majd vegyünk fel egy újabb értéket:

```json
{
    "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1",
        "start": "json-server --watch package.json"
    }
}
```

Telepítsük a json-server csomagot:

```cmd
npm install --save-dev json-server
```

Készítsünk egy adatbázist:

```json
{
    "employees": [
        { 
            "name": "Csete Irén",
            "city": "Szeged",
            "salary": 342
        },
        { 
            "name": "Erős Áron",
            "city": "Szolnok",
            "salary": 395
        },
        { 
            "name": "Csont Ernő",
            "city": "Szeged",
            "salary": 348
        }
    ]
}
```

Indítsuk el a szervert:

```cmd
npm start
```

Szükségünk van egy REST API kliensre. Insomnia, Postman httpie, stb.

A httpie telepítése rendszergazdaként Chocolatey telepítésével:

```cmd
choco install httpie
```

Ellenőrizzük a httpie klienssel a REST API működését:

```cmd
http get http://localhost:8000/employees
```

Resen csomag használata:

```cmd
npm install --global resen
```

Ellenőrizzük a resen klienssel a REST API működését:

```cmd
res get http://localhost:8000/employees
```

### REST API elérése JavaScripttel

Írjunk egy JavaScript klienst:

```javascript
var host = 'http://localhost:8000/';
var endpoint = 'employees';
var url = host + endpoint;
fetch(url)
.then(response => response.json())
.then(result => console.log(result))
.catch(err => console.log(err));
```

Tegyük fel, hogy az src/app.js fájlba írtuk. A futtatás node paranccsal ekkor:

```cmd
node src/app.js
```

Az async és await használatával:

```javascript
(async () => {
    try {
        var host = 'http://localhost:8000/';
        var endpoint = 'employees';
        var url = host + endpoint;
        const response = await fetch(url);
        const result = await response.json();
        console.log(result);
    } catch (err) {
        console.log(err);
    }
})();
```

A fetch() függvényről lásd tovább:

* [https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_fetch:egyszeru_lancolt](https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_fetch:egyszeru_lancolt)
