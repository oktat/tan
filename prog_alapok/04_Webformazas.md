# Programozás alapok - Webformázás - CSS

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Kezdés

A CSS rész a következő helyen található:

* [https://szit.hu/doku.php?id=oktatas:web:css](https://szit.hu/doku.php?id=oktatas:web:css)

## CSS

A CSS a Cascading Style Sheets rövidítése. Magyarul Lépcsőzetes stíluslapok. A CSS segítségével formázzuk a weboldalakat, határozzuk meg annak stílusát.

## Stíluslapok készítése

Stílusutasítást meghatározhatnak a következők:

* szerző
* felhasználó
* kliens

A stílus lap HTML oldalhoz rendelése:

* inline - soron belül állítunk stílust
* internal - a weboldalon belül állítunk stílust
* external - külön fájlban állítunk stílust

A külön fájlban elhelyezett stílusutasításokat .css kiterjesztésű állományokba írjuk. Az állomány neve tetszőleges, de gyakran használják a style.css-t, ha csak egyetlen állományban írjuk a CSS utasításokat.

A külső stíluslapot a HTML állományban a link elemmel csatoljuk:

```html
<link rel="stylesheet" href="style.css">
```

## Szelektorok

A stílust mindig egy HTML elemhez rendeljük hozzá. A szelektorok segítségével mondjuk meg, melyik HTML elem számára írunk beállításokat. Például:

```css
h1 {

}
```

vagy:

```css
body {

}
```

A stílus utasítások tulajdonság értékpárokból állnak. Ezeket a szelektor után írjuk a kapcsos zárójelek közzé. Állítsuk be a példa kedvéért a h1 elemek háttérszínét kék színűre.

```css
h1 {
    background-color: blue;
}
```

Az első tulajdonságunk a background-color, amit egy blue érték követ. Vegyük észre a tulajdonság és az érték között az kettőspontot (:), az érétk után a pontosvesszőt (;)

Egyszerre több elemet is megadhatunk:

```css
h1, h2, h3 {
    background-color: blue;
}
```

A h1, a h2 és a h3 elem számára is beállítottuk a kék háttérszínt. A szelektornál fontos a vessző (,), mivel nélküle más jelentést kapunk.

### Osztályok használata

Ha például több h2 elemünk is van, és nem szeretnénk mindegyik h2 elemnek beállítani a kék színt, akkor osztályt használunk. A HTML oldalról:

```html
<h2>egy</h2>
<h2>kettő</h2>
<h2 class="kek">három</h2>
<h2 class="kek">négy</h2>
```

A CSS fájlban ezek után:

```css
h2.kek {
    background-color: blue;
}
```

A h2 akár el is hagyható:

```css
.kek {
    background-color: blue;
}
```

### Azonosító használata

Ha egyetlen elemet szeretnénk azonosítani a HTML elemek között, akkor azonosítót használunk.

A következő példában h2 helyett div elemeket használunk:

```html
<div id="egy">első</div>
<div id="ketto">kettő</div>
```

A CSS fájlban így hivatkozunk rá:

```css
div#egy {
    background-color: blue;
}
```

Itt is elhagyható a div:

```css
#egy {
    background-color: blue;
}
```

## Háttérbeállítások

### Háttérszín beállítása

A háttérszínt a background-color tulajdonsággal állítjuk. Érétéke egy szín neve, vagy RGB kód lehet hexadecimális formában vagy rgb() függvénnyel.

```css
h1 {
    background-color: navy;
}
```

### Kép beállítása háttérként

Háttérképet a background-image tulajdonsággal állítunk. Értéke egy url() függvény, amelynek a paramétere egy képet tartalmazó fájlnak a neve, útvonallal együtt.

```css
h1 {
    background-image: url(fajlnev.png);
}
```

### A háttérkép ismétlése

A háttérkép ismétlését a background-repeat tulajdonsággal állítjuk.

Lehetséges értékei:

* repeat
* no-repeat
* repeat-x
* repeat-y

```css
h1 {
    background-image: url(virag.png);
    background-repeat: no-repeat;
}
```

### A háttérkép pozicionálása

Lehetséges értékei:

* left
* center
* right
* top
* bottom

```css
h1 {
    background-image: url(virag.png);
    background-repeat: no-repeat;
    background-position: center;
}
```

### A háttérkép rögzítése

A háttérképet rögzíthetjük a böngésző ablakához. A háttérkép rögzítését a background-attachment tulajdonsággal lehetséges. Lehetséges értékek:

* scroll
* fixed
* local

```css
h1 {
    background-image: url(virag.png);
    background-repeat: no-repeat;
    background-position: left;
    background-attachment: fixed;
}
```

### A háttérkép méretének beállítása

A háttérkép méretét a background-size tulajdonsággal állítjuk. Lehetséges értékei:

* cover
* contain
* méret (például 140px)

```css
h1 {
    background-image: url(virag.png);
    background-size: cover;
}
```

## Fontok

### A font stílusa

A font stílusát a font-style tulajdonsággal állítjuk. Lehetséges értékei:

* normal
* italic
* oblique
* inherit

```css
p {
    font-style: italic;
}
```

### A fontok vastagsága

A fontok vastagságát a font-weight tulajdonsággal állítjuk. Lehetséges értékei:

* normal
* bold
* bolder
* lighter
* 100, 200, 300, ..., 900
* inherit

```css
p {
    font-weight: bold;
}
```

### A fontok mérete

A fontok méretét a font-size tulajdonsággal állítjuk.

Lehetséges értékek:

* medium - alapértelmezett érték
* xx-small
* x-small
* small
* large
* x-large
* xx-large
* smaller
* larger
* hossz - számmal, mértékegységgel
* százalékos forma

```css
p {
    font-size: 15px;
}
```

### Fontcsalád beállítása

Beállítható fontcsalád, vagy konkrét font. Ehhez a font-family tulajdonságot használjuk.

A következő táblázat tartalmazza a fontcsaládokat:

| Fontcsalád | Leírás |
|-|-|
| serif | talapas betűk |
| sans-serif | talpatlan betűk |
| monospace | fix betűszéless |
| cursive | kurzív fontok |
| fantasy | fantázia fontok |

```css
p {
    font-family: Arial, Helvetica, sans-serif;
}
```

### Fontok beállítása csoportban

```css
p {
    font: italic bold 14px Arial, Helvetica, sans-serif;
} 
```

### Fontvariációk

Fontvariációkat a font-variant tulajdonsággal állíthatunk. Lehetséges értékek:

* normal
* small-caps
* inherit

```css
p {
    font-variant: small-caps;
}
```

A kiskapitális nagybetűs írás, de kisebb méretben.

## Szövegbeállítások

### Szöveg színezése

#### Elnevezett színek

A szöveget a "color" tulajdonsággal tudjuk színezni. Értéke lehet egy szín neve vagy RGB kódja. Néhány elérhető alapszín:

* white
* black
* red
* green
* blue
* yellow
* brown

Névvel megadott beállítás:

```css
h1 {
    color: blue;
}
```

#### RGB kód

RGB a Red, Green és Blue szavak rövidítése. A három szinből állítjuk össze a kívánt színt. A színeket hexadecimális számokkal adjuk meg. A kódon belül, egy színt két hexadecimális számmal adunk meg. Mivel három színt kell megadni, ezért hat darab hexadecimális számot írunk. A tiszta piros szín például: #ff0000. A tiszta zöld szín: #00ff00. A kék szín: #0000ff. A számokat variálva különböző színek állíthatók össze.

```css
h1 {
    color: #0000ff;
}
```

#### rgb() függvény

Az rgb() függvény segítségével decimális számokkal is megadható egy RGB színkód:

```css
h1 {
    color: rgb(0, 0, 255);
}
```

Használható még a rgba() függvény is, de arról később lesz szó.

### A betűk közötti távolság

```css
p {
   letter-spacing: 3px;
}
```

### A sormagassága

Az előző sorhoz képest beállítható a távolság a line-height segítségével.

```css
p {
    line-height: 1.6;
}
```

### Szöveg igazítása

A szöveg igazításáshoz a text-align tulajdonságot használjuk. Értékeik a következők lehetnek:

* left
* right
* center
* justify
* initial - kezdeti érték
* inherit - a szülőelemtől örökölt érték

Vegyünk egy h1 elemet. A szöveg automatikusan balra igazodik. Ha szeretnénk középre igazítani:

```css
h1 {
    text-align: center;
}
```

#### Szövegigazítás gyakorlat

##### Szövegigazítás gyakorlat 01

Készítsünk egy index.html és egy style.css fájlt.

```html
<!DOCTYPE html>
<html lang="hu">
<head>
  <meta charset="utf-8">
  <title>Igazítás</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>alma</h1>
</body>
</html>
```

```css
h1 {
    text-align: center;
}
```

Nézzük meg a weboldalt a böngészőben, és próbáljuk ki a lehetséges értékeket.

##### Szövegigazítás gyakorlat 02

Adott a következő weblap:

```html
<!DOCTYPE html>
<html lang="hu">
<head>
  <meta charset="utf-8">
  <title>Igazítás</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
    <h1>alma</h1>
</body>
</html>
```

Feladat: Határozza meg a h1 elem szülőelemét.

## Kerettulajdonságok

Minden HTML elemhez beállítható keret, vagy másként mondva szegély. A szegélyt a border tulajdonsággal állítjuk.

Meg kell adnunk a keret szélességét, stílusát és színét.

A keret szélességének beállítására példa egy p elemen:

```css
p {
    border-width: 3px;
    border-style: solid;
    border-color: blue;
}
```

A szélesség lehet egy érték valamilyen mértékegységgel és a következők:

* thin
* medium
* thick

A stílus a következők egyike lehet:

* none
* dotted
* dashed
* solid
* double
* groove
* ridge
* inset
* outset

A border-style beállításiat kipróbálhatjuk a [szit.hu webhelyen](https://szit.hu/doku.php?id=oktatas:web:css:css_nyelv#a_border-style)

Csoportos használat:

```css
p {
    border: 3px solid blue;
}
```

A border-collapse tulajdonság használható táblázatoknál, lásd ott.

## Dobozmodell

Minden böngészőben megjelenő HTM elemet egy doboznak tekintünk. Így beszélhetünk a dobozmodellről. Figyeljük meg a következ ábrán a dobookat. Legkülső dobozt a body elem alkotja. Abban van egy div doboz. A divben egy h1 és egy p doboz van.

![Dobozmodell](images/dobozmodell.png)

Minden doboz ugyanúgy épül fel, ugyanazok a tulajdonságok jellemzik. Lehet valami tartalma. A tartalma vagy egy másik doboz, vagy szöveg. A tartalom körül beállítható egy belső margó. A belső margó után állítható a szegély. A szegélyt margó veszi körül. Mindezeket állíthatjuk felül, jobbra, alul és balra. Figyeljük meg a következő ábrán:

![Doboz felépítése](images/dobozfelepites.png)

### Margó beállítása

A margót a margin tulajdonsággal állítjuk.

```css
p {
    margin: 20px;
}
```

A margók állíthatók felül, jobbra, alul és balra:

* margin-top
* margin-right
* margin-bottom
* margin-left

```css
p {
    margin-left: 20px;
}
```

Minden margónak a következő tulajdonságok állíthatók be:

* auto
* hossz - px, pt, cm stb.
* % - a tartalmazó elemhez képest százalékban
* inherit - a szülőtől örökölt tulajdonság

### Rövid változat

```css
p {
    margin: 5% 2% 10% 15;
}
```

A négy éréték felső, jobb, alsó és bal margót jelentik.

Megadható három érték is:

```css
p {
    margin: 5% 2% 10%;
}
```

Ekkor a felső 5%, a jobb és a bal margó 2%, az alsó margó 10%-s.

Két érték beállítása:

```css
p {
    margin: 5% 2%;
}
```

Az felső és alsó margó 5%-s, a bal és a jobb margó 2%-s.

### Az auto éréték

Az auto beállítást a dobozok vízszintes középreigazításához használjuk.

## Túlcsordulás

A HTML dobozok alapértelmezetten rugalmas méretűek. Ha hozzáadunk tartalmat, akkor automatikusan nő a méretük. Ha viszont fix szélességű és magasságú dobozt hozunk létre, és a tartalom nem fér el benne, a doboz túlcsordul.

A példa kevéért hozzunk létre egy 100px széles és 100px magas dobozt, például div elemből, doboz osztályjelölővel:

```html
<div class="doboz">

</div>
```

Legyen a doboz tartalma egy hosszabb Lorem ipsum szöveg:

```html
<div class="doboz">
Lorem ipsum dolor sit amet consectetur 
adipisicing elit. Voluptates aut dolorum 
officiis ipsam ratione, est velit.
</div>
```

Állítsuk be a doboz osztályjelölőt. Adjunk hozzá háttérszint is, hogy lássuk a túlfolyást.

```css
.doboz {
    width: 100px;
    height: 100px;
    background-color: aqua;
}
```

Az overflow tulajdonsággal megváltoztathatjuk a viselkedést:

```css
.doboz {
    width: 100px;
    height: 100px;
    background-color: aqua;
    overflow: scroll;
}
```

A szöveg nem folyik ki, a tartalom gördíthető.

Az overflow használható értékei:

* hidden - a tartalom nyírva lesz, a görgetősáv elrejtve
* scrool - a tartalom nyírva lesz, a görgetősáv megjelenik
* none - ez az alapértelmezés
* visible - a tartalomtól függetlenül a görgetősáv a dobozon kívül lesz
* auto - a megjelenés a tartalomtól függ
* clip - a tartalom nyírva, a többi része láthatatlan; letiltja a görgetést

<!--- 
TODO: Az overflow-x és overflow-y kifejtése
-->

Az **overflow-x** és **overflow-y** tulajdonság is használható.

### Az overflow-y

Beállítható értékek:

* visible
* hidden
* scroll
* auto
* initial
* inherit

Állítsunk be csak függőleges korlátozást.

```css
.doboz {
    width: 100px;
    height: 100px;
    background-color: aqua;
    overflow-y: scroll;
}
```

## Lista

## Megjelenés

## Pozicionálás

## Lebegtetés

## Blokk elemek igazítása

## Ál-osztályok

## Átlátszatlanság

## Táblázatok

## Z-index

## Mértékegységek

## Színek

A böngészők általában elfogadják a következő színeket:

* AliceBlue
* AntiqueWhite
* Aqua
* Aqumarine
* Azure
* Beige
* Bisque
* Black
* BlanchedAlmond
* Blue
* BlueViolet
* Brown
* BurlyWood
* CadetBlue
* Chartreuse
* Chocolate
* Coral
* CornflowerBlue
* Cornsilk
* Crimson
* Cyan
* DarkBlue
* DarkCyan
* DarkGoldenRod
* DarkGray
* DarkGrey
* DarkGreen
* DarkKhaki
* DarkMagenta
* DarkOliveGreen
* DarkOrange
* DarkOrchid
* DarkRed
* DarkSalmon
* DarkSeaGreen
* DarkSlateBlue
* DarkSlateGray
* DarkSlateGrey
* DarkTurquoise
* DarkViolet
* DeepPink
* DeepSkyBlue
* DimGray
* DimGrey
* DodgerBlue
* FireBrick
* FloralWhite
* ForestGreen
* Fuchsia
* Gainsboro
* GhostWhite
* Gold
* GoldenRod
* Gray
* Grey
* Green
* GreenYellow
* HoneyDew
* HotPink
* IndianRed
* Indigo
* Ivory
* Khaki
* Lavender
* LavenderBlush
* LawnGreen
* LemonChiffon
* LightBlue
* LightCoral
* LightCyan
* LightGoldenRodYellow
* LightGray
* LightGrey
* LightGreen
* LightPink
* LightSalmon
* LightSeaGreen
* LightSkyBlue
* LightSlateGray
* LightSlateGrey
* LightSteelBlue
* LightYellow
* Lime
* LimeGreen
* Linen
* Magenta
* Maroon
* MediumAquaMarine
* MediumBlue
* MediumOrchid
* MediumPurple
* MediumSeaGreen
* MediumSlateBlue
* MediumSpringGreen
* MediumTurquoise
* MediumVioletRed
* MidnightBlue
* MintCream
* MistyRose
* Moccasin
* NavajoWhite
* Navy
* OldLace
* Olive
* OliveDrab
* Orange
* OrangeRed
* Orchid
* PaleGoldenRod
* PaleGreen
* PaleTurquoise
* PaleVioletRed
* PapayaWhip
* PeachPuff
* Peru
* Pink
* Plum
* PowderBlue
* Purple
* RebeccaPurple
* Red
* RosyBrown
* RoyalBlue
* SaddleBrown
* Salmon
* SandyBrown
* SeaGreen
* SeaShell
* Sienna
* Silver
* SkyBlue
* SlateBlue
* SlateGray
* SlateGrey
* Snow
* SpringGreen
* SteelBlue
* Tan
* Teal
* Thistle
* Tomato
* Turquoise
* Violet
* Wheat
* White
* WhiteSmoke
* Yellow
* YellowGreen
