# Backend programozás - Laravel

* **Szerző:** Sallai András
* Copyright (c) 2023, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Szükséges

A következő szoftverekre van szükség:

* composer - Egy parancs
* php - A php parancsra van szükség
* npm - Az Node.js rendszer része
* MariaDB Server - MySQL elágazás
* sqlitebrowser
* Visual Studio Code
* curl - egy parancs; CLI HTTP kliens
* Insomnia - GUI REST API kliens

A composer telepítése Chocolatey csomagkezelővel:

```cmd
choco install composer
```

A composer csomaggal együtt felkerül a PHP is, a php paranccsal együtt.

A Node.js telepítése a Chocolatey csomagkezelővel:

```cmd
choco install nodejs-lts
```

A Node.js csomaggal felkerül az npm parancs is.

A MariaDB telepítése Chocolatey csomagkezelővel:

```cmd
choco install mariadb
```

Az sqlitebrowser telepítése Chocolatey csomagkezelővel:

```cmd
choco install sqlitebrowser
```

```cmd
choco install vscode.install
```

```cmd
choco install curl
```

```cmd
choco install insomnia-rest-api-client
```

## Első projekt

Hozzuk létre egy hello nevű projektet.

```cmd
composer create-project laravel/laravel hello
```

Lépjünk be a létrejött hello nevű könyvtárba, majd indítsuk el a beépített fejlesztői szerverrel az alkalmazást:

```cmd
cd hello
php artisan serve
```

A böngészőbe írjuk be a következő címet:

```url
http://127.0.0.1:8000/
```

A laravel alapértelmezett oldalát látjuk.

### Az alapértelmezett weblap cseréje

A resources/views/ könyvtárban hozzunk létre egy home.blade.php állományt a következő tartalommal:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <div class="container">
        <h1>Helló</h1>
    </div>
    
</body>
</html>
```

Nyissuk meg a webhely útválasztóját:

```php
<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
```

Javítsuk a Route::get() bejegyzést:

```php
Route::get('/', function () {
    return view('home');
});
```

Mentsük a fájlt, majd frissítsük a weboldalt.

### Gyakorlat - kiegészítés

* Egészítsük ki a hello projektet Bootstrap-pel. Használjunk CDN-t.
* Tegyünk egy 50 szavas Lorem ipsum szöveget a weblapra, bekezdésként.

## Könyvtár struktúra

* [https://laravel.com/docs/10.x/structure](https://laravel.com/docs/10.x/structure)

## Útválasztás

REST API esetén az útvonalakat a következő helyen állítjuk:

* routes/api.php

Hozzunk létre egy "vegpont" nevű projektet:

```cmd
composer create-project laravel/laravel vegpont
```

Nyissuk meg a routes/api.php fájlt:

```php
<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
```

Találunk egy alapértelmezett mintát. Töröljük vagy tegyük megjegyzésbe.

Készítsünk egy 'uzenet' nevű végpontot, GET metódussal. A végpontot a Route osztállyal készítjük el. Ehhez meg kell hagyjuk a második use sort:

```php
use Illuminate\Support\Facades\Route;
```

Majd hozzuk létre az útvonalat:

```php
Route::get('uzenet', function() {
    return 'üdvözlet';
});
```

Listázzuk az útvonalakat:

```cmd
php artisan route:list
```

### Tesztelés - egyszerű végpont

curl:

```cmd
curl http://localhost:8000/api/uzenet
```

Indítsuk el az Insomnia-t és teszeljük a végpontot.

### Tömb átadása

```php
Route::get('/uzenet', function() {
    return [1, 2, 3];
});
```

Átadunk egy tömböt és kapunk egy JSON-t.

### Végpont paramétere

```php
use Illuminate\Support\Facades\Route;

