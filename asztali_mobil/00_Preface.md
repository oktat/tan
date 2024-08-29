# Asztali és mobil alkalmazások

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Szükséges szoftverek](#szükséges-szoftverek)
* [Chocolatey](#chocolatey)
* [Csomagok telepítése Chocolatey csomagkezelővel](#csomagok-telepítése-chocolatey-csomagkezelővel)

## Szükséges szoftverek

* Chocolatey
* Visual Studio Code
* Scene Builder
* Java JDK
* Node.js
* Dia
* git
* Total Commander
* GIMP
* Inno Setup

## Chocolatey

Telepítse a Chocolatey csomagkezelőt. Továbbiakban ezt a csomagkezelőt használjuk.

A csomagkezelő weboldala:
[https://chocolatey.org/](https://chocolatey.org/)

Bővebb leírása:
[https://szit.hu/](https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey)

## Csomagok telepítése Chocolatey csomagkezelővel

```cmd
choco install vscode.install
```

```cmd
choco install scenebuilder
```

Java JDK lehet amit alapból ad, de ajánlott a 17 Java:

```cmd
choco install oraclejdk
choco install oracle17jdk
```

A Node.js-ből az LTS verzió szükséges:

```cmd
choco install nodejs-lts
```

Diagram szerkesztő:

```cmd
choco install dia
```

Git verziókövető:

```cmd
choco install git
```

Total Commander:

```cmd
choco install totalcommander
```

GIMP képszerkesztő:

```cmd
choco install gimp
```

Inno Setup

```cmd
choco install innosetup
```
