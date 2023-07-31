# JavaScript tesztelés

* **Szerző:** Sallai András
* Copyright (c) 2023, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Bevezetés

A JavaScript tesztelés két fejezet is van: 1 és 2. Elég az egyiket tudni. A JavaScript tesztelés 2-ben a Jasmin Browser Runner-t használjuk. Annak használata egyszerűbb. A JavaScript tesztelés 1-ben a szimpla Jasmine-t használjuk.

A konkrét tesztek megegyeznek mindkét fejezetben, csak a környezet más.

## A Jasmine

A Jasmine egy nyílt forráskódú tesztelő keretrendszer JavaScript számára. Első változatát 2010-ben jelentette meg a Pivotal Labs (agilis szoftverfejlesztési tanácsadó cég).

A Jasmine létrehozásakor a könnyen olvashatóság volt szem előtt.
A Jasmine licenc: MIT.

## Szükséges

* NodeJS
* VSCode

A VSCode helyett használhatunk más kódszerkesztőket is.

## Helló Világ - Jasmine

Készítsünk egy hello könyvtárat, csináljunk belőle NodeJS programot.

```bash
mkdir hello
cd hello
code .
```

Alakítsuk NodeJS projektté:

```bash
npm init -y
```

A package.json fájl, ami létrejött:

```json
{
  "name": "hello",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```

Telepítsük a teszteléséhez a csomagokat:

```bash
pnpm install --save-dev jasmine
```

Készítsük elő az alkalmazást a tesztelésre:

```bash
npx jasmine init
```

Létrejön a projekt gyökérkönyvtárában:

```txt
spec/
  `-support/
      `-jasmine.json
```

A tartalma, egyelőre nem érdekes számunkra.

A spec könyvtárban hozzuk létre test.spec.js néven egy állományt. Ebbe írjuk majd a tesztet:

```txt
spec/
  |-support/
  |   `-jasmine.json
  `-test.spec.js
```

A test.spec.js fájl tartalma:

```javascript
describe('egyszerű teszt', () => {
    it('A true értékre true-t várunk', () => {
      expect(true).toBe(true)
    })  
})
```

A package.json fájlban írjunk "start" scriptet, amivel futtathatjuk a tesztet:

```json
{
  "name": "hello",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "jasmine"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "jasmine": "^5.1.0"
  }
}

```

Futtassuk a tesztet:

```bash
npm test
```

Most egészítsük ki a tesztünket, egy második teszttel, ami hibára fut:

```javascript
describe('egyszerű teszt', () => {
    it('A true értékre true-t várunk', () => {
      expect(true).toBe(true)
    })  
    it('A false értéket kapunk, de true-t várunk', () => {
      expect(false).toBe(true);
    })
})
```

Egy állományban több describe() függvény is lehet. Minden describe() függvény egy teszt blokkot alkot. A describe() függvény több it() függvényt tartalmazhat.

A tesztfájlokat .spec.js fájlba kell tenni alapértelmezetten.

## Ellentét

A .not betéttel az egyezések értelme megfordítható:

```javascript
expect(false).not.toBe(true)
```

Az előző projektünk második tesztje hibára fut. Használjuk a .not kulcsot, a teszt teljesítéséhez:

```javascript
describe('egyszerű teszt', () => {
    it('A true értékre true-t várunk', () => {
      expect(true).toBe(true)
    })  
    it('A false értéket kapunk, de true-t ellentétjét várjuk', () => {
      expect(false).not.toBe(true);
    })
})
```

## Egyezések

Az alábbi táblázat mutatja milyen egyezéseket használhatunk Jasmine esetén:

| Egyezés | Leírás |
|-|-|
| toBe() | állítás vizsgálata |
| toBeNull()  | null vizsgálata |
| toBeUndefined() | nincs definiálva? |
| toBeDefined() | definiálva van? |
| toBeNaN() | a NaN vizsgálata (Not A Number) |
| toEqual() | egyenlőség vizsgálata |
| toBeFalsy() | A tulajdonság vagy az érték false |
| toBeTruthy() | A tulajdonság vagy az érték true |
| toMatch() | A karakterlánc egyezik egy szabályos kifejezésre. |
| toContain() | A karakterlánc vagy a tömb tartalmaz egy részt? |
| toBeLessThan() | Kisebb mint, matematikai összehasonlítás. |
| toBeGreaterThan() | Nagyobb mint, matematikai összehasonlítás. |
| toBeCloseTo() | Összehasonlítás, pontosság megadásával (második paraméter) |
| toThrow() | A függvény dob-e kivételt? |
| toThrowError() | Egy adott kivétel tesztelése |

Minden egyezésnél használható a .not "fordító".

Néhány példa az egyezésekre:

```javascript
it('A 30 az elvárt', () => {
  let actual = 30
  let expected = 30
  expect(actual).toEqual(expected)
})
```

```javascript
it('Null elvárva', () => {
    let actual = null
    expect(actual).toBeNull()
})
```

Ha nem lehet nulla:

