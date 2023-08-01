# Backend programozás - Express

* **Szerző:** Sallai András
* Copyright (c) 2023, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Szükséges

* NodeJS
* VSCode
* Insomnia

## Express és a Sequelize

Az Express minimalista, rugalmas webes keretrendszer, ami NodeJS-sel van megvalósítva.

Sok népszerű keretrendszer alapszik az Expressen.

A Sequelize egy ORM rendszer, amit a modelleket leképezi adatbázisra.

## Első Express projekt

```cmd
mkdir hello
cd hello
npm init -y
npm install express
mkdir src
```

### Az első index.js

Készítsünk egy **index.js** nevű fájlt az src könyvtárban. Tartalma:

```javascript
console.log('Helló Világ');
```

Futtatás:

```cmd
node src
```

## Végpontok

### Az index.js végponttal

Készítsünk egy új projektet **veges** néven:

```cmd
mkdir veges
cd veges
npm init -y
npm install express
mkdir src
```

Az src könyvtárban készítsünk egy index.js fájlt, a következő tartalommal:

```javascript

const express = require('express');

// Express alkalmazás létrehozása:
const app = express();

// Egy /msg nevű végpont beállítása:
app.get('/msg', (req, res) => {
    res.send('Helló üzenet'); // Üzenet visszaküldése
});

// A REST API szerver a 8000-s porton figyeljen:
app.listen(8000, () => {
    console.log('listening on port: 8000');
});
```

Ha elkszítettük a szerverünket, futtassuk a szervert.

Futtatás:

```cmd
node src
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

Nézzük meg az eredményt az Insomnia alkalmazásban is.

A futó szervert állítsuk le a Ctrl + C billentyűkombinációval.

### JSON válasz

JSON válaszhoz készítsünk például egy tömböt, aminek most egyetlen eleme van:

```javascript
const data = [
    { title: 'Helló Express'}
];
```

Teljes kód:

```javascript
const express = require('express');
const app = express();

const data = [
    { title: 'Helló Express'}
];

app.get('/msg', (req, res) => {
    res.send(data);
});

app.listen(8000, () => {
    console.log('listening on port 8000');
});
```

Futtassuk a szervert, és teszteljük curl vagy http paranccsal.

### Express több végponttal

Készítsünk egy **pcshop** nevű projektet.

Készítsük el a következő **index.js** állományt:

```javascript
const express = require('express');
const app = express();

const products = [
    { id: 1, name: 'CD-ROM', price: 34 },
    { id: 2, name: 'CPU',  price: 38 },
    { id: 2, name: 'RAM', price: 27 }
];

