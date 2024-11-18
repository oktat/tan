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
