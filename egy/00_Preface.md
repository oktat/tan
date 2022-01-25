# Webprogramozás - Előkészítés

* Előkészítés
* Sallai András
* 2022

## Chocolatey

Telepítse a Chocolatey csomagkezelőt. Továbbiakban ezt a csomagkezelőt használjuk.

A csomagkezelő weboldala:
[https://chocolatey.org/](https://chocolatey.org/)

Bővebb leírása:
https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey

A Chocolatey weboldalán található egy hosszú Power Shell paranancs, amivel telepíthető a program. Indítsunk egy PoserShell-t rendszergazdaként, így kiadva a parancsot.

A script másolata:

```PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Telepítés után kapunk egy choco nevű parancsot. Teszteljük:

```cmd
choco --version
```

Telepítés általánosan:

```cmd
choco install <csomagnév>
```

A telepítés során még rákérdez, hogy biztosan szeretnénk telepíteni a csomagot. Ekkor az összes ilyen kérdés elfogadása az "a" beírásával lehetésges. Ha telepítő parancsnak adunk egy -y kapcsolót, a kérdés elmarad és azonnal telepíte a Chocolatey.


```cmd
choco install <csomagnév> -y
```

Telepítsük a következő csomagokat:

```cmd
choco install yarn -y
choco install totalcommander -y
choco install vscode git insomnia-rest-api-client -y
choco install googlechrome -y
choco install geany -y
```

## Szükséges szoftverek

Parancsok:

* yarn
  * Chocolatey csomag: yarn
  * NPM csomag: yarn
  * Webhely: [https://yarnpkg.com/](https://yarnpkg.com/)
* node
  * Chocolatey csomag: nodejs
  * Webhely: [https://nodejs.org/](https://nodejs.org/)
* npm
  * A NodeJS része
  * Chocolatey csomag: nodejs
  * Webhely: [https://nodejs.org/](https://nodejs.org/)
* git
  * Chocolatey: git
  * Webhely: [https://git-scm.com/](https://git-scm.com/)

GUI program:

* Total Commander
  * Chocolatey csomag: totalcommander
  * Webhely: [https://www.ghisler.com/](https://www.ghisler.com/)
* Visusal Studio Code
  * Chocolatey csomag: vscode
  * Webhely: [https://code.visualstudio.com/](https://code.visualstudio.com/)
* Insomnia
  * Chocolatey csomag: insomnia-rest-api-client
  * Webhely: [https://insomnia.rest/](https://insomnia.rest/)
* Geany
  * Chocolatey csomag: geany
  * Webhely: [https://www.geany.org/](https://www.geany.org/)

## NodeJS

Telepítse a NodeJS rendszert.

* [https://nodejs.org/](https://nodejs.org/)

```cmd
choco install nodejs
```

Telepítés után lenni kell egy node és egy npm parancsnak. Ellenőrizzük:

```cmd
node --version
npm --version
```

Bővebben:

* [https://szit.hu/doku.php?id=oktatas:web:nodejs:telepites](https://szit.hu/doku.php?id=oktatas:web:nodejs:telepites)

## NodeJS projekt

Az alábbiakban elkészítünk egy NodeJS projektet, a jövőben mindig ilyen projektekkel fogunk dolgozni.

A tervek szerint a következő könyvtárszerkezetek lesznek:

```txt
app01/
  |-node_modules/
  |-index.html
  |-package.json
  `-yarn.lock
```

Ebből nekünk, csak az index.html fájlt kell létrehozni, a
többit valamilyen parancs hozza létre.

A **node_modules/** könyvtárba teszi a telepített függőségeket
az npm és a yarn parancs. A **packages.json** fájlba íródik,
be minden telepített csomag, amiről úgy beszélünk, hogy
függőség, mivel ezt használtuk a munánk során.
Ha más használni akarja a projektünket, akkor megkapja
az index.html és a package.json fájlt. Egy yarn vagy
egy npm paranccsal telepíteni tudja ugyanazokat az
csomagokat, amiket mi is használtunk.
A **yarn.lock** fájlba a yarn parancs írja, hogy milyen
csomagokat tettünk fel és szedtünk le, ez számunkra
nem érdekes.

Most elkészítjük az első NodeJS alapú projektünket.
A projekt könyvtárát most nekünk kell létrehozni.
Legyen a neve app01. Ha elkészült lépjünk be a
könyvtárba.

```cmd
mkdir app01
cd app01
npm init -y
```

Kapunk egy package.json fájlt. Tartalma:

```json
{
  "name": "p0",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```

A lite-server nevű csomagot fogjuk használni
a fejlesztés során.

Telepítsük a lit-server nevű csomagot:

```cmd
yarn add lite-server --dev
```

A csomag telepszik a node_modules könyvtárba,
sok függőségéve együtt. Nézzünk bele a package.json
fájba, ahol láthatjuk, hogy bejegyzésre került.

A **package-json** fájlba be kell jegyezni, hogy
szeretnénk elindítani. 

Egészítsük egy scripts részt:

```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "lite-server"
  },
```

Mentsük el.

Most már, nekifoghatunk a projekt részét tartalmazó
weboldal elkészítéséhez is.

Készítsünk egy weboldalt index.html néven.

```html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
    content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Valami</h1>
</body>
</html>
```

Indítsuk el a szervert a Visual Studio Code terminálablakában:

```cmd
yarn start
```

A weboldal megnyílik az alapértelmezett böngészőben. 

Végezzünk néhány javítást a webolalon. 
Vagyünk fel, például egy "p" elemet,
írjuk bele "Lorem ipsum dolor est amet",
mentsük és figyeljük a böngészőt.

A továbbikaban így fogunk weboldalakat készíteni.

## Git használata

Legyen egy app01 nevű projekt. Létrehozzuk a
könyvtárat, majd belépünk:

```cmd
mkdir app01
cd app01
```

Adjunk a projekthez git tárolót:

```cmd
git init
```

Hozzunk létre egy index.html amit szeretnénk verziókövetni.
Tegyük fel, hogy a projekt NodeJS projekt is egyben, vagyis
van node_modules könyvtár is. Ennek a könyvtárnak a tartalmát
nem szeretnénk verziókövetni, ezért bele kell írni a .gitignore
nevű fájlba. A .gitignore nevű fájlba azoknak a fájloknak és
könyvtáraknak a nevét tesszük, amelyeket nem szeretnénk
verziókövetni. Készítsük el a saját .gitignore nevű állományunkat,
majd írjuk bele a node_modules könyvtár nevét.

```txt
node_modules/
```

Ellenőrizzük, hogy valóban ki van zárva a könyvtár:

```bash
git status -u
```

Ha nem látuk a kimenetben mehet verziókövetendő fájlok 
hozzáadása:

```bash
git add .
```

A pont hatására minden az aktuális könyvtárban lévő fájl 
verziókövetésre lesz jelölve.

A verziókövetés egy git commit paranccsal történik, ahol
leírjuk milyen változásokat valósítottunk meg a projektben.

```bash
git commit -m 'Kezdés'
```

A git verziókövető rendszerről komplett tananyag:

* [https://szit.hu/doku.php?id=oktatas:programozas:verziokontroll:git](https://szit.hu/doku.php?id=oktatas:programozas:verziokontroll:git)
