# Webprogramozás - HTML

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Globális attribútumok

A globális attribútmok az összes HTML elemhez hozzárendelhetők.

| Attribútum | Leírás |
|-|-|
| accesskey | Billentyűkombináció megadása, amivel egy elem fokuszba kerülhet. Egy karaktert kell megadni. Chrome böngészőben az Alt billentyűvel működik. Firefoxban Alt+Shift mellett működik. &lt;input accesskey="c"&gt; esetén: alt+c |
| class | Egy vagy több osztálynév adható egy elemnek. Ezekre hivaktozhatunk a stíluslapokban. |
| contenteditable | Az elem tartalma szerkeszhető vagy nem. |
| data-* | Egyéni adatok megadása |
| dir | A szöveg irányának beállítása |
| draggable | A szöveg megragadható, vagy nem. |
| hidden | Megmondja, hogy egy elem még nem, vagy már nem releváns |
| id | Egyedi azonosító egy elem számára |
| lang | Beállítható az elem tartalmának nyelve |
| spellcheck |  Az elmnek kell-e ellenőrizni a nyeltanát |
| style | Inline CSS |
| title | Extra információ az elem számára |
| translate | Egy elem tartalmát le kell fordítani, vagy nem. |

Rejtett bekezdés:

```html
<p hidden>Rejtett bekezdés</p>
```

Helyesírás ellenőrzés:

```html
<p contenteditable="true" spellcheck="true">
  Írd át a szöveget
</p>

Teljes-név: <input type="text" name="fullname" spellcheck="true">
```

Ne legyen lefordítva:

```html
      <p translate="no">Don't translate it.</p>
      <p>This can be translated.</p>
```

Például: jobb egér gomb a weblapon, majd: "Fordítás magyar nyelvre"

## Táblázat elemei

A HTML táblázatot sorokkal, a sorokon belül adatcellákkal jelöljük. A táblázatot a **table** elemmel jelöljük, a sorokat a **tr** elemmel. A soron belül a fejrész cellákat **th**, az adatcellákat **td** elemmel jelöljük.

A HTML tábla további elemeket tartalmazhat:

* captain
* colgroup
* thead
* tbody
* tfoot
* col

Egy egyszerű táblázat:

```html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">    
    <title>Document</title>
<style>
table, th, td {
    border: 1px solid black;
}
</style>
</head>
<body>

    <table>
        <tr>
          <th>Hónap</th>
          <th>Spórolás</th>
        </tr>
        <tr>
          <td>Január</td>
          <td>1000 Ft</td>
        </tr>
      </table>
    
</body>
</html>
```

A táblázat celláinak szegélye között alapértelmezetten van egy kis tér. A cella szegélyeket összeomlaszthatjuk egybe a border-collapse tulajdonság collapse értékével.

```css
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
```

A táblázatoknak megadható összefoglaló attribútum és felirat.

```html
<table border="1" summary="Mi van a táblázatban">
  <caption>Költségvetés</caption>
  <tr>
    <th>Hónap</th>
    <th>Spórolás</th>
  </tr>
  <tr>
    <td>Január</td>
    <td>1000 Ft</td>
  </tr>
</table>
```

### Oszlopnyúlás

```html
<table>
    <tr>
      <th colspan="2">Költségek</th>
    </tr>
    <tr>
      <th>Hónap</th>
      <th>Spórolás</th>
    </tr>
    <tr>
      <td>Január</td>
      <td>1000 Ft</td>
    </tr>
</table>
```

<table>
    <tr>
      <th colspan="2">Költségek</th>
    </tr>
    <tr>
      <th>Hónap</th>
      <th>Spórolás</th>
    </tr>
    <tr>
      <td>Január</td>
      <td>1000 Ft</td>
    </tr>
</table>

### Sornyúlás

```html
<table>
  <tr>
    <th rowspan="2">Adatok</th>
    <th>Hónap</th>
    <th>Spórolás</th>
  </tr>
  <tr>
    <td>Január</td>
    <td>1000 Ft</td>
  </tr>
</table>
```

<table>
  <tr>
    <th rowspan="2">Adatok</th>
    <th>Hónap</th>
    <th>Spórolás</th>
  </tr>
  <tr>
    <td>Január</td>
    <td>1000 Ft</td>
  </tr>
</table>

### Sor- és oszlopnyúlás

```html
<table>
  <tr>
    <th rowspan="3">Adatok</th>
    <th colspan="2">Költségek</th>
  </tr>
  <tr>
    <th>Hónap</th>
    <th>Spórolás</th>
  </tr>
  <tr>
    <td>Január</td>
    <td>1000 Ft</td>
  </tr>
</table>
```

<table>
  <tr>
    <th rowspan="3">Adatok</th>
    <th colspan="2">Költségek</th>
  </tr>
  <tr>
    <th>Hónap</th>
    <th>Spórolás</th>
  </tr>
  <tr>
    <td>Január</td>
    <td>1000 Ft</td>
  </tr>
