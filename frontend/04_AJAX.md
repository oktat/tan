# Frontend - AJAX

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## AJAX

Az AJAX az Asynchronous JavaScript and XML  rövidítése. Adatok szállítás szerver és kliens között aszinkron kommunikációval, XML formátumban, JavaScript nyelven. Erre utalt az eredeti név. Gyakorlatilag azt jelenti, a weblap újra töltése nélkül mozgatunk adatokat. Az XML-t később felváltotta a JSON formátum.

A JavaScript nyelvben kezdetben erre a célra az XMLHttpRequest objektum volt használható.

## XMLHttpRequest objektum

Az XMLHttpRequest objektum egy olyan objektum, amivel aszinkron kommunikációt végezhetünk egy szerverrel. Az objektumot a JavaScript nyelvben használjuk. Az objektummal GET, POST, PUT, DELETE, HEAD, OPTIONS, PATCH és TRACE módszerekkel adatokat küldhetünk, illetve kérhetünk a szerverről.

### Helyettesítő REST API

Készítsünk egy gyors helyettesítő REST API-t, majd indítsuk el:

```bash
mkdir api
cd api
sin api
npm i
npm start
```

A sin parancs a sinto csomagban van. Ha nincs telepítve:

```bash
npm install -g sinto
```

### XMLHttpRequest objektum használata

Írjuk meg a klienst:

```javascript
const url = 'http://localhost:8000/employees'

var xhr = new XMLHttpRequest();
xhr.open('GET', url, true);
xhr.onreadystatechange = function() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        console.log(xhr.responseText);
    }
}
xhr.send();
```

## JSON konvertálás

### A JSON konvertálásról

A JSON.parse és a JSON.stringify használatára.

A JSON.parse() függvénnyel egy JSON formátumú szöveget tudunk átalakítani egy JavaScript objektumra.

A JSON.stringify() függvénnyel pedig egy JavaScript objektumot tudunk átalakítani JSON formátumú szöveggé.

### Egyszerű példa

A példában a JavaScript objektumot átalakítjuk JSON formátumú szöveggé, majd ezt a szöveget átalakítjuk egy újabb JavaScript objektumra.

```javascript
var myJSON = '{ "name": "John", "age": 30 }';
console.log(myJSON);
var obj = JSON.parse(myJSON);
console.log(obj);
```

Kimenet:

```bash
{ "name": "John", "age": 30 }
{ name: 'John', age: 30 }
```

```javascript
var obj = { name: "John", age: 30 };
console.log(obj);
var myJSON = JSON.parse(obj);
console.log(myJSON);
```

Kimenet:

```bash
{ name: 'John', age: 30 }
{"name":"John","age":30}
```

## Fetch API

A Fetch API felületet biztosít a erőforrások lekérésére hálózaton keresztül.

### REST API szerver mocking

A REST API szervert a HAI szerverrel fogjuk helyettesíteni, ami egy JSON fájlt REST API-ként szolgál ki egyszerűen.

Készítsünk Node.js projektet:

```cmd
mkdir app01
cd app01
```

Állítsuk be a szervert Node.js projektnek:

```cmd
npm init -y
```

A HAI szervert használhatjuk globálisan és lokálisan telepítve. Itt most lokálisan fogjuk használni. Telepítsük:

```cmd
npm install --save-dev hai-server
```

Készítsük el az adatbázisfájlt. A projekt gyökérkönyvtárában hozzuk létre a **database.json** nevű fájlt. A tartalma a következő legyen:

```javascript
{
    "employees" : [
        {
            "id": 1,
            "name": "Penge Béla",
            "city": "Szeged",
            "salary": 358
        },
        {
            "id": 2,
            "name": "Csendes Irén",
            "city": "Pécs",
            "salary": 392
        }
    ]
}
```

Szerkesszük a **package.json** fájlt. Írjunk egy új scriptet:

```json
  "scripts": {
    "api": "npx hai-server --watch database.json"
  },
```

A teljes kód:

```json
{
  "name": "app01",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "api": "npx hai-server --watch database.json"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "hai-server": "^0.0.4"
  }
}

```

Indítsuk el a szervert:

```cmd
npm run api
```

A szerver REST API szolgáltatóként működik és van egy employees nevű végpontja.

### A REST API tesztelése

Szükségünk van a teszteléshez egy HTTP kliensre. A GET metódus tesztelésére a böngésző is megfelel. Írjuk a böngészőbe:

```url
http://localhost:3000/employees
```

