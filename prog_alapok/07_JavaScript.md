# JavaScript

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Kimenet

```javascript
console.log('Helló Világ');
```

```javascript
alert('Weblapon felugró');
```

## JavaScript külső fájlban

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>JavaScript</title>
</head>
<body>
    <h1>JavaScript külső fájlban</h1>
    <script src="app.js"></script>
</body>
</html>
```

## Üdvözlő

Készítsünk egy webes felületet, amely bekér egy becenevet, majd kattintásra üdvözli a bírt név alapján a felhasználót.

Weboldal:

```html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
    content="width=device-width, 
    initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <div>
        <label for="nickname">Becenév</label>
        <input type="text" id="nickname">
        /* A becenév a "nickname" azonsítón 
        keresztül érehtő el */
    </div>
    <div>
        <button id="welcomeButton">Üdv</button>
        /* A nyomgómb a "welcomeButton" azonosítón
        keresztül érhető el */
    </div>

    /* Csatoljuk a JavaScriptet */
    <script src="script.js"></script>
    
</body>
</html>
```

A JavaScript rész:

```javascript
/* A HTML elemeket JavaScript objektumokhoz kötjük: */
const nickInput = document.querySelector('#nickname');
const welcomeButton = document.querySelector('#welcomeButton');

/* Szeretnénk figyelni ha kattintottak a welcomeButton-ra */
welcomeButton.addEventListener('click', welcome);
/* Kattintásra a welcome függvényt szeretnénk végrehajtani */

/* Így függvény, ami kiolvassa becenevet majd üdvözöl: */
function welcome() {
    const nickname = nickInput.value;
    alert('Üdv ' + nickname );
}
```

## Háromszög területszámítás

A weboldalon bekérjük az alapt és a magasságot, majd kattintásra megkapjuk a területet.

Az index.html fájl tartalma:

```html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <div class="container">
        <h1>Háromszög területszámítás</h1>
        <div class="triangleForm">
            <div>
                <label for="base">Alap</label>
                <input type="text" id="base">
            </div>
            <div>
                <label for="height">Magasság</label>
                <input type="text" id="height">
            </div>
            <div>
                <button id="calcButton">Számít</button>
            </div>
            <div>
                <label for="area">Terület</label>
                <input type="text" id="area">
            </div>
        </div>

    </div>
    <script src="app.js"></script>
    
</body>
</html>
```

Az app.js fájl tartalma:

```javascript
const baseInput = document.querySelector('#base');
const heightInput = document.querySelector('#height');
const areaInput = document.querySelector('#area');
const calcButton = document.querySelector('#calcButton');

calcButton.addEventListener('click', calcTriangleArea);

function calcTriangleArea() {
    var base = Number(baseInput.value);
    var height = Number(heightInput.value);
    var area = base * height / 2;
    areaInput.value = area;
}
```
