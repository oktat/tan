# Szoftvertesztelés - JavaScript tesztelés mocha

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Bevezetés](#bevezetés)
* [A Mocha](#a-mocha)
* [Szükséges](#szükséges)
* [Helló Világ](#helló-világ)
* [Függvény tesztelése](#függvény-tesztelése)
* [Kizárások](#kizárások)
* [Hibakezelés tesztelése](#hibakezelés-tesztelése)
* [Alkalmazás készítése](#alkalmazás-készítése)
* [Horgok](#horgok)
* [Chai](#chai)
* [Gyakorlatok](#gyakorlatok)

## Bevezetés

A fejezet feldolgozásához feltételezzük HTML5, CSS, JavaScript és Node.js ismereteket.

## A Mocha

A Mocha böngésző és Node.js JavaScript alkalmazások tesztelésére használható.

## Szükséges

Telepítve kell legyen:

* Node.js
* VSCode

A VSCode helyett használhatunk más kódszerkesztőket is, például VSCodium.

## Helló Világ

Készítsünk egy app01 könyvtárat, csináljunk belőle Node.js programot.

```bash
mkdir app01
cd app01
code .
```

Alakítsuk Node.js projektté:

```bash
npm init -y
```

> [!NOTE]
> Az npm parancs helyett használhatjuk a sinto csomag sin parancsát:
>
> ```bash
> npm install --global sinto
> ```
>
> Projekt létrehozása, ha beléptünk annak könyvtárába:
>
> ```bash
> sin ebuild -j
> ```

Telepítsük a teszteléséhez a csomagokat:

```bash
npm install --save-dev mocha
```

A mocha csomagot telepíthetjük globálisan is, ekkor lesz egy **mocha** parancsunk:

```bash
npm install --global mocha
```

Ellenőrzés:

```bash
mocha --version
```

A telepítéshez az **npm helyett** használhatjuk a **yarn** vagy a **pnpm** parancsot is.

Készítsük a projektünk gyökerében egy **test** nevű könyvtárat. Tetszőleges néven készítsünk benne egy teszt állományt.

```bash
app01/
  `-test/
     `-appTest.js
```

A appTest.js fájl tartalma:

```javascript
const assert = require('assert')
describe('egyszerű teszt', () => {
    it('A true értékre true-t várunk', () => {
      assert.equal(3, 3)
    })  
})
```

Ha be van állítva a package.json fájlban a type érték module-ra ("type": "module"), akkor az importálása:

```javascript
import assert from 'assert';
```

A tesztek egy describe() és it() függvényekből állnak. Az it() függvényekből több is lehet és a describe() függvényen belül helyezzük el őket. Mindkét függvénynek két paramétere van, egy szöveg és egy függvény. A szövegben írjuk le, mit csinál a tesztünk, és egy
névtelenfüggvényben valósítjuk meg a teszeket.

A package.json fájlban írjunk "test" nevű scriptet, amivel futtathatjuk a tesztet:

```json
{
  "name": "app01",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "mocha"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "jasmine-browser-runner": "^2.1.0",
    "jasmine-core": "^5.1.0"
  }
}
```

Futtassuk a tesztet:

```bash
npm test
```

Egy állományban több describe() függvény is lehet. Minden describe() függvény egy teszt blokkot alkot. A describe() függvény több it() függvényt tartalmazhat.

## Függvény tesztelése

Az tools.js hivatkozása a HTML fájlban:

```html
<script type="module" src="tools.js"></script>
```

A package.json fájlban a type értéke:

```json
{
    "type": "module"
}
```

Tipp: A **sinto** csomag, **sin init** parancsa, pont így állítja be a fájlokat.

Most teszteljünk egy függvényt, ami összead két számot. Készítsünk az src könyvtárban egy **tools.js** állományt.

src/tools.js:

```javascript
function add(num1, num2) {
    return num1 + num2
}

function sub(num1, num2) {
  return num1 - num2;
}

export {add, sub};
```

Írjunk hozzá tesztet, **toolsTest.js** nevű fájlba.

test/toolsTest.js:

```javascript
import assert from 'assert';
import { add, sub } from '../src/tools.js';

describe('Az add() függvény tesztje', () => {
    it('A 30, 35 bemenetre 65', () => {
        let actual = add(30, 35)
        assert.equal(actual, 65)
    })  
})
describe('Az sub() függvény tesztje', () => {
  it('A 30, 35 bemenetre -5', () => {
    let actual = sub(30, 35);
    assert.equal(actual, -5);
  })
})
```

Most futtassuk tesztet, ha az nem fut:

```bash
npm test
```

## Kizárások

Az only() függvénnyel csak adott tesztet futtathatjuk.

test/toolsTest.js:

```javascript
describe('Az add() függvény tesztje', () => {
    it('A 30, 35 bemenetre 65', () => {
        let actual = add(30, 35)
        assert.equal(actual, 65)
    })
    it.only('A 70, 20 bemenetre 90', () => {
        let actual = add(70, 20)
        assert.equal(actual, 90)
    })
})

//...
```

A skip() segítségvel az adott tesztet átlépjük.

test/toolsTest.js:

```javascript
describe('Az add() függvény tesztje', () => {
    it('A 30, 35 bemenetre 65', () => {
        let actual = add(30, 35)
        assert.equal(actual, 65)
    })
    it.skip('A 70, 20 bemenetre 90', () => {
        let actual = add(70, 20)
        assert.equal(actual, 90)
    })
})
//...
```

Ebben az esetben csak a második teszt nem fog futni.

## Hibakezelés tesztelése

Adott a következő függvény:

```javascript
function calcRadius(side, alpha) {
    if(!isValidInput(side)) {
        throw new Error('Hiba! Az oldal érték hibás!')
    }
    if(!isValidInput(alpha)) {
        throw new Error('Hiba! A szög érték hibás!')
    }
    let rad = alpha * Math.PI / 180
    return 1.0/2.0 * side * Math.sin(rad)
}
```

Csak azt teszteljük, hogy dob egyáltalán hibát:

```javascript
    it.only('A 45, 0 bemenetre Hiba', () => {
        assert.throws(() => {
            const actual = calcRadius(45, 0)
          })
    })
```

Azt is vizsgáljuk milyen hibát dob:

```javascript
    it('A 30, 0 bemenetre Hiba', () => {
        assert.throws(() => {
            const actual = calcRadius(30, 0)
          }, {
            name: 'Error',
            message: 'Hiba! A szög érték hibás!'
          })
    })
```

## Alkalmazás készítése

### Feladat

Oldjunk meg egy feladatot szit.hu webhelyről, amely adatokat kér be, számítást elvégezi, majd az eredményt kiírja. A feladatok közül 0301-től 0400-ig jöhet szóba.

Legyen a 0312-s feladat. A projekt neve "tombsug".

Hozzuk létre a könyvtárat és indítsuk el a kódszerkesztőt:

```bash
mkdir tombsug
cd tombsug
code .
```

Hozzunk létre egy Node.js projektet. Használjuk a sin parancsot:

```bash
sin init
```

Készítsük el az alkalmazást az src könyvtárban:

```txt
tombsug/
  `-src/
     |-app.js
     `-index.html
```

Az index.html tartalma:

```html

```

Az app.js fájlban két objektumot, 6 függvényt hozunk létre, és a window objektumon futtatunk egy függvényt:

```javascript
const doc = {}
const state = {}

window.addEventListener()

function init() {}
function handleEvent() {}
function startCalc() {}
function tryStartCalc() {}
function calcRadius() {}
function inputOk() {}
```

A teljes fájlok:

src/app.js:

```JavaScript
const doc = {
    sideInput: document.querySelector('#side'),
    alphaInput: document.querySelector('#alpha'),
    radiusInput: document.querySelector('#radius'),
    calcButton: document.querySelector('#calcButton')
}

const state = {
    radius: null
}

window.addEventListener('load', () => {
    init()
})

function init() {
    handleEvent()
}

function handleEvent() {
    if(doc.calcButton) {
        doc.calcButton.addEventListener('click', () => {
            startCalc()
        })
    }
}

function startCalc() {
    try {
        tryStartCalc()
    }catch(err) {
        console.log(err.message)
        alert(err.message)
    }
}

function tryStartCalc() {
    let side = doc.sideInput.value;
    let alpha = doc.alphaInput.value;
    state.radius = calcRadius(side, alpha)
    doc.radiusInput.value = state.radius
}
```

src/tools.js:

```javascript
function calcRadius(side, alpha) {
    if(!isValidInput(side)) {
        throw new Error('Hiba! Az oldal érték hibás!')
    }
    if(!isValidInput(alpha)) {
        throw new Error('Hiba! Az szög érték hibás!')
    }
    let rad = alpha * Math.PI / 180
    return 1.0/2.0 * side * Math.sin(rad)
}

function isValidInput(input) {
    let inputStr = String(input)
    if(!inputStr.match(/^[0-9]+$/)) {
        return false
    }
    if(input <= 0) {
        return false
    }
    return true
}

export {calcRadius, isValidInput}
```

### Tesztesetek felvétele

Szükségünk van tesztestekre. Vegyünk egy számológépet és nézzük meg, adott bemenetre mit kell kapnunk.

Használjuk a Node.js node parancsát, például:

```javascript
node
Welcome to Node.js v20.18.0.
Type ".help" for more information.
> 1.0/2.0*30*Math.sin(35*Math.PI/180)
8.60364654526569
> 
```

Lehetséges tesztesetek:

| Oldal | Alfa szög | Sugár |
|-|-|-|
| 30 | 35 | 8.60364654526569 |
| 130 | 140 | 41.78119462962506 |
| 0 | 35 | Hiba |
| 30 | 0 | Hiba |

Ha megvannak a tesztesetek, jöhet a tesztek írása.

### Tesztelés

Teszteléshez telepítsük a szükséges Mocha csomagokat:

```bash
npm install --save-dev mocha
```

A telepítéshez az npm helyett használhatjuk a yarn vagy a pnpm parancsot is.

A teszteket egy projekt gyökérkönyvtárában egy "test" nevű könyvtárba fogjuk tenni.

Hozzuk létre a "test" nevű könyvtárat:

```bash
mkdir test
```

Hozzuk létre a teszt állományt:

```txt
test/
  `-appTest.js
```

Az appTest.js tartalma:

```javascript
import assert from 'assert';
import { calcRadius, isValidInput } from '../src/tools.js';

describe('A számítás tesztelése', () => {
    it('A 30, 35 bemenetre 8.60364654526569', () => {
        const expected = 8.60364654526569
        const actual = calcRadius(30, 35)
        assert.equal(actual, expected)
    })
    it('A 130, 140 bemenetre 41.78119462962506', () => {
        const expected = 41.78119462962506
        const actual = calcRadius(130, 140)
        assert.equal(actual, expected)
    })
    it('A 0, 35 bemenetre Hiba', () => {        
        assert.throws(() => {
            const actual = calcRadius(0, 35)
          }, {
            name: 'Error',
            message: 'Hiba! Az oldal érték hibás!'
          })
    })
    it('A 30, 0 bemenetre Hiba', () => {        
        assert.throws(() => {
            const actual = calcRadius(30, 0)
          }, {
            name: 'Error',
            message: 'Hiba! A szög érték hibás!'
          })
    })
})

describe('A bemenet ellenőrző függvény', () => {
    it('A 30 bemenetre true', () => {
        const expected = true
        const actual = isValidInput(30)
        assert.equal(actual, expected)
    })
    it('Az 1 bemenetre true', () => {
        const expected = true
        const actual = isValidInput(1)
        assert.equal(actual, expected)
    })
    it('A abc bemenetre false', () => {
        const expected = false
        const actual = isValidInput('abc')
        assert.equal(actual, expected)
    })
    it('A 0 bemenetre false', () => {
        const expected = false
        const actual = isValidInput(0)
        assert.equal(actual, expected)
    })
    it('A -4 bemenetre false', () => {
        const expected = false
        const actual = isValidInput(-4)
        assert.equal(actual, expected)
    })
    it('A 35a bemenetre false', () => {
        const expected = false
        const actual = isValidInput('35a')
        assert.equal(actual, expected)
    })
})
```

Futtassuk a tesztet:

```bash
npm test
```

## Horgok

```javascript
describe('horgok', function () {
  before(function () {
    // egyszer lefut az első teszt előtt a blokkban
  });

  after(function () {
    // egyszer lefut az utolsó teszt után a blokkban
  });

  beforeEach(function () {
    // minden teszt előtt lefut a blokkban
  });

  afterEach(function () {
    // minden teszt után lefut a blokkban
  });

  //tesztesetek ...

});
```

## Chai

A Chai segítségével kiegészíthetjük a Mocha teszteket például expect() típusú függvényekkel.

Például:

```javascript
expect(valami).to.be.a('string');
expect(valami).to.equal('bar');
expect(valami).to.have.lengthOf(3);
expect(valami).to.have.property('mas')
  .with.lengthOf(3);
```

## Gyakorlatok

### Gyakorlat 1

Töltse le a következő projetet. Tesztelje a függvényeket:

* [https://github.com/oktat/temuveletek.git](https://github.com/oktat/temuveletek.git)
