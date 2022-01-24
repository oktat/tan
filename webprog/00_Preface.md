# Webprogramozás

## Sallai András

## 2022

## Előkészítés

## Chocolatey

Telepítse a Chocolatey csomagkezelőt. Továbbiakban ezt a csomagkezelőt használjuk.

A csomagkezelő weboldala:
https://chocolatey.org/

Bővebb leírása:
https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey

A Chocolatey weboldalán található egy hosszú Power Shell paranancs, amivel telepíthető a progra. Indítsunk egy PoserShell-t rendszergazdaként, így kiadva a parancsot.

A script másolata:

```PowerShell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('http://internal/odata/repo/ChocolateyInstall.ps1'))
```

Telepítés kapunk egy choco nevű parancsot. Teszteljük:

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

## NodeJS

Telepítse a NodeJS rendszert.

* https://nodejs.org/

```cmd
choco install nodejs
```

Telepítés után lenni kell egy node és egy npm parancsnak. Ellenőrizzük:

```cmd
node --version
npm --version
```

Bővebben:

* https://szit.hu/doku.php?id=oktatas:web:nodejs:telepites

## NodeJS projekt

Az alábbiakban elkészítünk egy NodeJS projektet, a jövőben mindig ilyen projektekkel fogunk dolgozni.

A tervek szerint a következő könyvtárszerkezetet hozzuk létre

```txt
app01/
  |-node_modules/
  |-index.html
  |-package.json
  `-yarn.lock
```

```cmd
mkdir app01
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

Egészítsük egy script részt:

```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "lite-server"
  },
```

Telepítsük a lit-server nevű csomagot:
yarn add lite-server --dev

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
