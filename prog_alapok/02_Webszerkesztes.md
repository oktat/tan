# Webszerkesztés

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [HTML](#html)
* [Szerkesztők](#szerkesztok)
* [Helló Világ](#hellovilag)
* [Megjegyzés](#megjegyzes)
* [Fejezetcímek](#fejezetcimek)
* [Bekezdések](#bekezdesek)
* [Általános elemek](#altalanos-elemek)
* [Szemantikus elemek](#szemantikus-elemek)
* [Blokk és inline elemek](#blokk-es-inline-elemek)
* [Sortörés](#sortores)
* [Kiemelés](#kiemeles)
* [Listák](#listak)
* [Képek beillesztése](#kepek)
* [Táblázatok](#tablazatok)
* [Hiperhivatkozások](#hiperhivatkozasok)
* [Videók](#videok)
* [Hangok](#hangok)
* [Űrlapok](#form-ok)
* [Az oldal szerkezetét leíró elemek](#az-oldalszerkezetet-leiro-elemek)
* [Gyakorlatok](#gyakorlatok)

<a name="html"></a>

## HTML

A HTML a **Hypertext Markup Language** rövidítése. Magyarul: **Hiperszöveg jelölő nyelv**. A hiperszöveg, olyan szöveg, ahol ugrásokat végezhetünk egy szöveg egyik részéből egy másik részbe.

A HTML fájlokat .html kiterjesztésű állományba írjuk.

### Történet

A GML nyelvet (Generalized Markup Language) az IBM alkotta meg az 1960-as években. Ezt a nyelvet használta dokumentumok leírásara. Az SGML nyelvből később szabvány lett, elét tettek egy "S" betűt, így lett SGML (Standard Generalized Markup Language). Az SGML később tovább fejlesztették, ez lett az XML.

Tim Berners-Lee 1990-ben a CERN-nél dolgozott, ahol kitalálta a World Wide Web-t, azzal együtt a HTML-t.

A HTML először a SGML alapján készült. Így lettek 1, 2, 3, 4, 4.1 verziók. Ezt követően XML alapokon kezdték a HTML újraírni, így lett XHTML 1, 1.1 és 2.0. A böngészőgyártok azonban nem mutattak nagy hajlandóságot a megvalósításra.

2007-ben a Mozilla Foundation, Apple, és az Opera Software létrehozott egy közösséget Web Hypertext Application Technology Working Group (WHATWG) néven. Ez lett a HTML5, amit ma is használunk.

### HTML5 teszt

A böngészőgyártók folyamatosan fejlesztik a böngészőik HTML5 képességeit. Van egy webes felület, ahol letesztelhetjük böngészőnk, milyen szinten ismeri a HTML5 oldalakt.

* [https://html5test.com/](https://html5test.com/)

Az oldalon kapunk egy számot, például 528 az 555-ből. Alatta pedig részletezve látjuk, hogy milyen funkciók vannak meg és mik hiányzonak.

Az [other browsers] gombra kattintva több böngésző összehasonlítását látjuk verzióként.

<a name="szerkesztok"></a>

## Szerkesztők

### Online szerkesztő

* [https://jsbin.com/](https://jsbin.com/)

### Telepíthető szerkesztő

* [https://code.visualstudio.com/](https://code.visualstudio.com/)

Telepítés Chocolatey csomagkezelővel:

```cmd
choco install vscode.install
```

<a name="hellovilag">

## Helló Világ

Készítsünk egy hello nevű projektet. Ez legyen egy hello nevű könyvtár, amelyben egy index.html fájl van:

```txt
hello/
  `-index.html
```

Az index.html fájl tartalma a következő legyen:

```html
<!DOCTYPE html>
<html lang="hu">
<head>
    <meta charset="utf-8">
    <title>Cím</title>
</head>
<body>
    <h1>Az oldal címe</h1>

</body>
</html>
```

Nyissuk meg böngészőben az index.html oldalt. Erre az egyik módszer: böngészőben Ctrl+O, kikeresem az index.html-t, majd a "Select" vagy "Megnyitás" gombra kattintva megnyitom.

### Elemzés

Minden HTML fájlt DOCTYPE sorral kezdjük. Ez megmondja
a böngészőnek, hogy a HTML melyik verzióját használjuk.
A példában szereplő &lt;!DOCTYPE html&gt; sor, azt jelenti, HTML5
verziót használunk.

A HTML oldal szerkezetét tagekkel határozzuk meg.
Egy tag kisebb mint jellel kezdődik és nagyobb mint jellel
záródik:

```xml
<név>
```

A kisebb mint és nagyobb mint jelek között adjuk meg a tag nevét.

Kétféle tag van:

* nyitó
* záró

```xml
<név>
tartalom
</név>
```

Egy konkrét HTML elmemmel:

```html
<div>
  Tartalom
</div>
```

A tartalmat ezek tagek fogják közre. Egy nyitó és egy záró taget együtt elemnek nevezünk, HTML elem. A HTML tagek közzé írt szöveg a tartalom, vagy innerText, más esetben textContent.

A HTML elemek újabb HTML elemeket tartalmazhatnak.

```xml
<név>
    <másiknév>
      tartalom
    </másiknév>
</név>
```

Konkrét HTML elemmel:

```html
<div>
  <h1>szöveg</h1>
  <p>szöveg</p>
</div>
```

Ha egy HTML elembe újabb HTML elemet vagy elemeket ágyazunk, innerHTML-ről beszélünk.

A weboldalak ilyen szervezése az SGML, majd később ebből kialakult XML dokumentumleíró nyelvből jött létre.

A HTML elemek lehetséges neveit szabvány határozza meg, amit [W3C](https://www.w3.org/) konzorcium készít.

Az egész HTML dokumentumot html elemek közzé tesszük, a DOCTYPE sor után.

A HTML dokumentumot két részre lehet osztani a html elemek
között:

* fejrész
* törzsrész

A fejrészt a **head** elemek között adjuk meg, a törzsrészt a **body** elemek között.

A fejrészben a megjelenő weblaphoz  háttér-információkat adunk meg. Azt a tartalmat ami a weblapon megjelenik a törzs részben helyezzük el. A fejrészben van két minimálisan megadandó HTML elem. Az egyik a weblap karakterkódolását mondja meg, a másik a weboldalnak egy olyan címét határozza meg, amely a böngésző címsorában, vagy annak fülein jelenik meg.

A karakterkódolást a meta elemmel adjuk meg. Minden HTML elem
felvehet attribútumokat. Az attribútumoknak van mindig egy értékük. A meta elemmel nagyon sok dolog beállítható, a karakterkódolás csak az egyik dolog. A karakterkódolást a charset attribútummal adjuk meg. Ennek értéke a kódolás:

```html
<meta charset="utf-8">
```

Az értéket mindig az attribútum és egy egyenlőség jel után adjuk meg, idézőjelek között.

A head elemek között az oldal címét a title taggel adjuk meg.

```html
<title>Valami</title>
```

### A body elem

A body elemek közzé írt tartalom jelenik meg a weboldalon.
Korábbi HTML verzióknál használtak attribútumokat a weboldal
formázására, de a HTML5 esetén a formázást CSS nyelvvel
végezzük.

A body elemen belül újabb HTML elemeket helyezünk el a
weboldal így egy hierarchikus dokumentumfába szerveződik.
Ezt a dokumentumfát nevezzük DOM-nak, ami a Document
Object Model rövidítése.

```html
<html>
<head>
    <meta charset="utf-8">
    <title>Valami</title>
</head>
<body>
    <div>
       <h1>Fejrész</h1>
       <p>Bekezdés</p>
    </div>
</body>
</html>
```

A DOM-ban a html a gyökérelem, mivel ez van a legfelső szinten.

<a name="megjegyzes">

## Megjegyzés

Megjegyzéseket a következő módon készíthetünk:

```html
<!-- egy sorban -->
<!-- 
  több
  soros
  megjegyzés
  szöveg 
-->
```

A HTML megjegyzések nem ágyazhatók egymásba.

<a name="fejezetcimek">

## Fejezetcímek

Egy szöveghez általában címmekkel adjuk meg miről szól, az adott fejezet. A fejezet címek a h1, h2, h3, h4, h5, h6 elemekkel határozhatók meg. Alapértelmezetten a h1 elem jelenik meg a legmagasabb betűmérettel.

```html
<h1>H1 fejezetcím</h1>
<h2>H2 fejezetcím</h2>
<h3>H3 fejezetcím</h3>
<h4>H4 fejezetcím</h4>
<h5>H5 fejezetcím</h5>
<h6>H6 fejezetcím</h6>
```

Alapértelmezetten a következő a megjelenítése Chrome böngészőben:

![h1-h6-ig HTML elemek](images/html/html_h1-h6.png)

<a name="bekezdesek">

## Bekezdések

A szövegeket bekezdésekre szokás tagolni. A HTML nyelven a bekezdés a "p" elemmel jelölhető meg:

```html
<p>
Lorem ipsum dolor sit amet.
</p>
```

A contenteditable attribútummal böngészőben a weblapról szerkeszhető bekezdés hozható létre.

```html
<p contenteditable="true">
Lorem ipsum
</p>
```

Ritkán van rá szükség.

<a name="altalanos-elemek">

## Általános elemek

A div és a span elemeknek nincs szemantikai jelentésük. A div elem az oldal tagolására lett létrehozva. A span elem segítségével a szöveg egyes részei eltérően formázhatók.

A következő példa a div elemek használatára mutat egy lehetséges megoldást:

```html
<div class="container">
    <div class="fejresz">
        <!-- ide jön a fejrész -->
    </div>
    <div class="menu">
        <!-- ide jön a menü -->
    </div>
    <div class="tartalom">
        <!-- ide jön az oldal tartalma -->
    </div>
</div>
```

Létrehoztunk egy div elemet, amelybe három újabb div elemet ágyaztunk. Minden div elemet számára megadtunk egy class attribútumot. A class attribútummal osztályba soroljuk a div elemeket. Ezekre az osztályokra szokás hivatkozni CSS-ben vagy JavaScriptben.

CSS:

```css
.container {
    color: blue;
}
```

JavaScript:

```javascript
document.querySelector('.container').style.color = 'blue';
```

A span elem használatára példa:

```html
Lorem <span class="egy">ipsum</span> dolor sit amet
consectetur, <span class="ketto">adipisicing</span> elit. 
Numquam, rem.
```

<a name="szemantikus-elemek">

## Szemantikus elemek

A szemantikus elemek valamilyen jelentéssel bírnak. Nem szemantikus elem a span és a div. Néhány szemantikus elem:

* table - táblázatok létrehozása
* i - dőlt szöveg jelölése
* p - bekezdés jelölése
* form - űrlap készítítése
* section - egy rész jelölése

<a name="blokk-es-inline-elemek">

## Blokk és inline szintű elemek

### Blokkelemek

Ha egy blokkelemet hozunk létre, az a tartalomtól függetlenül kitölti a rendelkezésre álló helyet. A következő példában a div elemmel hozunk létre egy dobozt, amelynek a tartalmazza az "alma" szót. Minden HTML elem egy úgynevezett dobozt hoz létre a weblapon. Ezen dobozok mérete, kiterjedése, általában nem látszik. Az "alma" szó nem tölti ki a weblap teljes szélességét, de a doboz amiben van, igen.

```html
<body>
   <div>
       alma
   </div>
</body>
```

A div elem a böngésző bal szélétől a jobb széléig tart.

Hogy lássuk a div boboz kiterjedését, adjunk háttérszint a doboznak:

```html
<body>
   <div style="background-color: blue">
       alma
   </div>
</body>
```

A doboznak a style attribútummal állítottunk be kék háttérszint.

![blokk elem](images/block_element.png)

Készítsünk több div elemet egymás után:

```html
<body>
   <div style="background-color: green">
       alma
   </div>
   <div style="background-color: red">
       körte
   </div>
   <div style="background-color: blue">
       barack
   </div>

</body>
```

![több div elem](images/tobb_div.png)

Kettes szintű fejezetcímek egymás után:

```html
<h2 style="background-color: blue">alma</h2>
<h2 style="background-color: red">körte</h2>
<h2 style="background-color: green">barack</h2>
<h2 style="background-color: yellow">szilva</h2>
```

![H2 elemek](images/h2_elements.png)

p elemek:

```html
    <p style="background-color: blue">alma</p>
    <p style="background-color: red">körte</p>
    <p style="background-color: green">barack</p>
    <p style="background-color: yellow">szilva</p>
```

![p elemek](images/p_elements.png)

Láthatjuk, hogy a blokkelemek egymás után folynak lefele a weblapon, mindegyik egyetlen sort elfoglalva.

### Inline elemek

Az inline elemek mérete a tartalomhoz igazodnak. Nézzünk egy span elemet, ami inline elem. A style attribútummal megszínezzük:

```html
<body>
   <span style="background-color: blue">
       alma
   </span>
</body>
```

![Inline elem](images/inline_element.png)

Láthatjuk a háttérszín alapján, hogy a doboz csak a szöveg körül létezik.

Most tegyünk több inline elemet egymás után:

```html
<body>
    <span style="background-color: green">
        alma
    </span>
    <span style="background-color: red">
        alma
    </span>
    <span style="background-color: blue">
        alma
    </span>    
</body>
```

Több inline elem egy sorban jelenik meg mindaddig, amíg elfér a sorban. Ha egy inline elem nem fér el, akkor a következő sorba jelenik meg.

![Több inline elem](images/multi_inline_elment.png)

Figyeljük meg, hogy a dobozok egymás után jelennek meg, egyetlen sorban. Az inline elemek körülfogják a tartalmat és nem nagyobbak mint a tartalom. Egymás után egyetlen sorban folynak, ha nincs több hely, a következő sorba folynak a weblapon.

### Összefoglaló

Egyes elemek blokk szintűek, egyes elemek inline szintűek:

Blokkelemek:

* div
* p
* h1 - h6
* stb.

Inline elemek:

* span
* b
* i
* a
* stb.

<a name="sortores">

## Sortörés

Sortörést a br elemmel lehet megvalósítani. A b elemnek nincs lezáró része, a lezárást az elem neve után írt szóköz, majd a / karakter jelölheti, de ez nem kötelező.

```html
<br />
```

vagy:

```html
<br>
```

Próbáljuk meg egy bekezdésben:

```html
<p>
Lorem ipsum dolor sit amet consectetur, 


adipisicing elit. Numquam, rem.
</p>
```

Eredmény a böngészőben:

![sortörés a bekezdésben](images/html/bekezdesben_sortores.png)

Egyetlen sorban jelenik meg a böngészőben. Így önmagában, hiába teszek sortöréseket, a weblapon az nem látszik. Használjunk helyette br elemet:

```html
<p>
Lorem ipsum dolor sit amet consectetur, 
<br><br>
adipisicing elit. Numquam, rem.
</p>
```

Most nézzük meg újra a böngészőben:

![sortörés a bekezdésben](images/html/bekezdesben_br_elemek.png)

A br elemek már a weblapon is tördelik a sorokat.

A három sor akár egyetlen sorban is megadható.

<a name="kiemeles">

## Kiemelés

A kiemelésekre többféle HTML elem áll rendelkezésre. A következő három fejezet, ilyen kiemelő elemeket mutat be.

### Szövegek kiemelése

| Tag | Leírás |
|-|-|
| &lt;b&gt; | félkövér szöveg |
| &lt;em&gt; | kiemelt szöveg  |
| &lt;i&gt; | dőlt szöveg |
| &lt;small&gt; | kis szöveg |
| &lt;strong&gt; | erős szöveg |
| &lt;sub&gt; | alsó index |
| &lt;sup&gt; | felső index |
| &lt;ins&gt; | beszúrt szöveg |
| &lt;del&gt; | törölt szöveg |
| &lt;s&gt; | elavult, pontatlan, nem fontos szöveg |

Vegyük a következő példát:

```html
<b>félkövérnek jelölt szöveg</b><br>
<em>kiemeltnek jelölt szöveg</em><br>
<i>dőltnek jeleölt szöveg</i><br>
<small>kisebbnek jelölt szöveg</small><br>
<strong>nagyobbnak jelölt szöveg</strong><br>
Alsó index példa: H<sub>2</sub>O<br>
Felső index példa: 2<sup>8</sup><br>
<ins>Beszúrtnak jelölt szöveg</ins><br>
<del>Töröltnek jelölt szöveg</del><br>
<s>Elavultnak jelölt szöveg</s><br>
```

A böngészőben ehhez hasonlóan jelenik meg:

![kiemelés](images/html/kiemelesek_minta.png)

### Számítógépes kiemelések

| Tag | Leírás |
|-|-|
| &lt;code&gt; | számítógépes kód |
| &lt;kbd&gt; | billentyűzet |
| &lt;samp&gt; | mintakód |
| &lt;var&gt; | változó |
| &lt;pre&gt; | előreformázott szöveg |

Lássunk egy példát:

```html
Kód:<code>System.out.println("Hello World");</code><br>
<kbd>Ctrl + Enter</kbd><br>
Minta: <samp>System.out.println("Hello World");</samp><br>
Változó: <var>USER</var><br>
<pre>
#include &lt;stdio.h&gt;
int main() {
    printf("Hello World");
    return 0;
}
</pre>
```

Bönégészőben:

![számítógépes kiemelések](images/html/szamitogepes_kiemelesek_minta.png)

### Idézetek és definíciók

| Tag | Leírás |
|-|-|
| &lt;abbr&gt; | egy rövidítés |
| &lt;address&gt; | cím |
| &lt;bdo&gt; | szöveg iránya |
| &lt;blockquote&gt; | hosszú idézet |
| &lt;q&gt; | rövid idézet |
| &lt;cite&gt; | cím idézése |
| &lt;dfn&gt; | egy kifejezése meghatározása |

A bdo elem esetén a szöveg irányát a dir attribútummal kell megadni:

```html
<bdo dir="rtl">szöveg irányának meghatározása</bdo><br>
```

Példa:

```html
Rövidítés minta: <abbr>MTA</abbr><br>
Cím: <address>Valahol, 28 kerület, Valami utca 1. </address><br>

<bdo dir="rtl">szöveg irányának meghatározása</bdo><br>
Hosszú idézet:
<blockquote>
    Lorem ipsum dolor sit amet consectetur 
    adipisicing elit. Doloribus quos dolorum 
    cupiditate quasi, veniam, fuga, quae eos 
    ducimus nihil eius consequuntur aut ipsam 
    a non ipsa. Quidem, qui laboriosam. Perferendis!
</blockquote><br>
Rövid idézet:
<q>Lorem ipsum dolor sit amet</q><br>
Cím idézése: <cite>A sötét ég</cite><br>
<dfn>Definció</dfn><br>
```

Bönégészőben:

![idézetek és definíciók](images/html/idezetek_es_definiciok_minta.png)

<a name="listak"></a>

## Listák

A listák minden dokumentumban fontos szervező elemek. A HTML oldalakon háromféle listát hozhatunk létre:

* számozott
* számozatlan
* definíciós

A számozott és számozatlan lista egymásba átalakítható CSS segítségével, amit később fogunk megtanulni.

### Számozatlan lista

A számozatlan lista angolul "unordered list". Ha a két szónak vesszük az első betűit, az ul-t kapjuk. Az ul elemmel hozhatunk létre számozatlan listákat. A lista elemeit az li elemmel adjuk meg. Lássunk egy példát:

```html
<ul>
    <li>alma</li>
    <li>körte</li>
    <li>barack</li>
    <li>szilva</li>
</ul>
```

A böngészőben:

![számozatlan lista](images/html/szamozatlan_lista_minta.png)  

### Számozott lista

Az angol "ordered list" szavak első betű ol. Az ol elemmel hozhatunk létre számozott listát.

```html
<ol>
    <li>alma</li>
    <li>körte</li>
    <li>barack</li>
    <li>szilva</li>
</ol>
```

Böngészőben:

![számozott lista](images/html/szamozott_lista_minta.png)

A számozás szabályozása:

```html
<ol start="40">
    <li>alma</li>
    <li>körte</li>
    <li>barack</li>
    <li>szilva</li>
</ol>
```

A böngészőben:

![számozott lista](images/html/szamozott_lista_start_minta.png)

Ebben a példában a számozás 40-től indul.

A számozás megfordítása:

```html
<ol reversed="reversed">
    <li>alma</li>
    <li>körte</li>
    <li>barack</li>
    <li>szilva</li>
</ol>
```

Böngészőben:

![számozott lista reversed](images/html/szamozott_lista_reversed_minta.png)

Használhatjuk két attribútumot együtt is.

### Egymásba ágyazás

Az li elemen belül megadható akár egy másik lista is.

```html
<ol>
  <li>Olaszorzság</li>
  <li>Magyarország
    <ol>
      <li>Hatvan</li>
      <li>Szolnok</li>
      <li>Miskolc</li>
    </ol>
  </li>
  <li>Szlovákia</li>
</ol>
```

Böngészőben a beágyazott lista:

![egymásba ágyazás](images/html/szamozott_lista_beagyazva.png)

### Definíciós lista

Valamilyen fogalom definiálásra használható a definíciós lista:

```html
<dl>
  <dt>fogalom</dt>
    <dd>leírás</dd>
  <dt>fogalom2</dt>
    <dd>leírás</dd>
    <dd>alternatív leírás</dd>
    <dd>másik alternatív leírás</dd>
</dl>
```

Böngészőben:

![definíciós lista](images/html/definicios_lista_minta.png)

<a name="kepek">

## Képek beillesztése

Használható fájltípusok:

|  Rövidítés  |  Formátum  | Kiterjesztés |
|-|-|-|
| JPEG | Joint Photographics Expert Group | .jpg, .jpeg |
| GIF | Graphics Interchange Format | .gif |
| PNG | Portable Network Graphics | .png |
| SVG | Scalable Vector Graphics | .svg |
| WebP | Web Picture | .webp |

Az [MDN](https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types) a dokumentációjában ide sorolja az APNG és az AVIF formátumokat is.

```html
<img src="nev.png" alt="leírás">
```

Az src és az alt attribútumok kötelezőek.

Lássunk egy példát böngészőben:

![kep](images/html/tatrakep_weblapon_bongeszoben.jpg)

A képeknek, azonban más attribútumai is lehetnek.

```html
<img 
   src="nev.png" 
   alt="leírás"
   title="leírás"
   with="100"
   height="100"
   >
```

### A figure elem

A figure elem segítségével összefoghatjuk a képet és a feliratát.

```html
<figure>
  <img src="nev.png" alt="Leírás" />
  <figcaption>Felirat<figcaption>
</figure>
```

![figure elem](images/html/tatrakep_figure_elemben_felirattal.jpg)

<a name="tablazatok">

## Táblázatok

A táblázat elterjedt formája többféle tulajdonság megjelenítésének.

### Alap

```html
<style>
  table, th, td {
    border: 1px solid black;          
  }      
</style>

<table>
  <tr>
    <th>#</th>
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

A style elem szükséges, hogy lássuk a táblázat szegélyét.

A böngészőben:

![tablazat](images/html/tablazat_minta_szegellyel.png)

### Táblázat felirattal

A caption elem segítségével feliratozható a táblázat. Böngészőtől függ, hogy ez hol jelenik meg.

```html
<style>
  table, th, td {
    border: 1px solid black;          
  }      
</style>

<table>
  <caption>Dolgozók</caption>
  <tr>
    <th>#</th>
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

A böngészőben:

![táblázat felirattal](images/html/tablazat_minta_felirattal.png)

### Táblázat összefoglalója

Ritkábban használt attribútum a summary, amiben megadhatunk egy összefoglalót, ami egyébként csak a forráskódban jelenik meg.

```html
<style>
  table, th, td {
    border: 1px solid black;          
  }      
</style>

<table summary="A dolgozók adatai">
  <caption>Dolgozók</caption>
  <tr>
    <th>#</th>
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

### Oszlopnyúlás

```html
<style>
  table, th, td {
    border: 1px solid black;          
  }      
</style>

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

![Cellanyúlás](images/tabla_oszlopnyulas.png)

### Sornyúlás

```html
<style>
  table, th, td {
    border: 1px solid black;          
  }      
</style>

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

![sornyúlás](images/tabla_sornyulas.png)

### Sor- és oszlopnyúlás

```html
<style>
  table, th, td {
    border: 1px solid black;          
  }      
</style>

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

![Cella- és sornyúlás](images/tabla_oszlop_es_sornyulas.png)

### Táblázat részeinek csoportosítása

A táblázat sorait felbontjuk fejrészre, törzs és lábrészre. A fejrészt a **thead** elemmel adjuk meg, a törzs részt a **tbody** elemmel, míg a lábrészt a **tfoot** elemmel.

```html
<style>
  table, th, td {
    border: 1px solid black;          
  }      
</style>

<table>
  <thead>
    <tr>
      <th>#</th>
      <th>Név</th>
      <th>Település</th>
      <th>Fizetés</th>      
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>1</td>
      <td>Nagy János</td>
      <td>Szolnok</td>
      <td>3850000</td>
    </tr>
    <tr>
      <td>2</td>
      <td>Kemény Ferenc</td>
      <td>Szeged</td>
      <td>2870000</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="3">Összesen</td>
      <td>6720000</td>
    </tr>
  </tfoot>
</table>
```

Böngészőben:

![táblázat részeinek csoportosítása](images/html/tablazat_reszeinek_csoportositasa.png)

### Oszlopok csoportosítása

Az oszlopok is csoportosíthatók a colgorup és col HTML elemekkel.

```html
<style>
  table, th, td {
    border: 1px solid black;          
  }      
</style>

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

Böngészőben:

![Oszlopok csoportosítása](images/html/tablazat_oszlopok_csoportositasa.png)

<a name="hiperhivatkozasok"></a>

## Hiperhivatkozások

Hiperhivatkozást az "a" elemmel hozunk létre. Maga a hivatkozás a href attribútum értéke. Az "a" elem tartalma pedig ami a weblapon megjelenik.

```html
<a href="hivatkozas">Leírás</a>
```

A hivatkozás lehet egy horgony, lehet egy másik weblap, vagy egy másik weblap horgonnyal.

```html
<a href="#horgonynev">Leírás</a>
<a href="masik.html">Leírás</a>
<a href="masik.html#horgonynev">Leírás</a>
```

Ha egy weboldalon belül szeretnénk egy szöveghez ugrani, akkor ahova szeretnénk ugrani, ott lenni kell egy horgonynak.

Horgony:

```html
<a id="név"></a>
```

vagy:

```html
<a name="név"></a>
```

* [Példa1: ugrás lapon belül](https://szit.hu/download/peldak/html5/negybekezdes.html)
* [Példa2: ugrás másik lapra](https://szit.hu/download/peldak/html5/elso.html)

<a name="videok"></a>

## Videók

Videókat a video elemmel teszünk közzé.

```html
<video src="fajlnev.ogg" width=”300” height=”300”></video>
```

Több formátumban is feltölthetünk videót. Ha egy böngésző nem ismeri az egyik formátumot, a másikat jó eséllyel már igen.

```html
<video  width=”300” height=”300”>
    <source src="fajlnev1.ogg">
    <source src="fajlnev2.mp4">
</video>
```

<a name="hangok"></a>

## Hang

Hangot az audio elemmel tehetünk közzé.

```html
<audio controls="controls">
  <source src="hangfajl.ogg" type="audio/ogg">
  <source src="hangfajl.mp3" type="audio/mpeg">
A böngésződ nem támogatja az audio elemet. 
</audio>
```

<a name="form-ok"></a>

## Űrlapok

Az űrlapok segítségével a weblap felhasználója adatokat közölhet a webszerverrel.

```html
<form action="akcio.php" method="POST">
<fieldset>
  <legend>Teljesnév</legend>
  <label for="vnev">Vezetéknév:</label>
  <input type="text" name="vnev" value="" id="vnev" /><br />
  <label for="knev">Keresztnév:</lable>
  <input type="text" name="knev" value="" id="knev" /><br />
 
  <input type="submit" value="Elküld" />
</fieldset>
 
</form>
```

<a name="az-oldalszerkezetet-leiro-elemek"></a>

## Az oldal szerkezetét leíró elemek

Az oldal szerkezetét általános célú div elemekkel,
vagy szemantikus elemekkel írjuk le. Erre a célra
a következő szemantikus elemek állnak rendelkezésre:

* section - a weblap egy szakasza
* aside - érintőlegesen kapcsolódó tartalom
* header - az oldal vagy egy rész fejrésze
* nav - navigációs sáv
* footer - az oldal vagy egy rész lábrésze
* article - tartalmi egységek
* main - az oldal főbb része

<a name="gyakorlat"></a>

## Gyakorlatok

### Szerkesztő gyakorlat

Oldjon meg feladatokat a következő gyűjteményből:

* [https://szit.hu/doku.php?id=oktatas:web:html:html_feladatok](https://szit.hu/doku.php?id=oktatas:web:html:html_feladatok)

### Feleletválasztós gyakoralt

1.) Melyik HTML elem a gyökérelem egy dokumentumban?

* head
* doctype
* html
* body

2.) Melyik HTML elemmel adjuk meg lang változót, ha teljes webes dokumentumra be akarom állítani a magyar nyelvet?

* head
* html
* table
* div

3.) Melyik az a HTML elem, amelynek a tartalma a böngészőben megjelenik mint weblap?

* head
* meta
* title
* body

4.) Mit állíthatunk be a lang attribútummal?

* Az oldal készítésének dátuma.
* A weboldal karakterkódolása.
* A weboldal nyelvezete.
* A weboldalhoz használt fordító program.

5.) Melyik a helyes karakterkódolás beállítás?

* &lt;html charset="utf-8"&gt;
* &lt;lang charset="utf-8"&gt;
* &lt;body charset="utf-8"&gt;
* &lt;meta charset="utf-8"&gt;

6.) Ha szeretnénk megjeleníteni a "Madár" szót elsődleges fejezetcímként, akkor azt a következő elemek között tesszük.

* body
* h1
* title
* lang

7.) &lt;html lang="hu"&gt;&lt;/html&gt; részletből HTML elemnek nevezzük a következőt:

* lang
* bármelyik html egyedül
* a két html együtt
* "hu"

8.) Egy HTML elem egyik tagját így hívjuk:

* log
* tag
* feg
* heg

9.) A title elemek célja:

* A weblapon megjelenő oldal címének beállítása.
* A weblap karakterkódolásának beállítása.
* A weblap címe a böngésző fülön vagy a címsorában.
* A weblap gyökéreleme.

10.) A body elem célja:

* A böngészőfülön cím beállítása.
* A weboldal kódolásának beállítása.
* A weboldalon megjelenő tartalmat ide helyezzük.
* A weboldal nyelvét állítjuk be.

11.) HTML oldalon a helyes megjegyzés:

* /&lowast; szöveg &lowast;/
* &lt;!-- szöveg --&gt;
* &num; szöveg
* { szöveg }

12.) Ennyiféle fejezetcím állítható be a HTML elemekkel:

* 4
* 5
* 6
* 7

13.) Kettes szintű fejezetcímet a következő HTML elemmel állítunk be:

* h2
* f2
* head2
* header2

14.) HTML-en belül bekezdésnek a következő elemmel jelölünk szöveget:

* a
* b
* p
* i

15.) Melyik elem általános célú a következők közül.

* i
* h1
* div
* em

16.) Melyik elem általános célú a következők közül.

* i
* span
* p
* pre

17.) Mitől blokkszintű egy HTML elem?

* A tartalma csak utf-8 kódolású lehet.
* Csak a tartalmat fogja körbe.
* Nem lehet tartalma.
* Kitölti a rendelkezésre álló helyet.

18.) Mitől inline egy HTML elem?

* Kitölti a rendelkezésre álló helyet.
* Nem lehet tartalma.
* Csak a tartalmat fogja körbe.
* A tartalma csak utf-8 kódolású lehet.

19.) Melyik blokk elem?

* span
* i
* b
* div

20.) Melyik inline elem?

* i
* div
* p
* h1

21.) Hogyan lehet sortörést megjeleníteni a weblapon?

* line
* br
* break
* linebreak
