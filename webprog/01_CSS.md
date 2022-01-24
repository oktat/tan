# Webprogramozás
## Sallai András
## 2022

## Chocolatey

Telepítse a Chocolatey csomagkezelőt. Továbbiakban ezt a csomagkezelőt használjuk.

A csomagkezelő weboldala:
https://chocolatey.org/


Bővebb leírása:
https://szit.hu/doku.php?id=oktatas:operacios_rendszerek:windows:csomagkezeles#chocolatey




A Chocolatey weboldalán található egy hosszú Power Shell paranancs, amivel telepíthető a progra. Indítsunk egy PoserShell-t rendszergazdaként, így kiadva a parancsot.

A script másolata:
```
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('http://internal/odata/repo/ChocolateyInstall.ps1'))
```


Telepítés kapunk egy choco nevű parancsot. Teszteljük:
```
choco --version
```

Telepítés általánosan:
```
choco install <csomagnév>
```
A telepítés során még rákérdez, hogy biztosan szeretnénk telepíteni a csomagot. Ekkor az összes ilyen kérdés elfogadása az "a" beírásával lehetésges. Ha telepítő parancsnak adunk egy -y kapcsolót, a kérdés elmarad és azonnal telepíte a Chocolatey.


```
choco install <csomagnév> -y
```


Telepítsük a következő csomagokat:

```
choco install yarn -y
choco install totalcommander -y
choco install vscode git insomnia-rest-api-client -y
choco install googlechrome -y
choco install geany -y
```


## NodeJS

Telepítse a NodeJS rendszert.
* https://nodejs.org/

```
choco install nodejs
```

Telepítés után lenni kell egy node és egy npm parancsnak. Ellenőrizzük:

```
node --version
npm --version
```

Bővebben:
* https://szit.hu/doku.php?id=oktatas:web:nodejs:telepites




## NodeJS projekt

Az alábbiakban elkészítünk egy NodeJS projektet, a jövőben mindig ilyen projektekkel fogunk dolgozni. 

A tervek szerint a következő könyvtárszerkezetet hozzuk létre

```
app01/
  |-node_modules/
  |-index.html
  |-package.json
  `-yarn.lock
```

```
mkdir app01
npm init -y
```

Kapunk egy package.json fájlt. Tartalma:

```json
{
  "name": "p0",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```

Egészítsük egy script részt:
```json
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "lite-server"
  },
```



Telepítsük a lit-server nevű csomagot:
yarn add lite-server --dev 

Készítsünk egy weboldalt index.html néven.


```html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
    content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Valami</h1>
</body>
</html>
```


Indítsuk el a szervert a Visual Studio Code terminálablakában:

```
yarn start
```

A weboldal megnyílik az alapértelmezett böngészőben. 

Végezzünk néhány javítást a webolalon. 
Vagyünk fel, például egy "p" elemet,
írjuk bele "Lorem ipsum dolor est amet",
mentsük és figyeljük a böngészőt.

A továbbikaban így fogunk weboldalakat készíteni.


## Táblázat elemei és CSS

A táblázat teljes leírása a következő
helyen található:

https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#tablazat


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
* header
* nav
* footer


### Médiaelemek

Audio, video, source

```
<video  width=”300” height=”300”>
    <source src="sample3.ogg">
    <source src="sample1.mp4">
</video>
```

```
<audio controls="controls">
  <source src="hangfajl.ogg" type="audio/ogg">
  <source src="hangfajl.mp3" type="audio/mpeg">
A böngésződ nem támogatja az audio elemet. 
</audio>
```



A médiaelemek részletes leírása:

* https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#video



### Meta elemek és SEO-alapok

```
<meta name=“érték“ content=“érték” /> 
```

```
<meta name="keywords" content="web, html, css">
```


A meta elemek részletes leírása:

* https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#meta_elemek


### Viewport


```
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```

### Konkurens stílusok

* Szerzői
* Felhasználói
* Klines - böngésző



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

https://szit.hu/doku.php?id=oktatas:web:css:css_nyelv#tablazatok



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


```
tr:nth-child(3) {
    background-color: orange;
}
```

Több információ az nth-child állosztlyról:

* https://szit.hu/doku.php?id=oktatas:web:css:css_szelektorok#az_nth-child_al-osztaly


### media query


```
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
```
p {
    background-color: olive;
}
```

Szín RGB kóddal, hexadecimálisan:
```
p {
    background-color: #8080000;
}
```

Szín RGB kóddal, decimálisan:
```
p {
    background-color: rgb(128, 128, 0);
}
```

```
p {
    background-color: rgba(128, 128, 0, 1);
}
```


Rövidítés:
```
p {
    background-color: #333;
}
```
Egyenértékű ezzel:
```
p {
    background-color: #333333;
}
```










### Átlátszatlanság

Beállítás egy doboz számára:
```
.doboz {
    opacity: 0.6;
}
```

Beállítás a doboz háttérszínének:
```
.doboz {
   background-color:rgba(255, 0, 0, 0.3);
} 
```


Több információ:
* https://szit.hu/doku.php?id=oktatas:web:css:css_nyelv#atlatszatlansag


### Színátmenet

```
.doboz {
  background-image: linear-gradient(navy, blue);
}
```

A színátmenetekről bővebben:

* https://szit.hu/doku.php?id=oktatas:web:css:css3#szinatmenet


### Dobozok árnyékolása

box-shadow


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

### Szöveg árnéyk
text-shadow

### Szegély lekerekítése
border-radius


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

```
.egy::before {
    content: "előtte";
    background-color: blueviolet;
}
```

```
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





