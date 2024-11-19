# Tesztelés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Chocolatey](#chocolatey)
* [Szükséges szoftverek](#szükséges-szoftverek)
* [Ellenőrzés](#ellenőrzés)
* [Az npm paranccsal települő csomagok](#az-npm-paranccsal-települő-csomagok)
* [Modern webfejlesztési folyamatok](#modern-webfejlesztési-folyamatok)

## Chocolatey

Telepítse a Chocolatey csomagkezelőt. Továbbiakban ezt a csomagkezelőt használjuk.

A csomagkezelő weboldala:
[https://chocolatey.org/](https://chocolatey.org/)

Bővebb leírása:
[https://szit.hu/](https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey)

## Szükséges szoftverek

Szükség van a Chocolatey nevű csomagkezelőre. Több információ a csomagkezelőről:

* [https://szit.hu/](https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey)

A következő szoftverekre van szükség:

* Visual Studio Code
* Python
* Google Chrome
* Total Commander
* Java JDK
* Node.js

Telepítés Chocolatey csomagkezelővel:

```cmd
choco install vscode
choco install python
choco install googlechrome
choco install totalcommander
choco install oraclejdk
choco install nodejs
```

## Ellenőrzés

```cmd
code --version
python --version
javac --version
java --version
node --version
npm --version
```

Indítsuk el:

* Google Chrome
* Total Commander

## Az npm paranccsal települő csomagok

```cmd
npm install --global sinto
```

Ellenőrzés:

```cmd
sin --version
```

## Modern webfejlesztési folyamatok

A modern webfejlesztési folyamatokban Node.js projekteket hozunk létre. A HTML, CSS és JavaScript fájlokat public, dist és src könyvtárakban tartjuk. Az egész projektet egy packages.json fájlban írjuk le. A package.json fájl tartalmazza az alkalmazás függőségeit is.

Néhány ezzel kapcsolatos cikk:

* [https://wpbeaches.com/getting-browsersync-running-with-gulp-4-and-valet/](https://wpbeaches.com/getting-browsersync-running-with-gulp-4-and-valet/)
* [https://css-irl.info/a-modern-front-end-workflow-part-1/](https://css-irl.info/a-modern-front-end-workflow-part-1/)
* [https://www.getfishtank.com/insights/speed-up-web-development-using-browsersync](https://www.getfishtank.com/insights/speed-up-web-development-using-browsersync)
* [https://dad-union.com/en/windows-npm-scripts-development-environment-custom-template](https://dad-union.com/en/windows-npm-scripts-development-environment-custom-template)

### Node.js projekt létrehozása

Az első lépés, hozzunk létre egy **package.json** fájlt. Ezt létrehozhatjuk egy egyszerű szövegszerkesztővel, kódszerkesztővel, de generáltatni is tudunk.

A generálás az npm init -y paranccsal történik:

```cmd
npm init -y
```

A -y kapcsoló nélkül az npm init parancs bekéri a projekt összes tulajdságát. Ha megadjuk a -y kapcsolót, alapértelmezett tulajdonság kerülnek beállításra a package.json fájlban.

Nézzük meg a package.json fájlt:

```json
{
  "name": "app02",
  "version": "1.0.0",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "description": ""
}
```

### A package.json fájl

A name tulajdonság a projekt nevét tartalmazza. A version a projekt verzióját. A main tulajdonságnak szerveroldali Node.js projektnél
van értelme. Ez tartalmazza annak a fájlnak a nevét, amely az alkalmazás belépési pontja.

A scripts részben feladatokat írhatunk le. Hogyan indítjuk a projektet, hogyan teszteljük, és más egyéni tevékenységeket.

A keywords egy tömb, amely azokat a kulcsszavakat tartalmazza, amelyek jellemzik a projektet. Az author a tulajdonost, a license a projekt engedélyét, a description pedig a projekt leírását.

### A projekt függőségei

A projekt függőségei, például a Bootstrap. A Bootstrap hivatkozható
CDN-en keresztül, vagy letölthető. Az npm segítségével letölthetjük
a bootstrap-t is. Telepítés:

```cmd
npm install bootstrap
```

Figyeljük meg a package.json fájlt. Bekerült egy új bejegyzés:

```json
  "dependencies": {
    "bootstrap": "^5.3.3"
  }
```

A dependencies tulajdonság tartalmazza a függőségeket.

Maga a függőség a node_modules könyvtárba kerül. Minden függőség ebbe a könyvtárba töltődik le.
Az általunk használt függőségeknek lehetnek saját függőségei. Amikor telepítjük bootstrap csomagot felkerül a @popperjs/core. Ezek a plusz függőségek is bejegyzésre kerülnek egy *lock* fájlba. A lock fájl teljes neve függ a használt csomagkezelő parancstól.

#### Fejlesztői függőségek

Ha Bootstrap-t használunk, a Bootstrap mint függőség szükséges abban az esetben is, amikor a termék elkészült. Ezzel szemben lehetnek olyan függőségek, amikre csak fejelesztési időben van szükség. Ilyan lehet egy fejlesztői szerver. Gyakran használt szerverek közé tartozik a Browser-sync. Telepítése:

```cmd
npm install --save-dev browser-sync
```

Ha fejlesztői függőséget --save-dev kapcsolóval jelezzük, hogy ez fejlesztői függőséget.

Figyeljük meg a package.json fájlt. Bekerült egy új tulajdonság **devDependencies**.

```json
  "devDependencies": {
    "browser-sync": "^3.0.3"
  }
```

### Csomag és projektkezelő parancsok

Az npm parancs a Node.js alapértelmezett csomagkezelő és projektkezelő parancsa. Mivel nem mindig működik megbízhatóan létrehoztak a Facebook-nál egy alternatívát, neve yarn lett. Telepítése:

```cmd
npm install --global yarn
```

Később létrehoztak egy pnpm nevű parancsot is. A pnpm parancs is használja a node_modules könyvtárat, azonban a függőségeket nem oda tölti le. Egy központi helyre töltődnek, ahonnan be lesz linkelve a node_modules könyvtárba. Ez gyorsabb működést és kevesebb helyfoglalást eredményez. Telepítés:

```cmd
npm install --global pnpm
```

Ha pnpm parancsot használjuk a lock fájl ilyen néven jön létre: pnpm-lock.yaml.

### A Node.js projket scriptjei

A feladatokat a scripts tulajdonságban gyűjtjük.

Az alapértelmezett script:

```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
```

Egy test nevű scriptünk van.

### A projekt mozgatása

Ha szeretnénk a Node.js projektet másolni, feltölteni valahova a node_modules könyvtárat nem másoljuk nem töltjük fel. A package.json fájl minden szükséges információt tartalmaz.

Amikor szeretnénk használatba venni a másolt vagy letöltött projektet, egyszerűen telepítsük a függőségeket.

```cmd
npm install
```

Ha yarn-t használunk:

```cmd
yarn install
```

Ha pnpm-t használunk:

```cmd
pnpm install
```
