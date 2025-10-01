# REST API elérés

* **Szerző:** Sallai András
* Copyright (c) 2025, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

## Bevezetés

### A REST API

A **REST** A **Representational State Trasfer** rövidítése.

Az **API** az **Application Programming Interface** rövidíétse.

A REST API együtt, a webszolgáltatások megvalósításához fejlesztett architektúra. A REST API használata során URL-ek és HTTP protokollokkal (GET, POST, PUT, PATCH, DELETE) dolgozunk.

Errőforrások:

A REST API-t erőforrásokba szervezzük, amelyek egyedi URL-en keresztül érhetők el. A felhasználók például a **/users** címen érhetők el. Egyetlen felhasználó **/users/{id}** címen érhető el.

A HTTP metódusok:

A REST API létrehozása során a HTTP szabványos metódusait használjuk:

* GET: erőforrás olvasása
* POST: új elem létrehozása az erőforráson
* PUT: egy elem frissítése az erőforráson
* PATCH: létező elem egy részének frissítése
* DELETE: elem törlése

Állapotmentesség:

A REST API állapotmentes, ezért minden kérés tartalmazza minden egyes kéréshez szükséges összes infomrációt.

Adatformátumok:

A REST API különböző formátumú adatokkal dolgozik. Ilyenek

* JSON
* XML
* HTML

Leggyakrabban JSON formátumot használjuk, mivel könnyen olvasható, és kevésbé terheli a hálózatot.

A szerver a HTTP üzenetekben mindig elhelyez egy válaszkódot is, amit státuszkódnak szokás nevezni. Az alábbiakban néhány státuszkódot láthatunk a teljesség igénye nélkül.

HTTP státuszkódok:

* 200 OK: Kérés sikeres
* 201 Created: Új elem létrehozva
* 204 No content: A kérés sikeres, de nincs mit visszaadni
* 400 Bad request: A kérés hibás
* 404 Not found: Az erőforrás nem található
* 500 Internal server error: Szerver oldali hiba

Kliens-szerver felépítés:

A REST API általában kliens-szerver felépítésű. A kliens lehet:

* web
* mobil
* asztali alkalmazás

## A Resclient

A Resclient egy egyszerűen használható REST API kliens könyvtár.

* egyszerű beépítés
* egyszerű használat
* beépített Gson támogatás

## A Resclient beállítása

Használjunk Maven projektet.

Keressük meg a Maven Central Repository-ban a Resclient csomagot:

* [https://central.sonatype.com/](https://central.sonatype.com/)

Ehhez hasonlót találunk:

```xml
<dependency>
    <groupId>hu.szit</groupId>
    <artifactId>resclient</artifactId>
    <version>1.3.3</version>
</dependency>
```

Illesszük be a **pom.xml** fájlba.

## Egyszerű GET kérés

Tegyük fel, hogy van localhost:8000/api/employees címen egy REST API, ami dolgozók adatati szolgáltatja. Lekérdezés:

```java
String url = "http://localhost:8000/api/employees";
ResClient client = new ResClient();
String result = client.get(url);
System.out.println(result);
```

A teljes kód:

_ResclientExample.java_:

```java
package com.example;

import hu.szit.resclient.ResClient;

public class ResclientExample {
    public static void readEmployees() {
        String url = "http://localhost:8000/api/employees";
        ResClient client = new ResClient();
        String result = client.get(url);
        System.out.println(result);        
    }
}
```

## Új elem felvétele

```java
public static void createEmployee() {
    String url = "http://localhost:8000/api/employees";
    ResClient client = new ResClient();
    String body = "{\"name\":\"Erős István\"}";
    String result = client.post(url, body);
    System.out.println(result);        
}
```

## Elem frissítése

```java
public static void updateEmployee() {
    String url = "http://localhost:8000/api/employees/1";
    ResClient client = new ResClient();
    String body = "{\"name\":\"Szilveszter István\"}";
    String result = client.put(url, body);
    System.out.println(result);        
}
```

## Elem törlése

```java
public static void deleteEmployee() {
    String url = "http://localhost:8000/api/employees/2";
    ResClient client = new ResClient();
    String result = client.delete(url);
    System.out.println(result);
}
```