```javascript
it('Null elvárva', () => {
    let actual = 30
    expect(actual).not.toBeNull()
})
```

## Függvény tesztelése

Most teszteljünk egy függvényt, ami összead két számot. Készítsünk az src könyvtárban egy arit.js állományt, tartalma:

```javascript
function add(num1, num2) {
    return num1 + num2
}

export default add
```

Készítsünk egy app.js fájlt, amiben használjuk a függvényt:

```javascript
import add from './arit.js'

console.log(add(30, 35))
```

Írjunk hozzá tesztet, arit.spec.js nevű fájlba:

```javascript
import add from '../src/arit.js'

describe('Az add() függvény tesztje', () => {
    it('A 30, 35 bemenetre 65', () => {
        let actual = add(30, 35)
        expect(actual).toEqual(65)
    })  
})
```

Ügyeljünk arra, hogy az app.spec.js fájl a spec könyvtárba legyen, ha nem állítottnunk be mást könyvtárat spec/support/jasmine.js fájlban.

Be kell állítani, a package.json és az index.html fájlban, hogy modult használunk.

A package.json fájlban vegyünk fel egy "type" tulajdonságot. Értéket "module". A teljes package.json jelenleg:

```json
{
  "name": "hello",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "jasmine",
    "start": "lite-server"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "jasmine": "^5.1.0",
    "lite-server": "^2.6.1"
  },
  "type": "module"
}
```

Az index.html fájlban az app.js hivatkozásánál szintén szükséges a type="module" attribútum. A teljes kód:

```html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aritmetika</title>
</head>
<body>   
    <h1>Aritmetika konzolon</h1>
    <script type="module" src="app.js"></script>
</body>
</html>
```

Most futtassuk tesztet:

```bash
npm test
```

## Tesztek kikapcsolása

Ha szeretnénk kikapcsolni egy tesztet az "x" karaktert tegyük a describe() vagy a it() függvény elé.

```javascript
describe('egyszerű teszt', () => {
    it('A true értékre true-t várunk', () => {
      expect(true).toBe(true)
    })  
    xit('A false értéket kapunk, de true-t várunk', () => {
      expect(false).not.toBe(true);
    })
})
```

Ebben az esetben csak a második teszt nem fog futni. Ha a describe elé tesszük az "x" karakter, akkor egyetlen teszt sem fut le:

```javascript
xdescribe('egyszerű teszt', () => {
    it('A true értékre true-t várunk', () => {
      expect(true).toBe(true)
    })  
    it('A false értéket kapunk, de true-t várunk', () => {
      expect(false).not.toBe(true);
    })
})
```

A tesztek jelenléte azonban látszik a futtatás kimenetében.

## Véletlenszerű tesztek

A teszteket alapértelmezetten véletlenszerű sorrendben veszi a futtató. Ez a viselkedés megváltoztatható a spec/supoort/jasmine-browser.json fájlban. Keressük meg az env:random tulajdonságot, majd állítsuk az értékét "false"-ra.

A tesztek futtatása regressziós teszt esetén jó ötlet. Fejlesztési időben, azonban jól jöhet, ha azok sorba futnak le.

## A tesztek helye

Alapértelmezetten a tesztek helye a **spec** könyvtárban van. A spec/supoort/jasmine-browser.json fájlban ez is megváltoztatható. Keressük meg a "specDir" tulajdonságot, és írjuk át például szokásos "test" névre.

A Jasmine innentől a test nevű könyvtárban keresi a .spec.js kiterjesztésű fájlokat.

## Alkalmazás készítése

### Feladat

Oldjunk meg egy feladatot szit.hu webhelyről, amely adatokat kér be, számítást végez, majd az eredmény kiírja. A feladatok közül 0301-től 0400-ig jöhet szóba.

Legyen a 0312-s feladat. A projekt neve "tombsug".

Hozzuk létre a könyvtárat és indítsuk el a kódszerkesztőt:

```bash
mkdir tombsug
cd tombsug
code .
```

Hozzunk létre egy src könyvtárat a projekt forrásának.

```bash
mkdir src
```

Az alkalmazást NodeJS projektként kezeljük, ezért:

```bash
npm init -y
```

Létrejön a package.json állomány a következő tartalommal:

```json
{
  "name": "tombsug",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```

Fejlesztéshez a lite-server nevű szervert használjuk, telepítsük:

```bash
npm install --save-dev lite-server
```

A lite-server számára készítsünk egy kis konfigurációs fájlt, bs-config.json néven:

```json
{
    "server": ["src"],
    "port": 3000
}
```

A packages.json állományban írjunk egy "start" nevű scriptet, amivel indíthatjuk a lite-server-t:

```json
{
  "name": "tombsug",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "lite-server"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "lite-server": "^2.6.1"
  }
}
```

A Bootstrapet fogjuk használni. Telepítsük:

```bash
pnpm install bootstrap
```

Egészítsük ki a bs-config.json fájlt:

