# Backend programozás - Backend keretrendszerek

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Szerkesztve: 2025
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [A Backend](#a-backend)
* [Backend keretrendszerek](#backend-keretrendszerek)
* [Választás](#választás)
* [MVC](#mvc)
* [Server Side Rendering - Blade](#server-side-rendering---blade)
* [Alkalmazás hosztolása](#alkalmazás-hosztolása)
* [Heroku](#heroku)

## A Backend

A Backend egy szoftver azon része ami nem látható és a szerveren fut. A szerveroldali logika, az adatok tárolása, feldolgozása a feladata.

A Backend a Frontend-del együtt biztosítja az alkalmazás működését.

A Backend segítségével egy API-t (alkalmazásprogramozási felület) biztosítunk, amin keresztül kommunikálhatunk az adatbázissal.

## Backend keretrendszerek

* Python - Django, Flask, FastAPI
* JavaScript (Node.js) - Express, Koa, NestJS
* PHP - Laravel, Symfony
* Ruby - Ruby on Rails, Sinatra
* Java - Spring Boot
* Go (Golang) - Gin, Echo

## Választás

Mi alapján válasszunk a backend keretrendszert?

* A projekt típusa - egyszerű, összetett
* Saját tudás
* Közösség - legyen aktív közösség
* Dokumentáció - legyen dokumentáció

## MVC

Az **MVC** a **Model View Controller** rövidítése. Az MVC egy szoftvertervezési minta, amely elválasztja az üzleti logikát a felhasználói felülettől. Az alkalmazást három részre bontjuk:

* modell
* nézet
* vezérlés

A Backend alkalmazásokat MVC szerint szokás kódolni. A nézetek Backend esetén egy-egy végpontot jelölnek.

### A modell

Az alkalmazás adataiért, azok kezeléséért felel. Válaszolhat információkérésekre, állapotváltásokra. A modell kezeli az állományokat, az adatbázist.

### A nézet

A felhasználói felületért felel. A modellből érkező adatokat rendereli a felhasználói felületen. Backend esetén ezek a végpontok.

### A vezérlő

A vezérlő vagy másnéven kontroller fogadja a felhasználói bemenetet és utasítja az objektumok és nézetek megfelelő műveletek végrehajtására.

Backend esetén a kontrollerek kezelik a HTTP kéréseket, amelyek az útválasztótól jönnek. Elkérik az adatokat az adatbázistól, általában egy ORM segítségével.

A kontrollerben szokás beállítani az érvényesség ellenőrzését.

## Server Side Rendering - Blade

A **Server Side Rendering**, vagy röviden **SSR** során a weboldalakat a szerveroldalon generáljuk. Ezeket nevezzük monolitikus programnak.

A Laravel keretrendszer az SSR-t a Blade sablonmotorral valósítja meg. A Blade egy PHP alapú sablonmotor, ami lehetővé teszi a dinamikus és moduláris HTML oldalak generálását.

## Alkalmazás hosztolása

Hosztolásra alkalmas eszközök:

* Heroku
* Back4app
* Elastic Beanstalk (AWS)
* Google App Engine
* Dokku on Digital Ocean etc.
* Firebase
* OpenShift
* Engine Yard
* Netlify
* Docker
* Kubernetes

## Heroku

### Parancssor telepítése

```cmd
npm install -g heroku
```

Telepítés után ellenőrizzük. A lehetséges kimenettel a parancs:

```cmd
heroku --version
 ›   Warning: Our terms of service have changed: 
 ›   https://dashboard.heroku.com/terms-of-service
heroku/7.64.0 linux-x64 node-v16.17.1
```
