# Frontend programozás

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Szerkesztve: 2022, 2023
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Szükséges szoftverek](#szükséges-szoftverek)
* [Chocolatey](#chocolatey)
* [Telepítések](#telepítések)
* [A Path környezeti változó](#a-path-környezeti-változó)
* [Node.js alkalmazások](#nodejs-alkalmazások)
* [Előzetes ismeretek](#előzetes-ismeretek)

## Szükséges szoftverek

* Chocolatey
* Visual Studio Code
* Node.js
* Dia
* git
* composer (PHP script)
* Insomnia (REST API client)
* HTTPie (REST API client)
* GIMP
* Total Commander
* XAMPP

## Chocolatey

Telepítse a Chocolatey csomagkezelőt. Továbbiakban ezt a csomagkezelőt használjuk.

A csomagkezelő weboldala:
[https://chocolatey.org/](https://chocolatey.org/)

Bővebb leírása:
[https://szit.hu/](https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey)

## Telepítések

A szoftverek telepítése choco paranccsal:

```cmd
choco install vscode.install
choco install nodejs
choco install dia
choco install composer
choco install insomnia-rest-api-client
choco install httpie
choco install gimp
choco install totalcommander
choco install xampp-81
```

## A Path környezeti változó

A C:\Users\janos\AppData\Roaming\npm útvonalat vegyük fel a **PATH** környezeti változóba.

* C:\Users\janos\AppData\Roaming\npm

Erre később szükség lesz, amikor az npm install -g <csomagnév> parancsot használjuk.

A környezeti változó beállításról itt találunk egy leírást:

* [https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:utvonalak#gui_felueleten](https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:utvonalak#gui_felueleten)

## Node.js alkalmazások

Az npm csomagkezelő telepítve kell legyen. Az npm a Node.js rendszer csomagkezelője.

```bash
npm install --global sinto
npm install --global resen
```

Szükség lesz még az angular cli csomagra, de ennek telepítése az Angular fejezetben le van írva.

## Előzetes ismeretek

Ennek a témának az elsajátításához szükség van a HTML, CSS, Bootstrap és JavaScript ismeretekre.

Ezek az ismeretek a következő tankönyvekben vannak leírva:

* [prog_alapok](https://github.com/oktat/tan/tree/master/prog_alapok)
* [webprog](https://github.com/oktat/tan/tree/master/webprog)

Előnyös még, ha a hálózatok témakörből ismerjük a HTTP protokoll működését.
