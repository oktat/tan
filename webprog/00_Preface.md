# Webprogramozás - Előkészítés

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Chocolatey

Telepítse a Chocolatey csomagkezelőt. Továbbiakban ezt a csomagkezelőt használjuk.

A csomagkezelő weboldala:
[https://chocolatey.org/](https://chocolatey.org/)

Bővebb leírása:
[https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey](https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey)

A Chocolatey weboldalán található egy hosszú Power Shell paranancs, amivel telepíthető a program. Indítsunk egy PowerShell-t rendszergazdaként, így kiadva a parancsot.

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

A telepítés során még rákérdez, hogy biztosan szeretnénk telepíteni a csomagot. Ekkor az összes ilyen kérdés elfogadása az "a" beírásával, majd egy "Enter" nyugtázással lehetésges. Ha telepítő parancsnak adunk egy -y kapcsolót, a kérdés elmarad és azonnal telepíti a megadott fájlt a Chocolatey.

```cmd
choco install <csomagnév> -y
```

Gyorskezdés:

```cmd
choco install yarn -y
choco install totalcommander -y
choco install vscode git insomnia-rest-api-client -y
choco install googlechrome -y
choco install geany -y
choco install nodejs -y
```

## Szükséges szoftverek

Parancssorban a következőkre van szükség:

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

Szükséges GUI program:

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

A NodeJS egy JavaScript futtató környezet.

Telepítse a NodeJS rendszert. Letölthető a weboldalról is:

* [https://nodejs.org/](https://nodejs.org/)

Vagy használjuk a choco parancsot.

```cmd
choco install nodejs
```

Telepítés után lenni kell egy node, egy npm és egy npx parancsnak. Ellenőrizzük:

```cmd
node --version
npm --version
npx --version
```

Bővebben:

* [https://szit.hu/doku.php?id=oktatas:web:nodejs:telepites](https://szit.hu/doku.php?id=oktatas:web:nodejs:telepites)

## NodeJS projekt

Az alábbiakban elkészítünk egy NodeJS projektet, a jövőben mindig ilyen projektekkel fogunk dolgozni. Ilyen projektet az npm és a yarn paranccsal is létrehozható.

A tervek szerint a következő könyvtárszerkezetet hozzuk létre:

```txt
app01/
  |-node_modules/
  |-index.html
  |-package.json
  `-package-lock.json
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
A **package-lock.json** fájlba az npm parancs írja le, milyen
csomagokat tettünk fel és szedtünk le, ezt általában nem nézegetjük.

Elkészítjük az első NodeJS alapú projektünket.
A projekt könyvtárát most nekünk kell létrehozni.
Legyen a neve app01. Ha elkészült lépjünk be a
könyvtárba.

```cmd
mkdir app01
cd app01
```

Csináljunk NodeJS projektet a könyvtárunkból:

```cmd
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
a fejlesztés során, webszervernek.

Telepítsük a lit-server nevű csomagot:

```cmd
npm install lite-server --save-dev
```

Ha van yarn parancsunk:

```cmd
yarn add lite-server --dev
```

A csomag telepszik a node_modules könyvtárba,
sok függőségével együtt. Nézzünk bele a package.json
fájba, ahol láthatjuk, hogy bejegyzésre került.

A projekt könyvtárában készítsünk egy index.html fájlt.
Indítsuk el a lite-servert:

```cmd
npx lite-server
```

Ügyeljünk arra, hogy a parancsot a projekt gyökérkönyvtárában indítsuk, és ott legyen az index.html állomány is.

A **package-json** fájlba, bejegyzhetünk feladatokat, vagy másnéven scripteket. Ezzel rövidíthetünk az indításon.

Egészítsük egy script részt:

```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "lite-server"
  },
```

Vegyük észre a "test" sor végén a vesszőt. Mentsük el.

Most már, nekifoghatunk a projekt részét tartalmazó weboldal elkészítéséhez is.

Készítsünk egy weboldalt index.html néven, ha még nem létezik. Tartalma:

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

A projekt indításhoz, most használjuk a megírt scriptet.
Visual Studio Code terminálablakában, vagy parancssorban, a projekt gyökrékönyvtárában:

```cmd
npm start
```

Ha van yarn parancsunk, így is indíthatjuk:

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

### Bemutatkozás

Használat előtt, először mutatkozzunk be a git számára. Adjuk meg a teljes nevünket és az e-mail címünket. Ezt kétféle módon tehetjük meg:

* lokálisan a projektbe
* globálisan a felhasználói profilba

Ha csak a projekt számára mutatkozunk be, akkor minden új projektben meg kell ezt tennünk. Ha globálisan mutatkozunk be, osztott használatnál, amikor végeztünk, érdemes törölnünk a nevünket és az e-mail címünket.

```bash
git config --global user.name "Nagy János"
git config --global user.email "nagyj@zold.lan"
```

Osztott használat esetén adatink törlése:

```bash
git config --global --unset user.name
git config --global --unset user.email
```

### Használat

Legyen egy app01 nevű projekt. Létrehozzuk a könyvtárat, majd belépünk:

```cmd
mkdir app01
cd app01
```

Adjunk a projekthez git tárolót:

```cmd
git init
```

Keressük meg a projekt gyökérkönyvtárában a **.git** könyvtárat. Ez lesz a git tároló. Visual Studio Code alatt ez nem látszik, mivel **rejtett könyvtár**. Nézzük meg fájlkezelővel. Fájlkezelőben is csak akkor látszik, ha a rejtett fájlok láthatósága be van kapcsolva.

Hozzunk létre egy index.html amit szeretnénk verziókövetni.
Tegyük fel, hogy a projekt NodeJS projekt is egyben, vagyis
van node_modules könyvtár is. Ennek a könyvtárnak a tartalmát
nem szeretnénk verziókövetni, ezért bele kell írni a **.gitignore**
nevű fájlba. A .gitignore nevű fájlba azoknak a fájloknak és
könyvtáraknak a nevét tesszük, amelyeket **nem szeretnénk
verziókövetni**. Készítsük el a saját .gitignore nevű állományunkat,
majd írjuk bele a node_modules könyvtár nevét.

```txt
node_modules/
```

Ellenőrizzük, hogy valóban ki van zárva a könyvtár:

```bash
git status -u
```

Ha nem látjuk a kimenetben mehet verziókövetendő fájlok
hozzáadása:

```bash
git add .
```

A pont hatására minden az aktuális könyvtárban lévő fájl
verziókövetésre lesz jelölve. Vigyázzunk ezzel a paranccsal! Ha nincs megadva a node_modules könyvtár a .gitignore fájlban, vagy rosszul van megadva, a pont hatására az egész könyvtár tartalma tárolásra kerül feleslegesen. Ezért azt szokták ajánlani, hogy egyenkét adjuk meg a követendő fájlokat. Például:

```bash
git add .gitignore
git add index.html
git add package.json
```

A tényleges követés a "git commit" paranccsal történik, ahol
leírjuk milyen változásokat valósítottunk meg a projektben.

```bash
git commit -m "Kezdés"
```

A -m kapcosló nélkül egy szövegszerkesztő nyílna meg, ahova beírhatjuk a commit szövegét. A -m kapcsoló után megadhatjuk ezt a szöveget. A -m kapcsoló nélkül csak akkor indítsuk "git commit" parancsot, ha van tapasztalatunk a vi szövegszerkesztővel, vagy beállítottunk más szövegszerkesztőt.

Az idézőjelben írjuk le, milyen változtatásokat végeztünk a projektünkbe. Kezdésnek lehet "Init" vagy "Kezdés".

Használjuk a tájékozódáshoz a "git status" parancsot:

```bash
git status
```

Változtassunk valamit az index.html oldalon, majd nézzük meg újra a státuszt. Változtatások után, használjuk mindig a -u kapcsolót:

```bash
git status -u
```

Nézzük meg a létrehozott commitokat:

```bash
git log
```

Használhatunk GUI felületet is a napló megtekintéséhez:

```bash
gitk
```

A git verziókövető rendszerről komplett tananyag:

* [https://szit.hu/doku.php?id=oktatas:programozas:verziokontroll:git](https://szit.hu/doku.php?id=oktatas:programozas:verziokontroll:git)
