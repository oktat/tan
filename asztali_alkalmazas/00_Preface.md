# Asztali alkalmazások

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
```

## Java JDK

Telepítsük:

```bash
choco install oracle17jdk
```

Ellenőrzés:
  java --version
  javac --version

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
