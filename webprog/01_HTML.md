# Webprogramozás - HTML

* HTML
* Sallai András
* 2022

## Táblázat elemei

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

## Szemantikus elemek

A szemantikus elemek tartalma egyértelmű.
Mint például:

* table
* form
* figure
* img
* article
* stb.

### Oldalszerkezet meghatározók

article, aside, header, footer, section, nav

* **section**: Összetartozó tartalmakat jelölünk vele, mint a div elemmel.
* **aside**: Érintőlegesen kapcsolódó tartalom, amely általában bal vagy jobb oldalon helyezkedik el. Ha valami a fő tartalom bal vagy jobb oldalán helyezkedik el, az még nem elegendő ok arra, hogy aside elembe helyezzük. Tegye fel magának a kérdést. Ha törlöm a félreeső tartalmat, a fő tartalom jelentése változik?
* **header**: Ez a header nem tévesztendő össze egy weboldal fejrészével, bár ott is használható. A HTML5 header elem akár többször is szerepelhet az oldalon, részeként például a section elemnek.
* **nav**: Az egész webhely navigációs információinak tárolására létrehozva.
* **footer**: Nem a weboldal alsó részéről van szó, bármelyik szakaszban használható.

* [http://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#szemantikus_elemek](http://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#szemantikus_elemek)

## Médiaelemek

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

## Meta elemek és SEO-alapok

```html
<meta name="érték" content="érték" /> 
```

```html
<meta name="keywords" content="web, html, css">
```

A meta elemek részletes leírása:

* [https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#meta_elemek](https://szit.hu/doku.php?id=oktatas:web:html:html5_nyelv#meta_elemek)

## Viewport

```html
<meta name="viewport" content="width=device-width, initial-scale=1.0">
```
