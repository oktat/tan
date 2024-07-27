# Funkciónális tesztelés

* **Szerző:** Sallai András
* Copyright (c) 2023, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Selenium

A Selenium egy nyílt forráskódú projekt, ami lehetővé teszi böngészők automatizálását.

Webhely:

[https://www.selenium.dev](https://www.selenium.dev)

## JavaScript webdriver

Készítsünk egy projektet:

```cmd
mkdir app01
cd app01
code .
```

A VSCode-ban indítsunk egy terminált. Készítsünk Node.js projektet:

```cmd
npm init -y
```

Lite szerver telepítése:

```cmd
npm install --save-dev lite-server
```

Telepítsük a selenium-webdriver-t:

```cmd
npm install --save-dev selenium-webdriver
npm install --save-dev chromedriver
```

## Forráskód

package.json:

```json
{
  "scripts": {
    "test": "node test/index.js",
    "start": "lite-server"
  },
  "devDependencies": {
    "chromedriver": "^111.0.0",
    "lite-server": "^2.6.1",
    "selenium-webdriver": "^4.8.1"
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
const { Builder, By, Key, until } = require("selenium-webdriver");
const chrome = require('chromedriver');
async function triangleTest() {
    let driver = await new Builder().forBrowser("chrome").build();
    await driver.get('http://localhost:3000');
    await driver.findElement(By.id('base')).sendKeys('30');
    await driver.findElement(By.id('height')).sendKeys('35');
    await driver.findElement(By.id('calcButton')).click();
    const areaInput = await driver.findElement(By.id('area')).getAttribute('value');
    console.log(areaInput)
    await driver.close();
}
triangleTest();
```

## Futtatás

```cmd
npm start
npm test
```
