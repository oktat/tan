# Frontend - JavaScript

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Típusok és kifejezések](#típusok-és-kifejezések)
* [Operátorok](#operátorok)
* [Változók](#változók)
* [Láthatóság](#láthatóság)
* [Vezérlési szerkezetek](#vezérlési-szerkezetek)
* [Függvények](#függvények)
* [A Math](#a-math)
* [Console](#console)
* [Osztályok és objektumok](#osztályok-és-objektumok)
* [Az Object.create()](#az-objectcreate)
* [Prototype](#prototype)
* [A window objektum](#a-window-objektum)
* [A location objektum](#a-location-objektum)
* [A document](#a-document)
* [DOM](#dom)
* [Elemek létrehozása](#elemek-létrehozása)
* [Elemek attribútumainak változtatása](#elemek-attribútumainak-változtatása)
* [Aszinkron futtatás](#aszinkron-futtatás)
* [Promise-ok](#promise-ok)

## Típusok és kifejezések

### A ternáris operátor

A ternáris operátor három kifejezésből áll.

```txt
feltétel ? kifejezés_ha_igaz : kifejezés_ha_hamis
```

Ha feltétel igaz, a "kifejezés_ha_igaz" értékét kapjuk, ellenkező esetben a "kifejezés_ha_hamisj" értékét kapjuk meg.

```javascript
let vanAutoja = true;
console.log(
  vanAutoja ? 'rendelkezik járművel' : 'nincs autója'
)
```

Kicsit összetettebb példa:

```javascript
let nev = 'John Doe';
let kor = 25;
let vanAutoja = true;

console.log(nev + ' ' + kor + ' éves és ' +
   (vanAutoja ? '' : 'nem ') + 'rendelkezik autóval.');
```

### Tömbtípus

```javascript
let tomb = [1, 2, 3, 4, 5];

console.log(tomb[0]);
console.log(tomb[1]);
console.log(tomb[2]);
```

### Objektum

```javascript

let user = {
  name: 'John Doe',
  age: 25
};
```

```javascript
// Objektum literál használata
let person = {
  name: "John",
  age: 30,
  isStudent: true
};

// Konstruktor használata
let person2 = new Object();
person2.name = "Jane";
person2.age = 25;
```

Kulcsok elérése:

```javascript
console.log(person.name);       // "John"
console.log(person['age']);     // 30
```

A zárójel szintaxis akkor hasznos, ha a kulcs neve nem érvényes változónévként (pl. ha szóközt vagy speciális karaktert tartalmaz).

Tulajdonság törlése:

```javascript
delete person.isStudent;
console.log(person.isStudent);  // undefined
```

Objektum bejárása:

```javascript
for (let key in person) {
  console.log(`${key}: ${person[key]}`);
}
```

Összehasonlítása:

```javascript
let a = { name: "John" };
let b = { name: "John" };
console.log(a === b); // false, mert különböző referenciák

let c = a;
console.log(a === c); // true, mert ugyanarra a referenciára mutatnak
```

### A Map típus

A Map típussal kulcs-érték párokat tárolhatunk. Előnyök:

* Bármilyen típus lehet kulcs (még tömb is).
* Garantált sorrend; a beillesztés sorrendjében kapjuk az adatokat.
* A kulcson keresztüli elérés O(1) időt vesz igénybe (gyors).
* Egyszerű iteráció.
* A size tulajdonsággal könnyen lekérdezhető a mérete.
* Egyszerű törlés. Egy elem törlése delete. Összes: clear.

A Map adatstruktúrát a Map() konstruktorral hozzuk létre.

Map létrehozása:

```javascript
let myMap = new Map();
```

Használata:

```javascript
myMap.set('name', 'Péter');
myMap.set(1, 'Az első');
myMap.set(true, 'Igaz érték');

console.log(myMap.get('name'));   // "Péter"
console.log(myMap.get(1));        // "Az első"
console.log(myMap.get(true));     // "Igaz érték"
```

Kulcsok és értékek ellenőrzhése:

```javascript
console.log(myMap.has('name'));  // true
console.log(myMap.has(2));       // false
console.log(myMap.size);         // 3
```

Törlés:

```javascript
myMap.delete('name');
console.log(myMap.has('name'));  // false

myMap.clear();
console.log(myMap.size);         // 0
```

Iterálás:

```javascript
myMap.set('name', 'John');
myMap.set(1, 'Number One');

// Iterálás a kulcs-érték párokon
for (let [key, value] of myMap) {
  console.log(`${key}: ${value}`);
}

// Kulcsok iterálása
for (let key of myMap.keys()) {
  console.log(`Kulcs: ${key}`);
}

// Értékek iterálása
for (let value of myMap.values()) {
  console.log(`Érték: ${value}`);
}
```

### Set típus

Egyedi értékeket tároló szerkezet, amit a Set() konstruktorral hozunk létre.

```javascript

let mySet = new Set();

mySet.add(1);
```

```javascript
let mySet = new Set([1, 2, 3, 4, 4, 5]);
console.log(mySet);  // Set(5) {1, 2, 3, 4, 5}
```

Elemek hozzáadása:

```javascript
mySet.add(1);
mySet.add(2);
mySet.add(2);  // Nem adódik hozzá, mert már létezik
mySet.add(3);
```

Vizsgálat:

```javascript
console.log(mySet.has(1));  // true
console.log(mySet.has(4));  // false
```

Iterálás:

```javascript
mySet.add(1);
mySet.add(2);
mySet.add(3);

for (let value of mySet) {
  console.log(value);
}
```

```javascript
mySet.forEach(value => {
  console.log(value);
});
```

Átalakítás tömbbé:

```javascript
let myArray = Array.from(mySet);
// vagy
let myArray = [...mySet];
```

Újabb példa:

```javascript
let numbers = [1, 2, 3, 3, 4, 5, 5, 6];
let uniqueNumbers = new Set(numbers);
console.log([...uniqueNumbers]);  // [ 1, 2, 3, 4, 5, 6 ]
console.log([uniqueNumbers]);     // [ Set(6) {1, 2, 3, 4, 5, 6} ]
```

### Az undefined és a null

```javascript
const empty = null;
const notExisting = undefined;

console.log(empty); // null
console.log(notExisting); // undefined
```

Ha egy változót létrehoztunk, de nem definiáltunk:

```javascript
let myVariable;

console.log(myVariable);  // undefined
```

A függvény amely nem ad vissza értéket:

```javascript
function doNothing() {
    // A függvény nem ad vissza értéket
}

let result = doNothing();

console.log(result);  // undefined
```

A null értéket akkor szoktuk használni, ha szándékosan üres értéket akarunk megadni.

```javascript
let emptyValue = null;

console.log(emptyValue);  // null
```

Az emptyValue változót szándékosan null-ra állítottuk, hogy jelezzük, hogy nincs értéke, de ez szándékos.

Összehasonlítás esetén:

```javascript
let a;
let b = null;

console.log(a == b);   // true
console.log(a === b);  // false
```

Ha egy űrlapból várunk egy nevet, és az nem érkezik meg null adunk meg.

```javascript
function getUserName(input) {
    let userName = input || null;

    if (userName === null) {
        console.log("A felhasználó nem adott meg nevet.");
    } else {
        console.log("A felhasználó neve: " + userName);
    }
}

getUserName();           // A felhasználó nem adott meg nevet.
getUserName("Józsi");    // A felhasználó neve: Józsi
```

## Operátorok

### Aritmetika

```javascript
let a = 10;
let b = 3;

console.log(a + b);
console.log(a - b);
console.log(a * b);
console.log(a / b);
console.log(a % b);
```

### Értékadó operátorok

```javascript
let a = 10;
let b = 20;

console.log(a += b); // 30
console.log(a -= b); // 10
console.log(a *= b); // 200
console.log(a /= b); // 10
console.log(a %= b); // 10
console.log(a **= b); // 1024
```

### A relációs operátorok

```javascript
console.log(5 > 3) // true
console.log(5 < 3) // false
console.log(5 >= 3) // true
console.log(5 <= 3) // false
console.log(5 == 3) // false
console.log(5 != 3) // true
console.log(5 === 3) // false
console.log(5 !== 3) // true
```

### A logikai operátorok

```javascript
console.log(!true) // false
console.log(!false) // true
console.log(!!true) // true
console.log(!!false) // false
```

### Elérő operátorok

```javascript
const szamok = [3, 5, 7, 9];

console.log(szamok[0]); // 3
console.log(szamok[3]); // 9
```

## Változók

```javascript
var nameVar = 'Józsi Var';
let nameLet = 'Józsi Let';
const nameConst = 'Józsi Const';

console.log('A nevem ' + nameVar + ' és ' + 
  nameLet + ' éves vagyok. De ' + nameConst + ' is tudja.');
```

## Láthatóság

A let és a const kulcsszóval létrehozott változók csak blokkon belül látszanak.

```javascript
{
  let num1 = 30;
  const num2 = 35;
  var num3 = 40;
}
//console.log(num1) // hibát ad
//console.log(num2) // hibát ad
console.log(num3)
```

Ha a var kulcsszóval hoztam létre egy változót, az elérhető blokkon kívül is.

Blokkot általában if, for, while stb utasításokkal hozunk létre:

```javascript
if(true) {
  let num1 = 30;
  const num2 = 35;
  var num3 = 40;
}
console.log(num3)
```

A függvények blokkok eltérően viselkednek. A függények blokkjaiban var kulcsszóval létrehozott változó sem látszik azon kívül:

```javascript
var num0 = 25;
function valami() {
  let num1 = 30;
  const num2 = 35;
  var num3 = 40;
  console.log(num0);
}
valami();
//console.log(num3); //hibát ad
```

Viszont a függvényen kívül létrehozott változók elérhetők a függvényen belül

## Vezérlési szerkezetek

### Feltételek

```javascript
let num = 8;

if (num % 2 == 0) {
  console.log('A szám páros.')
} else {
  console.log('A szám páratlan.')
}
```

Több ágú szelekció az if-fel:

```javascript
let num = 8;

if (num == 1) {
  console.log('egy')
} else if (num == 2) {
  console.log('kettő')
} else if (num == 3) {
  console.log('három')
} else if (num == 4) {
  console.log('négy')
} else {
  console.log('ismeretlen')
}
```

A switch utasítás több ágú szelekciót teszt lehetővé.

```javascript
let day = 'szerda';

switch (day) {
  case 'hétfő': 
    console.log('Ez a hét elsőnapja.'); 
    break;
  case 'kedd': 
    console.log('Ez a hét második napja.'); 
    break;
  case 'szerda': 
    console.log('Ez a hét harmadik napja.'); 
    break;
  case 'csütörtök': 
    console.log('Ez a hét negyedik napja.'); 
    break;
  case 'péntek': 
    console.log('Ez a hét ötödik napja.'); 
    break;
  case 'szombat':
    console.log('Ez a hét hatodik napja.'); 
    break;
  case 'vasárnap': 
    console.log('Ez a hét hetedik napja.'); 
    break;
  default: 
  console.log('Nem ismerem ezt a napot.');
}
```

### Iteráció

#### A for ciklus

```txt
for (kezdőérték; feltétel; növekmény) {
  //ciklustörzs
}
```

```javascript
const numbers = [1, 2, 3, 4, 5];

for (let i = 0; i < numbers.length; i++) {
  console.log(numbers[i]);
}
```

#### A while cikluse

```txt
while (állítás) {
  //ciklus törzse
}
```

```javascript
let num = 0;
while (num < 4) {
  console.log('egy sor');
  num++;
}
```

#### A do-while ciklus

```txt
while (állítás) {
  //ciklus törzse
}
```

```javascript
let num = 0;
while (num < 4) {
  console.log('egy sor');
  num++;
}
```

#### A for..in szerkezet

```javascript
let nums = [35, 47, 22, 11];
for (index in nums) {
  console.log(nums[index]);
}
```

#### A for..of szerkezet

```javascript
let nums = [35, 47, 22, 11];
for (num of nums) {
  console.log(num);
}
```

### A try catch

```javascript
try {
  var pelda = 10 / 0;
} catch (error) {
  console.log(error.name + ': ' + error.message);
}
```

### A throw használata

```javascript
try {
  let x = 5;
  if (x < 10) {
    throw "Az érték túl kicsi!";
  }
} catch (err) {
  console.log(err);
}
```

## Függvények

```javascript
function szorzas(a, b) {
    return a * b;
}

function osszeadas(a, b) {
    return a + b;
}

function szamol(szam, muvelet) {
    return muvelet(szam, 2);
}

console.log(szamol(5, szorzas));
console.log(szamol(5, osszeadas));
```

## A Math

```javascript
console.log(Math.PI); // 3.141592653589793
console.log(Math.sqrt(9)); // 3
console.log(Math.pow(2, 3)); // 8
console.log(Math.round(3.7)); // 4
console.log(Math.sin(Math.PI / 2)); // 1
console.log(Math.cos(Math.PI / 4)); // 0.7071067811865476
```

## Console

```javascript
console.log("Iskolapélda a console objektum használatára:")
console.info("Ez egy információs üzenet")
console.warn("Ez egy figyelmeztetés")
console.error("Ez egy hibaüzenet")
console.dir({name: "Józsi", age: 30})
console.group("Ez egy csoport")
console.log("Ez egy log üzenet a csoportban")
console.groupEnd()
```

* A csoportosítási lehetőség az átláthatóságot szolgálják.
* A dir() picit másként jelenik meg a böngésző konzolján.

## Osztályok és objektumok

```javascript
class Person {
    // Konstruktor metódus: itt határozzuk meg az osztály tulajdonságait
    constructor(name, age) {
        this.name = name;  // Tulajdonság (property)
        this.age = age;    // Tulajdonság (property)
    }

    // Egy metódus, amely bemutatja a személyt
    introduce() {
        console.log(`Szia! A nevem ${this.name}, és ${this.age} éves vagyok.`);
    }

    // Egy metódus, amely növeli az életkort
    haveBirthday() {
        this.age += 1;
        console.log(`Boldog születésnapot, ${this.name}! Most már ${this.age} éves vagy.`);
    }
}

const student = new Person('Józsi', 20);
student.introduce();
student.haveBirthday();
```

## Az Object.create()

```javascript
const Person = {
  constructor: function(name) {
    this.name = name
  },
  sayHello: function() {
    console.log(`Szia, ${this.name} vagyok!`)
  }
}

const student = Object.create(Person)
student.constructor('Józsi')
student.sayHello()
```

### Öröklés használata

```javascript
class Employee extends Person {
    constructor(name, age, jobTitle) {
        // Hívjuk meg a szülőosztály (Person) konstruktorát
        super(name, age);
        this.jobTitle = jobTitle;
    }

    // Egy új metódus, amely bemutatja a munkavállalót
    describeJob() {
        console.log(`${this.name} a(z) ${this.jobTitle} pozícióban dolgozik.`);
    }
}

// Létrehozzuk az Employee objektumot
const employee1 = new Employee('Kati', 28, 'Fejlesztő');

// Meghívjuk a metódusokat
employee1.introduce();   // Szia! A nevem Kati, és 28 éves vagyok.
employee1.describeJob(); // Kati a(z) Fejlesztő pozícióban dolgozik.
```

## Prototype

```javascript
function Student(name, age) {
    this.name = name;
    this.age = age;
}

Student.prototype.introduce = function() {
    console.log(`Szia, ${this.name} vagyok, és ${this.age} éves vagyok.`);
}

const s1 = new Student('Józsi', 20);
s1.introduce();
```

### Örökléssel együtt

```javascript
// Konstruktorfüggvény a Person objektum létrehozásához
function Person(name, age) {
    this.name = name;
    this.age = age;
}

// Prototípus metódus hozzáadása
Person.prototype.introduce = function() {
    console.log(`Szia! A nevem ${this.name}, és ${this.age} éves vagyok.`);
};

// Konstruktorfüggvény az Employee objektum létrehozásához
function Employee(name, age, jobTitle) {
    Person.call(this, name, age); // Hívjuk meg a szülőosztály konstruktorát
    this.jobTitle = jobTitle;
}

// Öröklés beállítása
Employee.prototype = Object.create(Person.prototype);
Employee.prototype.constructor = Employee;

// Új metódus hozzáadása az Employee prototípusához
Employee.prototype.describeJob = function() {
    console.log(`${this.name} a(z) ${this.jobTitle} pozícióban dolgozik.`);
};

// Példányosítás
const employee1 = new Employee('Kati', 28, 'Fejlesztő');

// Metódusok hívása
employee1.introduce();   // Szia! A nevem Kati, és 28 éves vagyok.
employee1.describeJob(); // Kati a(z) Fejlesztő pozícióban dolgozik.
```

## A window objektum

A böngésző ablakának aktuális magasságát és szélességét írjuk a konzolra:

```javascript
console.log(window.innerHeight);
console.log(window.innerWidth);
```

Abalakesemény kezelése:

```javascript
window.addEventListener('resize', () => {
    console.log(`Az ablak új méretei: ${window.innerWidth} x 
    ${window.innerHeight}`);
});
```

## A location objektum

Visszaadja az aktuális ablakon található URL-t.

```javascript
// Pl. "https://www.example.com/page?query=123"
console.log(location.href);  
```

A protokoll lekérdezése:

```javascript
// Például "https:"
console.log(location.protocol);
```

A host lekérdezése:

```javascript
// Pl. "www.example.com:3000"
console.log(location.host);
```

A hostname lekérdezése:

```javascript
// Pl. "example.com"
console.log(location.hostname);
```

Port lekérdezése:

```javascript
  // "3000"
console.log(location.port);
```

Útvonal lekérdezése:

```javascript
// Pl. "/page?query=123"
console.log(location.pathname);
```

Az URL lekérdezési része:

```javascript
// "?query=123"
console.log(location.search);
```

Az URL hash része:

```javascript
// "#section1"
console.log(location.hash);
```

Az URL beállítása és az oldal lekérése:

```javascript
location.assign('https://www.example.com/new-page');
```

Az URL cseréje anélkül, hogy a böngésző előzményeiben tárolódna:

```javascript
location.replace('https://www.example.com/another-page');
```

Az aktuális oldal újratöltse:

```javascript
location.reload();
```

Átirányítás:

```javascript
location.href = 'https://szit.hu';
```

## A document

A document objektum az aktuális HTML dokumentumot képviseli.

### A HTML dokumentum

```javascript
console.log(document.documentElement.innerHTML);
```

A lehetésges kimenet:

```txt
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Példák</title>
</head>
<body>
  <h1>Példák</h1>

  <script src="peldak.js"></script></body>
```

### Változtatás

```html
<p id="greeting">Helló Világ!</p>
<button id="changeTextBtn">Változtasd meg a szöveget</button>
```

```javascript
document.getElementById('changeTextBtn').onclick = function() {
    document.getElementById('greeting').innerText = 'Szia, világ!';
};
```

### Osztály alapon

```html
<div class="box"></div>
<div class="box"></div>
<button id="changeColorBtn">Szín megváltoztatása</button>
```

```javascript
document.getElementById('changeColorBtn').onclick = function() {
    const boxes = document.getElementsByClassName('box');
    for (let box of boxes) {
        box.style.backgroundColor = 'lightblue';
    }
};
```

### A quierSelector

```html
<p class="text">Első szöveg</p>
<p class="text">Második szöveg</p>
<button id="changeTextBtn">Változtasd meg az összes szöveget</button>

```

```javascript
document.getElementById('changeTextBtn').onclick = function() {
    const paragraphs = document.querySelectorAll('.text');
    paragraphs.forEach(paragraph => {
        paragraph.innerText = 'Szöveg megváltoztatva!';
    });
};
```

A dokumentum beöltötségének vizsgálata:

```javascript
document.addEventListener('DOMContentLoaded', function() {
    console.log('Az oldal teljesen betöltődött!');
});
```

### Egyéb document lehetőségek

A dokumentum címének lekérdezése, beállítása:

```javascript
document.title = 'Új cím';
```

Hozzáférés a body elemhez:

```javascript
document.body.style.backgroundColor = 'lightgrey';
```

Sütik lekérdezése, beállítása:

```javascript
document.cookie = 'username=pali; expires=Fri, 31 Dec 2024 12:00:00 UTC';
```

## DOM

A DOM a **Document Object Model** rövidítése. A DOM programozói ineterfész, ami a weboldalak szerkezetét képviseli, egy fa szerkezetben. A DOM lehetővé teszi a dokumentum szerkezetének, stílusának és tartalmának dinamikus módosítását.

A DOM minden egyes része egy csomópontként (node) jelenik meg. A legfelső szintű elem a gyökércsomópont.

```html
<!DOCTYPE html>
<html>
  <head>
    <title>DOM Példa</title>
  </head>
  <body>
    <h1>Üdvözlet!</h1>
    <p>Ez egy példa a DOM-ra.</p>
  </body>
</html>
```

Ez a dokumentum DOM képviselete:

```txt
document (gyökér)
  html
    head
      title (DOM Példa)
    body
      h1 (Üdvözlet!)
      p (Ez egy példa a DOM-ra.)
```

### DOM csomópontok

A DOM-ban minden elem egy csomópontot hoz létre. A következő típusok vannak:

* Element Node (elem csomópont) - egy HTML elem
* Text Node (szöveg csomópont) - egy szöveg az elemek között
* Attribute Node (attribútum csomópont) - egy attribútum (class, id stb)
* Comment Node (megjegyzés csomópont) - egy megjegyzés

### DOM manipuláció

A DOM használatával a webolal elemeit dinamikusan változtathatjuk.

Elem tartalmának változtatása:

```javascript
<p id="myParagraph">Ez egy szöveg.</p>
<button onclick="changeText()">Szöveg megváltoztatása</button>

<script>
function changeText() {
    document.getElementById('myParagraph').innerText = 'A szöveg megváltozott!';
}
</script>
```

### DOM navigáció

A DOM lehetővé teszi az elemek közötti navigációt. Navigálhatunk a szülő, gyermek vagy testvér elemek között.

* parentNode - az elem szülőjéra mutat
* childNodes - az elem gyermeke
* firstChild - az elem első gyermeke
* lastChild - az elem utolsó gyermeke
* nextSibling - a következő testvér elem
* previousSibling - az elem előző testvér elem

Példa a navigációra:

```html
<ul id="list">
  <li>Első elem</li>
  <li>Második elem</li>
  <li>Harmadik elem</li>
</ul>

<script>
const list = document.getElementById('list');
console.log(list.firstChild); // Az első gyermek elem
console.log(list.lastChild);  // Az utolsó gyermek elem
console.log(list.childNodes); // Az összes gyermek elem
</script>
```

## Elemek létrehozása

```html
<ul id="list">
    <li>Elem 1</li>
</ul>
<button id="addItemBtn">Új elem hozzáadása</button>
```

```javascript
document.getElementById('addItemBtn').onclick = function() {
    const newItem = document.createElement('li');
    newItem.innerText = 'Új elem';
    document.getElementById('list').appendChild(newItem);
};
```

## Elemek attribútumainak változtatása

```javascript
document.getElementById('changeImageBtn').addEventListener('click', function() {
    // Az elem kiválasztása az ID alapján
    const image = document.getElementById('myImage');
    
    // Az `src` attribútum módosítása
    image.setAttribute('src', 'image2.jpg');
    
    // Az `alt` attribútum módosítása
    image.setAttribute('alt', 'Kép 2');
});
```

Attribútum lekérdezése:

```javascript
const currentSrc = image.getAttribute('src');
console.log('A kép jelenlegi forrása:', currentSrc);
```

Attribútum eltávolítása:

```javascript
image.removeAttribute('alt');
```

## Aszinkron futtatás

A JavaScript utasítások egymás után rendere futnak le. Kivétel ez elól az aszinkron módon futó függvények.

Lássunk egy szinkronban futó utasításhalmazt.

```javascript
console.log('Első üzenet)
console.log('Masodik üzenet)
console.log('Harmadik üzenet)
```

Most lássunk egy aszinkron módon futó utasítást.

```javascript
console.log('Első üzenet')
setTimeout(function() {
    console.log('Masodik üzenet')
}, 2000)
console.log('Harmadik üzenet')
```

Figyeljük meg a "Második üzenet" mikor fut le. Futtathatjuk böngészőben és Node.js-sel is.

Aszinkron módon fut a fetch() függvény is.

## Promise-ok

Az aszinkron műveletek a Promise objektummal szoktuk létrehozni.

A Promise három műveletet kezel:

* Pending (függőben) - az aszinkron művleet még nem zárult le
* Fulfilled (teljesült) - az aszinkron művleet sikeresen befejeződött
* Rejected (elutasítva) - az aszinkron művlet hibára futtot

A Promise létrehozása:

```javascript
var p = new Promise((resolve, reject) => {});
```

Teljes példa:

```javascript
// Egy egyszerű Promise létrehozása
const myPromise = new Promise((resolve, reject) => {
  const success = true; // Ezt tetszőlegesen változtathatjuk a példa kedvéért

  if (success) {
      resolve('A művelet sikeres volt!');
  } else {
      reject('A művelet sikertelen volt.');
  }
});

// A Promise kezelése
myPromise
  .then(result => {
      console.log(result); // Ez akkor fut le, ha a Promise teljesült
  })
  .catch(error => {
      console.error(error); // Ez akkor fut le, ha a Promise elutasításra került
  });
```

Ebben a példában nem okoz semmi várakozást, ezért azonnal látjuk az eredményt.

Tegyünk bele egy véletlenszám generátort, ami biztosítja, hogy néha sikeres, néha sikertlen legyen az eredmény. Tegyünk bele késleltetést is, amitől még látványosabb az eredmény:

```javascript
// Egy egyszerű Promise létrehozása
const myPromise = new Promise((resolve, reject) => {
  
  setTimeout(() => {
    const ran = Math.random();
    var success;  
    if(ran < 0.5) {
      success = true;
    }else {
      success = false;
    }
    if (success) {
      resolve('A művelet sikeres volt!');
    } else {
      reject('A művelet sikertelen volt.');
    }    
  }, 3000)
});

// A Promise kezelése
myPromise
  .then(result => {
      console.log(result); // Ez akkor fut le, ha a Promise teljesült
  })
  .catch(error => {
      console.error(error); // Ez akkor fut le, ha a Promise elutasításra került
  });
```
