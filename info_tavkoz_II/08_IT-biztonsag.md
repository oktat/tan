# IT-biztonság

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Malware

Kártokozó szoftvereket összefoglaló néve: malware.

Többféle malware létezik:

* worm
* backdoor
* trojan horse
* rootkit
* adware - reklámot jelenít meg
* joke - program, ami megtréfál
* riskware - valamilyen környezetben veszélyes program
* spyware - kémprogram
* ransomware - fenyegetéssel pénz kicsalása
* makró - dokumentumokban kártékony makrók
* file infector - fájlfertőző

## Védekezés kártevők ellen

* ESET
* Avast
* Symantec Norton
* Bitdefender
* Panda
* AVG
* McAfee
* G DATA
* F-Secure
* IObit
* Watchdog
* Zyxel

Ingyens vírusírtók:

* Windows Defender
* Panda Free Antivirus
* Kaspersky Security Cloud
* Bitdefender
* Avira

## Hálózati támadások

### DoS támadás

A szolgáltató szervert a szolgáltatás megtagadására veszi rá a támadó.

Például, sok TCP kapcsolatot nyit a támadó a szerverre.

### Jelszó alapú támadások

A jelszóval védett felületek támadása, valamilyen próbálkozással.

## Megtévesztési technikák

Nem technikai jellegű támadások, pszichológiai befolyásolás.

* DNS átregisztráció
* Jelszó megkérdezése
* Bank ügyfeleinek megtévesztő e-mail

## Biztonsági házirend

A szervezeteknél gyakorlattá vált a biztonsági házirend írása, ami tartalmazza az IT eszközök és a hálózat használatának szabályait, céljait.

Olyanokat tartalmaz mint:

* fájlok kezelésének szabályzata
* jelszóhasználati szabályok
* stb.

## Adatmentés

## Jogosultságok, titkosítás

## Biztonságos törlés

## BIOS jelszó

## Windows helyi házirend

Alaphelyzetbe állítás:

```cmd
secedit /configure /verbose /cfg %windir%infdefltbase.inf /db defltbase.sdb
```

A helyi házirend szerkesztése:

```cmd
secpol.msc
```

## Windows felhasználó és csoportkezelés

## Böngészők biztonsági beállításai

### Privátböngészés

Privát ablak nyitása:

* Google Chrome - Ctrl + Shift + N
* Firefox - Ctrl + Shift + P
* Vivaldi - Ctrl + Shift + N

## Hibajavítás telepítése

## Vezeték nélküli eszközön hitelesítés

### EAP hitelesítési protokoll

Az EAP a **Extensible Authentication Protocol** rövidítése. Magyarul: kiterjeszthető hitelesítő protokoll.
Valójában szállító protokoll, hitelesítésre optimalizálva.

### Titkosító protokollok

* WEP
* TKIP
* AES-CCMP
* WPA

### RADIUS

A RADIUS a **Remote Authentication Dial In User Service** rövidítése. Magyarul: Távoli hitelesítő, betárcsázós felhasználói szolgáltatás. Eredetileg AAA, azaz Authentication, Authorization, and Accounting; magyarul: Hitelesítés, Hozzáférés, Naplózás. 

A RADIUS egy protokoll, amit Központosított hitelesítő adatbázisnak szokás használni. UDP protokoll felett működik.

## SOHO firmware

Letöltési központ és emulátorok:

* [https://www.tp-link.com/hu/support/](https://www.tp-link.com/hu/support/)

* [https://www.tp-link.com/hu/support/emulator/](https://www.tp-link.com/hu/support/emulator/)
* [https://emulator.tp-link.com/TL-WR702N/Index.htm](https://emulator.tp-link.com/TL-WR702N/Index.htm)

* System Tools
* Firmware
* Fájl kiválasztása
* Upgrade

## SOHO porttovábbítás

* [https://emulator.tp-link.com/941_v6_v3/Index.htm](https://emulator.tp-link.com/941_v6_v3/Index.htm)

* Forwarding
* Add New...
