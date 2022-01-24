# Webprogramozás - HTML és CSS

* HTML, CSS
* Sallai András
* 2022

## Táblázat elemei és CSS

A táblázat teljes leírása a következő
helyen található:

[https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#tablazat](https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#tablazat)

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

### Szemantikus elemek

article, aside, header, footer, section, nav

* section: Összetartozó tartalmakat jelölünk vele, mint a div elemmel.
* aside: Érintőlegesen kapcsolódó tartalom, amely általában bal vagy jobb oldalon helyezkedik el. Ha valami a fő tartalom bal vagy jobb oldalán helyezkedik el, az még nem elegendő ok arra, hogy aside elembe helyezzük. Tegye fel magának a kérdést. Ha törlöm a félreeső tartalmat, a fő tartalom jelentése változik?
* header: Ez a header nem tévesztendő össze egy weboldal fejrészével, bár ott is használható. A HTML5 header elem akár többször is szerepelhet az oldalon, részeként például a section elemnek.
* nav: Az egész webhely navigációs információinak tárolására létrehozva.
* footer: Nem a weboldal alsó részéről van szó, bármelyik szakaszban használható.

### Médiaelemek

Audio, video, source

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

A médiaelemek részletes leírása:

* [https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#video](https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#video)

### Meta elemek és SEO-alapok

```html
<meta name="érték" content="érték" /> 
```

```html
<meta name="keywords" content="web, html, css">
```

A meta elemek részletes leírása:

* [https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#meta_elemek](https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#meta_elemek)

### Viewport

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

### Konkurens stílusok

* Szerzői - Webmester írja
* Felhasználói - A böngészőben beállítható saját CSS
* Klines - böngészőnek is van saját stílusa

### CSS - táblázatok

```css
.table_001 {
   border: 1px solid black;
   border-collapse: collapse;
}
.table_001 tr td{
   border: 1px solid black;
   padding: 10px;
}
```

A collapse hatására a táblázat
cellái között megszűnik az üres hely.

A táblázatokról részletesen:

[https://szit.hu/doku.php?id=oktatas:web:css:css_nyelv#tablazatok](https://szit.hu/doku.php?id=oktatas:web:css:css_nyelv#tablazatok)

### nth-child

A nth-child ál-osztály lehetővé teszi
ismétlődő elemek esetén adott számú
elem külön formázását.

```html
<table>
  <tr>
    <td>termék1</td>
    <td>termék2</td>
  </tr>
  <tr>
    <td>termék1</td>
    <td>termék2</td>
  </tr>
  <tr>
    <td>termék1</td>
    <td>termék2</td>
  </tr>
  <tr>
    <td>termék1</td>
    <td>termék2</td>
  </tr>
</table>
```

```css
tr:nth-child(3) {
    background-color: orange;
}
```

Több információ az nth-child állosztlyról:

* https://szit.hu/doku.php?id=oktatas:web:css:css_szelektorok#az_nth-child_al-osztaly

### media query

```css
/* A szöveg alapértelmezett színe */
body {
  background-color: blue;
}
 
/* 900px vagy kisebb kijelző esetén */
@media screen and (max-width: 900px) {
  body {
    background-color: green;
  }
}
 
/* Képernyőn és 700px vagy annál kisebb kijelzőn */
@media screen and (max-width: 700px) {
  body {
    background-color: yellow;
  }
}
```

### Színek

A színek az RGB színtér használatával vagy nevekkel adhatók meg.

Szín névvel:

```css
p {
    background-color: olive;
}
```

Szín RGB kóddal, hexadecimálisan:

```css
p {
    background-color: #8080000;
}
```

Szín RGB kóddal, decimálisan:

```css
p {
    background-color: rgb(128, 128, 0);
}
```

```css
p {
    background-color: rgba(128, 128, 0, 1);
}
```

Rövidítés:

```css
p {
    background-color: #333;
}
```

Egyenértékű ezzel:

```css
p {
    background-color: #333333;
}
```

### Átlátszatlanság

Beállítás egy doboz számára:

```css
.doboz {
    opacity: 0.6;
}
```

Beállítás a doboz háttérszínének:

```css
.doboz {
   background-color:rgba(255, 0, 0, 0.3);
} 
```

Több információ:
* https://szit.hu/doku.php?id=oktatas:web:css:css_nyelv#atlatszatlansag

### Színátmenet

```css
.doboz {
  background-image: linear-gradient(navy, blue);
}
```

A színátmenetekről bővebben:

* [https://szit.hu/doku.php?id=oktatas:web:css:css3#szinatmenet](https://szit.hu/doku.php?id=oktatas:web:css:css3#szinatmenet)

### Dobozok árnyékolása

```css
.egy {
  box-shadow: 15px 15px 15px black;
}
```

### Körvonal

A körvonal olyan vonal, amelyet a doboz köré
húzunk, a szegélyen kívül. Egy elem
kiemelésére használható.

A következő tulajdonságok használhatók:

* outline-style
* outline-color
* outline-width
* outline-width
* outline-offset - milyen távol jelenjen meg
* outline

A körvonal az elemeken kívül rajzolódik,
így átfedhet más tartalmakat. A körvonal nem
része az elem méreteinek sem.

### Szöveg árnyék

```css
.egy {
  text-shadow: 5px 5px 5px black;
}
```

### Szegély lekerekítése

```css
.egy {
  border-radius: 15px;
}
```

### >, +, ~ szelektorok

* div > p
  * p elem, aminek szülője egy div
* div + p
  * az első p elem a div után
* div ~ p
  * az összes p elem, amit megelőz egy div

### Attribútum szelektorok

```html
<a>a elem</div>
<a target="_blank">a elem</div>
```

```css
a[target] {
    background-color: blueviolet;
}
```

### Előtte és utána

::before ::after

```html
<div class="egy">Első</div>
<div class="ketto">Második</div>
<div class="harom">Harmadik</div>
```

```css
.egy::before {
    content: "előtte";
    background-color: blueviolet;
}
```

```css
.egy::after {
    content: "utána";
    background-color: blueviolet;
}
```

### Flex doboz

```html
<div class="burkolo">
 
    <div class="egy">
        Lorem ipsum dolor sit amet.
    </div>
    <div class="egy">
        Lorem ipsum dolor sit amet.
    </div>
    <div class="egy">
        Lorem ipsum dolor sit amet.
    </div>
 
</div>
```

```css
.burkolo {
    display: flex;
}
 
.egy {
    padding: 10px;
    background-color: orange;
}
```

Több információ:
* https://szit.hu/doku.php?id=oktatas:web:css:css_flex

### Grid dobozok

```html
<div class="grid">
    <div class="item">a</div>
    <div class="item">b</div>
    <div class="item">c</div>
    <div class="item">d</div>
    <div class="item">e</div>
</div>
```

```css
.grid {
    display: grid;
    grid-template-columns: 1fr 2fr;
    grid-template-rows: 50px 50px 50px;
    grid-gap: 30px;
}
 
.item {
    background-color: orange;
}
```

Az fr a Grid elrendezési lehetőséggel együtt
érkezett. Az fr a „fractional unit” rövidítése, ami töredék résznek fordítható. **1fr** a **rendelkezésre álló résznek az egyszerese**.

CSS Animation és Transition

Az animáció:
* https://szit.hu/doku.php?id=oktatas:web:css:css_animacio

Transition:

```html
<div class="egy"></div>
```

```css
.egy {
    width: 100px;
    height: 100px;
    background-color: navy;
    transition: width 2s, height 4s;
}
 
.egy:hover {
    width: 300px;
    height: 300px;    
}
```

### Transzformációk

```css
#egy {
  background-color: navy;
  color: white;
  padding: 5px;
  position: absolute;
  top: 50px;
  transform: rotate(-90deg); 
}
```

A dobozt az óramutató járásával ellentétes
irányba fordítja 90°-kal.

További transformációk:
* https://szit.hu/doku.php?id=oktatas:web:css:css3#transzformaciok

### CSS preprocessor

A preprocessor egy előfeldolgozó program,
amely valamilyen szintaxis szerint írt
CSS-t lefordít a böngészők által ismert
CSS-re.

Céljuk az olvashatóbb, könnyebb 
karbantartás, plusz funkciók (beágyazás,
keverés).

Az előfeldolgozó telepíthető a webszerverre
vagy webes fejlesztés során használjuk.

Néhány népszerű előfeldolgozó:

* Sass
* LESS
* Stylus
* PostCSS
