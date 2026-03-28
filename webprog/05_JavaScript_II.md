# Webprogramozás - JavaScript II

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Objektumok és tömbök kezelése ES6](#objektumok-és-tömbök-kezelése-es6)
* [Hibakeresés JavaScriptben](#hibakeresés-javascriptben)
* [Szinkron futtatás](#szinkron-futtatás)
* [Promise](#promise)
* [JSON](#json)
* [REST API](#rest-api)
* [AJAX](#ajax)
* [CRUD műveletek XMLHttpRequest-tel](#crud-műveletek-xmlhttprequest-tel)
* [CRUD műveletek fetch függvénnyel](#crud-műveletek-fetch-függvénnyel)
* [Az async használata](#az-async-használata)
* [Tömbök](#tömbök)
* [Beépített objektumok](#beépített-objektumok)
* [Build művelet](#build-művelet)
* [TypeScript](#typescript)

## Objektumok és tömbök kezelése ES6

Az ES6 szabványban a JavaScript a class utasítással is bővült.
Létrehozhatunk osztályokat, ahogy azt az objektum orientált
nyelveknél azt megszoktuk.

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

Szintén az ES6 szabvánnyal került be for..of utasítás. A for..of ciklussal nem az indexet kapjuk egy sztring
vagy egy tömb esetén, hanem magát az értéket.

```javascript
let mondat = 'körte';

for(let ch of mondat) {
    console.log(ch);
}
```

```javascript
const nums = [32, 45, 18, 27];

for(const num of nums) {
    console.log(num);
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

```javascript
console.log('egy')
console.log('kettő')
console.log('három')
```

Néhány utasítás aszinkron módon fut le, vagyis nem sorba a többi kóddal. Ilyen a **setTimeout()** függvény. Lássunk egy kódot:

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
new Promise()
```

```javascript
var p = new Promise((resolve, reject) => {})
```

A Promise állapotai:

* pending - folyamatban van
* fulfilled - resolve - sikeres válasz
* rejected - sikertelen válasz

Tevékenység Promise-on belül:

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

Használjuk a böngésző konzolját a futtatáshoz. Másoljuk be egyszerűen egy böngésző
konzoljára, majd nyomjunk **Enter**-t.

Most írjuk be a konzolba p-t majd nyomjunk Entert: **p<Enter>**

Az eredmény lekérdezése:

```javascript
p.then( res => {
    console.log('A then eredménye: ', res);
})
.catch(err => {
    console.log('A catch eredménye: ', err);
})
```

### A szállítás szimulációja

#### A Promise

Készítsünk egy Promise-t:

```javascript
const szallitas = new Promise((szallit, visszautasit) => {})
```

Másoljuk a böngésző konzoljára.

```console
szallitas
```

Ezt követően nyomjunk Entert: **Enter**

#### Szállítás

Most hívjuk meg a szallit() függvény, hogy sikerre fusson:

```javascript
const szallitas = new Promise((szallit, visszautasit) => {
    szallit();
});
```

Most futassuk sikertelenre:

```javascript
const szallitas = new Promise((szallit, visszautasit) => {
    visszautasit();
});
```

#### A szimuláció

```javascript
const szallitas = new Promise((szallit, visszautasit) => {
    const ran = Math.random();
    console.log(ran);
    if (ran > 0.5) {
        szallit();
    }
    visszautasit();
});
```

#### Késleltetés

```javascript
const szallitas = new Promise((szallitas, visszautasitas) => {
    setTimeout(()=> {
        const ran = Math.random();
        console.log(ran);
        if (ran > 0.5) {
            szallitas();
        }
        visszautasitas();
    }, 10000);
});
```

#### Az eredmény használata

```javascript
const szallitas = new Promise((szallit, visszautasit) => {
    setTimeout(()=> {
        const ran = Math.random();
        console.log(ran);
        if (ran > 0.5) {
            szallit();
        }
        visszautasit();
    }, 10000);
});

szallitas.then(() => {
    console.log('Szállítás történik');
})

szallitas.catch(() => {
    console.log('Hiba! Sikertelen szállítás!');
});
```

#### Használat függvényként

```javascript
const lekerSzallitas = () => {
    return new Promise((szallitas, visszautasitas) => {
        setTimeout(()=> {
            const ran = Math.random();
            console.log(ran);
            if (ran > 0.5) {
                szallitas();
            }
            visszautasitas();
        }, 10000);
    });
};

lekerSzallitas().then(() => {
    console.log('Szállítás történik');
});

lekerSzallitas().catch(() => {
    console.log('Hiba! Sikertelen szállítás!');
});
```

#### Vonatozás

```javascript
const lekerSzallitas = () => {
    return new Promise((szallitas, visszautasitas) => {
        setTimeout(()=> {
            const ran = Math.random();
            console.log(ran);
            if (ran > 0.5) {
                szallitas();
            }
            visszautasitas();
        }, 10000);
    });
};

lekerSzallitas().then(() => {
    console.log('Szállítás történik');
})
.catch(() => {
    console.log('Hiba! Sikertelen szállítás!');
});
```

#### Üzenetek Promise-ból

```javascript
const lekerSzallitas = () => {
    return new Promise((szallitas, visszautasitas) => {
        setTimeout(()=> {
            const ran = Math.random();
            console.log(ran);
            if (ran > 0.5) {
                szallitas('Siker');
            }
            visszautasitas('Hiba! A szállítás nem lehetséges');
        }, 10000);
    });
};

lekerSzallitas().then( res => {
    console.log(res);
})
.catch( res => {
    console.log(res);
});
```

Kövessük a témát a következő helyen:

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

A REST egy szoftverarchitektúra-stílus.

A REST alkalmazásnak következőnek kell megfeleljenek.

* kliens-szerver
* URL-n keresztül elérhető
* állapotmentes
* rétegelt rendszer
* gyorstárazható
* a szerver és a kliens között egységes interfész
* igényelt kód - a szervert kódot ad a kliensnek (JavaScript)

Lásd még:

* [https://szit.hu/doku.php?id=oktatas:web:rest_api:rest_api](https://szit.hu/doku.php?id=oktatas:web:rest_api:rest_api)

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

Kapunk egy **package.json** fájlt. Keressük meg a scripts tulajdonságot, majd vegyünk fel egy újabb értéket:

```json
{
    "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1",
        "start": "json-server --watch database.json"
    }
}
```

Telepítsük a json-server csomagot:

```cmd
npm install --save json-server
```

Készítsünk egy adatbázist:

```json
{
    "employees": [
        {
            "id": 1, 
            "name": "Csete Irén",
            "city": "Szeged",
            "salary": 342
        },
        { 
            "id": 2,
            "name": "Erős Áron",
            "city": "Szolnok",
            "salary": 395
        },
        { 
            "id": 3,
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

Szükségünk van egy REST API kliensre. Resen, Insomnia, Insomnium, Postman, httpie stb.

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

#### Az XMLHttpRequest használata

_app.js_:

```javascript
const url = 'http://localhost:3000/employees'
const xhr = new XMLHttpRequest()

xhr.open('GET', url, true)
xhr.onload = function() {
  if (xhr.status >= 200 && xhr.status < 300) {
    const employees = JSON.parse(xhr.responseText)
    console.log(employees)
  }else {
    console.error('Hiba! A lekérdezés sikertelen!')
    console.error('Státusz:', xhr.status)
  }
}

xhr.onerror = function() {
  console.error('Hálózati hiba!')
}

xhr.send()
```

#### A fetch használata

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

## CRUD műveletek XMLHttpRequest-tel

### Create művelet xhr

```javascript
const host = 'http://localhost:3000/';

function createEmployee() {
    const url = host + 'employees';
    const employee = {        
        name: 'Pontos Péter',
        city: 'Hatvan',
        salary: 393,
        positionId: 1
    };

    // 1. Új XMLHttpRequest objektum létrehozása
    const xhr = new XMLHttpRequest();

    // 2. Kapcsolat megnyitása (Metódus, URL, Aszinkron-e)
    xhr.open('POST', url, true);

    // 3. Fejlécek beállítása (Fontos a JSON küldéséhez!)
    xhr.setRequestHeader('Content-Type', 'application/json');

    // 4. Eseménykezelő a válasz feldolgozásához
    xhr.onload = function() {
        if (xhr.status >= 200 && xhr.status < 300) {
            // Siker esetén a választ JSON-ná alakítjuk
            const result = JSON.parse(xhr.responseText);
            console.log(result);
        } else {
            // Szerveroldali hiba (pl. 404, 500)
            console.error('Hiba történt a kérés során: ' + xhr.status);
        }
    };

    // 5. Hálózati hiba kezelése
    xhr.onerror = function() {
        console.error('Hálózati hiba történt.');
    };

    // 6. Az adat elküldése JSON formátumban
    xhr.send(JSON.stringify(employee));
}
```

## CRUD műveletek fetch függvénnyel

### Create művelet

A fetch() függvény első paramétere az url, a második parméter egy objektum.
Szükséges kulcsok:

* method
* headers
* body

A body-ban sztringesítve utaztatjuk a dolgozó adatait.

```javascript
const host = 'http://localhost:3000/'

function createEmployee() {
    const url = host + 'employees'
    const employee = {        
        name: 'Pontos Péter',
        city: 'Hatvan',
        salary: 393,
        positionId: 1
    }
    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(employee)
    })
    .then(response => response.json())
    .then(result => console.log(result))
    .catch(err => console.log(err))
}
```

### Read művelet

```javascript
function getEmployees() {
    const url = host + 'employees'
    fetch(url)
    .then(response => response.json())
    .then(result => console.log(result))
    .catch(err => console.log(err))
}
```

### Update művelete

```javascript
function updateEmployee() {
    const url = host + 'employees/JDkmrybJgWw'
    const employee = {        
        name: 'Ron Irén',
        city: 'Zalaegerszeg',
        salary: 398,
        positionId: 1
    }
    fetch(url, {
        method: 'PUT',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(employee)
    })
    .then(response => response.json())
    .then(result => console.log(result))
    .catch(err => console.log(err))
}
```

### Delete művelete

```javascript
function deleteEmployee() {
    const url = host + 'employees/JDkmrybJgWw'
    fetch(url, {
        method: 'DELETE'
    })
    .then(response => response.json())
    .then(result => console.log(result))
    .catch(err => console.log(err))
}
```

## Az async használata

### Az async create művelet

```javascript
const host = 'http://localhost:3000/'
```

```javascript
async function createEmployee() {
    const url = host + 'employees'
    const employee = {
        name: 'Pontos Péter',
        city: 'Hatvan',
        salary: 393,
        positionId: 1
    }
    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(employee)
        })
        const result = await response.json()
        console.log(result)
    } catch (error) {
        console.log(error)
    }
}

```

### Az async read művelet

```javascript
async function getEmployees() {
    const url = host + 'employees'
    try {
        const response = await fetch(url);
        const result = await response.json();
        console.log(result)
    } catch (error) {
        console.log(error)
    }
}
```

### Az async update művelet

```javascript
async function updateEmployee() {
    const url = host + 'employees/2cOhFYAUkfs'
    const employee = {
        name: 'Ron Irén',
        city: 'Zalaegerszeg',
        salary: 398,
        positionId: 1
    }
    try {
        const response = await fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(employee)
        })
        const result = await response.json()
        console.log(result)
    } catch (error) {
        console.log(error)
    }

}
```

### Az async delete művelet

```javascript
async function deleteEmployee() {
    const url = host + 'employees/2cOhFYAUkfs'
    try {
        const response = await fetch(url, {
            method: 'DELETE'
        })
        const result = await response.json()
        console.log(result)
    } catch (error) {
        console.log(error)
    }
}
```

## Tömbök

### Szűrés

```javascript
const szavak = ['alma', 'körte', 'barack', 'szilva', 'málna']

const result = szavak.filter((szo) => szo.length < 5)

console.log(result)
```

```javascript
const szavak = ['alma', 'körte', 'barack', 'szilva', 'málna']

const result = szavak.filter(rovidek)

function rovidek(szo) {
    return szo.length < 5
}
console.log(result)
```

### Tartalmazás

```javascript
const gyumolcsok = ['alma', 'körte', 'barack', 'szilva', 'málna']

console.log(gyumolcsok.includes('málna'))
//A futtatás eredménye: true
```

### Összekapcsolás

Tömbből sztirng.

```javascript
const elemek = ['tűz', 'levegő', 'víz']

console.log(elemek.join())
//A futtatás eredménye: 'tűz, levegő, víz'

console.log(elemek.join('-'))
//A futtatás eredménye: 'tűz-levegő-víz'

```

### Tömb leképezése

Fogunk egy tömböt, csinálunk vele valamit, majd kapunk egy újabb tömböt.

```javascript
const szamok = [2, 8, 3, 9]

const lekepezett = szamok.map((x) => x * 2)

console.log(lekepezett)
//A futtatás eredménye: Array [4, 16, 6, 18]
```

### Redukálás egyetlen értékre

Valamilyen szempont alapján egyetlen értékre redukálunk egy tömböt.

```javascript
const szamok = [1, 2, 3, 4]

// 0 + 1 + 2 + 3 + 4
const initialValue = 0
const sum = szamok.reduce(
    (accumulator, currentValue) => accumulator + currentValue, 
    initialValue
)
console.log(sum)
//A futtatás eredménye: 10
```

Szintaxis:

```javascript
reduce(callbackFn)
reduce(callbackFn, initialValue)
```

* callbackFn

A callbackFn egy függény amit minden elemre végre kell hajtani.
A visszatérési értéke bekerül az accumulator-ba, ami a következő
hívás **currentValue** értéke lesz.

* initialValue

Az initialValue lesz az accumulator első értéke.
Ha nincs megadva initialValue, akkor a tömb első
eleme lesz a kezdőérték.

## Beépített objektumok

### Map

```javascript
const map = new Map();
map.set('a', 1);
map.set('b', 2);
map.set('c', 3);
console.log(map);
console.log(map.get('b'));

```

### Math

A Math egy névtérobjektum, ami statikus mezőket és metódusokat tartalmaz,
matematikai állandókkal és függvényekkel.

* Math.PI
* Math.abs()
* Math.ceil()
* Math.cos()
* Math.floor()
* Math.pow()
* Math.random()
* Math.round()
* Math.sin()
* Math.sqrt()
* Math.tan()

```javascript
console.log(Math.PI); // 3.141592653589793
console.log(Math.abs(-5)); // 5
console.log(Math.ceil(2.1)); // 3

const rad = 30 * Math.PI / 180;
console.log(Math.cos(rad)); // 0.8660254037844387

console.log(Math.floor(2.9)); // 2

console.log(Math.pow(2, 8)); // 256

console.log(Math.random()); // 0 és 1 közötti szám
```

### JSON objektum

Egy névtérobjektum, amely statikus metódusokat tartalmaz
JavaScript objektumok JSON típusra alakaításához és vissza.

```javascript
JSON.parse()
JSON.stringify()
```

```javascript
const obj = {
    id: 1,
    name: 'Elemér'
}
const str = JSON.stringify(obj);
console.log(str); // {"id":1,"name":"Elemér"}

const obj2 = JSON.parse(str);
console.log(obj2); // { id: 1, name: 'Elemér' }
```

### Set objektum

A Set objektumok értékeinek gyűjteménye.

```javascript
const set1 = new Set();

set1.add(5); // Set(1) { 5 }
set1.add(3); // Set(2) { 5, 3 }
set1.add(3); // Set(2) { 5, 3 }
set1.add('alma'); // Set(3) { 5, 3, 'alma' }
const o = { a: 1, b: 2 }
set1.add(o)

set1.has(o); // true
set1.has(5); // true
set1.size; //4
set1.delete(3); // a 3-s törlése
set1.has(3); // false
```

Bejárás:

```javascript
for(const item of set1) {
    console.log(item)
}
```

Több információ:

* [https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set)

### Date objektum

A JavaSCript Date objektumai egyetlen időpillanatot ábrázolnak
platformfüggetlen formátumban. A dátumobjektumok egy egész
számot tartalmaznak, amely ezeredmásodperceket jelent.
1970 január 1 óta eltelt ezredmásodpercek száma.
Ezt epoch-nak is hívjuk.

```javascript
const date = Date.now()
console.log(date) // 1774728656026
```

```javascript
const now = new Date()
console.log(now) // 2026-03-28T20:10:56.029Z
```

```javascript
const now = new Date("2026-03-28T12:00:00")
const [month, day, year] = [
    now.getMonth(), 
    now.getDate(), 
    now.getFullYear()
]

now.setMinutes(5)

const [hour, minute, second] = [
    now.getHours(), 
    now.getMinutes(), 
    now.getSeconds()
]


console.log(month, day, year) // 2 28 2026
console.log(hour, minute, second) // 12 0 0
```

```javascript

const now = new Date("2026-03-28T12:00:00")

now.setMinutes(5)

const [hour, minute, second] = [
    now.getHours(), 
    now.getMinutes(), 
    now.getSeconds()
]

console.log(hour, minute, second) // 12 5 0
```

* [https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date)

## Build művelet

A fejlesztés során az emberbarát kódot átalakítjuk a böngésző számára,
gyorsan futtatható kóddá.

Fogalmak:

* Transzpillálás: Újabb JavaScript átalakítása régebbi verzióra. Erre jó pl. Babel.
* Bundling (csomagolás): Több különálló fájl (.js, .css) összevonása egyetlen fájlba.
* Minifikálás: Felesleges whitespace karakterek, kommentek eltávolítása.
* Asset Management: Képek optimalizálása. SASS/LESS fájlok CSS-re alakítása.

### A build folyamat eszközei

| Típus | Eszközök | Feladat |
| - | - | - |
| Csomagekezelő | npm, yarn, pnpm | Külső könyvtárak (függőségek) letöltése. |
| Task Runnerek | Gulp, Grunt | Ismétlődő feladatok automatizálása. |
| Bundlerek | Webpack, Vite, esbuild, Rollup | A teljes alkalmazás összefogása. |

### A buildfolyamat

1.) fejlesztés

```bash
npm run dev
```

2.) build

```bash
npm run build
```

A build folyamat létrehoz egy **dist** könyvtárat. Ebben a mappában egy
tömörített változatát találjuk a webes alkalmazásunknak.

### Projekt létrehozása build folyamathoz

```bash
npm create sip@latest
```

```bash
npm create vite@latest
```

## TypeScript

A TypeScript a JavaScript kiegészítve típusokkal.

Nézzük meg a következő kódot:

_app.js_:

```javascript
const employee = {
    firstName: 'Árpád',
    lastName: 'Tona',
    age: 22
}

console.log(employee.name);
```

A kódszerkesztő nem ad hibát, pedig hibás.

Ha ugyanezt TypeScriptben írjuk, hibát kapunk.

_app.ts_:

```javascript
const employee = {
    firstName: 'Árpád',
    lastName: 'Tona',
    age: 22
}

console.log(employee.name);
```

A TypeScript nyelvet nem ismerik a böngészők, ezért azt le kell fordítani
JavaScriptre.

A fordításhoz a typescript nevű csomagot használjuk.
Telepítés projektben:

```bash
npm install typescript --save-dev
```

```bash
npx tsc
```

Globális telepítés:

```bash
npm install --global typescript
```
