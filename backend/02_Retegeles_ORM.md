# Backend programozás - Rétegelt architektúra és ORM

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Függőség befecskendezés

```php
<?php

namespace App\Http\Controllers;

use App\Services\UserService;

class UserController extends Controller
{
    protected $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;
    }

    public function index()
    {
        $users = $this->userService->getAllUsers();
        return view('users', compact('users'));
    }
}
```

## Service réteg

A service réteget használhatjuk az adattárolás, üzleti logika leválasztására a vezérlőktől és a végpontoktól.

A Laravel alkalmazásban például létrehozhatunk egy Service nevű könyvtárat, ahol elhelyezhetjük a szolgáltatásainkat.

Például lehet egy UserService osztály.

```php
<?php

namespace App\Services;

use App\Repositories\UserRepository;

class UserService
{
    protected $userRepository;

    public function __construct(UserRepository $userRepository)
    {
        $this->userRepository = $userRepository;
    }

    public function getUserById($id)
    {
        return $this->userRepository->find($id);
    }

    public function createUser($data)
    {
        // validálás, feldolgozás, stb.
        return $this->userRepository->create($data);
    }

    public function updateUser($id, $data)
    {
        // validálás, feldolgozás, stb.
        return $this->userRepository->update($id, $data);
    }

    public function deleteUser($id)
    {
        return $this->userRepository->delete($id);
    }
}
```

A példában a UserRepository osztály végzi az adatelérést. A UserService osztály közvetít a vezérlő (kontroller) és a UserRepository között.

## ORM

Az ORM az "Object-Relational Mapping" rövidítése, ami egy programozási paradigma, amely lehetővé teszi objektumok és az adatbázis relációs tábláinak kapcsolatát. ORM használata esetén az alkalmazás fejlesztője csak objektumokkal dolgozik, ami automatikusan leképeződik táblázatokra.

Az ORM előnye az adatbázis-rendszertől való függetlenség, könnyen, hatékonyan kezelhető adatok. Az ORM használható, Java, C#, Ruby, PHP, JavaScript, Python stb. nyelvekhez.

### Eloquent

A Laravel ORM rendszere az Eloquent. Az Eloquent kifejezetten PHP-ban írt alkalmazások számára készült. A Laravel adatbázis-kapcsolati rétegeként működik. SQL utasítások nélkül elérhetővé teszi az adatbázist.

#### Kapcsolatbeállítások

A Laravel a lehetséges kapcsolatbeállításai a **config/database.php** vannak tárolva. A konkrét beállítást a gyökér könyvtárban a **.env** nevű fájlban tehetjük meg.

```ini
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=
```

### Sequelize

Az Express esetén tetszőleges ORM válaszható, amiből itt a Sequelize-t fogjuk használni. Mivel a Sequelize nincs beépítve az Express-be, ezért tetszőleges felépítésű beállítófájlt használhatunk. A lekérdezéseket nem szükséges SQL nyelven, az ORM rendelkezik beépített lehetőségekkel. Az ORM rendszereke azonban megengedik egyedi lekérdezések írását.

## Entity

Az Entity egy osztály, ami adatbázistáblára képződik le egy ORM rendszerben.

## Relációk

A reláció alatt az adatbázisban tárolt táblákat és a köztük lévő kapcsolatokat értjük.

Háromféle kapcsolat lehetséges a táblák között:

* 1:1
* 1:N
* N:N

## Egyedi lekérdezések

Egyedi lekérdezések esetén, nem használjuk az ORM beépített metódusait. Lehetőségünk van egyedi lekérdezésekre. Használhatunk speciális szűrési feltételeket, adatokat vonhatunk össze, vagy más specifikus lekérdezéseket készíthetünk.
