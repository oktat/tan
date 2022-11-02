# Frontend - Angular keretrendszer

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Az Angular telepítése

### Telepítés

```cmd
npm install -g @angular/cli
```

### Ellenőrzés

```cmd
ng version
```

vagy:

```cmd
ng v
```

### Adott verzió beszerzése

A legújabb verzió helyett használjuk mindig az LTS verziót. Az LTS verzió hosszú támogatási idővel rendlkezik. Keressük meg a legújabb LTS a következő helyen:

* [https://angular.io/guide/releases](https://angular.io/guide/releases)

2022-10-17-én a legújabb LTS verzió a 13.0.0, ami 2023-05-04 jár le.

Telepítése:

```cmd
npm install -g @angular/cli@13.0.0
```

### Windowson

Windowson útvonalba kell tenni a következő könyvtárat:

```path
c:\Users\user\AppData\Romaing\npm
```

A user felhasználónév helyére helyettesítse be a saját felhasználónvét.

## Új projekt

```cmd
ng new app01
```

A program két kérdést tesz fel, ami magyarra valahogy így fordítható:

* Szeretnénk-e routingot is telepíteni?
* Milyen nyelven írunk stíluslapot?

Az első kérdés konkrét példa:

```cmd
ng new app02
? Would you like to add Angular routing? (y/N)
```

A kérdésből láthatjuk, hogy válaszolhatunk "y" vagy "n" billentyűvel. Mivel az "N" betű nagybetűvel van írva, ez lesz az alapértelmezés, ha csak egy "Enter" billentyű leötését választjuk, ami első projektnél teljsen megfelelő választás.

Most a következő kérdést látjuk:

```cmd
ng new app02
? Would you like to add Angular routing? No
? Which stylesheet format would you like to use? (Use arrow keys)
❯ CSS 
  SCSS   [ https://sass-lang.com/documentation/syntax#scss                ] 
  Sass   [ https://sass-lang.com/documentation/syntax#the-indented-syntax ] 
  Less   [ http://lesscss.org 
```

Az első projektnél itt is megfelelő a CSS választása, amihez itt is csak egy "Enter" billentyű szükséges.

Ezt követően elindul a projekt létrehozása, ahol hasonló sorokat látunk:

```cmd
ng new app02
? Would you like to add Angular routing? No
? Which stylesheet format would you like to use? CSS
CREATE app02/README.md (1059 bytes)
CREATE app02/.editorconfig (274 bytes)
CREATE app02/.gitignore (548 bytes)
CREATE app02/angular.json (3033 bytes)
CREATE app02/package.json (1068 bytes)
CREATE app02/tsconfig.json (863 bytes)
CREATE app02/.browserslistrc (600 bytes)
CREATE app02/karma.conf.js (1422 bytes)
CREATE app02/tsconfig.app.json (287 bytes)
CREATE app02/tsconfig.spec.json (333 bytes)
CREATE app02/.vscode/extensions.json (130 bytes)
CREATE app02/.vscode/launch.json (474 bytes)
CREATE app02/.vscode/tasks.json (938 bytes)
CREATE app02/src/favicon.ico (948 bytes)
CREATE app02/src/index.html (291 bytes)
CREATE app02/src/main.ts (372 bytes)
CREATE app02/src/polyfills.ts (2338 bytes)
CREATE app02/src/styles.css (80 bytes)
CREATE app02/src/test.ts (745 bytes)
CREATE app02/src/assets/.gitkeep (0 bytes)
CREATE app02/src/environments/environment.prod.ts (51 bytes)
CREATE app02/src/environments/environment.ts (658 bytes)
CREATE app02/src/app/app.module.ts (314 bytes)
CREATE app02/src/app/app.component.css (0 bytes)
CREATE app02/src/app/app.component.html (23332 bytes)
CREATE app02/src/app/app.component.spec.ts (953 bytes)
CREATE app02/src/app/app.component.ts (209 bytes)
✔ Packages installed successfully.
hint: Using 'master' as the name for the initial branch. This default branch name
hint: is subject to change. To configure the initial branch name to use in all
hint: of your new repositories, which will suppress this warning, call:
hint: 
hint:   git config --global init.defaultBranch <name>
hint: 
hint: Names commonly chosen instead of 'master' are 'main', 'trunk' and
hint: 'development'. The just-created branch can be renamed via this command:
hint: 
hint:   git branch -m <name>
    Successfully initialized git.

```

### Projekt használata

```cmd
cd app01
```

### Projekt routinggal

Később megatanuljuk használni a routingot. A routing használatát választhatjuk a kapcsolóval is:

```cmd
ng new app01 --routing
```

### Kódszerkesztő

Ha beléptünk a projekt könyvtárába indítsuk el a Visual Studio Code programot:

```cmd
code .
```

### Futtatás

```cmd
ng serve --open
```

Vagy:

```cmd
ng s -o
```

A kimenet ehhez hasonló lehet:

```cmd
ng s -o 
✔ Browser application bundle generation complete.

Initial Chunk Files   | Names         |  Raw Size
vendor.js             | vendor        |   1.70 MB | 
polyfills.js          | polyfills     | 296.95 kB | 
styles.css, styles.js | styles        | 173.21 kB | 
main.js               | main          |  47.66 kB | 
runtime.js            | runtime       |   6.51 kB | 

                      | Initial Total |   2.21 MB

Build at: 2022-11-02T22:27:24.116Z - Hash: 17fc0071f143d1b7 - Time: 18563ms

** Angular Live Development Server is listening on localhost:4200, open your browser on http://localhost:4200/ **


✔ Compiled successfully.
```

A böngészőben megnyíló ablak:

![Angular kezdőablak](images/angular_kezdo_projekt.png)

## Könyvtár-struktúra

```cmd
projetk01/
  |-node_modules/
  `-src/
     |-app/
     |  |-app.components.css
     |  |-app.component.html
     |  |-app.component.spec.ts
     |  |-app.components.ts
     |  `-app.modules.ts
     `index.html
```

A weblap az src/index.html állomnyból indul:

```html
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>App02</title>
  <base href="/">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body>
  <app-root></app-root>
</body>
</html>
```

Ez az alkalmazás váza. Tartózik hozzá egy globális stíluslap, az src/style.css.

A weboldal komponensei az "app" könyvtárban találhatók.
A weblap egy fő komponenssel indul. A fő komponens 4 darab állományból áll, mindegyik az "app" szóval kezdődik. Ez a komponens az alkalmazás gyökér (root) komponense.

Van még egy "app" szóval kezdődő állomány ez az Angular modulok importálására való.

A projekt gyökérkönyvtárában még sok más állomány is található, amelyek segítik a projekt működését.

### A fő komponens állományai

* app.component.css üres állomány
* app.component.html tartalmát törölni fogjuk
* app.component.spec.ts - teszállomány

Az app.component.spec.ts kezdeti tartalma:

```typescript
import { TestBed } from '@angular/core/testing';
import { AppComponent } from './app.component';

describe('AppComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [
        AppComponent
      ],
    }).compileComponents();
  });

  it('should create the app', () => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.componentInstance;
    expect(app).toBeTruthy();
  });

  it(`should have as title 'app02'`, () => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.componentInstance;
    expect(app.title).toEqual('app02');
  });

  it('should render title', () => {
    const fixture = TestBed.createComponent(AppComponent);
    fixture.detectChanges();
    const compiled = fixture.nativeElement as HTMLElement;
    expect(compiled.querySelector('.content span')?.textContent).toContain('app02 app is running!');
  });
});
```

* app.component.ts - a fő komponens TypeScript állománya

Az app.component.ts tartalma:

```typescript
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app02';
}
```

* app.module.ts - az importált Angular modulok

Kezdeti tartalma:

```typescript
import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
```

## Angular elmélet

### Komponens

* component

Az Angular alapú weblap komponensekből áll. A komponensek egy nézetet valósítanak meg.

### Szolgáltatás

Létrehozhatunk szolgáltatásokat, amelyeket a komponensek használhatnak. A szolgáltatásokat a komponensekben függőség befecskendezéssel használhatók.

### Dekorátorok

A modulok, komponensek és a szolgáltatások osztályként vannak létrehozva. Minden osztályhoz tartozik egy dekorátor, ami az oszátly számára metaadatokat tartalmaz.

### Routing

Az Angular a routing segítségével képes választani a beltöltendő nézetek között.

### Modulok

Az Angular modulok az ES2015 JavaScript szabvány kiegészítői.

## Kötések

A komponens két főbb része:

* app.component.ts
* app.component.html

A kettő között az adatok összeköthetők, így adatkötésről beszélhetünk.

Töröljük üresre az app.component.html fájlt. Az app.component.ts fájlban már van egy adat title néven. Alapértelmezetten a projekt nevét találjuk itt:

```typescript
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'app02';
}
```

A fő komponensosztály neve AppComponent. Benne egy "title" nevű adattag. Most kössük a title változót a HTML állományhoz. A app.component.html fájlban:

```html
<h1>{{title}}</h1>
```

A változó nevét beírtuk dupla kapcsoszárójelek közé. Így létrehoztuk a kötést. Nézzük meg a weblapon. Ha közben leállítottuk a szervert a beépített szervert, indítsuk el:

```cmd
ng server --open
```

## Továbbiak

* [https://szit.hu/doku.php?id=oktatas:web:angular](https://szit.hu/doku.php?id=oktatas:web:angular)