Route::get('employees/{id}', function($id) {
    return $id;
});
```

Teszteljük a curl paranccsal:

```cmd
curl http://localhost:8000/api/employees/35
35%
```

Teszteljük Insomnia kliensben is.

Egészítsük ki bevezető szöveggel:

```php
Route::get('employees/{id}', function($id) {
    return 'Dolgozó azonosító: '.$id;
});
```

Teszteljük:

```cmd
curl http://localhost:8000/api/employees/35
Dolgozó azonosító: 35%
```

### Request függőség befecskendezése

```php
Route::get('employees/{id}', function(Request $request, string $id) {
    return 'A kérés: '.$request;
});
```

Teszteljük:

```cmd
curl http://localhost:8000/api/employees/35
A kérés: GET /api/employees/35 HTTP/1.1
Accept:     */*
Host:       localhost:8000
User-Agent: curl/7.74.0

```

### Útválasztás link

* [https://laravel.com/docs/10.x/routing](https://laravel.com/docs/10.x/routing)

### Gyakorlat - Végpont

* Hozzunk létre egy gyumolcs nev projektet.
* Készítsünk három végpontot:
  * alma
  * korte
  * barack

Az alma nevű végpont adja vissza az alma szót, és 150 értéket egy sorban.

Az korte nevű végpont adja vissza az alma szót, és 180 értéket egy sorban.

Az barack nevű végpont adja vissza az alma szót, és 210 értéket egy sorban.

### Response használata

```php
Route::get('/uzenet', function() {
    return response('Helló', 200);
});
```

Teszteljük:

```cmd
curl http://localhost:8000/api/uzenet
Helló%
```

Használjuk a -i kapcsolót is a válaszkód megtekintéséhez:

```cmd
curl -i http://localhost:8000/api/uzenet
HTTP/1.1 200 OK
Host: localhost:8000
Date: Sun, 14 May 2023 15:45:41 GMT
Connection: close
X-Powered-By: PHP/8.1.17
Cache-Control: no-cache, private
Date: Sun, 14 May 2023 15:45:41 GMT
Content-Type: text/html; charset=UTF-8
X-RateLimit-Limit: 60
X-RateLimit-Remaining: 59
Access-Control-Allow-Origin: *

Helló% 
```

Megadhatjuk a fejlécben a válasz típusát text/plain-ként, de ez az alapértelmezés:

```php
use Illuminate\Support\Facades\Route;

Route::get('/uzenet', function() {
    return response('Helló', 200)
        ->header('Content-Type', 'text/plain');
});
```

### Response és JSON válasz

routes/api.php:

```php

use Illuminate\Support\Facades\Route;

Route::get('employees', function() {
    return response()->json([
        'name' => 'Terebes Ernő',
        'city' => 'Szeged',
        'salary' => 349
    ]);
});
```

curl:

```cmd
curl http://localhost:8000/api/employees
```

## Kontrollerek használata

Készítsünk egy kontrollt dolgozók számára:

```cmd
php artisan make:controller EmployeeController
```

A kontroller a következő helyen és néven jön létre:

* app/Http/Controllers/EmployeeController.php

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EmployeeController extends Controller
{
    //
}
```

Készítsünk egy index() metódust:

```php
function index() {}
```

Térjünk vissza egy névvel:

```php
    function index() {
        return 'Béla';
    }
```

Készítsünk hozzá útvonalat. Ehhez először a routes/api.php fájlban vegy használatba az EmployeeController osztályt:

```php
use App\Http\Controllers\EmployeeController;
```

Útvonalban jelöljük mega a kontroller index metódusát:

```php
Route::get('/employees', [EmployeeController::class, 'index']);
```

Teszteljük a curl paranccsal:

```cmd
curl http://localhost:8000/api/employees
Béla%
```

A válasz már az útválasztó helyett az EmplyoeeController-ből érkezett.

Teljes kód:

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EmployeeController extends Controller
{
    function index() {
        return 'Béla';
    }
}
```

Használhatunk response() metódust:

```php
    function index() {
        return response('Béla', 200);
    }
```

### Azonosító átvétele a kontrollerben

A routes/api.php fájlban:

```php
Route::get('/employees/{id}', [EmployeeController::class, 'index']);
```

```php
    function index($id) {
        return 'Id: '.$id;
    }
```

Teljes kontroller:

```php
<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class EmployeeController extends Controller
{
    function index($id) {
        return 'Id: '.$id;
    }
}
```

### Hibakeresés

A dd() függvény alkalmas változók, tömbök, objektumok megjelenítésére.

```php
    function index() {
        dd('valami');
        return 'Valami';
    }
```

A dd() függvény hatására 500-as válaszkódot kapunk, de megkapjuk a kért értéket.

Hívjuk meg az útválasztóból:

```php
Route::get('/employees', [EmployeeController::class, 'index']);
```

Az eredményt curl paranccsal nem igazán lehet látni, használjunk Insomniát.

### POST kérés

Fogadjunk az útválasztóban POST kérést, az **employees** végponton, futtassuk az index() metódust az EmployeeController-ben:

```php
Route::post('/employees', [EmployeeController::class, 'index']);
```

Az EmployeeController-ben adjuk vissza a kérést:

```php
    function index(Request $request) {
        return 'Kérés: '.$request;
    }
```

Teszteljük:

```cmd
curl -X POST -d 'aaaa' http://localhost:8000/api/employees

Kérés: POST /api/employees HTTP/1.1
Accept:         */*
Content-Length: 4
Content-Type:   application/x-www-form-urlencoded
Host:           localhost:8000
User-Agent:     curl/7.74.0

