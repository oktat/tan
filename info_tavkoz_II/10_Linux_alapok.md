# Linux alapok

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: https://szit.hu

## A Linux szerepe

A Linux kezdetben szerverek kedvenc operációs rendszere. Manapság a fejleszők is előszeretettel választják asztali felületükhöz. 

A Google kezdetben (2012) Ubuntu Linux alapokon készített saját Linuxot Goobuntu néven, amit akkor csak ajánlott a fejlesztőinek. Később már csak ezt lehetett választani, Windows külön kellett kérni. 2018-ban a cég Ubuntu helyett Debian GNU/Linux alapokra váltott, a neve [gLinux](https://en.wikipedia.org/wiki/GLinux).

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

Könyvtár létrehozása:

```bash
mkdir valami
```

Mindig van egy aktuális könyvtár. Ha készítettünk egy könyvtárat beléphetünk abba és aktuálissá válik. Belpés a "valami" nevű könyvtárba:

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
2. A fa nevű könyvtárban készítsen egy tolgy.txt fájlt.
3. A fa nevű könyvtárban készítsen egy hars.txt fájlt is.

## Rendszergazdai üzemmód

Rendszergazdai üzemmódba a **su** paranccsal léphetünk. Ha a su név után egy kötőjelet is megadun, akkor root felhasználó teljes környezetét megkapjuk.

```bash
su -
```
