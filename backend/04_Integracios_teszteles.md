# Backend programozás - Integrációs tesztelés

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Mocking

### Mockery

* [https://docs.mockery.io/](https://docs.mockery.io/)

Használat a projektben:

```cmd
composer require --dev mockery/mockery
```

A következőt kapjuk:

```txt
app01/
  |-vendor/
  |  |-composer/
  |  |-hamcrest/
  |  |-mockery/
  |  `-autoload.php
  |-composer.json
  `-composer.lock
```

### Lásd még

* [https://laravel.com/docs/9.x/mocking](https://laravel.com/docs/9.x/mocking)

## HTTP kérés indítása tesztből

A Laravel tesztek futtatásához az általános gyakorlat az, hogy a **TestCase** osztályból származtatjuk az összes tesztesetünket. Az **Illuminate\Foundation\Testing\Concerns\MakesHttpRequests** trait használatával lehetőségünk van különféle HTTP kéréseket indítani, például GET, POST, PUT, DELETE stb.

A következő példában egy GET kérés indítása látható egy tesztesetben:

```php
use Illuminate\Foundation\Testing\Concerns\MakesHttpRequests;

class ExampleTest extends TestCase
{
    use MakesHttpRequests;

    public function test_example()
    {
        $response = $this->get('/example-route');
        $response->assertStatus(200);
    }
}
```

Ahhoz, hogy másféle kéréseket indítsunk, csak a **get()** helyére kell írnunk az adott metódus nevét (pl. **post()**, **put()**, **delete()** stb.) és további paramétereket is meg lehet adni, ha szükségesek. Az **assertStatus()** metódus használatával ellenőrizhetjük, hogy a válasz **200 OK** státusz kódot ad-e vissza, de számos más beépített **assert** metódus is használható a további validációhoz.

* [https://laravel.com/docs/9.x/http-tests](https://laravel.com/docs/9.x/http-tests)

## HTTP válasz validálása

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
