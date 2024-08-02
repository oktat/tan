# Procedurális és Objektum Orientált fejlesztés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Procedurális fejlesztés

A program egyes részeit **eljárásokba,
függvényekbe** szervezzük. Nézzünk erre példát Python nyelven.

```python
def calcPerimeter(aSide, bSide, cSide):
    return aSide + bSide + cSide;

def calcArea(base, height):
    return base * height / 2

perimeter = calcPerimeter(30, 35, 40)
area = calcArea(30, 35)
print('Kerület:', perimeter)
print('Terület:', area)
```

## Objektum Orientál fejlesztés

A programokat **osztályokba** szervezzük. A következő példa Python nyelven mutatja ezt be:

```python
class Triangle:
    def calcPerimeter(aSide, bSide, cSide):
        return aSide + bSide + cSide;

    def calcArea(base, height):
        return base * height / 2

triangle = Triangle()
perimeter = triangle.calcPerimeter(30, 35, 40)
area = triangle.calcArea(30, 35)
print('Kerület:', perimater)
print('Terület:', area)
```

## Az osztály és az objektum

Az osztályt általános leírásra használjuk. Úgy is felfogható, hogy valaminek a tervrajza.

Az objektum egy konkrét dolog. Úgy is mondhatjuk, hogy a tervrajz alapján valami, amit megvalósítottunk.

### Példányosítás

Ha az osztályból létrehozunk egy objektumot, ezt nevezzük példányosításnak.

A példány létrehozása a konstruktor hívását jelenti. Ha az osztályban nem készítettünk konstruktort, az ilyen esetben is létezik, mivel automatikusan létrejön.

Példányosításra példa Python nyelven:

```python
triangle = Triangle()
```

Megjegyzés: A triangle = Triangle bizonyos esetekben működik, de az nem példányosítást!

### Property

Egy osztály adattagja, tulajdonsága, jellemzője. Az osztályon belül egy globális változóként látjuk jelen.

Általában két metódus van hozzá:

* getter
* setter

Az ilyen metódusok neveit "get" és "set" előtaggal adjuk meg.

```python
class Employee:
    def __init__(self):
        self.name = "Névtelen"
    def setName(self, name):
        self.name = name
    def getName(self):
        return self.name


feri = Employee()
feri.setName("Deres Ferenc")
print(feri.getName())
```

## Objektum Orienált Java

A Java nyelvben osztály nélkül csak JShell-t használva dolgozhatunk. Minden más esetben a egy osztály létrehozásával kell kezdenünk:

```java
class Program01 {
    public static void main(String[] args) {

    }
}
```

Az osztályt mindig a class kulcsszóval vezetjük be. Az induló osztály neve tetszőleges, de meg kell egyezen a fájl nevével, kis- és nagybetűre is egyeznie kell.

Az osztály és a metódusok törzsét kapcsoszárójellel adjuk meg. Nem kötelező, hogy kövessék az osztály vagy a metódust nevét. A fenti kód így is  helyes:

```java
class Program01 
{
    public static void main(String[] args) 
    {

    }
}
```

De az összes utasít írható egyetlen sorban is. Ez viszont nem ajánlott, mivel átláthatatlanná teszi a kódot.

A főosztályban Kötelező egy main() metódus, ez lesz a program belépési pontja. A public és a static előtagok kötlezőek, a void visszatérési típussal együtt. A bementő paraméter szintén kötlező: String[] args.

Vegyünk egy Employee osztályt, amiben dolgozó adatatit szeretnénk tárolni. Az adattagok típusát előre meg kell adni:

```java
class Employee {
    String name;
    public Employee() {
        this.name = "Névtelen";
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getName() {
        return this.name;
    }
}
feri = new Employee();
feri.setName("Deres Ferenc");
System.out.println(feri.getName());
```

* A this az adattagra utal.
* A konstruktor neve megegyezik az osztály nevével.
* A példányosításhoz szükség van a "new" kulcsszóra.
* A metódusoknál jelezni kell a visszatérés típusát.
* A void azt jelenti nincs visszatérési érték.
* Minden utasítást pontosvesszővel zárunk.
* A kiíratás a println() metódussal történik.
* A println() előtt a System.out a képernyőt jelenti.
