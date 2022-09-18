# Webs hibakeresés

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## HTML

### Validátor

* [https://validator.w3.org/](https://validator.w3.org/)

### A böngésző fejlesztői eszköze

Billentyűkód:

* Ctrl + Shift + I

vagy

* F12

Korábban csak a Ctrl+Shift+I működött. Mostanság az F12 is.

Lehetőségek:

* elem kiválasztása vizsgálatra - Elements-el együtt
* eszközválasztó sáv - oldal megtekintése pl. mobil felbontásban
* Elements - HTML és CSS vizsgálata
* Console - JavaScript konzolja
* stb.

## Git

A Git egy verziókövető rendszer. Segítségével visszaállítható egy korábbi állapot hiba esetén.

### Kezdés

Készítsük el a projektet, majd a készítsünk belőle git tárolót:

```cmd
mkdir app01
cd app01
git init
```

Innentől kezdve a projekt fel van készítve a verziókövetésre. A projekt állományait tudjuk követni.

### Bemutatkozás

Az állapotok tárolása mindig valakinek a nevében történnek. Vagy globálisan, vagy a helyi projekten belül be kell mutatkozni a git számára.

```cmd
git config --global user.name "Keresztnév Vezetéknév"
git config --global user.email "joska@zold.and"
```

Beállítások lekérdezése:

```cmd
git config --list
```

Hol vannak tárolva a beállítások:

```cmd
git config --list --show-origin
```

Az e-mail és a név lekérdezése egyenként:

```cmd
git config --global user.email
git config --global user.name
```

Beállítások megszüntetése:

```cmd
git config --global --unset user.email
git config --global --unset user.name
```

### Windows kulcsok

```cmd
cmdkey /list
```

Kiléptetés például:

```cmd
cmdkey /delete git:https://github.com
```

### Tárolás

Készítsünk egy adat.txt és egy naplo.txt állományt:

```cmd
echo alma > adat.txt
echo 2022 > naplo.txt
```

Az adat.txt állományt szeretnénk verziókövetni, de a naplo.txt állományt nem.
A naplo.txt állomány nevét írjuk bele egy .gitignore állományba. Így a Git nem törekszik annak követésére.

```cmd
echo "naplo.txt" >> .gitignore
```

Most adjuk ki a git status parancsot. Lehetséges kimenet:

```cmd
git status
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	.gitignore
	adat.txt

nothing added to commit but untracked files present (use "git add" to track)
```

Láthatjuk, hogy két fájlt szeretne követni a Git. A .gitignore és az adat.txt fájlt. A naplo.txt fájl nem érdekli.

Először vegyük rá a fájl követésére a tárolót:

```cmd
git add .gitignore
git add adat.txt
```

Kérdezzük le újból a tároló státuszát:

```cmd
git status
```

Most fűzzünk megjegyzést a tárolt állapothoz. Például "Kezdés".

```cmd
git commit -m "Kezdés"
```

A tárolás most kész. Kérdezzük le újból a státuszt:

```cmd
git status
```

A kimenet most:

```
On branch master
nothing to commit, working tree clean
```

Egyetlen állapot lett véglegesítve. A véglegesített állapot neve commit. Nézzük meg:

```cmd
git log
```

Lehetséges kimenet:

```
commit 11377e55527cfa39dfad9314629d9c1cabc4aed7 (HEAD -> master)
Author: Nagy János <janos@zold.lan>
Date:   Wed Aug 24 20:42:50 2022 +0200

    Kezdés
```

Minden commit kap egy azonosítót, ami 40 karakterből áll, és egy hexadecimális szám.

### Visszaállítás

Adjunk az adat.txt állományhoz a "körte", majd az "eper" szót is.

```cmd
echo körte >> adat.txt
echo eper >> adat.txt
```

Most rájövünk, hogy ezt nem kellett volna, vissza kéne állni az utolsó végleges mentéshez, amikor még csak az alma szó volt az adat.txt fájlban.

Visszaállás, ha még nem volt git add:

```cmd
git reset --hard
```

Ha már volt git add:

```cmd
git reset --hard HEAD
```

Visszaállás egy véglegesített állapotra:

```cmd
git checkout 4824
```

Az ágból elhagyott commitokat is szeretnénk látni:

```cmd
git log --reflog
```

Automatikusan stage állapotba és commit:

```cmd
git commit -a -m 'Valami'
git commit --all --message 'Valami'
```

### Ágak használata

Elágazás létrehozása:

```cmd
git branch dev
```

Átállás az elágazásra:

```cmd
git checkout dev
```

Fejlesztünk

```cmd
echo uborka >> zoldseg.txt
git add zoldseg.txt
git commit -m "Uborka hozzáadva"
```

Visszaállás a master ágra és összefűzés:

```cmd
git checkout master
git merge dev
```

### Távoli munka

Ha még nincs példányunk:

```cmd
git clone https://github.com/valaki/valami
```

Ha már van példányunk és szeretnék a változásokat letölteni:

```cmd
git pull origin master
```

Feltöltéshez távoli szerver beállítása:

```cmd
git remote add origin https://github.com/valaki/valahol.git
```

Ha javítani kell:

```cmd
git remote set-url origin https://github.com/valaki/valahol.git
```

Lekérdezés:

```cmd
git remote get-url origin
```

## IRC

* [https://webchat.freenode.net/](https://webchat.freenode.net/)
