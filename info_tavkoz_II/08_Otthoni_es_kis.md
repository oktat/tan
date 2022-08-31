# Otthoni és kisvállalati hálózatok építése és beállítása

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Az otthoni és kisvállalati hálózatok eszközei

* SOHO router
* switch
* Wifi jelismétlő

## Protokollok

* HTTP
* FTP

## ping és traceroute használata

```cmd
ping 192.168.10.11
```

## IOS show parancsai

```cisco
#show running-config
```

```cisco
#show startup-config
```

```cisco
S1#show ip interface brief
```

MAC tábla megtekintése:

```cisco
S1#show mac-address-table 
```

## IP címzés

```cmd
ifconfig
```

```cmd
ifconfig /all
```

## Hálózati hibaelhárítás

Ellenőrizzük a következőket:

* Be van kapcsolva készülék? - tápkábel
* Az elosztó vagy útválasztó be van kapcsolva?
* A hálózati vezetékek csatlakoztatva vannak?

Ha a készülék be van kapcsolva:

* Be van állítva IP cím a problémás eszközön?
* Van beállítva biztonsági szoftver?

WLAN esetén:

* Nincs túl messze WLAN hozzáférési ponttól?
* Van akadály a hozzáférési pont és készülék között?

Nincs Internet tünet:

* Az eszközök be vannak kapcsolva?
* A csatlakozás rendben van?
* IP cím be van állítva?
* A szomszédos gép, vagy az átjáró elérhető?
* Az Interneten a ping paranccsal elérhető bármilyen gép?
* Működik a DNS feloldás?

Hibaelhárítás Windowson:

* [https://support.microsoft.com/](https://support.microsoft.com/hu-hu/windows/a-h%C3%A1l%C3%B3zati-kapcsolati-hib%C3%A1k-elh%C3%A1r%C3%ADt%C3%A1sa-a-windowsban-166a28c4-14c1-bdb1-473c-09c1571455d8#Category=Windows_10)

## Dokumentálás

Dokumentáljuk a következőt:

* Mik a tünetek?
* Milyen lépéseket tettünk.
* Milyen lépések voltak hatástalanok.

## Információgyűjtés

* Hiba megerősítése.
* Kikérdezzük a beszámoló egyént.
* Az érintett eszközökről gyűjtünk információt.
* A naplófájlokról másolatot készítünk, ha vannak.
