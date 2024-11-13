# Funkciónális tesztelés

* **Szerző:** Sallai András
* Copyright (c) 2023, Sallai András
* Szerkesztve: 2024
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Bevezetés](#bevezetés)
* [A puppeteer](#a-puppeteer)
* [Projekt készítése](#projekt-készítése)
* [Teszt írása](#teszt-írása)
* [Teszt](#teszt)
* [Fej nélküli indítás](#fej-nélküli-indítás)
* [Képernyőkép](#képernyőkép)
* [A Mocha használata a szit.hu vizsgálatával](#a-mocha-használata-a-szithu-vizsgálatával)
* [A háromszög területsámítsá tesztje](#a-háromszög-területsámítsá-tesztje)

## Bevezetés

Angolul **System Level Testing**, röviden **SLT**.

Jellemzők:

* A teljes rendszert teszteljük.
* Funkcionális és nem-funkciónális tesztelés.
* Általában külső tesztelő csapat végzi.
* Általában fekete dobozos teszt.
* Lehet automatizált és kézi tesztelés is.

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

Telepítsüka Puppeteer-t:

```cmd
pnpm add --save-dev puppeteer
```

## Teszt írása

A package.json scriptjei:

package.json:

```json
{
  "scripts": {
    "test": "node test/index.js",
    "start": "browser-sync start --config bs-config.json"
  }
}
```

app.js

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

index.html

```html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Triangle</title>
</head>
<body>

    <div class="container">
        <h1>Triangle</h1>

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

```json
{
    "server": ["src"]
}
```

## Teszt

```javascript
const puppeteer = require('puppeteer');

(async () => {
    const browser = await puppeteer.launch();
    const page = await browser.newPage();

    await page.goto('https://szit.hu/');

    await page.type('#qsearch__in', 'Programozás');
    await page.click('button[type="submit"]');

    await page.waitForSelector('body');

    const content = await page.content();
    const containsProgramming = content.includes('programozas');

    if (containsProgramming) {
        console.log('A weblap a "programozas" szó szerepel.');
    } else {
        console.log('A weblapon a "programozas" szó nem szerepl.');
    }

    await browser.close();
})();
```

### Futtatás

```cmd
npm start
npm test
```

## Fej nélküli indítás

```javascript
puppeteer.launch({headless: false});
```

Legyen egy 10 másodperces várakozást állítsunk be:

```javascript
await new Promise(resolve => setTimeout(resolve, 10000));
```

A teljes kód:

```javascript
const puppeteer = require('puppeteer');

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
node test/valami.js
```

vagy:

```bash
npm test
```

## Képernyőkép

```javascript
const puppeteer = require('puppeteer');

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

```javascript
const puppeteer = require('puppeteer');
const assert = require('assert');

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
    it('Van az Oktatás link a főoldalon', async function() {
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

## A háromszög területsámítsá tesztje

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
