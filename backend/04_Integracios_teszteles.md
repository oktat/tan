# Backend programozás - Integrációs tesztelés

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Laravel tesztelése

### Tesztkészítés

```bash
php artisan make:test EmpTest
```

```php
<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class EmpTest extends TestCase
{
    /**
     * The employees endpont test
     */
    public function test_getEmps(): void
    {
        $response = $this->get('/api/employees');
        $response->assertStatus(200);
    }
    public function test_postEmps(): void
    {
        $response = $this->post('/api/employees');
        $response->assertStatus(200);
    }
}
```

Ahhoz, hogy másféle kéréseket indítsunk, csak a **get()** helyére kell írnunk az adott metódus nevét (pl. **post()**, **put()**, **delete()** stb.) és további paramétereket is meg lehet adni, ha szükségesek. Az **assertStatus()** metódus használatával ellenőrizhetjük, hogy a válasz **200 OK** státusz kódot ad-e vissza, de számos más beépített **assert** metódus is használható a további validációhoz.

* [https://laravel.com/docs/9.x/http-tests](https://laravel.com/docs/9.x/http-tests)

### HTTP válasz validálása

A Laravel a PHPUnit assert metódusaira támaszkodik.

```php
public function testExample()
{
    $response = $this->get('/example-route');

    $response->assertStatus(200);
    $this->assertTrue($response->arrayHasKey('data'));
}
```

Az assertStatus metódussal ellenőrizhetjük, hogy a válasz 200 OK státusz kódot ad-e vissza. Az arrayHasKey metódus pedig ellenőrzi, hogy a válasz tartalmazza-e a data kulcsot.

## Integrációs teszt példa

```php
public function test_example()
{
    $response = $this->get('/example-route');

    $response->assertOk();
    $response->assertSee('Expected data');
}
```

* vizságljuk a kérés működik-e
* megfelelő kérés esetén válasz rendben van-e
* az visszaadott adatok megfelelők

### Lásd még

* [https://laravel.com/docs/9.x/mocking](https://laravel.com/docs/9.x/mocking)

## Express tesztelése

### Get kérés

tests/app.test.js:

```javascript
import supertest from 'supertest'
    
const host = 'http://localhost:8000/api' 

supertest(host)
.get('/employees')
.expect(200)
.end((err, res) => {
    if (err) {
        console.log(err)
    } else {
        console.log('Ok')
    }
})
```

### Post kérés

tests/app.test.js:

```javascript
import supertest from 'supertest'
    
const host = 'http://localhost:8000/api' 

supertest(host)
.post('/employees')
.send('name=Valaki')
.expect(200)
.end((err, res) => {
    if (err) {
        console.log(err)
    } else {
        console.log(res.body)
    }
})
```
