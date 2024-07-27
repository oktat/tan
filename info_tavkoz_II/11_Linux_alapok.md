# Linux alapok

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A Linux szerepe

A Linux kezdetben szerverek kedvenc operációs rendszere. Manapság a fejleszők is előszeretettel választják asztali felületükhöz.

A Google kezdetben (2012) Ubuntu Linux alapokon készített saját Linuxot Goobuntu néven, amit akkor csak ajánlott a fejlesztőinek. Később már csak ezt lehetett választani, Windows külön kellett kérni. 2018-ban a cég Ubuntu helyett Debian GNU/Linux alapokra váltott, a neve [gLinux](https://en.wikipedia.org/wiki/GLinux).

## Telepítés

Szerezzünk be egy Linuxot. Ajánlott Linux terjesztések:

* [Debian GNU/Linux](https://debian.org)
* [Linux Mint](https://linuxmint.com/)

A továbbiakban Debian GNU/Linuxal foglalkozunk.

Keressük fel a [https://debian.org](https://debian.org) weboldalt. Töltsünk le egy "netinstall" típusú telepítőt. A Debian webhely főoldalán, jobb oldalon találunk egy "Letöltés" gombot. Ez átvisz a letöltőoldalra: [https://www.debian.org/download](https://www.debian.org/download). 2022-11-16-án a letölthető képfájl:

* debian-11.5.0-amd64-netinst.iso

A Linuxot telepíthetjük virtuális vagy valódi gépre.

### Valódi gép

Ha valós fizikai gépre szeretnénk telepíteni a Linuxot, ki kell írni a letöltött lemezképet CD/DVD-re vagy pendrive-ra. Betesszük CD/DVD-t a meghajtóba, a pendrive-t valamelyik USB aljaztba. A gép bekapcsolásakor gondoskodunk arról, hogy a behelyezett médiáról induljon a rendszer.

Kövessük a telepítő utasításait.

### Virtuálisgép

Virtuális gépnek ajánlott:

* [https://virtualbox.org](https://virtualbox.org)

Telepítsük a Virtualboxot a gépünkre. A virtuális gépre ugyanusz behelyezhető a tárolóknál a letöltött .iso fájl, mint ha az valóban kiírtuk volna egy CD vagy DVD lemezre.

### Telepítés folyamata

Ha valós gépre telepítünk, előbb készítsünk mentést az adatainkról.

A telepítés kezdete során válasszuk a magyar nyelvet, időzónát és billentyűzetet. A particionálásnál lehet telepítővel segített. A GRUB rendszerbetöltőre kérdez a végén. Ezt az MBR-be kell telepíteni:

```cmd
/dev/sda
```

Ki kell választani.

## Parancssor

A parancssor a parancs nevéből és argumentumokból áll. Az argumentumok két részre oszthatók:

* kapcsolók
* paraméterek

A kapcsolók módosítják a parancs működését, a paraméterek megmondják min kell végrehajtani.

Adott például az ls parancs, ami listázza az aktuális könyvtár tartalmát.

```bash
ls
```

De megadható, milyen könyvtárat listázzon:

```bash
ls /var
```

Megmondhatjuk, hogy ne csak a neveket írja ki, hanem minél több információt:

```bash
ls -l /var
```

A kapcsolókat általában előbb adjuk meg, mint a paramétereket. Az adott parancs programozójától függ, hogy lehetséges-e más sorrend.

A kapcsolókat egy vagy két kőtőjellel vezetjük be. Általában az egy karakteres kapcsolókat egy kőtjellel vezetjük be, a több karakteres kapcsolókat kettővel, de ez is programozótól függ.

Az ls parancs -a kapcsolója a rejtett fájlokat is megmutatja. Lássuk rövid és teljes formáját:

```bash
ls -a
ls --all
```

A kapcsolókról és a paraméterekről a man parancs ad tájékoztatást, minden parancs esetén. Az ls parancs kézikönyvét így kérhetjük:

```bash
man ls
```

A man parancs egy lapozó programnak adja át kimenetet. Ha szeretnénk kilépni a lapozó programból, nyomjuk meg a Q billentyűt.

## Könyvtárkezelés

Mindig van egy aktuális könyvtár. Ez lekérdezhető a pwd paranccsal:

```bash
pwd
```

Könyvtár létrehozása:

```bash
mkdir valami
```

Ha készítettünk egy könyvtárat beléphetünk abba és aktuálissá válik. Belpés a "valami" nevű könyvtárba:

```bash
cd valami
```

Listázás:

```bash
ls
```

A könyvtár törlése:

```bash
rmdir valami
```

### Gyakorlat 1

1. Készítsünk egy **rendezo** nevű könyvtárat.
2. Lépjünk be a könyvtárba.
3. Listázzuk az aktuális könyvtár tartalmát.
4. Készítsünk egy újabb könyvtárat Leone néven.
5. Készítsük el még a következő könyvtárakat is: Nolan, Tarantino, Cameron, Burton.

## Fájlkezelés

Létrehozás:

```bash
touch adat.txt
```

Listázás:

```bash
ls
```

A fájl törlése:

```bash
rm adat.txt
```

A fájl szerkesztése:

```bash
nano adat.txt
```

Mentés a nano programban a Ctrl+O billentyűkombinációval. A Ctrl+X billentyűvel kiléphetünk belőle.

### Gyakorlat 2

1. Készítsen egy **fa** nevű könyvtárat, majd lépjen be a könyvtárba.
2. A fa nevű könyvtárban készítsen egy **tolgy.txt** fájlt.
3. A fa nevű könyvtárban készítsen egy **hars.txt** fájlt is.

## Rendszergazdai üzemmód

Rendszergazdai üzemmódba a **su** paranccsal léphetünk. Ha a su név után egy kötőjelet is megadun, akkor root felhasználó teljes környezetét megkapjuk.

```bash
su -
```

## Leállítás

Szabályos leállítás:

```bash
poweroff
```

## Jogosultságok

Linuxon alapértelmezetten kizárólagos jogok állíthatók be. Egy fájlnak egyetlen tulajdonosa van és egyetlen csoporthoz tartozik. Ez bővíthető az ACL használatával. Itt csak a kizárólagos jogokat vesszük.

Háromféle jog van:

* olvasás
* írás
* végrehajtás

|magyar |angol|karakter|
|---------|-------|---|
| olvasás | Read  | r |
| írás    | Write | w |
| végrehajtás | eXecute | x |

Kinek adható jog

| magyar | angol | karakter |
|---------|-------|---|
| tulajdonos | User | u |
| csoport | Group | g |
| mások | Other | o |
| mindenki | All | a |

A jogosultságok megtekintése:

```bash
stat adat.txt
```

Figyeljük meg a stat parancs kimenetét:

```txt
$ stat adat.txt
     Fájl: adat.txt
    Méret: 0         	blokkok: 0          IO-blokk: 4096   szabályos üres fájl
   Eszköz: 803h/2051d	I-node: 16923313    linkek: 1
Hozzáférés: (0644/-rw-r--r--)  Uid: ( 1000/  andras)   Gid: ( 1000/  andras)
   Elérés: 2022-08-17 11:24:25.136436611 +0200
Módosítás: 2022-08-17 11:24:25.136436611 +0200
 Változás: 2022-08-17 11:24:25.136436611 +0200
 Születés: 2022-08-17 11:24:25.136436611 +0200
```

Keressük meg a kimenetben a "Hozzáférés" feliratú sort.

```bash
Hozzáférés: (0644/-rw-r--r--)  Uid: ( 1000/  andras)   Gid: ( 1000/  andras)
```

A fájlhoz való hozzáférés meg van adva számokkal és betűkkel is.

Ha a fájl az aktuális könyvtárban van:

```bash
ls -l
```

A fájl nevének megadása:

```bash
ls -l adat.txt
```

| típus | tulajdonos jogai | csoport tagjai | mindenki más jogai |
|--|---|---|---|
| - | rw- | r-- | r-- |

### Tulajdonos beállítása

```bash
chown mari.mari adat.txt
```

Ugyanaz kettősponttal:

```bash
chown mari:mari adat.txt
```

A csoport megadása elhagyható:

```bash
chown mari: adat.txt
```

### Jogok beállítása

A jogok összerakása karakterekből:

| Kar. | Kinek | Angol |
|-|-|-|
| u | tulajdonos | user |
| g | csoport | group |
| o | más | other |
| a | mindenki | all |

Jogokat a chmod paranccsal adjuk. A parancs neve után egy karaktersorozatot állítunk össze.

A karaktersorozat felépítése:

* Kinek állítjuk be a jogot: u, g, o vagy a betű.
* Adjuk vagy elvesszük a jogot: + vagy -.
* Mit adunk: r, w, x.

A következő példában a felhasználó a cél. A jogot megadjuk. Írási jogot adunk.

```bash
chmod u+w adat.txt
```

Ha elvesszük a jogot:

```bash
chmod u-w adat.txt
```

### Könyvtárak jogai

| Jel | Jog | Jelentés |
|-|-|-|
| r | olvasás | Megnézheti milyen fájlok vannak egy könyvtárban |
| w | írás | létrehozhat, átnevezhet, mozgathat |
| x | futtatás | a fájl és könyvtár tartalma megtekinthető |

## Másolás, mozgatás

Másolatot a cp paranccsal készíthetünk:

```bash
cp adat.txt mas.txt
```

A másolás során megadhatunk útvonalat is, ebben az esetben a célfájl neve megegyezhet:

```bash
cp dok/adat.txt dev/adat.txt
```

A fenti esetben, feltételezzük, hogy a dok és a dev könyvtár az aktuális könyvtárban található.

```bash
cp /home/janos/dok/adat.txt /home/janos/dev/adat.txt
```

### Mozgatás

```bash
mv dok/adat.txt dev/adat.txt
```

Ha helyben mozgatunk, átnevezés történik:

```bash
mv adat.txt mas.txt
```

## Szövegfájlok tartalma

```bash
cat adat.txt
```

A fájlok tartalma megtekinthető lapozó programmal is:

```bash
less adat.txt
```

## Keresés a szövegben

Legyen egy fiz.txt állomány, a következő tartalommal:

```txt
3:Para Béla:Szolnok:350
4:Nyár Lajos:Szeged:472
7:Kérdő Szilvia:Szolnok:422
18:Árnyas Irén:Miskolc:398
234:Fer Iván:Szeged:471
398:Enyed Ferenc:442
```

Keressük azokat a sorokat, amiben szerepel a "Szolnok" szó. A grep parancsot fogjuk használni:

```bash
grep Szolnok fiz.txt
```

## Szabályos kifejezések

Szabályos kifejezések használatával, azt is megadhatjuk, egy keresendő szöveg hol helyezkedik el. Az előző fejezet állományában ha a 398-s azonosítót keressük két sort is kapunk. Szabályos kifejezéssel megmondhatjuk, hogy azt a 398-s szövegrészt keressük, ami a sor elején van:

```bash
grep "^398" fiz.txt
```

Ha azt keressük ahol a sor végén van:

```bash
grep "398$" fiz.txt
```

## A nano szövegszerkesztő

A nano szövegszerkesztő weblapja:

[https://www.nano-editor.org/](https://www.nano-editor.org/)

A nano beállításait a **~/.nanorc** fájlba írható.

Példaként a tabulátor méretének beállítása:

```rc
set tabsize 4
```

Üreshely karakterek mutatása:

```key
Ctrl+P
```

Sortörés tiltása:

```keyboard
Alt+L
```

### Vágólaphasználat

Másolás:

```key
Alt+6
```

Beillesztés:

```key
Ctrl+U
```

Kivágás:

```key
Ctrl+K
```

Külső fájl beszúrása:

```key
F5
```

Tallózhatunk is fájlokat az F5 után:

```key
Ctrl+T
```

Számozás:

```key
Alt+AltGr+x
```

Szavak, sorok és karakterek megszámolása:

```key
Alt+D
```

Mentés:

```key
Ctrl+O
F3
```

Kilépés:

```key
Ctrl+X
F2
```

## IP cím beállítása

### Aktuális beállítás

Aktuális IP cím megtekintése:

```bash
ip addr show
```

Röviden:

```bash
ip a
```

Fix IP cím beállítása:

```bash
ip address add 192.168.10.11/24 dev enp0s3
```

Dinamikus IP cím kérése:

```bash
dhclient enp0s3
```

### Tartós beállítás

```bash
nano /etc/network/interfaces
```

## Folyamatkezelés

A folyamatok megjelenítése:

```bash
ps
```

## Átirányítások

Fájlba irányítás:

```bash
echo kék > szinek.txt
```

Fájl tartalmát a kimenetre irányítjuk:

```bash
cat < szinek.txt
```

## Csomagkezelés

Csomaginformációk frissítése

```bash
apt update
```

```bash
apt install mc
```

## Jelszavak beállítása

A felhasználó saját jelszavának beállítása:

```bash
passwd
```

A rendszergazda mások jelszavát is beállíthatja:

```bash
passwd mari
```
