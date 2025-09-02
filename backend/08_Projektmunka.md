# Backend programozás - Projektmunka

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Egy nagyobb projekt](#egy-nagyobb-projekt)

## Egy nagyobb projekt

Ebben a részben egy projektet készítünk, amely Web API-t valósít meg, és az adatokat SQL adatbázisban tárolja. A feladatban 2-3 CRUD műveletet fogunk megvalósítani, amit a Frontend tantárggyal együtt valósítunk meg.

### Elemezés

Írjuk össze miről szeretnénk adatokat tárolni és szolgáltatni. Ezek az adatok milyen típusúak.

* Tanulókról szeretnénk adatokat tárolni.
* A tanulók által elvégzett dolgozatokról is szeretnénk adatokat tárolni.

### Tervezés

A tervezéshez kezdetben használhatunk papírt amire felvázolhatjuk a gondolatainkat.

Elektronikus tervezéshez ajánlott a Dia nevű program.

A projekt neve legyen:

* **stude**

Lehet két végpont:

| Végpontok |
|-|
| students |
| examine |

### Kódolás

A kódoláshoz ajánlott szoftverek:

* Codium

Készítsünk egy alap projektet:

```cmd
git clone https://github.com/oktat/exapi stude
```

#### Student modell készítése

_app/models/student.js_:

```javascript
const { DataTypes } = require('sequelize')
const sequelize = require('../database/database')
 
const Student = sequelize.define('Student', {
    id: { 
        type: DataTypes.INTEGER,
        autoIncrement: true,
        primaryKey: true
    },
    name: { type: DataTypes.STRING,  allowNull: false  },
    city: { type: DataTypes.STRING,  allowNull: true  },
    email: { type: DataTypes.STRING , allowNull: true },
    birth: { type: DataTypes.DATE, allowNull: true }
})


sequelize.sync({
    force: false
})
module.exports = Student
```

#### StudentController készítése

_app/controllers/studentcontlroller.js_:

```javascript
const Student = require('../models/studnet')

const StudentController = {
    async index(req, res) {
        try {
            StudentController.tryIndex(req, res)
        }catch(error) {
            res.status(500)
            res.json({
                success: false,
                message: 'Error! The query is failed!'
            })
        }
    },
    async tryIndex(req, res) {
        const students = await Student.findAll()
        res.status(200)
        res.json({
            success: true,
            data: students
        })
    }
}

module.exports = StudentController
```

#### Routing

Az app/routes/api.js fájlban vegyünk fel a következő sort:

```javascript
router.get('/students', StudentController.index)
```

A teljes fájl:

_app/routes/api.js_:

```javascript
const Router = require('express')
const router = Router()

const AuthController = require('../controllers/authcontroller')
const UserController = require('../controllers/usercontroller')
const StudentController = require('../controllers/studentcontroller')
const { verifyToken } = require('../middleware/authjwt')
 
router.post('/register', AuthController.register)
router.post('/login', AuthController.login)
router.get('/users', [verifyToken], UserController.index)

router.get('/students', StudentController.index)
 
module.exports = router
```

#### CRUD műveletek

A Read művelet elkészült. Önállóan valósítsák meg a többi műveltetet is a students végponton, majd dokumentálja.

### Tesztelés

Teszteléshez ajánlott eszköz:

Ad-hoc teszt:

* HTTPie

Tervezett teszt:

* supertest

#### Teszt kezdése

_test/studentTest.js_:

```javascript
const supertest = require('supertest')

describe('A students teszt', () => {

    const host = 'http://localhost:8000/api' 

    it('/students get teszt', (done) => {
        supertest(host)
            .get('/students')
            .set('Accept', 'application/json')
            .expect(200, done)
    })
})
```