</table>

### Oszlopok külön stílusban

```html
<table>
  <colgroup>
    <col span="2" style="background-color:yellow">
    <col style="background-color:blue">
  </colgroup>
  <tr>
    <th>No.</th>
    <th>Név</th>
    <th>Település</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Nagy József</td>
    <td>Szolnok</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Peres Ferenc</td>
    <td>Szeged</td>
  </tr>
</table>
```

<table>
  <colgroup>
    <col span="2" style="background-color:yellow">
    <col style="background-color:blue">
  </colgroup>
  <tr>
    <th>No.</th>
    <th>Név</th>
    <th>Település</th>
  </tr>
  <tr>
    <td>1</td>
    <td>Nagy József</td>
    <td>Szolnok</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Peres Ferenc</td>
    <td>Szeged</td>
  </tr>
</table>

### A táblázat részeinek csoportosítása

```html
<table>
  <thead>
    <tr>
      <th>Név</th>
      <th>Fizetés</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Nagy János</td>
      <td>3850000</td>
    </tr>
    <tr>
      <td>Kemény Ferenc</td>
      <td>2870000</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td>Összesen</td>
      <td>6720000</td>
    </tr>
  </tfoot>
</table>
```

Link:

* [https://developer.mozilla.org/en-US/docs/Learn/HTML/Tables/Basics](https://developer.mozilla.org/en-US/docs/Learn/HTML/Tables/Basics)

## Szemantikus elemek

A szemantikus elemek tartalma egyértelmű.
Mint például:

* table
* form
* figure
* img
* article
* stb.

Tudjuk, hogy a table elemben táblázatot teszünk, a form elembe űrlapot, a figure elembe valamilyen doboz feliratát, az img elemmel képet jelenítünk meg, az article elembe valamilyen cikk tartalmát rakjuk.

### Oldalszerkezet meghatározók

Az oldal szerkezetét meghatározó szemantikus elemek a következők:

* article
* aside
* header
* footer
* section
* nav

Lássuk mire valók:

* **section**: Összetartozó tartalmakat jelölünk vele, mint a div elemmel.
* **aside**: Érintőlegesen kapcsolódó tartalom, amely általában bal vagy jobb oldalon helyezkedik el. Ha valami a fő tartalom bal vagy jobb oldalán helyezkedik el, az még nem elegendő ok arra, hogy aside elembe helyezzük. Tegye fel magának a kérdést. Ha törlöm a félreeső tartalmat, a fő tartalom jelentése változik? Ha nem változik meg, akkor a megfelelő módon használjuk.
* **header**: Ez a header nem tévesztendő össze egy weboldal fejrészével, bár ott is használható. A HTML5 header elem akár többször is szerepelhet egy weblap részeként, például a section elemen belül. A section elemnek is lehet külön header vagy footer része.
* **nav**: Az egész webhely navigációs információit helyezzük el benne.
* **footer**: Nem a weboldal alsó részéről van szó, bármelyik szakaszban használható. De jelölhetjük vele a weblap alját is.

* [http://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#szemantikus_elemek](http://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#szemantikus_elemek)

## Médiaelemek

A HTML5 óta médiák megjelenítésre szemantikus elemek állnak rendelkezdésre, úgymint audio, video, source elemek.

```html
<video  width="300" height="300">
    <source src="sample3.ogg">
    <source src="sample1.mp4">
</video>
```

```html
<audio controls="controls">
  <source src="hangfajl.ogg" type="audio/ogg">
  <source src="hangfajl.mp3" type="audio/mpeg">
A böngésződ nem támogatja az audio elemet. 
</audio>
```

A médiaelemekről több információ:

* [https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#video](https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#video)

## Meta elemek és SEO-alapok

```html
<meta name="érték" content="érték" /> 
```

```html
<meta name="keywords" content="web, html, css">
```

Példák:

```html
<meta name="generator" content="Bluefish">
<meta name="author" content="Sallai András">
<meta name="date" content="2009-01-01">
<meta name="copyright" content="© 2009, Sallai András">
<meta name="keywords" content="web, html, css">
<meta name="description" content="Weboldal készítése">
<meta name="ROBOTS" content="NOINDEX, NOFOLLOW">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="expires" content="0">
```

A meta elemek jelentése:

* A weboldalt készítő program
* A weboldal írója, szerzője – Lehet bő felsorolás is.
* A készítés dátuma
* Terjesztési feltételek
* Kulcsszavak
* Leírás
* A keresőrobotok indexeljék-e a weboldalt
* Weboldal kódolása
* A weblap lejár

Újabb példák:

```html
<meta name="contact" content="nagyontitkospostafiok@gmail.com" />
<meta http-equiv="last-modified" content="YYYY-MM-DD@hh:mm:ss TMZ" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="content-language" content="hu,en" />
<meta http-equiv="pragma" content="no-cache" />
```

Jelentésük:

* A weboldal tulajdonosának elérhetősége (A spammerek botjai figyelik!)
* Utolsó módosítás
* Az oldal legyen tárolva a böngésző tárolójában (cache).
* A content-language tartalma az ISO 639-1 alapján meghatározott két betű.
* A pragma csak egy másik lehetőség a weblap tárolásának megakadályozására.

### Keresőrobotok

A kereső webhelyek automatizált programokat használnak más webhelyek feltérképezésére. Ezeket a programokat nevezzük keresőrobotoknak. A keresőrobotokat vezérelhetjük egy meta elemmel:

```html
<meta name="robots" content="NOINDEX, NOFOLLOW">
```

Lehetséges értékek:

* All
* Index, follow - ugyanaz, mint az all
* NoIndex
* NoFollow
* NoIndex, NoFollow

A NoIndex értékkel azt mondjuk egy keresőrobotnak, hogy ne indexelje a weblapot, mert nem szeretnék a keresőkben viszontláti a weblapot.

### SEO

A SEO a Search Engine Optimization rövidítése. Magyarul keresőoptimalizálás.

Általában azt szeretnénk, ha a közzétett webhelyünk a keresőkben minél előreébb szerepeljenek a találatokban.

A keresőnek ehhez megfelelő kulcsszavakat és leírást kell társítanunk a weblapunkhoz. Példa:

```html
<meta name="keywords" content="web, html, css">
<meta name="description" content="Weboldal készítése">
```

A keywords content részében szerepeltetjük, milyen szavakra keresve találjanak rá az oldalunkra. A description content részében írjuk le mi van az oldalunkon. Vigyázzunk mit írunk ezekbe a content értékeknek. Ha az ide beírt tartalom nem egyezik a weboldal látható tartalmával, a keresők nem fogják szerepeltetni a találatok között.

A keywords értékei olyan kulcsszavak legyenek, amik valóban szereplnek a weblapon. A description szavai, vagy az egész mondat szintén szerepeljen a weblapon is.

## Viewport

A reszponzív webhelyek nélkülönözhetetlen része a viewport beállítása:

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

A nézetablak (viewport) a felhasználó által látható terület. A mobiltelefonon ez kisebb, mint a számítógép képernyőjén. A mobileszközök a viewport beállítása után nem kicsinyítik mobil eszközön a weblapot.

A viewport segítségével a webhely készítője szabályozhatja az weblap méreteit. A width=device-width úgy állítja be az weboldal szélességét, hogy az kövesse az eszköz szélességét.

Az initial-scale=1.0 a kezdeti nagyítási szintet állítja be. Kezdeti nagyítási szint alatt az oldal betöltésekor adott méretett értjük.

## Gyakorlat

### Gyakorló kérdések

1.)
Milyen HTML elemekhez rendelhető a class attribútum?

* bármilyen
* csak div
* csak span
* csak p

2.)
Mi a szerepe az id attribútumnak?

* Azonosítót rendelhetünk bármelyik HTML elemnek
* Azonosítót rendelhetünk a div elemhez, és csak ehhez
* A tartalom nyelvét tudjuk beállítani
* A szöveg irányát tudjuk megadni

3.)
Milyen elemhez rendelhető a lang attribútum?