const customers = [
    { id: 1, name: 'Varga Béla', email: 'varga@kek.lan' },
    { id: 2, name: 'Dante Irén',  email: 'dante@kek.lan' },
    { id: 2, name: 'Lant Ferenc', email: 'lant@kek.lan' }
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

Használjunk get és post metódust is:

```javascript
const express = require('express');
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

Teszteljük mindkettőt. Használjuk a HTTPie, http parancsát:

```cmd
http localhost:8000/msg
```

```cmd
http post localhost:8000/msg
```

Fejlesszük tovább az alkalmazásunkat és valósítsunk meg minden metódust:

```javascript
const express = require('express');
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

Teszteljük az alkalmazást a HTTPie vagy a curl paranccsal vagy az Insomnia segítségével.

### Express router

Készítsünk egy **utas** nevű projektet.

A Router használatával az alkalmazás egyes részei szétválaszthatók, és végpontot is bővíthetjük.

Először lássuk egyetlen fájlban a használatát. Készítsünk egy index.js fájlt az src könyvtárban:

```javascript
const express = require('express');
const app = express();

const Router = require('express');
const router = Router();

const products = [
    { id: 1, name: 'CD-ROM', price: 34 }
];

router.get('/products', (req, res) => {
    res.send(products);
});

app.use('/api', router);

app.listen(8000, () => {
    console.log('listening on port: 8000');
});
```

Indítsuk el a szervert és teszteljük:

```cmd
http localhost:8000/api/products
```

### Az Express router szétbontva

Készítsünk két külön állományt egy routes.js és egy index.js fájlt, az src könyvtárban.

routers.js:

```javascript
const Router = require('express');
const router = Router();

const products = [
    { id: 1, name: 'CD-ROM', price: 34 }
];

router.get('/products', (req, res) => {
    res.send(products);
});

module.exports = router
```

index.js:

```javascript
const express = require('express');
const app = express();
const router = require('./routes');

app.use('/api', router);

app.listen(8000, () => {
    console.log('listening on port: 8000');
});
```

Indítsuk el az alkalmazást:

```cmd
node src
```

### Express gyakorlat

Készítsen projektet **rendelo** néven.

* Telepítése az Express szervert.
* Hozzon létre egy **paciens** nevű végpontot.
* A paciens végpont adjon vissza egy pac nevű JSON objektumot.
* A pac objektumban tároljon nevet, kezelés dátumot, életkort.
* A pac objektumban vegyen fel tetszőleges adatokat.
* A szerver 16500 porton figyeljen.
* Indítsa el a szervert.
* Ellenőrizze HTTP klienssel a végpontot.

## Kontrollerek

A következő célunk, hogy a választ egy kontrollerből adjuk.

### Új projekt

Készítsünk egy új projektet **empapi** néven. NodeJS projekt:

```cmd
mkdir empapi
cd empapi
pnpm init
```

A következő könyvtárszerkezetet hozzuk létre:

```txt
empapi/
  |-node_modules/
  |-src/
  |   |-controllers/
  |   |  `-employeeController.js
  |   |-routes/
  |   |  `-api.js
  |   `-index.js
  |-package.json
  `-pnpm-lock.yaml
```

Függőségek telepítése:

```cmd
pnpm install express sequelize mariadb
pnpm install --save-dev nodemon
```

A **nodemon** lehetővé teszi számunkra, hogy az alkalmazás fejlesztése során minden egyes mentéskor azonnal legyen aktuális a fejlesztett rész.

A package.json fájlban az indító script:

```json
  "scripts": {
    "start": "nodemon src --watch src"
  },
```

### Útválasztás

Hozzuk létre a routingot a **routes** könyvtárban **api.js** néven, a következő tartalommal:

```javascript
const Router = require('express')
const router = new Router()

router.get('/employees', (req, res) => {
    res.json({msg: 'működik'})
})

module.exports = router
```

Jelenleg egyetlen JSON adatot adunk vissza egy "msg" tulajdonsággal, a json() függvénnyel. A json() függvény beállítja a HTTP fejlécet is.

### Belépési pont

```javascript
const express = require('express')
const app = new express()
const router = require('./routes/api')

app.use('/api', router)

app.listen(8000, () => {
    console.log('Port: 8000')
})
```

Indítsuk el az alkalmazást:

```cmd
npm start
```

Teszteljünk egy HTTP klienssel. Például HTTPie http parancsa:

```cmd
http localhost:8000/api/employees
```

### Kontroller

Készítsünk egy employeeController.js fájlt,
a controllers könyvtárban, a következő tartalommal:

```javascript
const EmployeeController = {
    index: (req, res, next) => {
        res.json({msg: 'Kontroller itt'});
    }
}

module.exports = EmployeeController
```

### Kontroller hívása az útválasztóból

Készítsünk az src könyvtárban egy routes nevű könyvtárat. Hozzunk benne létre egy api.js fájt.

```txt
empapi/
  |-node_modules/
  |-src/
  |   |-controllers/
  |   |  `-employeeController.js
  |   |-routes/
  |   |  `-api.js
  |   `-index.js
  |-package.json
  `-pnpm-lock.yaml
```

Az routes/api.js fájlban hozzunk létre egy útválasztást, ahol használjuk az EmployeeController-t:

```javascript
const Router = require('express');
const EmployeeController = require('../controllers/employeeController');
const router = Router();

router.get("/employees", EmployeeController.index);

module.exports = router
```

Teszteljük újból. Most már a kontrollerből jön a válasz.

A teszte végezhetjük curl, http paranccsal vagy az Insomnia alkalmazással.

```cmd
curl http://localhost:8000/api/employees
Valami%
```

### Az összes metódus megvalósítása

Valósítsuk meg az összes metódust.

_src/controllers/employee.controller.js_:

```javascript
const EmployeeController = {
    index: (req, res, next) => {
        res.json({msg: 'read művelet'});
    },
    store: (req, res, next) => {
        res.json({msg: 'create művelet'});
    },
    update: (req, res, next) => {
        res.json({msg: 'update művelet'});
    },
    destroy: (req, res, next) => {
        res.json({msg: 'delete művelet'});
    }
}

module.exports = EmployeeController
```

_src/routes/api.js_:

```javascript
const Router = require('express');
const EmployeeController = require('../controllers/employee.controller');

const router = Router();

router.get("/employees", EmployeeController.index);
router.post("/employees", EmployeeController.store);
router.put("/employees", EmployeeController.update);
router.delete("/employees", EmployeeController.destroy);

module.exports = router
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

A példában egy success és egy msg tulajdonságot adunk vissza. A success megmutatja az üzenet sikeress vagy nem, az msg magát az üzenetet.

_employee.controller.js_:

```javascript
const EmployeeController = {
    index: (req, res, next) => {
        res.json({
            success: true,
            msg: 'Valami'
        });
    }
}

module.exports = EmployeeController
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

_employee.controller.js_:

```javascript
const EmployeeController = {
    index: (req, res, next) => {
        res.status(200).json({msg: 'Valami'});
    }
}

module.exports = EmployeeController
```

## HTTP adat fogadása a klienstől

Készítsünk egy egyszerű Express REST API-t, ami read művelet tud /msg végponttal. Készítsünk egy index.js fájlt:

```txt
fogadas/
  |-src/
  |  |-index.js
  `-package.json
```

Telepítsük a express-t:

```cmd
pnpm install express
```

_src/index.js_:

```javascript
const express = require('express');
const app = express();

app.get('/msg', (req, res) => {
    res.send('Működik');
});

app.listen(8000, () => {
    console.log('listening on port 8000');
});
```

Mondjuk meg, hogy szeretnénk JSON adatot fogadni. Ez az Express beépített json() nevű köztes szoftverével valósítjuk meg:

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

_index.js_:

```javascript
const express = require('express');
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

Indítsuk el a szervert. Ha az index.js fájl egy src könyvtárban van, akkor:

```cmd
node src
```

vagy

```javascript
node src/index.js
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

Vegyük elő a **empapi** projektünket vagy készítsünk egy másikat, ha az nem áll rendelkezésre.

```txt
fogadas/
  |-src/
  |  |-controllers/
  |  |  `-employeeController.js
  |  |-routes/
  |  |  `-api.js
  |  |-index.js
  `-package.json
```

Az index.js-ben adjuk hozzá az express.json() köztes szoftvert:

```javascript
app.use(express.json());
```

Használjuk a **morgan** naplózót:

```cmd
pnpm install morgan
```

```javascript
const morgan = require('morgan');
//...
app.use(morgan('tiny'));
```

A szerver belépési pontja, a teljes index.js:

```javascript
const express = require('express');
const app = express();
const morgan = require('morgan');

const router = require('./routes/api');

app.use(morgan('tiny'));
app.use(express.json());
app.use('/api', router);

app.listen(8000, () => {
    console.log('port: 8000')
})
```

Fontos az app.use(express.json()); hívás. Ez meg kell előzze az app.use('/api', router); sort.

Készítsünk egy útválasztó bejegyzést, ami POST metódust fogad és az EmployeeController, store() függvényét futtatja.

Az api.js két bejegyzéssel:

```javascript
const Router = require('express');
const EmployeeController = require('../controllers/employee.controller');
const router = Router();

router.get('/employees', EmployeeController.index);
router.post('/employees', EmployeeController.store);

module.exports = router
```

Ha előző munkánkból megmaradt a többi útvonal nyugodtan ott hagyhatjuk.

Készítsük el a kontrollerben a store() függvényt:

```javascript
store: (req, res) => {
    res.status(200).json({ezt_kuldted: req.body})
}
```

A teljes kontroller, index és store függvényekkel:

```javascript
const EmployeeController = {
    index: (req, res) => {
        res.status(200).json({msg: 'Valami'});
    },
    store: (req, res) => {
        res.status(200).json({ezt_kuldted: req.body})
    }
}

module.exports = EmployeeController
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

A req.body.name tulajdonságban kellene megkapjunk egy "name" értéket. Ezt ellenőrizzük az if() utasításban. Ha nincs kérésben "name" tulajdonság, akkor a válaszkódot beállítjuk 400-ra, az üzenetet pedig "Bed Request"-re.

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
store: (req, res, next) => {
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

A destroy() metódusban ezek után req.params.id tulajdonságban kapjuk meg az azonosítót:

```javascript
    destroy: (req, res, next) => {        
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

Most már tudunk adatokat és paramétert átvenni, dogozhatunk adatbázissal.

## ORM használata

### Adatbázis előkészítése

Hozzuk létre az adatbázis és hozzá egy felhasználót:

```sql
create database emp
character set utf8
collate utf8_hungarian_ci;

grant all privileges
on emp.*
to emp@localhost
identified by 'titok';
```

A példában egy emp nevű adatbázis hoztunk létre, és egy emp nevű felhasználó érheti azt el a titok jelszóval.

### A dotenv használata

Telepítsük a dotenv csomagot:

```cmd
pnpm install dotenv
```

Hozzunk létre a projekt gyökérkönyvtárában egy .env nevű fájlt

#### Port beállítása

```bash
PORT=8000
```

A projekt belépési pontját, az index.js fájlt egészítsük ki a következőkkel:

```javascript
require('dotenv').config()
//...
app.listen(process.env.APP_PORT, () => {
    console.log(`Port: ${process.env.APP_PORT}`)
})
```

A teljes index.js fájl:

```javascript
const express = require('express')
const app = new express()
const morgan = require('morgan')
const router = require('./routes/api')
require('dotenv').config()

app.use(morgan('tiny'))
app.use(express.json())
app.use('/api', router)

app.listen(process.env.APP_PORT, () => {
    console.log(`Port: ${process.env.APP_PORT}`)
})
```

Indítsuk újra a szervert. Most a .env fájlban megadott portot veszi fel a szerver. Ellenőrizzük, egy 3000-s port beállításával, majd a szerver újraindításával.

### Adatbázis konfigurálása

#### MariaDB

```cmd
npm install mariadb
```

Most vegyük fel a .env fájlban a MariaDB elérési adatait:

```bash
APP_PORT=8000

DB_HOST=127.0.0.1
DB_NAME=emp
DB_USER=emp
DB_PASS=titok
```

### Adatbázis elérés

Készítsünk egy egy **src/database/mariadb.js** fájlt:

```javascript
const Sequalize = require('sequelize')
require('dotenv').config()
 
const sequalize = new Sequalize(
    process.env.DB_NAME,
    process.env.DB_USER, 
    process.env.DB_PASS,
    {
        host: process.env.DB_HOST,
        dialect: 'mariadb',
        dialectOptions: {}
    }
)
 
module.exports = sequalize
```

### Model készítése

Készítsünk egy **src/models/employee.js fájlt:

```javascript
const { DataTypes } = require('sequelize')
const sequelize = require('../database/mariadb')
 
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
 
//A model és az adatbázis szinkronizálása, nem erőltetve.
sequelize.sync({
    force: false
})
module.exports = Employee
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

```javascript
const Employee = require('../models/employee')
 
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
 
module.exports = EmployeeController
```

## Routing

```javascript
const Router = require('express');
const router = Router();
 
const EmployeeController = require('../controllers/employeecontroller')
 
router.get('/employees', EmployeeController.index)
router.post('/employees', EmployeeController.store)
router.put('/employees/:id', EmployeeController.update)
router.delete('/employees/:id', EmployeeController.destroy)
 
module.exports = router
```

## Végleges belépési pont

```javascript
const express = require('express')
const app = new express()
const router = require('./routes/api')
const morgan = require('morgan')
require('dotenv').config()
const PORT = process.env.APP_PORT || 8000
 
app.use(morgan('combined'))
app.use(express.json())
app.use('/api', router)
 
app.listen(PORT, () => {
    console.log(`Listening localhost: ${PORT}`)
})
```

Futtatás:

```cmd
npm start
```

Tesztelés HTTPie paranccsal:

```cmd
http localhost:8000/api/employees
```

## Azonosítás

Az útvonalak védelméhez szükség van felhasználókra. Az útvonalakat JWT tokennel fogjuk biztosítani.

### User model készítése

Készítsünk egy User modellt az **src/models/user.js** fájlban:

```javascript
const { DataTypes } = require('sequelize')
const sequelize = require('../database/mariadb')
 
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
 
//A model és az adatbázis szinkronizálása, nem erőltetve.
sequelize.sync({
    force: false
})
module.exports = User
```

### AuthController készítése

Készítsünk az **src/controllers/authController.js fájlban egy AuthController-t:

```javascript
const bcrypt = require('bcryptjs')
 
const User = require('../models/user')
 
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
 
module.exports = AuthController
```

### Útválasztás a regiszterhez

```javascript
const AuthController = require('../controllers/authcontroller')
//...
router.post('/register', AuthController.register)
```

Az **src/routes/api.js** teljes tartalma:

```javascript
const Router = require('express');
const router = Router();
 
const EmployeeController = require('../controllers/employeecontroller')
const AuthController = require('../controllers/authcontroller')
 
router.get('/employees', EmployeeController.index)
router.post('/employees', EmployeeController.store)
router.put('/employees/:id', EmployeeController.update)
router.delete('/employees/:id', EmployeeController.destroy)
 
router.post('/register', AuthController.register)
 
module.exports = router
```

## Bejelentkezés

### Az APP_KEY

Hozzunk létre egy alkalmazáskulcsot a .env fájlban.

```bash
APP_KEY=3434384383343
```

A számok véletlenszerűen megadott számok.

A teljes .env fájl:

```bash
APP_PORT=8000
APP_KEY=3434384383343

DB_HOST=127.0.0.1
DB_NAME=emp
DB_USER=emp
DB_PASS=titok
```

### A login() függvény az authcontroller.js-ben

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

```javascript
router.post('/login', AuthController.login)
```

### Tokenek ellenőrzse

A tokenek ellenőrzését egy köztes szoftverben végezzük. Hozzuk létre az **src/middleware/authjwt.js** fájlban a következőt:

```javascript
const jwt = require("jsonwebtoken");
require('dotenv').config()
 
exports.verifyToken = (req, res, next) => {
    let authData = req.headers.authorization;
    if(!authData) {
        return res.status(403).send({
            message: 'No token provided!'
        })
    }
    let token = authData.split(' ')[1];
 
    jwt.verify(token, process.env.APP_KEY, (err, decoded) => {
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

```javascript
const { verifyToken } = require('../middleware/authjwt');
//...
router.post('/employees', [verifyToken], EmployeeController.store)
```

Ellenőrizzük például a HTTPie http parancsával:

```cmd
http post localhost:8000/api/employees 
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

#### NodeJS cors csomagja

Telepítés:

```cmd
npm install cors
```

Használat:

```javascript
const cors = require('cors');
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
const cors = require('cors');
//...

const corsOption = {
    origin: 'http://localhost:4200',
    optionSuccessStatus: 200
}

app.get('/valami', cors(corsOpton), (req, res, next) => {})
```

Csak a localhost:4200 címről fogadunk hívásokat.

```javascript
const cors = require('cors');
//...

const corsOption = {
    origin: 'http://localhost:4200'
}

app.use(cors(corsOption))
```

De be is építhetjük:

```javascript
const cors = require('cors');
//...

app.use(cors({
    origin: 'http://localhost:4200' 
}))
```

Tömbben több hely is megadható:

```javascript
const cors = require('cors');
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

src/index.html

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

A Helmetet köztes szoftverknt használjuk az Expressben.

Írjunk egy egyszerű Express szervert:

```javascript
const express = require('express');
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
const express = require('express');
const helmet = require('helmet');
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
