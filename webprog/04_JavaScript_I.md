# Webprogramozás - JavaScript I

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A JavaScript nyelv

1995-ben létrehoztak egy Mocha nevű nyelvet. Néha Netscape Scripting Language néven is említették. A C és Java nyelv is hatással volt rá, de azoktól független nyelv. A Mocha később LiveScript-re lett átnevezve, majd megint később lett JavaScript.

A Mocha óta a JavaScript sok változáson ment keresztül. Szintaktikája a Java nyelvhez hasonlóságot a JavaScript név felvétele idején kezdett mutatni.

A JavaScript szabványt az ECMA szabványügyi szervezet tartja karban. Az ECMAScript szabványt a JavaScript (Netscape) és a JScript (Microsoft) nyelvek alapján hozták létre. A szabványosítást a Netscape vállalat kezdeményezte. Az első szabvány 1997-ben jelent meg. 1998-ban és 1999-ben újabb verziója jelent meg a szabványnak. A következő, a negyedik szabványig hoszzabb idő telt el, de nem készült el. Az ötödik szabvány 2011-ben jelent meg 5.1 verzószámmal. A hatódik szabvány 2016-ban jelent meg. Ettől a szabványtól évente jelent meg újabb [szabványok](https://www.ecma-international.org/publications-and-standards/standards/ecma-262/).

* 1 - 1997
* 2 - 1998
* 3 - 1999
* 4 - nem készült el
* 5 - 2009
* 5.1 - 2011
* 6 - 2015
* 7 - 2016
* 8 - 2017
* 9 - 2018
* 10 - 2019
* 11 - 2020
* 12 - 2021
* 13 - 2022

A szabványokra rövidítéssel szokás hivatkozni. Például:

| Verzió | Kiadás dátuma | Rövidítés |
|-|-|-|
| 6 | 2015 | ES6 |
| 7 | 2016 | ES7 |
| 8 | 2017 | ES8 |
| 9 | 2018 | ES9 |
| 10 | 2019 | ES10 |
| 11 | 2020 | ES11 |
| 12 | 2022 | ES12 |
| 13 | 2022 | ES13 |

## Futtatás konzolon

```javascript
console.log('működik');
```

Futtatás:

```bash
node index.js
```

### JavaScript böngészőben

Készítenünk kell egy index.html nevű fájlt:

#### Inline

```html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="utf-8">
    <title></title>
 
</head>
<body onload="alert('Helló Világ');">
 
</body>
</html>
```

#### Internal

```html
<!DOCTYPE html>
<html>
<head>
<title></title>
<script>
alert("Helló Világ");
</script>
 
</head>
<body>
 
</body>
</html>
```

#### External

```html
<!DOCTYPE html>
<html>
<head>
<title></title>
<script src="index.js"></script>
 
</head>
<body>
 
</body>
</html>
```

index.js fájl tartalma:

```javascript
alert("Helló Világ");
```

### A console a böngészőben

A böngészőkben a konzolt a fejlesztői felületen találjuk. A fejlesztői felületet általában a Ctrl+Shift+i billentyűkombinációval jeleníthetjük meg. Újabban az F12 is működik.

A böngésző konzoljára írás is:

```javascript
console.log('működik');
```

## Típusok

Elemi adattípusok:

* number
* string
* boolean
* null
* undefined

Összetett adattípusok:

* array
* object
* map
* set

A number típusban tárolhatók egész és valós számok egyaránt. Egész szám például:

```txt
30
```

Készítsünk egy index.js nevű fájlt a következő tartalommal:

```javascript
console.log(typeof 30);
```

Futtassuk a következő parancsot:

```cmd
node index.js
```

Valós szám:

```txt
35.7
```

Az index.js áttírásával teszteljük valós szám vizsgálatát.

```javascript
console.log(typeof 35.7);
```

A string típusban karakterláncokat tárolhatunk:

```txt
"alma"
'körte'
`szilva`
```

Az index.js fájlban nézzük meg a karakterláncok típusát:

```javascript
console.log(typeof "alma");
```

A boolean típusok:

```txt
true
false
```

A null speciális mivel, azt jelenti nincs érték. Ennek típusa object. Az undefined is speciális és ez is a nem megadott értékre utal.

Az array, object, map, set összetett adattípusok, vagyis több értéket is tartalmazhatnak.

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

A typeof operátorral lekérdezhetők a változók típusai:

```javascript
var a = 30;
console.log(typeof a);
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