aaaa%
```

A négy darab 'a' betűt elküldtük a szervernek POST metódussal, majd vissza is küldtük válaszként:

## Modellek

Modell generálása:

```cmd
php artisan make:model Employee
```

## ORM

### Adatbázis beállítása

Az adatbázis adatait a .env állományban kell beállítani. A Laravel projekt létrehozása során létrejön egy .env fál. Keressük meg benne a következő részt:

```ini
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=
```

#### MariaDB

MySQL vagy MariaDB mindegy, mivel teljesen kompatibilisek egymással. Készítsünk az adatbázis szerveren egy adatbázist, vegyük fel hozzá egy felhasználót. Legyen például egy 'emp' nevű adatbázis.

Használjuk a következő SQL utasításokat:

```sql
create database emp
character set utf8
collate utf8_hungarian_ci;

grant all privileges
on emp.*
to emp@localhost
identified by 'titok';
```

A két SQL utasítás létrehozza az 'emp' adatbázis és egy emp nevű felhasználót, aki localhoston hozzáférhet az adatbázishoz.

Állítsuk be a .env fájlba:

```ini
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=emp
DB_USERNAME=emp
DB_PASSWORD=titok
```

### Migráció

```php
php artisan make:migration create_employees_table
```

Az adatábzis tábla neve employees lesz.

```cmd
php artisan migrate
```

#### Hozzáadás tesztelése

```php
Route::post('/employees', [EmployeeController::class, 'store']);
```

Készítsünk egy EmployeeControllerben egy store() nevű metódust:

```php
function store(Request $req) {
    return $req->all();
}
```

```cmd
curl -X POST http://localhost:8000/api/employees \
   -H "Content-Type: application/json" \
   -d '{"name": "Erős István", "city": "Szeged", "salary": 392}'
{"name":"Er\u0151s Istv\u00e1n","city":"Szeged","salary":392}% 
```

Ha visszakapjuk a dolgozó adatait, eddig jól csináltuk.

Most a visszaadás mellet el kell tennünk adatbázisba is. Ehhez szükség van egy modellre is.

#### Modell létrehozása

```cmd
php artisan make:model Employee
```

Hozzunk létre egy $fillable tömböt, amiben megadjuk milyen mezőket lehet változtatni (kitölteni).

```php
protected $fillable = [
    'name', 
    'city', 
    'salary'
];
```

A teljes Employee.php fájl tartalma:

```php
<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    use HasFactory;
    protected $fillable = [
        'name', 
        'city', 
        'salary'
    ];
}
```

Alakítsuk át a kontrollert:

```php
function store(Request $req) {
    return Employee::create($req->all());
}
```

#### Hozzáadás teszt tárolással

Tesztelésnél be kell állítanunk POST metódust.

```cmd
curl -X POST http://localhost:8000/api/employees
   -H "Content-Type: application/json"
   -d '{"name": "Park Irén", "city": "Szeged", "salary": 383}'