A böngészőben megjelenek a két dolgozó adatai.

A többi metódus (POST, PUT, DELETE) teszteléséhez szükségünk van más kliensre.

A REST API teszteléséhez ajánlott eszközök:

* Resen
* HTTPie
* Insomnia
* curl
* Postman
* VSCode - Thunder client bővítmény

Itt most a curl utasítást használjuk:

```cmd
curl -GET 
-H "Content-Type: application/json" 
"http://localhost:3000/employee"
```

A parancsot egy sorba kell írni, csak az átláthatóság miatt lett három sorba írva.

## Kliens készítése

Készítsünk egy Node.js projektet:

```cmd
mkdir app01
cd app01
npm init -y
```

Legyen egy ilyen projekt:

```txt
app01/
  |-src/
  |  |-app.js
  |  `-index.html
  |-bs-config.json
  `-package.json
```

```javascript
function getUsers() {
    fetch('https://jsonplaceholder.typicode.com/users')
        .then(response => response.json())
        .then(data => console.log(data))
        .catch(error => console.log(error)) 
}

getUsers()
```

## HTTP státuszkódok

```javascript
const url = 'https://jsonplaceholder.typicode.com/users';
fetch(url)
    .then(response => {
        console.log('HTTP státuszkód:', response.status);
        console.log('HTTP eredmény:', response.statusText);
        if (response.status >= 200 && response.status < 300) {
            return response.json()
        }
        return response.json()

    })
    .then(data => console.log(data))
    .catch(error => console.log(error)) 
```

## HTTP metódusok kezelése

A fetch() metódus második paraméter egy tetszőleges objektum. Itt megadhatjuk a használni kívánt metódust nevét.

Adatok küldését a POST metódussal tehetjük meg.

```javascript
const url = 'https://jsonplaceholder.typicode.com/users';
fetch(url, {method: 'POST'})
```

Ha REST API szerverrel dolgozunk, a szerver POST metódust úgy értelmezi, hogy szeretnénk egy új elemet felvenni, ezért vájra az adatokat is.

```javascript
const url = 'http://localhost:8000/employees';
fetch(url, {method: 'POST'})
```

A teljes kód:

```javascript
const url = 'http://localhost:8000/employees';
emp = {name: 'Penge Béla', city: 'Szeged', salary: 358};
fetch(url, {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify(emp)
  })
  .then(response => response.json())
  .then(data => console.log('Success:', data))
  .catch(error => console.error('Error:', error));
```

### Adatok módosítása

```javascript
const url = 'http://localhost:8000/employees/2';

employee = {
  name: 'Csend Ernő',
  city: 'Szeged',
  salary: 393
};

fetch(url, {
  method: 'PUT',
  headers: {
    'Content-Type': 'application/json'
  },
  body: JSON.stringify(employee)
})
  .then(response => response.json())
  .then(data => console.log(data))
  .catch(error => console.error(error));
```

## API key használata

Vegyünk egy hír API szolgáltatót:

* [https://newsapi.org/](https://newsapi.org/)

Regisztráljunk. A regisztráció elindul a "Get API Key ->" feliratú gombra kattintva is.

A főoldalon találunk egy mintát, hogyan hívhatjuk.

Amit meg kell adni:

* mit keresünk (* az összes cikket megtalálja)
* mikortól szeretnénk cikket megjeleníteni
* mi szerint rendezzük
* az API kulcs

Ha meg van az API kulcs, akkor jöhet egy példa:

index.html:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hír</title>
  
</head>
<body>
  <h1>Hírek</h1>
  <section id="section"></section>

  <script src="app.js"></script>
</body>
</html>
```

app.js:

```javascript
const apiKey = 'f638c93fcd5deea292132cb56958bc11'
const content = 'Linux'
const from = '2024-08-22'
const url = `https://newsapi.org/v2/everything?q=${content}&from=${from}&sortBy=popularity&apiKey=${apiKey}`

const section = document.querySelector('section')

fetch(url)
    .then(response => response.json())
    .then(data => {
      console.log(data.articles[0].content)
      data.articles.forEach(article => displayNews(article))
    })
    .catch(error => console.log(error))

function displayNews(data) {
  let article = document.createElement('article')
  article.innerHTML = `
    <h2>${data.title}</h2>
    <p>${data.content}</p>
    <p>${data.description}</p>
  `
  section.appendChild(article)
}
```

## Források

* [https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_ajax](https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_ajax)

* [https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_fetch:egyszeru_lancolt](https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_fetch:egyszeru_lancolt)
