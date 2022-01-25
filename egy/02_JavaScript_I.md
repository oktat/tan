# Webprogramozás - JavaScript I

* JavaScript I
* Sallai András
* 2022

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

```javascript
function nevjegy() {
    console.log('Nagy János');
}
```

```javascript
var nevjegy = function() {
    console.log('Nagy János');
}
```

```javascript
var nevjegy = () => {
    console.log('Nagy János');
}
```

### Duplázó

```javascript
function kiDupla(num) {
    console.log(num * 2);
}
```

```javascript
var kiDupla = function(num) {
    console.log(num * 2);
}
```

```javascript
var kiDupla = (num) => {
    console.log(num * 2);
}
```

### Érték visszaadása

```javascript
var kerDupla = (num) => {
    eredmeny = num * 2;
    return eredmeny;
}
console.log(kerDupla(25))
```


## Szabályos kifejezések

A szabályos kifejezéseket perjel
"/" karakterek közzé írjuk.
Használható néhány függvénybe,
ilyen a replace().

```javascript
var noSpace = kar => {
    return kar.replace(/ /g, '')
}
```

További információk:

* https://szit.hu/doku.php?id=oktatas:web:javascript:regex

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
el a weboldal, illetve annak egyes részei.

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

A console-ra a fejlesztő ír üzenetek
saját maga számára, például a log() 
függvénnyel. Néhány függvény:

* log()
* error()
* warn()
* clear()