```

A parancsot egyetlen sorba kell bírni!

Használjuk más adatokkal az Insomnia-t.

#### Dolgozók lekérdezése

Hozzuk létre az employees útvonalat, ha nem létezik:

```php
Route::get('/employees', [EmployeeController::class, 'index']);
```

Egészítsük ki az Employee komponenst egy index() metódussal:

```php
function index() {
    return Employee::all();
}
```

#### Dolgozók frissítése

Az EmployeeController osztályban hozzon létre egy update() metódust:

```php
function update(Request $req, $id) {
    $employee = Employee::find($id);
    $employee->update($req->all());
    return $employee;
}
```

Hozzon létre egy útvonalat a routes/api.php fájlban:

```php
Route::put('/employees/{id}', [EmployeeController::class, 'update']);
```

Teszteléshez vegyünk fel egy dolgozót, jegyezzük fel az azonosítóját. Legyen például 3. A használható URL ebben az esetben:

```url
http://localhost:8000/api/employees/3
```

Állítsunk be PUT metódust.

A body-ban küldjük a következőt:

```json
{
    "name": "Tagadó Árpád",
    "city": "Szeged",
    "salary": 384
}
```

Helyes működés esetén a következőt kell kapjuk:

```json
{
    "id": 3,
    "name": "Tagadó Árpád",
    "city": "Szeged",
    "salary": 384,
    "created_at": "2023-05-14T20:05:08.000000Z",
    "updated_at": "2023-05-14T20:06:35.000000Z"
}
```

#### Dolgozók törlése

Az EmployeeController osztályban hozzon létre egy destroy() metódust:

```php
function destroy($id) {
    return Employee::destroy($id);
}
```

Hozzon létre egy útvonalat a routes/api.php fájlban:

```php
Route::delete('/employees/{id}', [EmployeeController::class, 'destroy']);
```

Teszteléshez vegyünk fel egy dolgozót, jegyezzük fel az azonosítóját. Legyen például 4. A használható URL ebben az esetben:

```url
http://localhost:8000/api/employees/4
```

Állítsunk be DELETE metódust.

A body-t hagyjuk üresen. Sikeres törlés esetén megkapjuk a törölt dolgozók számát vagyis 1-t.

## A respons() függvény

### Újratervezés response használatával

Használjuk az Employee kontrollerben a **response()** függvényt, a válaszok beállítására, amit a Laravel biztosít számunkra. Ezzel visszatérési kódot is beállíthatjuk.

| Státuszkód | Jelentés |
|-|-|
| 201 | A létrehozás sikerült |
| 204 | No content - Sikeres törlés esetén |

A read és update műveletnél 200 válaszkóddal térünk vissza.

### A read művelet response() függvénnyel

Javítsuk az index() metódust:

```php
function index() {
    $employees = Employee::all();
    return response($employees, 200);
}
```

Javítsunk kicsit a visszatérési üzeneteken:

```php
function index() {
    $employees = Employee::all();
    return response()->json([
        'success' => true,
        'message' => 'OK. A lekérdezés sikeres.',
        'data' => $employees
    ], 200);
}
```

### A create művelet response() függvénnyel

A store() metódus:

```php
function store(Request $req) {
    $employee = Employee::create($req->all());
    return response($employee, 201);
}
```

Sikeres létrehozás esetén 201-s kóddal kell visszatérni.

Javított üzenetekkel:

```php
function store(Request $req) {
    $employee = Employee::create($req->all());
    return response()->json([
        'success' => true,
        'message' => 'OK. A létrehozás sikeres.',
        'data' => $employee
    ], 201);
}
```

### Az update művelet response() függvénnyel

```php
function update(Request $req, $id) {
    $employee = Employee::find($id);
    $employee->update($req->all());
    return response()->json([
        'success' => true,
        'message' => 'OK. A frissítés sikeres.',
        'data' => $employee
    ], 200);        
}
```

### A delete művelet response() függvénnyel

A delete művelet esetén visszatérhetünk 200-s vagy 204-s válaszkóddal. 204-s válaszkód esetén viszont nem küldhetünk body-ban semmit.

```php
function tryDestroy($id) {
    $deleted = Employee::destroy($id);
    return response()->json([
        'success' => true,
        'message' => 'OK. A törlés sikeres.',
        'deleted' => $deleted
    ], 200);        
}
```

Ha nem küldünk body-t:

```php
function destroy($id) {
    Employee::destroy($id);
    return response()->json([],204);        
}
```

De azt ellenőrizhetjük, hogy törlendő létezik-e:

```php
function destroy($id) {
    $emp = Employee::find($id);
    if(!$emp) {
        return response()->json([
            'success' => false,
            'message' => 'Hiba! Nincs ilyen azonosító!'
        ], 404);
    }
    Employee::destroy($id);
    return response()->json([],204);        
}
```

## Kivételkezelés a végpontokon

Ha szeretnénk szerveroldali hiba esetén színvonalasabb visszajelzést kapni, JSON formátumban try_catch szerkezetbe kell tennünk az adatbázis lekérdezést.

A hibajelzések mellé válasszunk megfelelő státuszkódot, az alábbi táblázat alapján.

| Státuszkód | Jelentés |
|-|-|
| 404 | Not Found - Az erőforrás nem található |
| 401 | Not authorized - Nem vagy bejelentkezve |
| 403 | Logged in but access to requested area is forbidden |
| 400 | Bad request (valami hiba van az URL-ben vagy paraméterekben) |
| 422 | Unprocessable Entity (érvényességi hiba) |
| 500 | Szerver hiba |

### Dolgozók lekérdezése kivételkezeléssel

Vegyük használatba a Throwable osztályt, majd használjuk a try_catch szerkezetet:

```php
//...
use Throwable;
//...

