# Reszponzív

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## A reszponzív weblapokról

A reszponzív tervezéshez újabban betűszavakat hoznak létre. Responsive Web Design, és RWD-ként rövidítik.

A legkülönfélébb eszközökön szeretnénk a weblapot optimálisan megjeleníteni.

A cél eléréshez az elemek méretét, helyét százalékban adjuk meg.

## Mobile First Design

A mobilhasználat nagyságrendje okán, elsőként mobil eszközre készítjük el a weboldalt.

Fontos a tartalmi elemek megfelelő sorrendjének megtalálása.

A mobileszközök esetén is keressük meg a legkisebb felbontást. Legyen a legkisebb például 320x50 pixel.

## Progressive enhancement

A webtartalom minél hamarabbi megjelenítése a célja. Ne kelljen várni JavaScript futásra sem, inkább töltődjön a HTML a tartalommal együtt azonnal.

Ez segíti az internetes kereső motorok működését is, de a letöltés is gyorsabb.

Az stílust és az animációt CSS-sel határozzuk meg. A JavaScript egyéb fejlesztésekre használatos.

A technik a Graceful degradation fejlesztés továbbgondolt változata. Ennek lényege, hogy a mobilos verziókból a lényegtelen részeket egyszerűen elhagyjuk.

A Graceful degradation ellentétje, a kicsitől a nagyobbig elv, amikor elsőként kevesebb funkcióval fejlesztek kisebb eszközökre.

## Médialekérdezések

A CSS2 bemutatta médiatípusokat. Ez lehetővé teszi stílusok meghatározását különböző médiatípusokhoz.

Például más stílust lehet beállítani a nyomtatott médiához és más a képernyőhöz.

A CSS3-ban bevezették az eszköz képességeinek lekérdezését, a szimpla típusfigyelés helyett.

Miket figyelhetünk a médialekérdezések során:

* Felbontás.
* A nézet szélesség és magassága.
* A készülék szélessége és magassága.
* Tájolás (fekvő vagy álló)

Szintaxis:

```css
@media not|only médiatípus and (kifejezés) {
    /* Ide jön a CSS kód */
}
```

A webfelületen különböző stíluslapok médiához igazítva:

```html
<link rel="stylesheet" media="típus and|not|only (kifejezés)" href="fajlnev.css">
```

Példa:

```css
@media screen and (min-width: 450px) {
    .doboz {
        background-color: blue;
    }
}
```

## Töréspontok

A töréspontok segítségével a webhely tartalma különböző módon reagál az eszköz szélességére. A töréspontokat a médialekérdezés teszi lehetővé.

Lássunk néhány gyakori töréspontot:

* 320
* 480
* 768
* 1024
* 1200

Nincs meghatározva a töréspontok száma, de érdemes legalább 3 töréspontot használni.

## Viewport

A viewportot, mint tulajdonság a mobileszközök elterjedése indukálta.

A viewport az a terület a böngészőben, ahol megjelenik a weboldal.

Viewport beállítás nélkül, ha egy átlagos PC monitorára elkészítettünk egy szöveges tartalmat, a mobileszközön a szöveg apró és olvashatlan.

A viewport beállítása:

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

Ha a weblapot 320 pixel szélességű eszközhöz készítenénk, írhatnánk ezt:

```html
<meta name="viewport" content="width=320" />
```

Eszközhöz igazított méret:

```html
<meta name="viewport" content="width=device-width" />
```

Megadhatunk magásságot is, ha úgy tetszik:

```html
<meta name="viewport" content="width=device-height" />
```

A nagyítás mértékét az initial-scale tulajdonsággal végezzük:

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

Egyéb tulajdonságok:

* user-scalable=no - felhasználói zoom tiltása
* minimum-scale=1.0 - zoom minimum
* maximum-scale=3.0 - zoom maximum

A W3C hivatalos viewport szabványa:

```css
@viewport {
    width: device-width;
    zoom: fixed;
    zoom: 1.0;
    min-zoom: 1;
    max-zoom: 3;
}
```

Opera esetén ajánlott előtag használata:

```css
@-o-viewport {
    width: device-width;
    zoom: fixed;
    zoom: 1.0;
    min-zoom: 1;
    max-zoom: 3;
}
```

## Médialekérdezés és viewport

```css
@media screen and (min-width: 740px) and (max-width: 1024px) {
    @viewport { width: 740px; }
}
```

## Mértékegységek

Kétféle mértékegység van:

* relatív
* abszolút

### Realatív hosszmértékek

| mértékegyésg | Leírás  |
|--------------|---------|
| em | A releváns karakter mérete |
| px | képpont; eszközfüggő |
| ex | A releváns karakter x-magassága |
| % | Százalékban megadott érték |
| ch | A "0" szélességhez relatívan |
| rem | A gyökérelem fontszélességéhez relatívan |
| vw | A viewport szélességének 1%-hoz relatívan |
| vh | A viewport magasságának 1%-hoz relatvan |
| vmin | A viewport kisebb dimenziójához képest 1%-al |
| vmax | A viewport nagyobb dimenziójához képest 1%-al |

### Abszolút hosszmértékek

| mértékegyésg | Leírás  |
|--------------|---------|
| in | inch; hüvelyk; 25,4 mm |
| cm | centiméter |
| mm | milliméter |
| pt | pt; pont; 1/72 hüvelyk; kb.: 0,352 mm |
| pc | pica; 12 pont, 3/18 hüvelyk; kb.: 4,23 mm |

### Mit mikor ajánlott használni?

| Média | Ajánlott | Alkalmanként | Nem ajánlott |
|-------|----------|--------------|--------------|
| Képernyő | px, em, % | ex | mm, cm, in, pt, pc |
| Nyomtatott | mm, cm, in, pt, pc, em, % | px, ex, | |

## CSS keretrendszerek

A CSS keretrendszerek előre elkészített stílusok és komponensek gyűjteménye. Hatékonyabb és termelékenyebb fejlesztést tesznek lehetővé.

* Bootstrap
* Foundation
* Materialize
* Tailwind CSS
* Bulma
* UIkit
* Primer
