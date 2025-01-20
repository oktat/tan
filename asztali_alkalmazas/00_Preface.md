# Asztali alkalmazások

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Chocolatey](#chocolatey)
* [Gépelés 10 ujjal](#gépelés-10-ujjal)
* [Java JDK](#java-jdk)
* [Kódszerkesztők](#kódszerkesztők)
* [Verziókövető](#verziókövető)
* [Scene Builder](#scene-builder)

## Chocolatey

Telepítse a Chocolatey csomagkezelőt. Továbbiakban ezt a csomagkezelőt használjuk.

A csomagkezelő weboldala:
[https://chocolatey.org/](https://chocolatey.org/)

Bővebb leírása:
[https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey](https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey)

A Chocolatey weboldalán található egy hosszú Power Shell parancs, amivel telepíthető a program. Indítsunk egy PowerShell-t rendszergazdaként, így kiadva a parancsot.

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

A telepítés végezhető **Command Prompt** és **Power Shell** terminálban egyaránt, de **rendszergazdi jog** szükséges.

A telepítés során még rákérdez, hogy biztosan szeretnénk-e telepíteni a csomagot. Ekkor az összes ilyen kérdés elfogadása az "a" beírásával lehetésges. Ha telepítő parancsnak adunk egy -y kapcsolót, a kérdés elmarad és azonnal telepíti a Chocolatey.

```cmd
choco install <csomagnév> -y
```

Telepítsük a következő csomagokat:

```cmd
choco install totalcommander -y
choco install vscode git -y
choco install googlechrome -y
choco install geany -y
choco install scenebuilder -y
```

## Gépelés 10 ujjal

A gépelés 10 ujjal megkönnyíti a szoftverfejlesztés egész folyamatát. A gépelés egy más érzés; könyedebb munka, gyorsabb javítás.

A 10 ujjas gépelést úgy kezdjük, hogy megkeressük a billentyűzeten az ujjak helyét. Oda tesszük az ujjainkat és minden
billentyűt ebből a pozícióból ütünk le.

Oktató szoftver:

* [https://termih.github.io/jtpgt/index_hu.html](https://termih.github.io/jtpgt/index_hu.html)

Tötsük le a szoftvert, csomagoljuk ki. Indítás után leckéket találunk benne, amiken haladva elsajátíthatjuk a gépelést.

## Java JDK

Telepítsük:

```bash
choco install oracle17jdk
```

Ellenőrzés:

```bash
java --version
javac --version
```

## Kódszerkesztők

```bash
choco install vscode geany
```

A Visual Studio Code bővítményei

* Project Manager for Java
* Language Support for Java(TM) by Red Hat
* Debugger for Java
* Maven for Java
* Test Runner for Java

## Verziókövető

```bash
choco install git
```

Ellenőrzés:

```bash
git --version
```

## Scene Builder

Telepítés:

```bash
choco install scenebuilder
```