function index() {
    try {
        return $this->tryIndex();
    }catch(Throwable $e) {
        return response()->json([
            'message' => 'Hiba! A lekérdezés sikertelen!',
            'exception' => $e->getMessage()
        ], 500);
    }
}
function tryIndex() {
    $employees = Employee::all();
    return response($employees, 200);
}
```

A Throwable osztályt a PHP 7-ben vezették be. Lehetővé teszi a kivételek testreszabását az alkalmazásainkban.

### Új dolgozó hozzáadása kivételkezeléssel

```php
function store(Request $req) {
    try {
        return $this->tryStore($req);
    } catch (Throwable $e) {
        return response()->json([
            'message' => 'Hiba! A tárolás sikertelen!',
            'exception' => $e->getMessage()
        ], 500);
    }
}
function tryStore(Request $req) {
    $employee = Employee::create($req->all());
    return response($employee, 201);
}
```

### Dolgozó frissítése kivételkezeléssel

```php
function update(Request $req, $id) {
    try {
        return $this->tryUpdate($req, $id);
    } catch (Throwable $e) {
        return response()->json([
            'message' => 'Hiba! A frissítés sikertlen!',
            'exception' => $e->getMessage()
        ], 500);
    }
}
function tryUpdate(Request $req, $id) {
    $employee = Employee::find($id);
    $employee->update($req->all());
    return $employee;
}
```

### Dolgozó törlése kivételkezeléssel

```php
function destroy($id) {
    try {
        return $this->tryDestroy($id);
    } catch (Throwable $e) {
        return response()->json([
            'message' => 'Hiba! A törlés sikertelen!',
            'exception' => $e->getMessage()
        ], 500);
    }
}
function tryDestroy($id) {
    return Employee::destroy($id);
}
```

## Érvényesség ellenőrzése

Érvényességet kell ellenőrizzük, amikor űrlapból kapunk adatokat. Ez create és update műveleteknél van.

### A create művelet érvényességgel

Eredeti kód:

```php
function tryStore(Request $req) {
    $employee = Employee::create($req->all());
    return response($employee, 201);
}
```

Érvényesség ellenőrzése:

```php
function tryStore(Request $req) {

    $employee = Employee::create($req->all());
    return response($employee, 201);
}
```

```php
function tryStore(Request $req) {
    $rules = [
        'name' => 'required|max:50',
        'city' => 'max:50'
    ];

    $message = [
        'name.required' => 'A név megadása kötelező',
        'city.max' => 'A településnév maximális hossza 50'
    ];

    $req->validate($rules, $message);

    $employee = Employee::create($req->all());
    return response()->json([
        'success' => true,
        'message' => 'OK. A létrehozás sikeres.',
        'data' => $employee
    ], 201);
}
```

Csökkentsük a településnév maximális hosszát 5 karakterre. Használjuk az Insomnia-t egy új dolgozó felvételére, aki például szolnoki.

```json
{
    "message": "Hiba! A tárolás sikertelen!",
    "exception": "A településnév maximális hossza 5"
}
```

Ha most visszaállítjuk az 50-s értéket és újból használjuk az Insomnia-t, a következő választ kaphatjuk:

```json
{
    "success": true,
    "message": "OK. A létrehozás sikeres.",
    "data": {
        "name": "Árpa Villmos",
        "city": "Szolnok",
        "salary": 393,
        "updated_at": "2023-05-19T20:23:44.000000Z",
        "created_at": "2023-05-19T20:23:44.000000Z",
        "id": 7
    }
}
```

### Az update művelet érvényességgel

A felépítés hasonló a create műveletnél megadottaknál:

```php
function tryUpdate(Request $req, $id) {

    $rules = [
        'name' => 'required|max:50',
        'city' => 'max:50'
    ];

    $message = [
        'name.required' => 'A név megadása kötelező',
        'city.max' => 'A településnév maximális hossza 50'
    ];

    $req->validate($rules, $message);        

    $employee = Employee::find($id);
    $employee->update($req->all());
    return response()->json([
        'success' => true,
        'message' => 'OK. A frissítés sikeres.',
        'data' => $employee
    ], 200);        
}
```

## Felhasználók kezelése

### Felhasználók lekérdezése

Hozzunk létre egy projektet 'felhasznalo' néven.

Hozzunk létre egy kontrollert a felhasználók számára. Migrációs fájl és modell már a projekt létrehozásakor létezik.

```cmd
php artisan make:controller UserController
```

Hozzuk létre a kontrollerben egy index() metódust:

```php
function index() {
    return User::all();
}
```

Hozzunk létre egy útvonalat routes/api.php fájlban:

```php
Route::get('/users', [UserController::class, 'index']);
```

### Új felhasználó felvétele

```php
function store(Request $req) {
    $rules = [
        'name' => 'required|max:50',
        'password' => 'required|string|confirmed'
    ];
    $message = [
        'name' => 'Hiba! A név megadása kötelező!',
        'password' => 'Hiba! A jelszó megadása kötelező!'
    ];
    $req->validate($rules, $message);
    $user = User::create([
        'name' => $req->name,
        'email' => $req->email,
        'password' => bcrypt($req->password)
    ]);
    $token = $user->createToken('sajatToken')->plainTextToken;
    $response = [
        'user' => $user,
        'token' => $token
    ];
    return response()->json([
        'success' => true,
        'message' => 'OK. A felhasználó létrehozása sikeres.',
        'data' => $response
    ], 201);
}
```

Siker esetén lehetséges JSON válasz:

```json
{
    "success": true,
    "message": "OK. A felhasználó létrehozása sikeres.",
    "data": {
        "user": {
            "name": "dani",
            "email": "dani@zold.lan",
            "updated_at": "2023-05-19T21:42:42.000000Z",
            "created_at": "2023-05-19T21:42:42.000000Z",
            "id": 2
        },
        "token": "1|5J2m5wm6Jxl4JtYAjCQnsPKKc1CCPCanpY5zLKJD"
    }
}
```

### Belépés

```php
function login(Request $req) {
    $userData = [
        'name' => $req->name,
        'password' => $req->password
    ];
    if(Auth::attempt($userData)) {
        $authUser = Auth::user();
        $token = $authUser->createToken('sajatToken')->plainTextToken;
        $name = $authUser->name;
        return response()->json([
            'success' => true,
            'message' => 'OK. Bejelentkezve',
            'token' => $token,
            'name' => $name
        ], 200);
    }else {
        return response()->json([
            'success' => false,
            'message' => 'Hiba! Az azonosítás sikertelen!',
            'name' => $req->name
        ], 401);
    }
}
```

Amit küldeni kell:

```json
{
    "name": "pali",
    "password": "titoka"
}
```

Lehetséges válasz siker esetén:

```json
{
    "success": true,
    "message": "OK. Bejelentkezve",
    "token": "3|oHgR4oA2UQ9RwJee8f92UbF3wCXFgygdqDHdYTWv",
    "name": "pali"
}
```

Lehetséges válasz sikertelenség esetén:

```json
{
    "success": false,
    "message": "Hiba! Az azonosítás sikertelen!",
    "name": "pali"
}
```

## Sanctum azonosítás

A Laravelben a Sanctum egy könnyen használható csomag azonosításra. Lehetővé teszi API-k végpontjainak védelmét, token alapú azonosítással.

A védelmet az útválasztóban állítjuk be.

Például az employees végpont védelme POST metódus esetén:

```php
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post('employees', [EmployeeController::class, 'store']);
});
```

Ugyanígy fel kell vennünk azokat az útvonalakat amit védni szeretnénk:

```php
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::post('employees', [EmployeeController::class, 'store']);
    Route::put('employees/{id}', [EmployeeController::class, 'update']);
    Route::delete('employees/{id}', [EmployeeController::class, 'destroy']);
});
```

## Képek tárolása

A képek tárolására két lehetőség van:

A képet a szerveren tároljuk a fájlrendszeren, az adatbázisban csak az elérési-utat. A másik lehetőség a képek tárolása ténylegesen az adatbázisban. Ez utóbbi nem ajánlott, mivel az adatbázis tárhelyek mindig kisebbek és hamar betelhet az adatbázis.

### Képek a szerveren

A Laravel lehetővé teszi fájlok feltöltését a **storage** könyvtárba vagy tárolhatjuk adatbázisban. Ez utóbbi nem ajánlott mert gyorsan fogyasztja az adatbázis-tárhelyet.

### Képek adatbázisban

A képek tárolásához szükség egy bináris mezőre:

```php
public function up(): void
{
    Schema::create('employees', function (Blueprint $table) {
        $table->increments('id');
        $table->string('name');
        $table->string('city');
        $table->double('salary');
        $table->binary('image');
        $table->timestamps();
    });
}
```

### A kontrollerben a tárolás

#### Tárolás

```php
public function store(Request $request)
{
    $path = NULL;
    $imageData = NULL;
    if($request->hasFile('image')) {
        $path = $request->file('image');
        $imageData = file_get_contents($path);
        $imageBase64 = base64_encode($imageData);
    }
 
    $employee = new Employee;
    $employee->name = $request->name;
    $employee->city = $request->city;
    $employee->salary = $request->salary;
    $employee->image = $imageBase64;
    $employee->save();
 
    return response()->json([
        'name' => $employee->name, 
        'success' => 'ok'
    ]);
}
```

#### Validálás

```php
$request->validate([
    'name' => 'required|string|max:255',
    'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
]);
```

#### MIME adatok tárolása képekről

Ha MIME adatokat is tárolunk a képekről, akkor semmilyen konvertálásra nincs szükség.

```php
$employee = new Employee;
$employee->name = $request->name;
$employee->city = $request->city;
$employee->salary = $request->salary;
$employee->image = 'data:image/png;base64,' . $imageBase64;
$employee->save();
```

A böngészők a következőt kapják:

```html
<img src="data:image/png;base64,iVGAwidrG... (innen a képadatok)">
```

## Tesztelés

A Larvelben a teszteket generálni kell. Egy ValamiTest generálása:

```cmd
php artisan make:test ValamiTest
```

A tesztosztály neve kötelezően Test végződésű kell legyen!

A test/Feautre/Valami.php állomány jön létre a következő tartalommal:

```php
<?php
 
