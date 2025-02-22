# Funkciónális tesztelés

* **Szerző:** Sallai András
* Copyright (c) 2023, Sallai András
* Szerkesztve: 2024
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Bevezetés](#bevezetés)
* [A funkcionális tesztelésről](#a-funkcionális-tesztelésről)
* [A puppeteer](#a-puppeteer)
* [Projekt készítése](#projekt-készítése)
* [Puppeteer teszt készítése](#puppeteer-teszt-készítése)
* [Fej nélküli indítás](#fej-nélküli-indítás)
* [Képernyőkép](#képernyőkép)
* [A Mocha használata a szit.hu vizsgálatával](#a-mocha-használata-a-szithu-vizsgálatával)
* [Háromszög projekt](#háromszög-projekt)

## Bevezetés

A teszt típusok a következők lehetnek:

* funkcionális
* nem-funkcionális
* regressziós
* biztonsági
* teljesítmény
* kompatibilitási
* használhatósági

A használhatósági tesztek eszközei:

* megfigyelés - felhasználók figyelése
* interjúk a felhasználókkal
* kérdőívek
* A/B tesztek - több változat tesztelése - melyik jobb?

## A funkcionális tesztelésről

A funkconális tesztelés az alkalmazást a specifikációnak megfelelően teszteljük. Megfelel a követelményeknek? A funkcionális tesztelés végezhető kézi és automatizált módszerekkel.

### A funkcionális tesztelés eszközei

A webes felület teszteléséhez néhány eszköz:

* Selenium
* Cypress
* Puppeteer

Ebben a leírásban a Puppeteer-t fogjuk használni.

## A puppeteer

A Puppeteer egy Node.js könyvtár. Vezérlést biztosít Chrome és Firefox böngészőkhöz. A DevTools vagy WebDriver protokollt használja.

Webhely:

[https://pptr.dev](https://pptr.dev)

## Projekt készítése

Készítsünk egy projektet:

```cmd
mkdir app01
cd app01
code .
```

A VSCode-ban indítsunk egy terminált. Készítsünk Node.js projektet:

```cmd
sin init
```

Telepítsük a Puppeteer-t:

```cmd
npm install --save-dev puppeteer
```

vagy pnpm paranccsal:

```cmd
pnpm add --save-dev puppeteer
```

## Puppeteer teszt készítése

### A Puppeteer használata a szit.hu vizsgálatával

Készítsük el a **test** nevű könyvtárba a tesztet, **index.js** néven.

test/index.js:

```javascript
import puppeteer from 'puppeteer';

(async () => {
    const browser = await puppeteer.launch({
        headless: true});
    const page = await browser.newPage();

    await page.goto('https://szit.hu/');

    await page.type('#qsearch__in', 'programozás');
    await page.click('button[type="submit"]');

    await page.waitForSelector('.search-results-form');

    const content = await page.content();
    const containsProgramming = content.includes('programozas');

    if (containsProgramming) {
        console.log('A weblapon a "programozas" szó szerepel.');
    } else {
        console.log('A weblapon a "programozas" szó nem szerepel.');
    }
    await browser.close();
})();
```

A fájlok kiterjesztése **.cjs**, ha package.json-ban a "type": "module" be van kapcsolva és a require() függvényt használjuk.

test/index.cjs:

```javascript
const puppeteer = require('puppeteer');

//...
```

### Futtatás

Futtatás node paranccsal:

```cmd
node test/index.js
```

Futtathatjuk npm scripttel is.

package.json részlet:

```json
{
  "scripts": {
    "test": "node test/index.js"
  },
}
```

Futtatás parancssorból:

```cmd
npm test
```

## Fej nélküli indítás

A fej nélküli indítás azt jelenti, a böngészőablak nem jelenik meg a teszt futtatása során. Az alapértelmezés a fejnélküli indítás. Ha beállítással nyomatékosítjuk a {headless: true} beállítással tehetjük meg. Ha szeretnénk látni a böngészőt, akkor állítsuk true értékre.

```javascript
puppeteer.launch({headless: false});
```

Legyen egy 10 másodperces várakozás:

```javascript
await new Promise(resolve => setTimeout(resolve, 10000));
```

A teljes kód:

test/index.js:

```javascript
import puppeteer from 'puppeteer';

(async () => {
    const browser = await puppeteer.launch({headless: false});
    const page = await browser.newPage();

    await page.goto('https://szit.hu/');

    await new Promise(resolve => setTimeout(resolve, 10000));
    await browser.close();
})();
```

A teszt indítása:

```bash
node test/index.js
```

vagy:

```bash
npm test
```

## Képernyőkép

A futó böngészőről képernyő kép is készíthető programozottan.

test/index.js:

```javascript
import puppeteer from 'puppeteer';

(async () => {
    const browser = await puppeteer.launch({headless: false});
    const page = await browser.newPage();

    await page.goto('https://szit.hu/');

    await page.screenshot({ path: 'szit.png', fullPage: true});
    await page.pdf({ path: 'szit.pdf', format: 'A4'});

    await browser.close();
})();
```

## A Mocha használata a szit.hu vizsgálatával

Telepítsük a mocha-t:

```cmd
npm install --save-dev mocha
```

test/index.js:

```javascript
import puppeteer from 'puppeteer';
import assert from 'assert';

describe('A szit.hu tesztelése', function()  {
    let browser;
    let page;
    before(async function() {
        browser = await puppeteer.launch({headless: true});
        page = await browser.newPage();
    });
    after(async function() {
        await browser.close();
    });
    it('A weblap elérése', async function() {
        await page.goto('https://szit.hu');
        const title = await page.title();
        assert.strictEqual(title, 'start [szit]')
    });
    it('Van Oktatás link a főoldalon', async function() {
        await page.goto('https://szit.hu');
        const linkExists = await page.waitForSelector('a[href="/doku.php?id=oktatas"]');
        assert.ok(linkExists, 'Az Oktatás link nem található!');
    });

    it('Az Oktatás link kattintása', async function() {
        await page.goto('https://szit.hu');
        await page.click('a[href="/doku.php?id=oktatas"]');
        await page.waitForSelector('body')
        const currentUrl = await page.url();
        assert.strictEqual(currentUrl, 'https://szit.hu/doku.php?id=oktatas');
    });
});
```

package.json részlet:

```json
{
  "scripts": {
    "test": "mocha"
  },
  "devDependencies": {
    "mocha": "^10.8.2",
    "puppeteer": "^23.8.0"
  },  
}
```

## Háromszög projekt

### A tesztelendő projekt elkészítése

Ha a projektet a **sin init** paranccsal készítettük, akkor a package.json egyes részei már készen állhatnak. Ugyanígy a bs-config.json fájl is.

A package.json scriptjei:

package.json:

```json
{
  "scripts": {
    "test": "mocha",
    "start": "browser-sync start --config bs-config.json"
  }
}
```

src/app.js:

```javascript
doc = {
    baseInput: document.querySelector('#base'),
    heightInput: document.querySelector('#height'),
    areaInput: document.querySelector('#area'),
    calcButton: document.querySelector('#calcButton')
};

window.addEventListener('load', () => {
    init();
});

function init() {
    doc.calcButton.addEventListener('click', () => {
        startCalc();
    });
}

function startCalc() {
    let base = Number(doc.baseInput.value);
    let height = Number(doc.heightInput.value);
    doc.areaInput.value = calcTriangleArea(base, height);
}

function calcTriangleArea(base, height) {
    return base * height / 2;
}
```

src/index.html:

```html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Háromszög</title>
</head>
<body>

    <div class="container">
        <h1>Háromszög területe</h1>

        <div class="triangleForm">
            <div class="mt3">
                <label for="base">Alap</label>
                <input type="text" id="base">
            </div>
            <div class="mt3">
                <label for="height">Magasság</label>
                <input type="text" id="height">
            </div>
            <button id="calcButton">Számít</button>
            <div class="mt3">
                <label for="area">Terület</label>
                <input type="text" id="area">
            </div>
        </div>
    </div>
    <script src="app.js"></script>
</body>
</html>
```

bs-config.json:

```json
{
  "server": [
    "src",
    "node_modules/bootstrap/dist/css",
    "node_modules/bootstrap/dist/js"
  ],
  "port": 3000,
  "watch": true
}
```

### Teszt írása

Puppetiert és Mocha-t használjuk vegyesen a tesztelésre.

test/testApp.js:

```javascript
import puppeteer from 'puppeteer'
import assert from 'assert'

describe('Háromszög területszámítás tesztje', () => {
    let browser;
    let page;
    before(async function () {
        browser = await puppeteer.launch({headless: true})
        page = await browser.newPage()
        await page.goto('http://localhost:3000')        
    })
    after(async function() {
        await browser.close()
    })
    it('Böngésző címsora', async function() {
        const title = await page.title()
        assert.strictEqual(title, 'Háromszög')
    })
    it('h1 tartalma a weblapon', async function() {
        const content = await page.$eval('h1', element => element.textContent)
        assert.strictEqual(content, 'Háromszög területe')
    })

    it('Az alap label tartalma', async function() {
        const content = await page.$eval('label[for="base"]', element => element.textContent.trim())
        assert.strictEqual(content, 'Alap')
    })
    it('A magasság label tartalma', async function() {
        const content = await page.$eval('label[for="height"]', element => element.textContent.trim())
        assert.strictEqual(content, 'Magasság')
    })
    it('Az alap input létezése', async function() {
        const element = await page.$('#base')
        assert.ok(element, 'A base input elemnek léteznie kell')
    })
    it('A magasság input létezése', async function() {
        const element = await page.$('#height')
        assert.ok(element, 'A height input elemnek léteznie kell')
    })

    it('Input 30 és 35 bemenetre 525 kimenete', async function() {
        await page.type('#base', '30')
        await page.type('#height', '35')        
        await page.click('#calcButton')
        const actual = await page.$eval('#area', elem => elem.value)
        assert.strictEqual(actual, '525')
    })
})
```

package.json részlet:

```json
{
  "scripts": {
    "test": "mocha"
  },
  "devDependencies": {
    "mocha": "^10.8.2",
    "puppeteer": "^23.8.0"
  },
}

```

A teszt futtatása:

```cmd
npm start
npm test
```

### Másik megoldás

```javascript
import puppeteer from "puppeteer";
import assert from "assert";

describe("Triangle", function () {
  let browser;
  let page;

  before(async function () {
    browser = await puppeteer.launch();
    page = await browser.newPage();
  });

  /* Minden teszt előtt külön-külön betölti a weboldalot. */
  this.beforeEach(async function () {
    await page.goto("https://szit.hu/m/triangle_ts");
  })
  
  after(async function () {
    await browser.close();
  });

  it("A title ellenőrzése", async function () {
    const actual = await page.title();
    const expected = "Háromszög";
    assert.strictEqual(actual, expected);
  });

  it("A h1 elem ellenőrzése", async function () {
    const actual = await page.$eval("h1", el => el.textContent);
    const expected = "Háromszög területe";
    assert.strictEqual(actual, expected);
  });

  it("Háromszög területe 30, 35 bemenetre 525", async function () {
    await page.type("#base", "30");
    await page.type("#height", "35");
    await page.click("#calcButton");
    const actual = await page.$eval("#area", el => Number(el.value));
    const expected = 525;
    assert.strictEqual(actual.toFixed(1), expected.toFixed(1));
  });

  it("Háromszög területe 123, 99 bemenetre 6088.5", async function () {
    await page.type("#base", "123");
    await page.type("#height", "99");
    await page.click("#calcButton");
    const actual = await page.$eval("#area", el => Number(el.value));
    const expected = 6088.5;
    assert.strictEqual(actual.toFixed(1), expected.toFixed(1));
  });

})
```
