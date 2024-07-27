# Frontend - AJAX

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## AJAX

Az AJAX az Asynchronous JavaScript and XML  rövidítése. Adatok szállítás szerver és kliens között aszinkron kommunikációval, XML formátumban, JavaScript nyelven. Erre utalt az eredeti név. Gyakorlatilag azt jelenti, a weblap újra töltése nélkül mozgatunk adatokat. Az XML-t később felváltotta a JSON formátum.

A JavaScript nyelvben kezdetben erre a célra az XMLHttpRequest objektum volt használható.

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

Készítsük el a JSON szervert. A projekt gyökérkönyvtárában hozzuk létre a **database.json** nevű fájlt. A tartalm a következő legyen:

```javascript
{
    "employees" : [
        {
            "id": 1,
            "name": "Penge Béla",
            "salary": 358
        },
        {
            "id": 2,
            "name": "Csendes Irén",
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

* Insomnia
* curl
* Postman

Itt most a curl utasítást használjuk:

```cmd
curl -GET 
-H "Content-Type: application/json" 
"http://localhost:3000/employee"
```

A parancsot egy sorba kell írni, csak az átláthatóság miatt lett három sorba írva.

## Források

* [https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_ajax](https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_ajax)

* [https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_fetch:egyszeru_lancolt](https://szit.hu/doku.php?id=oktatas:web:javascript:javascript_fetch:egyszeru_lancolt)