namespace Tests\Feature;
 
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
 
class Valami extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function test_example()
    {
        $response = $this->get('/');
 
        $response->assertStatus(200);
    }
}
```

Írjunk egy tesztet, ami lekérdezi a /api/employees végpontot GET metódussal:

```php
<?php
 
namespace Tests\Feature;
 
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
 
class Valami extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function test_example()
    {
        $response = $this->get('/api/employees');
 
        $response->assertStatus(200);
    }
}
```

A tesztfüggvénynek a **test** szóval kell kezdődnie, de utána bármi lehet, ami a függvényeknél megengedett.

### A tesztek futtatása

```php
php artisan test
```

A tesztek futtatására másik lehetőség:

```cmd
./vendor/bin/phpunit
```

### A read és create művelet tesztlése

Készítsünk egy EmployeeTest nevű tesztet:

```php
<?php
 
namespace Tests\Feature;
 
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
 
class EmployeeTest extends TestCase
{
    /**
     * A basic feature test example.
     *
     * @return void
     */
    public function test_getemps()
    {
        $response = $this->get('/api/employees');
        $response->assertStatus(200);
    }
    public function test_addemp() {
        $response = $this->post('/api/employees', [
            'name' => 'Arany Ede',
            'city' => 'Miskolc',
            'salary' => 655
        ]);
        $response->assertStatus(201);
    }
}
```

### Adatbázis memóriában

A tesztek futtatásház beállíthatunk olyan adatbázist amit a memóriában tárolja az adatokat. A tesztek így gyorsak lesznek, és ideiglenesek.

A **config/database.php** fájlban vegyük fel a következőt sorokat:

```php
        'sqlite_memory' => [
            'driver'    =>  'sqlite',
            'database'  =>  ':memory:',
            'prefix'    =>  ''
        ],
