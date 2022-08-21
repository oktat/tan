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
