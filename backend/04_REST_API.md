# Backend programozás - REST API

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [REST](#rest)
* [JSON](#json)
* [URL-konvenciók](#url-konvenciók)
* [Resource](#resource)
* [Stateless](#stateless)
* [CRUD](#crud)
* [REST kontrollerek](#rest-kontrollerek)
* [JSON mapping](#json-mapping)
* [DTO](#dto)

## REST

A **REST** a **Representational State Transfer** rövidítése, ami elosztott alkalmazásrendszert jelent, webes alapú alkalmazások számára. A REST API-k jellemzően HTTP protokollt használnak, többféle művelettel. A műveleteket a metódusok határozzák meg: GET, POST, PUT, DELETE stb. Ezek lehetővé teszik szövegek, képek lekérését, frissítését, törlését, létrehozását.

A REST architektúra jellemzői:

* Egyszerű és laza kapcsolat
* Erőforrások kiszolgálása
* Az erőforrások változó formában adhatók meg: XML, JSON stb.
* Egységes és általános interfész

Az erőforrások egyedi URI-n keresztül érhetők el. Mivel az erőforrások elérése egységes és általános, ezért többféle platformról és különböző kliensekről is elérhetők.

## JSON

A **JSON** a **JavaScript Object Notation** rövidítése, amely könnyű súlyú szövegalapú adatcserélő formátum. Általában webes szolgáltatásokban használjuk. A JSON formátum könnyen olvasható emberek és gépek számára is, és sok programozási nyelv támogatja.

## URL-konvenciók

A CRUD műveleteket a metódusok határozzák meg:

* GET
* POST
* PUT
* DELETE

ID-t használunk egy tartományon belül egyed azonosításához.

## Resource

Az erőforrások végpontokon keresztül érhetők el, amit egy URL reprezentál.

## Stateless

A HTTP kérések állapotmentesek, vagyis mindenegyes kérsének az összes szükséges információt tartalmaznia kell. A szerver nem követi nyomon a kéréseket, nem tárol semmit a kliens munkamenetéről. A kérések így egymástól függetlenek.

## CRUD

A CRUD műveletek:

* create - elem létrehozása
* read - elem/elemek olvasása
* update - elem frissítése
* delete - elem törlése

## REST kontrollerek

A kontrollerekben állítjuk be a HTTP kérések válaszait. Itt kezeljük az adatokat, konvertáljuk JSON formátumba, formátumból.

## JSON mapping

Az objektumokat JSON formátumba és JSON formátumból objektummá alakítjuk. Ezt a legtöbb programozási nyelv támogatja, vagy alapból, vagy valamilyen programozói könyvtárral.

## DTO

A **DTO** a **Data Transfer Object** rövidítése. Ez egy olyan objektum amely nem tartalmaz üzleti logikát, csak az adatok szállítására találták ki.