```

A teszteléshez állítsuk be a **phpunit.xml fájlban:

```xml
<server name="DB_CONNECTION" value="sqlite_memory"/>
```

A cache törlése:

```cmd
php artisan config:cache
```

## Admin felhasználó

Hozzunk létre egy migrációs fájlt. Például:

```cmd
php artisan make:migration add_admin_to_users_table --table=users
```

A migárciós fájlban hozzáadunk egy új mezőt, is_admin néven:

```php
Schema::table('users', function (Blueprint $table) {
    $table->boolean('is_admin')->default(false);
});
```

Végezzük le a migrációt:

```cmd
php artisan migrate
```

Az új admin felhasználót ezek után, a következőhöz hasonlóan hozzuk létre:

```php
use App\Models\User;
use Illuminate\Support\Facades\Hash;

$user = new User;
$user->name = 'admin';
$user->email = 'admin@zold.lan';
$user->password = Hash::make('titok');
$user->is_admin = true;
$user->save();

```

## Deployment

### A .env fájl

A telepítéshez állítsuk be az APP_ENV és a APP_DEBUG fájlt.

A teljes példa .env fájl:

```bash
APP_NAME=app01
APP_ENV=production
APP_DEBUG=false
APP_KEY=base64:SyvMmCx6w8w8rcnsm6sWvq6X2HGm9HQVo7412tPNOic=
APP_URL=http://zold.lan
 
