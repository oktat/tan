# Algoritmusok és adatszerkezetek

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Algoritmusok bonyolultsága

### Bonyolultság

* [https://szit.hu/doku.php?id=oktatas:programozas:algoritmusok:bonyolultsag](https://szit.hu/doku.php?id=oktatas:programozas:algoritmusok:bonyolultsag)

### Tömb

Öt egész szám tárolására alkalmas tömb:

```java
int[] szamok = new int[5];
a[0] = 35;
a[1] = 22;
a[2] = 72;
a[3] = 14;
a[4] = 28;
```

```java
int[] szamok = {35, 22, 72, 14, 28};
```

```java
import java.util.ArrayList;
//...

ArrayList<Integer> szamLista = new ArrayList<>();

szamLista.add(35);
szamLista.add(22);
szamLista.add(72);
szamLista.add(14);
szamLista.add(28);
```

```java
import java.util.ArrayList;
import java.util.Arrays;
//...

Integer[] szamok = {35, 22, 72, 14, 28}
ArrayList<Integer> szamLista = new ArrayList<>(Arrays.asList(b));

//bejárás:
for(Integer szam : szamLista) {
    System.out.println(szam);
}
```

```java
import java.util.LinkedList;
//...

LinkedList<Integer> szamLista = new LinkedList<>();

szamLista.add(35);
szamLista.add(22);
szamLista.add(72);
szamLista.add(14);
szamLista.add(28);
```

Teljeskód:

```java
import java.util.LinkedList;

public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("LinkedList használata");

        LinkedList<Integer> szamLista = new LinkedList<>();
        szamLista.add(35);
        szamLista.add(22);
        szamLista.add(72);
        szamLista.add(14);
        szamLista.add(28);
        for(Integer szam : szamLista) {
            System.out.println(szam);
        }
    }
}
```

Még több információ:

* [https://szit.hu/doku.php?id=oktatas:programozas:java:java_kollekciok#arraylist](https://szit.hu/doku.php?id=oktatas:programozas:java:java_kollekciok#arraylist)

### Elemi adatszerkezetek

* [https://szit.hu/doku.php?id=oktatas:programozas:elemi_adatszerkezetek](https://szit.hu/doku.php?id=oktatas:programozas:elemi_adatszerkezetek)

### Hashmap

* [https://szit.hu/doku.php?id=oktatas:programozas:java:java_kollekciok#hashmap](https://szit.hu/doku.php?id=oktatas:programozas:java:java_kollekciok#hashmap)

### Nevezetes algoritmusok

Ajánlott videók:

* [https://www.youtube.com/user/AlgoRythmics](https://www.youtube.com/user/AlgoRythmics)

#### Buborék rendezés

* [https://szit.hu/doku.php?id=oktatas:programozas:programozasi_tetelek:mondatszeru_leiras#buborekrendezes](https://szit.hu/doku.php?id=oktatas:programozas:programozasi_tetelek:mondatszeru_leiras#buborekrendezes)

#### Rendezés beszúrással

* [https://szit.hu/doku.php?id=oktatas:programozas:programozasi_tetelek:mondatszeru_leiras#rendezes_beszurassal](https://szit.hu/doku.php?id=oktatas:programozas:programozasi_tetelek:mondatszeru_leiras#rendezes_beszurassal)

#### Gyorsrendezés

* [https://szit.hu/doku.php?id=oktatas:programozas:programozasi_tetelek:mondatszeru_leiras#gyorsrendezes](https://szit.hu/doku.php?id=oktatas:programozas:programozasi_tetelek:mondatszeru_leiras#gyorsrendezes)

#### Bináris keresés

* [https://szit.hu/doku.php?id=oktatas:programozas:programozasi_tetelek:mondatszeru_leiras#binaris_logaritmikus_vagy_felezeses_kereses](https://szit.hu/doku.php?id=oktatas:programozas:programozasi_tetelek:mondatszeru_leiras#binaris_logaritmikus_vagy_felezeses_kereses)

### Rekurzió

* [https://szit.hu/doku.php?id=oktatas:programozas:java:java_megoldasok#rekurzio](https://szit.hu/doku.php?id=oktatas:programozas:java:java_megoldasok#rekurzio)

* [https://szit.hu/doku.php?id=oktatas:programozas:programozas_elmelet:tananyag#rekurzio](https://szit.hu/doku.php?id=oktatas:programozas:programozas_elmelet:tananyag#rekurzio)
