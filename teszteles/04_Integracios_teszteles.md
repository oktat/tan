# Integrációs tesztelés

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Az Integrációs tesztelés](#az-integrációs-tesztelés)
* [Könyvtári kölcsönzés](#könyvtári-kölcsönzés)
* [További tesztesetek](#további-tesztesetek)
* [Teszt keretrendszerek](#teszt-keretrendszerek)
* [Integrációs teszt gyakorlat](#integrációs-teszt-gyakorlat)

## Az Integrációs tesztelés

A komponensek, modulok együtműködését teszteljük.

Lehet:

* automatizált
* kézi

## Könyvtári kölcsönzés

Legyen egy több részből álló alkalmazás, ahol áttekinthetjük az integrációs tesztelést.

Egy egyszerű könyvtári rendszert fogunk készíteni. Három modulunk lesz: Könyv, Felhasználó, Kölcsönzés.

```python
class Book:
    def __init__(self, title, author):
        self.title = title
        self.author = author


class User:
    def __init__(self, name):
        self.name = name
        self.borrowed_books = []

    def borrow_book(self, book):
        self.borrowed_books.append(book)


class Borrowing:
    @staticmethod
    def lend_book(user, book):
        user.borrow_book(book)

```

```python
# Integrációs teszt
def test_borrowing():
    user = User("Alice")
    book = Book("1984", "George Orwell")
    
    # Mekkora a borrowed_books list mérete?
    print(len(user.borrowed_books))
    Borrowing.lend_book(user, book)
    
    # Most mérete 1 kell legyen
    print(len(user.borrowed_books))

test_borrowing()
```

Az assert a Python nyelv része, amivel vizsgálatokat végezhetünk. Ha vizsgálat False értéket ad, a program futása megszakad.

Tesztelés assert-tel:

```python
# Integrációs teszt
def test_borrowing():
    user = User("Alice")
    book = Book("1984", "George Orwell")
    
    Borrowing.lend_book(user, book)

    # Használjuk az assert kulcsszót
    # A book benne van a listában?
    assert book in user.borrowed_books

    # Az assert nem ad eredményt, ha benne volt
    # Ha nem volt megszakítja a program futását

    print('A teszt sikerres')

test_borrowing()
```

A try_except használata:

```python
# Integrációs teszt
def test_borrowing():
    user = User("Alice")
    book = Book("1984", "George Orwell")
    book2 = Book("Más", "Másvalaki")

    Borrowing.lend_book(user, book)    
    
    try:
      assert book2 in user.borrowed_books, "Book not borrowed"
      print("Borrowing test passed.")
    except AssertionError as e:
      print("Borrowing test failed.")
      print(e)
```

A könyv és a felhasználó moduloknál érdemes implementálni a CRUD műveleteket.

Megnézhetjük, hogy a kölcsönzés modul el tudja érni a kölcsönzés adatait?

A kölcsönzött könyv lista frissül a felhsználómodulban?

Tesztelhetjük a határokat, például érévnyetlen adatokkal. Ez lehet egy nem létező könyv kölcsönzése.

## További tesztesetek

```python
# Ha már ki van kölcsönözve egy könyv
# elutasítja a kód a kölcsönzést?

class Book:
    def __init__(self, title, author):
        self.title = title
        self.author = author
        self.is_available = True  # vegyük fel az új tulajdonságot

#...

def test_borrowing_unavailable_book():
    user = User("Alice")
    book = Book("The Great Gatsby", "F. Scott Fitzgerald")
    book.is_available = False  # Könyv már el van kölcsönözve

    result = Borrowing.lend_book(user, book)

    assert result == "Book is not available"


test_borrowing_unavailable_book()

```

Visszaadás működik. A felhasználó könyveiből eltávolításra kerül a visszaadott könyv?

```python
def test_returning_book():
    user = User("Alice")
    book = Book("1984", "George Orwell")
    user.borrow_book(book)

    # Visszaadás művelet
    user.return_book(book)  
    
    # Implementáljunk egy return_book metódust

    assert book not in user.borrowed_books
```

Több könyvet lehet kölcsönözni?

```python
def test_multiple_borrowing():
    user = User("Alice")
    book1 = Book("1984", "George Orwell")
    book2 = Book("Brave New World", "Aldous Huxley")

    Borrowing.lend_book(user, book1)
    Borrowing.lend_book(user, book2)

    assert len(user.borrowed_books) == 2
    assert book1 in user.borrowed_books
    assert book2 in user.borrowed_books
```

Érvénytelen könyv vázsgálata:

```python
def test_borrowing_invalid_book():
    user = User("Alice")
    invalid_book = None  # Érvénytelen könyv

    result = Borrowing.lend_book(user, invalid_book)

    assert result == "Invalid book"
```

## Teszt keretrendszerek

Használhatunk teszt keretrendszereket is.

A Python két tesztkeretrendszere:

* [pytest](https://szit.hu/doku.php?id=oktatas:programozas:python:pytest)
* unittest

## Integrációs teszt gyakorlat

### Feladat 1

Töltse le a következő projektet, majd végezze el az integrációs tesztet.

* [https://github.com/oktat/teliblend.git](https://github.com/oktat/teliblend.git)
* [https://szit.hu/download/oktatas/teszt_sablon.xlsx](https://szit.hu/download/oktatas/teszt_sablon.xlsx)

### Feladat 2

Töltse le a következő projektet, majd végezze el az integrációs tesztet.

* [https://github.com/oktat/teliblendfx.git](https://github.com/oktat/teliblendfx.git)