```json
{
    "server": [
        "src",
        "node_modules/bootstrap/dist/css",
        "node_modules/bootstrap/dist/js"
        ],
    "port": 3000
}
```

Készítsük el az alkalmazást az src könyvtárban:

```txt
src/
  |-app.js
  |-index.html
  `-rhombus.js
```

Az index.html tartalma:

```html

```

Az app.js fájlban két objektumot, 4 függvényt hozunk létre, és a
window objektumon futtatunk egy függvényt:

```javascript
const doc = {}
const state = {}

window.addEventListener()

function init() {}
function handleEvent() {}
function startCalc() {}
function tryStartCalc() {}
```

A rhomus.js fájlban 2 függvény készítünk

```javascript
function calcRadius() {}
function inputOk() {}
```

Ebbe az állományba kerülnek a tesztelésre szánt függvények.

Az app.js tartalma:

```javascript
import { calcRadius } from './rhombus.js'

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

Az rhombus.js tartalma:

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

export { calcRadius, isValidInput }
```

### Tesztesetek felvétele

Szükségünk van tesztestekre. Adott bemenetre mit kell kapnunk.

| Oldal | Alfa szög | Sugár |
|-|-|-|
| 30 | 35 | 8.60364654526569 |
| 130 | 140 | 41.78119462962506 |
| 0 | 35 | Hiba |
| 30 | 0 | Hiba |

### Tesztelés

Teszteléshez telepítsük a szükséges Jasmine csomagot:

```bash
pnpm install --save-dev jasmine
```

A telepítéshez az pnpm helyett használhatjuk a yarn vagy az npm parancsot is.

Készítsük elő az alkalmazást a tesztelésre:

```bash
npx jasmine init
```

A projekthez a következő könyvtárszerkezet adódik hozzá:

```txt
spec/
  `-support/
      `-jasmine.json
```

A jasmine.json fájl tartalmlazza a teszteléshez szükséges beállításokat. Tartalma:

```json
{
  "spec_dir": "spec",
  "spec_files": [
    "**/*[sS]pec.?(m)js"
  ],
  "helpers": [
    "helpers/**/*.?(m)js"
  ],
  "env": {
    "stopSpecOnExpectationFailure": false,
    "random": true
  }
}

```

A teszteket egy projekt gyökérkönyvtárában egy "test" nevű könyvtárba fogjuk tenni. Ezért javítsuk ki a "specDir" tulajdonságot:

```json
{
  "spec_dir": "test",
  "spec_files": [
    "**/*[sS]pec.?(m)js"
  ],
  "helpers": [
    "helpers/**/*.?(m)js"
  ],
  "env": {
    "stopSpecOnExpectationFailure": false,
    "random": false
  }
}

```

Esetleg állítsuk a "env":"random" tulajdonságot false értékre, így a tesztek sorba futnak le.

Hozzuk létre a "test" nevű könyvtárat:

```bash
mkdir test
```

Hozzuk létre a teszt állományt:

```txt
test/
  `-rhombus.spec.js
```

Az rhombus.spec.js tartalma:

```javascript
import { calcRadius, isValidInput } from '../src/rhombus.js'

describe('A számítás tesztelése', () => {
    it('A 30, 35 bemenetre 8.60364654526569', () => {
        const expected = 8.60364654526569
        const actual = calcRadius(30, 35)
        expect(actual).toEqual(expected)
    })
    it('A 130, 140 bemenetre 41.78119462962506', () => {
        const expected = 41.78119462962506
        const actual = calcRadius(130, 140)
        expect(actual).toEqual(expected)
    })
    it('A 0, 35 bemenetre Hiba', () => {        
        expect(() => {
            calcRadius(0, 35)
        }).toThrow();
    })
    it('A 30, 0 bemenetre Hiba', () => {        
        expect(() => {
            calcRadius(30, 0)
        }).toThrow();
    })
})

describe('A bemenet ellenőrző függvény', () => {
    it('A 30 bemenetre true', () => {
        const expected = true
        const actual = isValidInput(30)
        expect(actual).toBe(expected)
    })
    it('Az 1 bemenetre true', () => {
        const expected = true
        const actual = isValidInput(1)
        expect(actual).toBe(expected)
    })
    it('A abc bemenetre false', () => {
        const expected = false
        const actual = isValidInput('abc')
        expect(actual).toBe(expected)
    })
    it('A 0 bemenetre false', () => {
        const expected = false
        const actual = isValidInput(0)
        expect(actual).toBe(expected)
    })
    it('A -4 bemenetre false', () => {
        const expected = false
        const actual = isValidInput(-4)
        expect(actual).toBe(expected)
    })
    it('A 35a bemenetre false', () => {
        const expected = false
        const actual = isValidInput('35a')
        expect(actual).toBe(expected)
    })
})
```

Futtassuk a tesztet:

```bash
npm test
```

Az alkalmazás forráskódja a GitHubon:

* [https://github.com/oktat/extombsug_jasmine1](https://github.com/oktat/extombsug_jasmine1)