...
 
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=app01
DB_USERNAME=app01
DB_PASSWORD=titok
```

### Optimalizálás

A feltöltés előtt optimalizálni kell a projektet:

```cmd
composer install --optimize-autoloader --no-dev
php artisan config:cache
php artisan route:cache
```

### A szolgáltatónál

A példa kedvéért legyen a szolgáltatónál egy **html** nevű könyvtár amibe fel kell tölteni a weboldalon megjelenő fájlokat:

```txt
html/
```

Az app01 tartalmát a html könyvtár mellé kell másolni:

```txt
app01/
html/
```

### A public könyvtár

Az app01/public tartalmát másoljuk a szolgáltató html/ könyvtárába.

Szerkesszük a index.php fájltés írjuk a vendor elé a html/ könyvtár mellet a projekt könyvtár tartalmát:

```php
require __DIR__.'/../projekt01/vendor/autoload.php';

//...
$app = require_once __DIR__.'/../projekt01/bootstrap/app.php';
```

Ügeljünk arra, hogy a Laravel projektenk írnia kell tudni a app01/storage könyvtárat.

Töltsük fel az adatbázist a szolgáltatóhoz.

### Kezdő felhasználó

A /api/register útvonalat érdemes védelmezni. Ekkor szükség van egy kezdő felhasználóra. Ezt létrehozhatunk **tinker** eszközzel, vagy seedert készítünk hozzá.

```php
User::create(["name"=> "admin","email"=>"admin@zold.lan","password"=>bcrypt("titok")]);
=> App\Models\User {#4290
   name: "admin",
   email: "admin@zold.lan",
   updated_at: "2023-06-07 21:21:10",
   created_at: "2023-06-07 21:21:10",
   id: 1,
  }
```
