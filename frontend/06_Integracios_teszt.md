# Frontend - Integrációs teszt

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Az integrációs teszt

Az egyes szoftverkomponenseket együttesen vizsgáljuk.

## Selenium

A Selenium egy nyílt forráskódú rendszer integrációs és funkcionális tesztek számára. Böngészőautomatizálást biztosít, több programozási nyelven:

* JavaScript
* C#
* Groovy
* Java
* Perl
* PHP
* Python
* Ruby
* Scala

## Szükséges

* Node.js
* Visual Studio Code

## Teszt létrehozása

Feltételezzük, hogy a tesztelendő webhely már létezik. Csak a tesztet kell létrehozni.

```bash
mkdir app01
cd app01
code .
```

A VSCode terminálban készítsünk NodeJS projektet:

```bash
npm init -y
```

```bash
npm install selenium-webdriver
```

Szükségünk egy böngészőhöz is egy driver-re, de itt figyelembe kell venni a verziószámot is.

Ha a Chrome verzió például 112, akkor

```bash
npm install chromedriver@112
```

Firefoxhoz a geckodriver nevű csomagot kell letölteni.

Legyen egy **index.js** nevű fájlt:

```javascript
const {Builder, By, Key} = require("selenium-webdriver")
require('chromedriver')
async function szithuTest() {
    let driver = await new Builder().forBrowser("chrome").build();
    await driver.get("https://szit.hu");
    await driver.findElement(
        By.name("q"))
        .sendKeys("selenium", Key.RETURN);
}
szithuTest();
```

A tesztelő alkalmazásban a findElement() függvénnyel megkeressük azt a HTML elemet, aminek a "name" tulajdonság értéke "q". Ez a szit.hu webhelyen a kereső.

A sendKeys("selenium", Key.RETURN) függvény beírja a keresőmezőbe a "selenium" szót, majd megnyomja az RETURN (Enter) billentyűt.

A teszt futtatása:

```bash
node index
```

## Triangle teszt

A kész projekt itt található:

* [https://github.com/oktat/extriangle_selenium.git](https://github.com/oktat/extriangle_selenium.git)

```html
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
```

A tesztelendő alkalmazás JavaScript kódja:

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
        let base = Number(doc.baseInput.value);
        let height = Number(doc.heightInput.value);
        doc.areaInput.value = calcTriangleArea(base, height);
    });
}
 
function calcTriangleArea(base, height) {
    return base * height / 2;
}
```

A teszt például test/index.js fájlban:

```javascript
const { Builder, By, Key, until } = require("selenium-webdriver");
require('chromedriver');
 
async function triangleTest() {
    let driver = await new Builder().forBrowser("chrome").build();
    await driver.get('http://localhost:3002');
    await driver.findElement(By.id('base')).sendKeys('30');
    await driver.findElement(By.id('height')).sendKeys('35');
    await driver.findElement(By.id('calcButton')).click();
    const areaInput = await driver.findElement(By.id('area')).getAttribute('value');
    console.log(areaInput)
    await driver.close();
}
triangleTest();
```

Ami újdonság a nyomógomb kattintása a click() függvénnyel.

## Lásd még

Több információs:

* [https://szit.hu/doku.php?id=oktatas:web:selenium](https://szit.hu/doku.php?id=oktatas:web:selenium)
