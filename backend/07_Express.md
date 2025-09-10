# Backend programozás - Express

* **Szerző:** Sallai András
* Copyright (c) 2023, Sallai András
* Szerkesztve: 2025
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Szükséges](#szükséges)
* [Express és a Sequelize](#express-és-a-sequelize)
* [Első Express projekt](#első-express-projekt)
* [Kontrollerek](#kontrollerek)
* [HTTP válaszok testreszabása](#http-válaszok-testreszabása)
* [HTTP adat fogadása a klienstől](#http-adat-fogadása-a-klienstől)
* [Beállítások tárolása](#beállítások-tárolása)
* [ORM használata](#orm-használata)
* [MariaDB](#mariadb)
* [Kontroller készítése](#kontroller-készítése)
* [Routing](#routing)
* [Végleges belépési pont](#végleges-belépési-pont)
* [Azonosítás](#azonosítás)
* [Bejelentkezés](#bejelentkezés)
* [Biztonság](#biztonság)

## Szükséges

* Node.js
* VSCode
* Insomnia vagy Insomnium és a resen

## Express és a Sequelize

Az Express minimalista, rugalmas webes keretrendszer, ami Node.js-sel van megvalósítva.
Sok népszerű keretrendszer alapszik az Expressen.

A Sequelize egy ORM rendszer, ami a modelleket leképezi adatbázisra. Ebben a leírásban ezt fogjuk
használni az Express mellett.

## Első Express projekt

### Az index.js végponttal

Készítsünk egy új projektet **hello** néven:

```cmd
mkdir hello
cd hello
npm init -y
npm install express
mkdir app
```

ECMASCript szabványt fogjuk használni, ezért a package.json fájlban írjuk át a type kulcs tartalmát "module" értékre.

```json
{
    "type": "module"
}
```

Az app könyvtárban készítsünk egy index.js fájlt, a következő tartalommal:

_app/index.js:_

```javascript
import express from 'express';

// Express alkalmazás létrehozása
const app = express();

//egy /msg nevű végpont beállítása:
app.get('/msg', (req, res) => {
  res.send('Helló üzenet'); // Üzenet visszaküldése
});

// A REST API szerver fusson a 8000-s porton:
app.listen(8000, () => {
  console.log('Server is running on port 8000');
});
```

Ez a kis program a kezdetleges REST API szerverünk, futtassuk azt.

Futtatás:

```cmd
node app
```

A futtatás eredményeként, elindul a szerver és megjelenik a terminálban a "listening on port: 8000" szöveg. A szerver az előtérben fut, így nem adja vissza a várakozási jelet.

Ellenőrizzük a végpontot, például curl paranccsal:

```cmd
curl localhost:8000/msg
```

Használhatjuk a HTTPie alkalmazás http parancsát is:

```cmd
http localhost:8000/msg
```

A resen csomag res parancsával:

```cmd
res localhost:8000/msg
```

Nézzük meg az eredményt az Insomnia vagy Insomnium alkalmazásban is.

A futó szervert állítsuk le a Ctrl + C billentyűkombinációval.

### JSON válasz

Készítsünk egy újabb projektet például **jes** néven.

JSON válaszhoz készítsünk például egy tömböt, aminek most egyetlen eleme van:

```javascript
const data = [
    { title: 'Helló Express'}
];
```

Teljes kód:

_app/index.js_:

```javascript
import express from 'express';
const app = express();

const data = [
  { title: 'Helló Express' }
];

app.get('/msg', (req, res) => {
  res.send(data);
});

app.listen(8000, () => {
  console.log('Server is running on port 8000');
});
```

Futtassuk a szervert, és teszteljük res, curl vagy http paranccsal.

### Express több végponttal

Készítsünk egy **pcshop** nevű projektet. Az alkalmazást az **app** könyvtárban hozzuk létre.
A projekt értelemszerűen legyen Node.js projekt. A package.json fájlban állítsuk be ES szabványt,
vagyis a type kulcs értéke legyen "module". Telepítsük az Express csomagot.
Az adatokat egyenlőre nem adatbázisból vesszük, helyette beépítjük az adatokat a kódba, tömb formájában.

Készítsük el a következő **app/index.js** állományt:

_app/index.js_:

```javascript
import express from 'express';
const app = express();

const products = [
    { id: 1, name: 'CD-ROM', price: 34 },
    { id: 2, name: 'CPU',  price: 38 },
    { id: 3, name: 'RAM', price: 27 }
];

const customers = [
    { id: 1, name: 'Varga Béla', email: 'varga@kek.lan' },
    { id: 2, name: 'Dante Irén',  email: 'dante@kek.lan' },
    { id: 3, name: 'Lant Ferenc', email: 'lant@kek.lan' }
];

app.get('/products', (req, res) => {
    res.send(products);
});

app.get('/customers', (req, res) => {
    res.send(customers);
});

app.listen(8000, () => {
    console.log('listening on port: 8000');
});
```

### Metódusok

Nézzük meg, hogyan használunk egyetlen végponton több metódust. A végpont neve ebben az esetben nem változik.

Készítsünk egy új **metod** nevű projektet. A projekt ES modulokat használjon. Az alkalmazást az **app** könyvtárban fejlesszük. A belépésipont az index.js fájl. Telepítsük az express csomagot.

Használjunk get és post metódust is:

_app/index.js:_

```javascript
import express from 'express';
const app = express();

app.get('/msg', (req, res) => {
    res.send({msg: 'Helló get metódus'});
});

app.post('/msg', (req, res) => {
    res.send({msg: 'Helló post metódus'});
});

app.listen(8000, () => {
    console.log('listening on port 8000');
});
```

Teszteljük mindkettőt. Használjuk a resen csomag **res** parancsát vagy a HTTPie csomag http parancsát:

```cmd
res localhost:8000/msg
```

```cmd
http post localhost:8000/msg
```

Fejlesszük tovább az alkalmazásunkat és valósítsunk meg minden metódust.

_app/index.js:_

```javascript
import express from 'express';
const app = express();

app.get('/msg', (req, res) => {
    res.send({msg: 'get metódus'});
});

app.post('/msg', (req, res) => {
    res.send({msg: 'post metódus'});
});

app.put('/msg', (req, res) => {
    res.send({msg: 'put metódus'});
});

app.patch('/msg', (req, res) => {
    res.send({msg: 'patch metódus'});
});

app.delete('/msg', (req, res) => {
    res.send({msg: 'delete metódus'});
});

app.listen(8000, () => {
    console.log('listening on port 8000');
});
```

Teszteljük az alkalmazást valamilyen HTTP klienssel.

### Express router

Készítsünk egy **utas** nevű projektet.

A **Router** függvény használatával az alkalmazás egyes részei szétválaszthatók, és a végpontok is külön kezelhetők.

Először lássuk egyetlen fájlban a használatát. Készítsünk egy index.js fájlt az app könyvtárban:

_app/index.js:_

```javascript
import express from 'express';
import Router from 'express';

const app = express();
const router = Router();

const products = [
    { id: 1, name: 'CD-ROM', price: 34 }
];


/* A routingot most a router objektumon
   állítjuk be.
*/
router.get('/products', (req, res) => {
    res.send(products);
});

/* Első paraméterként megadunk egy 
   alap útvonalt a /api 
   A második paraméterben mondjuk meg, 
   hogy a router objektumot szeretnénk 
   használni.
*/
app.use('/api', router);

app.listen(8000, () => {
    console.log('listening on port: 8000');
});
```

Indítsuk el a szervert és teszteljük:

```cmd
res localhost:8000/api/products
```

### Az Express router szétbontva

Készítsünk két külön állományt egy **routes.js** és egy **index.js** fájlt, az app könyvtárban.

_app/routes.js:_

```javascript
import Router from 'express';
const router = Router();

const products = [
    { id: 1, name: 'CD-ROM', price: 34 }
];

router.get('/products', (req, res) => {
    res.send(products);
});

export default router
```

_app/index.js:_

```javascript
import express from 'express';
import router from './routes.js';

const app = express();

app.use('/api', router);

app.listen(8000, () => {
    console.log('listening on port: 8000');
});
```

Indítsuk el az alkalmazást:

```cmd
node app
```

### Express gyakorlat

Készítsen projektet **rendelo** néven.

* Állítsa be az ECMAScript használatát.
* Telepítése az Express szervert.
* Hozzon létre egy **patients** nevű végpontot.
* A patients végpont adjon vissza egy pac nevű JSON objektumot.
* A pac objektumban tároljon nevet, kezelés dátumot, életkort.
* A pac objektumban vegyen fel tetszőleges adatokat.
* A szerver 16500 porton figyeljen.
* Indítsa el a szervert.
* Ellenőrizze HTTP klienssel a végpontot.

## Kontrollerek

A következő célunk, hogy a választ egy kontrollerben generáljuk, leválasztva azt az útválasztásról.

### Új projekt

Készítsünk egy új projektet **empapi** néven. Node.js projekt:

```cmd
mkdir empapi
cd empapi
npm init -y
```

A következő könyvtárszerkezetet hozzuk létre:

```txt
empapi/
  |-node_modules/
  |-app/
  |   |-controllers/
  |   |  `-employeeController.js
  |   |-routes/
  |   |  `-api.js
  |   `-index.js
  |-package-lock.json
  `-package.json
```

Függőségek telepítése:

```cmd
npm install express
npm install --save-dev nodemon
```

A **nodemon** lehetővé teszi számunkra, hogy az alkalmazás fejlesztése során minden egyes mentéskor azonnal legyen aktuális a fejlesztett rész.

Írjunk egy indító scriptet és állítsuk be a package.json fájlban a type kulcsot "module" értékre.

A package.json fájlban az indító script és a típus részlet:

```json
  "scripts": {
    "dev": "nodemon app --watch app"
  },
  "type": "module"
```

### Útválasztás

Hozzuk létre a routingot a **routes** könyvtárban **api.js** néven, a következő tartalommal:

_app/routes/api.js:_

```javascript
import Router from 'express'
const router = new Router()

router.get('/employees', (req, res) => {
    res.json({msg: 'működik'})
})

export default router
```

Jelenleg egyetlen JSON adatot adunk vissza egy "msg" tulajdonsággal, a json() függvénnyel. A json() függvény beállítja a HTTP fejlécet is.

### Belépési pont

_app/index.js:_

```javascript
import express from 'express'
import router from './routes/api.js'
const app = new express()

app.use('/api', router)

app.listen(8000, () => {
    console.log('Port: 8000')
})
```

Indítsuk el az alkalmazást:

```cmd
npm run dev
```

Teszteljünk egy HTTP klienssel.

```cmd
res localhost:8000/api/employees
```

### Kontroller

Készítsünk egy **employeeController.js** fájlt, a controllers könyvtárban, az alábbi tartalommal:

_app/controllers/employeeController.js_:

```javascript
const EmployeeController = {
    index: (req, res) => {
        res.json({msg: 'Kontroller itt'});
    }
}

export default EmployeeController
```

### Kontroller hívása az útválasztóból

Készítsünk az app könyvtárban egy routes nevű könyvtárat. Hozzunk benne létre egy api.js fájt.

```txt
empapi/
  |-node_modules/
  |-app/
  |   |-controllers/
  |   |  `-employeeController.js
  |   |-routes/
  |   |  `-api.js
  |   `-index.js
  |-package-lock.json
  `-package.json
```

A routes/api.js fájlban hozzunk létre egy útválasztást, ahol használjuk az EmployeeController-t.

_app/routes/api.js_:

```javascript
import Router from 'express'
import EmployeeController from '../controllers/employeeController.js'
const router = new Router()

router.get('/employees', EmployeeController.index)

export default router
```

Teszteljük újból. Most már a kontrollerből jön a válasz.

Teszteljün valamilyen HTTP klienssel.

```cmd
curl http://localhost:8000/api/employees
```

```cmd
res http://localhost:8000/api/employees
```

### Az összes metódus megvalósítása

Valósítsuk meg az összes metódust.

_app/controllers/employee.controller.js_:

```javascript
const EmployeeController = {
    index: (req, res) => {
        res.json({msg: 'read művelet'});
    },
    store: (req, res) => {
        res.json({msg: 'create művelet'});
    },
    update: (req, res) => {
        res.json({msg: 'update művelet'});
    },
    destroy: (req, res) => {
        res.json({msg: 'delete művelet'});
    }
}

export default EmployeeController
```

_app/routes/api.js_:

```javascript
import Router from 'express'
import EmployeeController from '../controllers/employeeController.js'
const router = new Router()

router.get('/employees', EmployeeController.index)
router.post("/employees", EmployeeController.store);
router.put("/employees", EmployeeController.update);
router.delete("/employees", EmployeeController.destroy);

export default router
```

## HTTP válaszok testreszabása

### JSON válasz a kontrollerben

A JSON segítségével több adatot is visszaadhatunk:

```javascript
res.json({
    success: true,
    msg: 'Valami'
    });
```

A példában egy success és egy msg tulajdonságot adunk vissza. A success megmutatja az üzenet sikeres vagy nem, az msg magát az üzenetet tartalmazza.

_app/controllers/employee.controller.js_:

```javascript
const EmployeeController = {
    index: (req, res) => {
        res.json({
            success: true,
            msg: 'read művelet újra'
        });
    }
}

export default EmployeeController
```

### HTTP válaszkód

Szabályozhatjuk milyen válaszkódot adunk. Láncolva:

```javascript
res.status(200).json({msg: 'Valami'});
```

Több sorba:

```javascript
res.status(200)
res.json({msg: 'Valami'});
```

_api/controllers/employee.controller.js_:

```javascript
const EmployeeController = {
    index: (req, res) => {
        res.status(200).json({msg: 'Valami'});
    }
}

module.exports = EmployeeController
```

## HTTP adat fogadása a klienstől

Készítsünk egy egyszerű Express REST API-t, ami read művelet tud /msg végponttal. Készítsünk egy index.js fájlt:

```txt
fogadas/
  |-app/
  |  `-index.js
  `-package.json
```

Telepítsük az express-t:

```cmd
npm install express
```

_app/index.js_:

```javascript
import express from 'express';
const app = express();

app.get('/msg', (req, res) => {
    res.send('Működik');
});

app.listen(8000, () => {
    console.log('listening on port 8000');
});
```

Mondjuk meg, hogy szeretnénk JSON adatot fogadni. Ezt az Express beépített json() nevű köztes szoftverével valósítjuk meg:

```javascript
app.use(express.json());
```

Egészítsük ki az útválasztást egy POST metódussal, ami szintén a /msg végponton működik, fogadja a kérséssel érkező adatokat, és visszaküldi változatlanul:

```javascript
app.post('/msg', (req, res) => {
    res.send(req.body);
});
```

Korábban a body-parser csomag volt használatos, de az elavult lett. Az Express már köztes szoftver formájában tartalmazza JSON értelmezőt.

_app/index.js_:

```javascript
import express from 'express';
const app = express();

app.use(express.json());

app.get('/msg', (req, res) => {
    res.send('Működik');
});

app.post('/msg', (req, res) => {
    res.send(req.body);
});

app.listen(8000, () => {
    console.log('listening on port 8000');
});

```

Indítsuk el a szervert. Ha az index.js fájl egy app könyvtárban van, akkor:

```cmd
node app
```

Ha fut a szerver, akkor teszteljük egy HTTP klienssel. Például HTTPie:

```cmd
http POST http://localhost:8000/msg name=Valaki
```

A http parancs a "name" kulcsot, a "Valaki" értékkel JSON formátumban küldi el. Helyes műkdöés esetén ehhez hasonló választ kell kapjunk:

```txt
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 17
Content-Type: application/json; charset=utf-8
Date: Sun, 21 May 2023 19:50:05 GMT
ETag: W/"11-kQ7bwC4zF281UBKjv6iRM9EYyd4"
Keep-Alive: timeout=5
X-Powered-By: Express

{
    "name": "Valaki"
}
```

### Adat fogadása kontrollerben

Vegyük elő az **empapi** projektünket vagy készítsünk egy másikat, ha az nem áll rendelkezésre.

```txt
fogadas/
  |-app/
  |  |-controllers/
  |  |  `-employeeController.js
  |  |-routes/
  |  |  `-api.js
  |  `-index.js
  `-package.json
```

Az index.js-ben adjuk hozzá az express.json() köztes szoftvert:

```javascript
app.use(express.json());
```

Használjuk a **morgan** naplózót:

```cmd
npm install morgan
```

```javascript
import morgan from 'morgan';
//...
app.use(morgan('tiny'));
```

A szerver belépési pontja, a teljes index.js:

_app/index.js_:

```javascript
import express from 'express';
import morgan from 'morgan';
import router from './routes/api.js';

const app = express();

app.use(morgan('tiny'));
app.use(express.json());
app.use('/api', router);

app.listen(8000, () => {
    console.log('port: 8000');
});
```

Fontos az app.use(express.json()); hívás. Ezt meg kell előzze az app.use('/api', router); sort.

Készítsünk egy útválasztó bejegyzést, ami POST metódust fogad és az EmployeeController, store() függvényét futtatja.

Az api.js két bejegyzéssel:

_api/routes/api.js_:

```javascript
import Router from 'express';
import EmployeeController from '../controllers/employee.controller';
const router = Router();

router.get('/employees', EmployeeController.index);
router.post('/employees', EmployeeController.store);

exports default = router
```

Ha előző munkánkból megmaradt a többi útvonal, nyugodtan ott hagyhatjuk.

Készítsük el a kontrollerben a store() függvényt:

```javascript
store: (req, res) => {
    res.status(200).json({ezt_kuldted: req.body})
}
```

A teljes kontroller, index és store függvényekkel:

_api/controllers/employee.controller.js_:

```javascript
const EmployeeController = {
    index: (req, res) => {
        res.status(200).json({msg: 'Valami'});
    },
    store: (req, res) => {
        res.status(200).json({ezt_kuldted: req.body})
    }
}

exports default EmployeeController
```

Teszteljük a végpontot POST metódussal. A http paranccsal például:

```txt
http POST http://localhost:8000/api/employees name=Valaki 
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 33
Content-Type: application/json; charset=utf-8
Date: Sun, 21 May 2023 21:07:31 GMT
ETag: W/"21-TQ2+VhlWHm1aN+P6nd9r3i9oU6o"
Keep-Alive: timeout=5
X-Powered-By: Express

{
    "ezt_kuldted": {
        "name": "Valaki"
    }
}
```

Küldjünk több adatot:

```cmd
http POST http://localhost:8000/api/employees name='Pártus László' city='Szeged' salary=358
```

Ha http parancsot használjuk, tegyük állományba a küldendő adatokat, például adat.txt:

```json
{
    "name": "Pártus László",
    "city": "Szeged",
    "salary": 387
}
```

```cmd
http POST http://localhost:8000/api/employees < adat.txt 
```

### Érvényesség ellenőrzése

```javascript
store: (req, res) => {
    if(!req.body.name) {
        res.status(400);
        res.json({message: 'Bad Request'});
    }
    res.status(201).json({ezt_kuldted: req.body})
}
```

A **req.body.name** tulajdonságban kellene megkapjunk egy "name" értéket. Ezt ellenőrizzük az if() utasításban. Ha nincs kérésben "name" tulajdonság, akkor a válaszkódot beállítjuk 400-ra, az üzenetet pedig "Bed Request"-re.

Ellenőrizzük úgy, hogy nem küldünk adatot:

```javascript
http post localhost:8000/api/employees
HTTP/1.1 400 Bad Request
Connection: keep-alive
Content-Length: 25
Content-Type: application/json; charset=utf-8
Date: Sat, 03 Jun 2023 19:26:28 GMT
ETag: W/"19-FkPEY9wpMIN361xso7ugHGed8Qg"
Keep-Alive: timeout=5
X-Powered-By: Express

{
    "message": "Bad Request"
}
```

Most küldjünk egy name tulajdonságot tetszőleges értékkel:

```javascript
http post localhost:8000/api/employees name='Béla'
HTTP/1.1 201 Created
Connection: keep-alive
Content-Length: 32
Content-Type: application/json; charset=utf-8
Date: Sat, 03 Jun 2023 19:30:11 GMT
ETag: W/"20-2hNokITzoaufR2pu/z4Hctjl+fA"
Keep-Alive: timeout=5
X-Powered-By: Express

{
    "ezt_kuldted": {
        "name": "Béla"
    }
}

```

Felvehetünk több tulajdonságot is:

```javascript
store: (req, res) => {
    if(!req.body.name || !req.body.city) {
        res.status(400);
        res.json({message: 'Bad Request'});
    }
    res.status(201).json({ezt_kuldted: req.body});
}
```

### Paraméterek átvétele

A paraméter átvételére az update és delete műveletnél szükséges. Nézzük meg a delete műveletnél a paraméter átvételét.

Elsőként jelezzük az api.js fájlban a útválasztásnál, hogy paramétert is érkezik:

```javascript
router.delete("/employees/:id", EmployeeController.destroy);
```

A destroy() metódusban ezek után **req.params.id** tulajdonságban kapjuk meg az azonosítót:

```javascript
    destroy: (req, res) => {        
        res.send(req.params.id);
    }
```

A példában rögtön vissza is küldtük, így a tesztelésnél meg kell kapjuk az azonosítót. Teszteljük:

```cmd
http delete localhost:8000/api/employees/30
HTTP/1.1 200 OK
Connection: keep-alive
Content-Length: 2
Content-Type: text/html; charset=utf-8
Date: Sat, 03 Jun 2023 19:55:48 GMT
ETag: W/"2-ItIA+GcNvbPiU6kO7lCYR3yVwj0"
Keep-Alive: timeout=5
X-Powered-By: Express

30
```

Most már tudunk adatokat és paramétert átvenni, dolgozhatunk adatbázissal.

## Beállítások tárolása

A beállítások tárolhatók .env nevű fájlban vagy tárolhatók JSON fájlban is. A JSON fájl szokásos neve config.json vagy a config/default.json. Mi az utóbbi fogjuk használni.

Hozzuk létre egy **config/default.json** fájlt.

### Port beállítása

Elsőként állítsuk be az alkalmazás portszámát.

_config/default.json_:

```json
{
  "app": {
    "port": 3000
  }
}
```

Most be kell olvasni a default.json fáljt.

A projekt belépési pontját, az index.js fájlt egészítsük ki a következő két sorral:

```javascript
import { readFileSync } from 'fs'
const fileUrl = new URL('config.json', import.meta.url)
const config = JSON.parse(readFileSync(fileUrl, 'utf-8'))

//...
app.listen(config.app.port, () => {
    console.log(`Port: ${config.app.port}`)
})
```

A beolvasás után a config objektumban érjük el beállításokat. A portbeállításnál ezt azonnal felhasználjuk.

A teljes index.js fájl:

_app/index.js_:

```javascript
import express from 'express'
import morgan from 'morgan'
import router from './routes/api'
import { readFileSync } from 'fs'

const fileUrl = new URL('config.json', import.meta.url)
const config = JSON.parse(readFileSync(fileUrl, 'utf-8'))

const app = new express()

app.use(morgan('tiny'))
app.use(express.json())
app.use('/api', router)

app.listen(config.app.port, () => {
    console.log(`Port: ${config.app.port}`)
})
```

Indítsuk újra a szervert. Most a default.json fájlban megadott portot veszi fel a szerver. Ellenőrizzük, egy 3000-s port beállításával, majd a szerver újraindításával.

## ORM használata

### SQLite használata

Hozzunk létre egy **lite** nevű projektet. Könyvtárszerkezet:

```txt
lite/
  |-app/
  |  `-database/
  |     `-database.js
  |-database.sqlite
  `-package.json
```

```cmd
mkdir lite
cd lite
npm init -y
npm install express
```

Állítsuk be a **package.json** fájlban a type kulcs tartalmát module-ra.

```json
{
    "type": "module"
}

Telepítsük az SQLite és Sequelize csomagjait:

```cmd
npm install sqlite3 sequelize
```

A Sequelize() konstruktorban paraméterként megadva írjuk le az adatbázist. Jelen esetben ez SQLite adatbázis. Ehhez két kulcsot kell megadni, a dialect és a storage.

_app/database/database.js_:

```javascript
import { Sequelize } from 'sequelize'

const sequelize = new Sequelize({
    dialect: 'sqlite',
    storage: 'database.sqlite'
})

//Megnézzük, hogy elérhető az adatbázis:
await sequelize.authenticate()
```

Futtassuk az alkalmazást:

```cmd
node app/database/database.js
```

A futtatás eredményeként létre kell jöjjön a projekt gyökérkönyvtárában egy **database.sqlite** fájl.

A Sequelize() konstruktor lehetséges paraméterei:

| Név | Típus | Tulajdonság | Leírás |
| --- | --- | --- | --- |
| database | sztirng | opcionális | Adatbázis neve |
| username | sztring | opcionális | Adatbázis felhasználóneve |
| password | sztring | opcionális | Adatbázis jelszava |
| options | objektum | opcionális | Adatbázis konfiguráció objektum |
| options.host | sztring | opcionális | Adatbázis elérési név |
| options.port | szám | opcionális | Adatbázis port |
| options.dialect | sztring | opcionális | Adatbázis tipus |
| options.username | sztring | opcionális | Adatbázis felhasználóneve |
| options.password | sztring | opcionális | Adatbázis jelszava |
| options.database | sztring | opcionális | Adatbázis neve |
| options.storage | sztring | opcionális | Adatbázis fájlnév |

```javascript
import { Sequelize } from 'sequelize'

const sequelize = new Sequelize({
    dialect: 'sqlite',
    storage: 'database.sqlite'
})

//Hibakezelés:
try {
  await sequelize.authenticate()
  console.log('Ok')
}catch (err) {
  console.error('Hiba!')
  console.error(err)
}
```

Futtassuk újra az alkalmazást.

A sequelize objektummal létrehozhatunk modellt, amiből létrejön egy tábla.

Tegyük fel, hogy dolgozók adatait szeretnénk tárolni.

```javascript
const Employee = new sequelize.define('employee', {
    name: { type: DataTypes.STRING },
    city: { type: DataTypes.STRING },
    salary: { type: DataTypes.DOUBLE }
})
```

Szükség van egy utasításra, ami leszinkronizálja az objektumot az adatbázisban.

```javascript
await sequelize.sync(
    { force: true }
)
```

Esetleg:

```javascript
await sequelize.sync(
    { alter: true }
)
```

Ha már léteznek a táblák a { force: true } kitörli és felülírja azt. Az { alter: true } meghadja az meglévő adatokat.

A teljes kód:

```javascript
import { Sequelize } from "sequelize";

const sequelize = new Sequelize({
  dialect: "sqlite",
  storage: "database.db"
});

const Employee = sequelize.define('employee', {
  name: {
    type: Sequelize.STRING,
    allowNull: false
  },
  city: {
    type: Sequelize.STRING,
    allowNull: true
  },
  salary: {
    type: Sequelize.DOUBLE,
    allowNull: true
  }
});

await sequelize.sync({
    alter: true
});

await Employee.create({
  name: 'Erős István',
  city: 'Szeged',
  salary: 392
});
```

Az **id mezőt** nem adtuk meg, mivel automatikusan létrejön.

Futtassuk az alkalmazhást.

Az adatbázisban, most létre kell jöjjön egy employees tábla. Ellenőrizzük.

### SQLite beállításfájlból

Vegyük fel a **config** nevű mappát, benne egy **default.json** fájlt.

```txt
lite/
  |-app/
  |  `-database/
  |     `-database.js
  |-config/
  |  `-default.json
  |-database.sqlite
  `-package.json
```

Állítsuk be a **default.json** fájlban a SQLite elérési adatait. Vegyünk fel egy **db** kulcsot. Értéke egy objektum ami két újabb kulcsot tartalmaz: dialect és storage. A dialect kulcsban megadhatjuk az adatbázis típusát, a storage kulcsban megadhatjuk az adatbázis fájlt.

```json
{
    "db": {
        "dialect": "sqlite",
        "storage": "database.sqlite"
    }
}
```

Most be kell olvasni a fájl tartalmát.

```javascript
import { readFileSync } from 'fs'
const fileUrl = new URL('config.json', import.meta.url)
const config = JSON.parse(readFileSync(fileUrl, 'utf-8'))
```

A beállíátsok a **config** objektmból érhetők el.

```javascript
import { Sequelize } from "sequelize";
import { readFileSync } from 'fs'
const fileUrl = new URL('config.json', import.meta.url)
const config = JSON.parse(readFileSync(fileUrl, 'utf-8'))

const sequelize = new Sequelize({
  dialect: config.db.dialect,
  storage: config.db.storage"
});

const Employee = sequelize.define('employee', {
  name: {
    type: Sequelize.STRING,
    allowNull: false
  },
  city: {
    type: Sequelize.STRING,
    allowNull: true
  },
  salary: {
    type: Sequelize.DOUBLE,
    allowNull: true
  }
});

await sequelize.sync({
    alter: true
});

await Employee.create({
  name: 'Erős István',
  city: 'Szeged',
  salary: 392
});
```

Töröljük az adatbázisfájlt majd, futtassuk újra az alkalmazást és ellenőrizzük az adatbázist, benne a táblát.

Hosszú távon a modellt és a modellen a create() függvény futtatását kiemeljük más állományba. A modelt egy models nevű könyvtárba helyezzük, az új dolgozó létrehozását a controllers nevű könyvtár egy állományába.

```txt
lite/
  |-app/
  |  |-controllers/
  |  |   `-employeeController.js
  |  |-database/
  |  |   `-database.js
  |  `-models/
  |      `-employee.js
  |-config/
  |  `-default.json
  |-database.sqlite
  `-package.json
```

## MariaDB

### Adatbázis előkészítése

Hozzuk létre az adatbázist és hozzá egy felhasználót:

```sql
create database emp
character set utf8
collate utf8_hungarian_ci;

grant all privileges
on emp.*
to emp@localhost
identified by 'titok';
```

A példában egy **emp** nevű adatbázis hoztunk létre, és egy emp nevű **felhasználó** érheti azt el a **titok jelszóval**.

### MariaDB használat

```cmd
npm install mariadb
```

Most vegyük fel a **default.json** fájlban a MariaDB elérési adatait:

_config/default.json_:

```json
{
    "app": {
        "port": 8000
    },
    "db": {
        "dialect": "mariadb",
        "host": "localhost",
        "name": "emp",
        "user": "emp",
        "pass": "titok",
        "path": ":memory:"
    }
}
```

### Adatbázis-elérés

Készítsünk egy **app/database/mariadb.js** fájlt.

_app/database/mariadb.js_:

```javascript
import Sequalize from 'sequelize'
import { readFileSync } from 'fs'

const fileUrl = new URL('config.json', import.meta.url)
const config = JSON.parse(readFileSync(fileUrl, 'utf-8'))
 
const sequalize = new Sequalize(
    config.db.name,
    config.db.user, 
    config.db.pass,
    {
        host: config.db.host,
        dialect: 'mariadb',
        dialectOptions: {}
    }
)
 
exports default sequalize
```

### Model készítése

Készítsünk egy **app/models/employee.js** fájlt.

_app/models/employee.js_:

```javascript
import { DataTypes } from 'sequelize'
import sequelize from '../database/mariadb.js'

const Employee = sequelize.define('Employee', {
    id: { 
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: { type: DataTypes.STRING,  allowNull: false  },
    city: { type: DataTypes.STRING,  allowNull: true  },
    salary: { type: DataTypes.DOUBLE , defaultValue: 0 }
})
 
/*
A model és az adatbázis 
szinkronizálása, nem erőltetve. 
*/
sequelize.sync({
    force: false
})
export default Employee
```

|  Jelölés  |  Jelentés  |
|-|-|
| DataTypes.INTEGER | egész |
| DataTypes.STRING  | sztring |
| DataTypes.DATETIME  | dátum és idő |
| DataTypes.DOUBLE    | double |
| DataTypes.FLOAT     | float  |
| DataTypes.DECIMAL   | decimális |
| DataTypes.BOOLEAN   | tinint(1) |

## Kontroller készítése

_app/controllers/employeeController.js_:

```javascript
import Employee from '../models/employee'
 
const EmployeeController = {
    async index(req, res) {
        try {
            const emps = await Employee.findAll()
            res.status(200)
            res.json({
                success: true,
                data: emps
            })
        } catch (error) {
            res.status(500)
            res.send('Hiba')
        }        
    },
    async store(req, res) {
        try {
            const emp = await Employee.create(req.body)
            res.status(201)
            res.json({
                success: true,
                data: emp
            })
        } catch (error) {
            res.status(500)
            res.send('Hiba')
        }        
    },
    async update(req, res) {
        try {
            const id = req.params.id
            const emp = await Employee.update(req.body, {
                where: {id: id}
            })
            res.status(200)
            res.json({
                success: true,
                data: emp
            })
        } catch (error) {
            res.status(500)
            res.send('Hiba')
        }        
    },
    async destroy(req, res) {
        try {
            const id = req.params.id
            const emp = await Employee.destroy({
                where: {id: id}
            })
            res.status(200)
            res.json({
                success: true,
                data: emp
            })
        } catch (error) {
            res.status(500)
            res.send('Hiba')
        }        
    }
}
 
export default EmployeeController
```

## Routing

_app/routes/api.js_:

```javascript
import Router from 'express'
import EmployeeController from '../controllers/employeecontroller.js'
const router = Router();

router.get('/employees', EmployeeController.index)
router.post('/employees', EmployeeController.store)
router.put('/employees/:id', EmployeeController.update)
router.delete('/employees/:id', EmployeeController.destroy)
 
export default router
```

## Végleges belépési pont

_app/index.js_:

```javascript
import express from 'express'
import router from './routes/api.js'
import morgan from 'morgan'
import { readFileSync } from 'fs'

const fileUrl = new URL('config.json', import.meta.url)
const config = JSON.parse(readFileSync(fileUrl, 'utf-8'))

const app = new express()

const PORT = config.app.port || 8000
 
app.use(morgan('combined'))
app.use(express.json())
app.use('/api', router)
 
app.listen(PORT, () => {
    console.log(`Listening localhost: ${PORT}`)
})
```

Futtatás:

```cmd
npm run dev
```

Tesztelés resen csomag res parancsával:

```cmd
res localhost:8000/api/employees
```

## Azonosítás

Az útvonalak védelméhez szükség van felhasználókra. Az útvonalakat JWT tokennel fogjuk biztosítani.

### User model készítése

Készítsünk egy User modellt az **src/models/user.js** fájlban:

_src/models/user.js_:

```javascript
import { DataTypes } from 'sequelize'
import sequelize from '../database/mariadb.js'
 
const User = sequelize.define('User', {
    id: { 
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: { type: DataTypes.STRING,  allowNull: false  },
    email: { type: DataTypes.STRING,  allowNull: true  },
    password: { type: DataTypes.STRING , allowNull: false }
})
 
/*
A model és az adatbázis 
szinkronizálása, nem erőltetve. 
*/
sequelize.sync({
    force: false
})
export default User
```

### AuthController készítése

Készítsünk az **app/controllers/authController.js** fájlban egy AuthController-t:

_app/controllers/authController.js_:

```javascript
import bcrypt from 'bcryptjs'
import User from '../models/user.js'
 
const AuthController = {
    async register(req, res) {
 
        if(!req.body.name ||
            !req.body.email ||
            !req.body.password ||
            !req.body.password_confirmation) {
            res.status(400)
            res.json({
                success: false,
                message: 'Hiba! A bejövő adatok hibásak!'
            })
        }
 
        if(req.body.password != req.body.password_confirmation) {
            res.status(400).send({
                success: false,
                message: "A jelszavak nem egyeznek!"
            })
        }        
 
        try {
            User.findOne({
                where: {
                    name: req.body.name
                }
            })
            .then(user => {
                if(user) {
                    res.status(400)
                    res.json({ 
                        message: "A felhasználó már létezik: " + user.name
                    })
                }else {
                    const user = {
                        name: req.body.name,
                        email: req.body.email,
                        password: bcrypt.hashSync(req.body.password)
                    }
                    User.create(user)
                    .then( result => {
                        res.status(201)
                        res.json({
                            succes: true,
                            data: result
                        })
                    })
 
                }
            })
        } catch (error) {
            res.status(500)
            res.json({
                success: true,
                message: 'Hiba! A felhasználó létrehozása sikertelen'
            })
        }        
    }
}
 
export default AuthController
```

### Útválasztás a regiszterhez

```javascript
import AuthController from '../controllers/authcontroller.js'
//...
router.post('/register', AuthController.register)
```

Az **app/routes/api.js** teljes tartalma:

_app/routes/api.js_:

```javascript
import Router from 'express';
const router = Router();

import EmployeeController from '../controllers/employeecontroller.js'
import AuthController from '../controllers/authcontroller.js'
 
router.get('/employees', EmployeeController.index)
router.post('/employees', EmployeeController.store)
router.put('/employees/:id', EmployeeController.update)
router.delete('/employees/:id', EmployeeController.destroy)
 
router.post('/register', AuthController.register)
 
export default router
```

## Bejelentkezés

### Az APP_KEY

Hozzunk létre egy alkalmazáskulcsot a config/default.json fájlban.

```json
{
    "app": {
        "key":"434384383343"
    }    
}
```

A számok véletlenszerűen megadott számok, legalább 32 darab.

A teljes config/default.json fájl az alábbiakban láthatjuk.

_config/default.json_:

```json
{
    "app": {
        "port": 8000,
        "key": ""
    },
    "db": {
        "host": "127.0.0.1",
        "name": "",
        "user": "",
        "pass": ""
    }
}
```

### A login() függvény az authcontroller.js-ben

_app/controllers/authcontroller.js_:

```javascript
    async login(req, res) {
        if(!req.body.name || !req.body.password) {
            res.status(400).send({
                message: "Hiba! A felhasználónév vagy jelszó hibás!"
            })
            return
        }
        const user = {
            name: req.body.name,
            password: bcrypt.hashSync(req.body.password)
        }
        User.findOne({
            where: {
                name: req.body.name
            }
        })
        .then(user => {
            if(!user) {
                return res.status(404).send({ message: "User not found."})
            }
            var passwordIsValid = bcrypt.compareSync(
                req.body.password,
                user.password
            );
            if(!passwordIsValid) {
                res.status(401).send({
                    accessToken: null,
                    message: "Invalid password!"
                });
            }
            var token = jwt.sign({ id: user.id }, process.env.APP_KEY, {
                expiresIn: 86400 //24 óra
            });
            res.status(200).send({
                id: user.id,
                name: user.name,
                email: user.email,
                accessToken: token
            });
        })        
    }
```

### Útválasztás a login számára

Hozzunk létre egy login nevű végpontot.

```javascript
router.post('/login', AuthController.login)
```

### Tokenek ellenőrzse

A tokenek ellenőrzését egy köztes szoftverben végezzük. Hozzuk létre az **app/middleware/authjwt.js** fájlban a következőt:

_app/middleware/authjwt.js_:

```javascript
import jwt from 'jsonwebtoken'
import { readFileSync } from 'fs'

const fileUrl = new URL('config.json', import.meta.url)
const config = JSON.parse(readFileSync(fileUrl, 'utf-8'))
 
exports.verifyToken = (req, res, next) => {
    let authData = req.headers.authorization;
    if(!authData) {
        return res.status(403).send({
            message: 'No token provided!'
        })
    }
    let token = authData.split(' ')[1];
 
    jwt.verify(token, config.app.key, (err, decoded) => {
        if(err) {
            return res.status(401).send({
                message: "Unauthorized!"
            })
        }
        req.userId = decoded.id;
        next()
    })
};
```

### Útvonal védelme

Az útvonalak védelme get(), post(), put() és a delete() függvényhívásokban a második paraméter lesz. A példában szögletes zárójelben adtuk meg, ami tömb adatszerkezet. Vagyis több köztes szoftver is megadható.

```javascript
import { verifyToken } from '../middleware/authjwt.js'
//...
router.post('/employees', [verifyToken], EmployeeController.store)
```

Ellenőrizzük például a resen csomag res parancsával:

```cmd
res post localhost:8000/api/employees 
name='Verdi Ernő' city='Szeged' 
-A bearer -a eyJhbG
```

A -a után a token írjuk, ami valójában jóval hosszabb.

Állítsuk be az update és delete műveletre is:

```javascript
router.delete('/employees/:id', [verifyToken], employees.destroy);
router.put('/employees/:id', [verifyToken], employees.update);
```

## Biztonság

### CORS

#### A set() függvény

```javascript
app.get('/msg', (req, res) => {
    res.set('Access-Control-Allow-Origin', '*')
    res.send(data);
});
```

#### Node.js cors csomagja

Telepítés:

```cmd
npm install cors
```

Használat:

```javascript
import cors from 'cors'
//...
app.use(cors())
```

Ebben a formában mindenhonnan fogad kérést.

Egyetlen útválasztáshoz is köthetjük:

```javascript
app.get('/valami', cors(), (req, res, next) => {})
```

A CORS beállítása:

```javascript
import cors from 'cors'
//...

const corsOption = {
    origin: 'http://localhost:4200',
    optionSuccessStatus: 200
}

app.get('/valami', cors(corsOpton), (req, res, next) => {})
```

Csak a localhost:4200 címről fogadunk hívásokat.

```javascript
import cors from 'cors'
//...

const corsOption = {
    origin: 'http://localhost:4200'
}

app.use(cors(corsOption))
```

De be is építhetjük:

```javascript
import cors from 'cors'
//...

app.use(cors({
    origin: 'http://localhost:4200' 
}))
```

Tömbben több hely is megadható:

```javascript
import cors from 'cors'
app.use(cors({
    origin: [
        'http://localhost:4200',
        'http://localhost:3000'
    ]
}))
```

Nyílvános:

```javascript
app.use(cors({
    origin: '*'
}));
```

* [https://www.section.io/engineering-education/how-to-use-cors-in-nodejs-with-express/](https://www.section.io/engineering-education/how-to-use-cors-in-nodejs-with-express/)
* [https://www.npmjs.com/package/cors](https://www.npmjs.com/package/cors)

#### A CORS tesztelése

A CORS teszteléséhez készítsünk egy weblapot, amit egy szerverről futtatunk. Lehet például a lite-server.

src/index.html:

```html
<html>
<script src="app.js"></script>
</html>
```

src/app.js:

```javascript
fetch('http://localhost:8000/msg')
    .then((res) => res.json())
    .then((data) => console.log(data))
```

```json
{
    "server": ["src"]
}
```

### A helmet

A helmet egy nyílt forráskódú JavaScript-könyvtár. HTTP fejlécek beállításával vagy éppen tiltásával segíti a biztonságos HTTP fejléceket.

A helmet nélkül az Express bizalmas információkat tesz közzé, így sebezhető lesz.

A Helmetet köztes szoftverként használjuk az Expressben.

Írjunk egy egyszerű Express szervert:

```javascript
import express from 'express';
const app = express();

app.get('/msg', (req, res) => {
    res.send('működik');
});

app.listen(8000, () => {
    console.log('listening on port 8000');
});
```

Vegyünk egy biztonsági tesztelő programot, például:

* [https://wapiti-scanner.github.io/](https://wapiti-scanner.github.io/)

Linuxon csak írjuk be:

```bash
apt install wapiti
```

Ezek után teszteljük a szerverünket, például:

```bash
wapiti -u http://localhost:8000/msg
```

A futtatás után a felhasználó könyvtárában, egy ehhez hasonló útvonalon találunk egy ripotrtot:

* [.wapiti/generated_report/localhost_8000_05212023_1843.html](.wapiti/generated_report/localhost_8000_05212023_1843.html)

A tesztelés elvégezhető szemrevételezéssel is, A HTTPie vagy a curl segítségével:

```cmd
http http://localhost:8000/msg
```

```cmd
curl --include http://localhost:8000/msg
```

Vegyük észre például a következő fejlécmezőt:

```json
X-Powered-By: Express
```

#### A Helmet használata

Most használjuk a Helmetet:

```javascript
import express from 'express';
import helmet from 'helmet';
const app = express();

app.use(helmet());

app.get('/msg', (req, res) => {
    res.send('működik');
});

app.listen(8000, () => {
    console.log('listening on port 8000');
});
```

Most készítsünk újra riportot a Wapitivel, illetve nézzük meg a http vagy curl paranccsal.
