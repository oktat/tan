# Funkciónális tesztelés

* **Szerző:** Sallai András
* Copyright (c) 2023, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Bevezetés

A funkcionális tesztelésből jelenleg 2 változat van. Elég az egyiket feldolgozni.

## A puppeteer

A Puppeteer egy Node.js könyvtár. Vezérlést biztosít Chrome vagy és Firefox böngészőkhöz. A DevTools vagy WebDriver protokollt használ.

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

## Futtatás

```cmd
npm start
npm test
```
