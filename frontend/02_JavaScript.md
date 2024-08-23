# Frontend - JavaScript

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Típusok és kifejezések

## Aritmetika

## Változók

## Láthatóság

## Vezérlési szerkezetek

## Függvények

## A Math

## Console

## Osztályok és objektumok

## Konstruktor

## Az Object.create()

```javascript
const Person = {
  constructor: function(name) {
    this.name = name
  },
  sayHello: function() {
    console.log(`Szia, ${this.name} vagyok!`)
  }
}

const student = Object.create(Person)
student.constructor('Józsi')
student.sayHello()
```

## Prototype

## Window, location, document

## DOM

## Elemek létrehozása

## Elemek kiválasztása

## Elemek attribútumainak változtatása

## Aszinkron futtatás

## Promise-ok