* Csak a html elemhez
* Bármely elemhez
* Csak a body elemhez
* A text elemhez

4.)
Mire jó a style HTML attribútum?

* Egyéni adatok megadására
* Soron belül tudunk stílus rendelni az adott elemhez
* Extra információ egy elem számára
* Egy elem tartalmát fordítani kell vagy nem

5.)
Mire jó a table elemen belül a captain elem?

* A táblázat fejrészét határozzuk meg vele
* A táblázat számára leírást adhatunk
* A táblázat szegélyét szabályozhatjuk vele
* A táblázat lábrészét adhatjuk meg vele

6.)
Mire jó a colspan attribútum egy táblázatban?

* A táblázat feliratát szabályozzuk vele
* A táblázat összefoglaló szövegét adhatjuk meg vele
* A táblázat celláit össezvonhatjuk oszlopokon keresztül
* A táblázat celláit összevonhatjuk sorokon keresztül

7.)
Mit csinál a következő attribútum: &lt;td colspan="3"&gt;?

* Három soron keresztül összevonja az adott cellát
* Három cella jelenik meg, egy helyett
* Három pixellel nagyobb lesz a cella mérete
* Három oszlopon keresztül összevonja az adott cellát

8.)
Melyik HTML elemmel csoportosíthatjuk egy táblázat oszlopait?

* tr
* colgroup
* td
* tbody

9.)
A táblázat alsó részét csoportosíthatjuk a következő HTML elemmel:

* tfoot
* footgroup
* groupfoot
* footer

10.)
Milyen tartalmat adhatunk meg az aside elemmel?

* Az oldal lényegi tartalma
* Kapcsolódó tartalom
* Az oldal fő navigációs sávja
* Képek megjelenítésére használható
