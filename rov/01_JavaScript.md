# Webprogramozás - JavaScript I

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Függvények létrehozása

```javascript
function valami() {
   console.log('működik');
}
```

## Dolgozók adatai

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
