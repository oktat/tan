# Webprogramozás - JavaScript I

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Futtatás konzolon

```javascript
console.log('működik');
```

Futtatás:

```bash
node index.js
```

## Típusok

Elemi adattípusok:

* Number
* String
* Boolean
* null
* undefined

Összetett adattípusok:

* Array
* Object
* Map
* Set

## Változók

```javascript
var a = 30;
var b = 'alma';
var c = "körte";
var d = `szilva`;
```

Változók blokkon belül:

```javascript
var csianl = () => {
    let a = 25;
}
```

Állandó:

```javascript
const a = document.getElementById('vmi');
const b = 25;
```

## Vezérlési szerkezetek

```javascript
if (a > 5) {
    console.log('nagyobb');
}
```

```javascript
if (a > 5) {
    console.log('nagyobb');
}else {
    console.log('kisebb');
}
```

## Függvények

### Névjegy

A függvényeket a "function" kulcsszóval vezetjük be. Ezt követi a függvény neve. A függvény törzse kapcsoszárójelek között, akár egyetlen sorban is szerepelhet.

```javascript
function nevjegy() {
    console.log('Nagy János');
}
```

A függvény neve meghatározható értékadással is:

```javascript
var nevjegy = function() {
    console.log('Nagy János');
}
```

Az egyenlőség jel jobb oldalán egy névtelen függvény van.

Névtelen függvényt másként is létrehozhatunk:

```javascript
var nevjegy = () => {
    console.log('Nagy János');
}
```

### Duplázó

Nézzünk egy olyan függvényt, ami paramétert fogad:

```javascript
function kiDupla(num) {
    console.log(num * 2);
}
```

Értékadással, ugyanaz:

```javascript
var kiDupla = function(num) {
    console.log(num * 2);
}
```

Lambda kifejezéssel:

```javascript
var kiDupla = (num) => {
    console.log(num * 2);
}
```

### Érték visszaadása

Az érték visszaadását a return utasítással határozzuk meg:

```javascript
var kerDupla = (num) => {
    eredmeny = num * 2;
    return eredmeny;
}
console.log(kerDupla(25))
```

## Szabályos kifejezések

A szabályos kifejezéseket perjel "/" karakterek közzé írjuk. Használható néhány függvénybe, ilyen a replace().

```javascript
var noSpace = kar => {
    return kar.replace(/ /g, '')
}
```

További információk:

* [https://szit.hu/doku.php?id=oktatas:web:javascript:regex](https://szit.hu/doku.php?id=oktatas:web:javascript:regex)

## Objektumok és a DOM

A böngészőbő elérhető néhány alapobjektum:

* window
* document
* console

### A window

A window a böngészőablakot jelképezi.
A bőngészőn belül a felület, ahol megjelenik
a webolal "screen". A screen tulajdonságai
lekérdezhetők. Például szélesség:

```javascript
console.log(window.screen.width)
console.log(window.screen.height)
```

### A document

A document objektumon keresztül érhető
el a webolal, annak egyes részei.

A weboldal HTML elemekből épül fel.
Az elemk egy hierachiája egy fával
ábrázolható. Ezt a hierarchikusan
felépülő szerkezetet nevezzük
DOM-nak. Document Object Model.

A document objektumon keresztül elérhetjük
a DOM egyes részeit.

```javascript
console.log(document.querySelector('.egy') )
```

### A console

A böngészők fejlesztői felületén elérhető
rész. Általában F12 billentyűkombinációval
nyitható meg a fejlesztői felület.

A console-ra a fejlesztő ír üzenetek saját maga számára, például a log() függvénnyel. Néhány függvény:

* log()
* error()
* warn()
* clear()

## Gyakorlat

### Dolgozók adatai

```html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">    
    <meta 
    name="viewport" 
    content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Dolgozó</h1>

    <label for="name">Név</label>
    <input type="text" id="name">
    <br>

    <label for="city">Település</label>
    <input type="text" id="city">
    <br>

    <label for="salary">Fizetés</label>
    <input type="text" id="salary">
    <br>

    <button id="addButton">Hozzáad</button>

    <script src="app.js"></script>
</body>
</html>
```

```javascript
'use strict';

const nameElem = document.querySelector('#name');
const cityElem = document.querySelector('#city');
const salaryElem = document.querySelector('#salary');
const addButton = document.querySelector('#addButton');

var dolgozo = {
    name: "névtelen",
    city: "ismeretelne",
    salary: 0
}

addButton.addEventListener('click', () => {
    console.log('működik');
    dolgozo.name = nameElem.value;
    dolgozo.city = cityElem.value;
    dolgozo.salary = Number(salaryElem.value);
    
    console.log(dolgozo.salary)

    
});
```
