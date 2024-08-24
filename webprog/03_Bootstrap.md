# Webprogramozás - Bootstrap

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Kezdés](#kezdés)
* [Bootstrap Node.js-el](#bootstrap-nodejs-el)
* [Színek](#színek)
* [Konténerek](#konténerek)
* [Rácsok](#rácsok)
* [Eszközök](#eszközök)
* [Bootstrap gyakorlat](#bootstrap-gyakorlat)

## Kezdés

* [https://getbootstrap.com](https://getbootstrap.com)

A Bootstrap letölthető de, használható CDN-ről [^1] is.

[^1]: A CDN egy kiszolgáló, amely folyamatosan biztosítja fájlok elérését.

Mobileszközön:

```html
<meta name="viewport" content="width=device-width, initial-scale=1">
```

Bootstrap 5 CDN:

```html
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
```

Példa:

```html
<!DOCTYPE html>
<html lang="hu">
<head>
<meta charset="utf-8" />
<title>Bootstrap példa</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="sajat.css">
</head>
<body>
 
<h1>Példa weblap</h1>
 
<p>Bootstrap példaweblap</p>
 
</body>
</html>
```

## Bootstrap Node.js-el

Van bootstrap csomag, telepítsük:

```bash
npm install bootstrap
```

A bs-config.json fájban vegyük fel a bootstrap útvonalát:

```json
{
    "server": [
        "src",
        "node_modules/bootstrap/dist/css",
        "node_modules/bootstrap/dist/js"
    ],
    "port": 3000,
    "watch": true
}
```

A HTML állományban ezek után a Bootstrap hivatkozása:

```html
<link res="stylesheet" href="bootstrap.css">
<!-- ... -->
<script src="bootstrap.js"></script>
```

## Színek

### Szöveg

* .text-primary
* .text-secondary
* .text-success
* .text-danger
* .text-warning
* .text-info
* .text-light
* .text-dark
* .text-body
* .text-muted
* .text-white
* .text-black-50
* .text-white-50

```html
<div class="text-primary">Lorem ipsum</div>
```

### Háttér

* bg-primary
* bg-secondary
* bg-success
* bg-danger
* bg-warning
* bg-info

```html
<div class="bg-primary text-white">Lorem ipsum</div>
```

## Konténerek

```html
<div class="container">
Lorem ipsum
</div>
```

A container osztályjelölőnek akkor láthatjuk a működését igazán, ha olyan tartalmat teszünk bele, ami nem fér bele a lap szélességébe.

```html
<div class="container">
Lorem ipsum dolor sit, amet consectetur
adipisicing elit. Omnis, tempora? Consequatur
nemo, illum architecto dignissimos ab,
deleniti incidunt porro minus delectus
asperiores quae magni corporis ad itaque
perspiciatis pariatur dicta animi maiores,
exercitationem deserunt. Fugiat magni
excepturi, tenetur quia consequatur
odit suscipit? Vel dolorem ex sunt
reprehenderit officia minus similique.
</div>
```

A böngészőben mindkét oldalon 1.5 rem margó jelenik meg, az első töréspontig, ami 576 pixelnél van. Ha tovább növeljük a lap szélességét a szöveg szélessége 576 pixelnél nem nő tovább, de csak a következő töréspontig, ami 768 pixelnél van. Utána körülbelül 3 rem szélességű margó jelenik meg, a szöveg szélessége megint nem változik a következő töréspontig 992 pixelig. Ez így folytatódik az utolsó töréspontig.

Töréspontok:

| Töréspont | Infix osztály | Dimenzió |
|-|-|-|
| extra-small | nincs | <576px |
| Small | sm | >=576px |
| Medium | md | >=768px |
| Large | lg | >=992px |
| Extra large | xl | >=1200px |
| Extra extra large | xxl | >=1400px |

## Rácsok

Maximum 12 darab oszlop hozható létre a tartalom elrendezéséhez. A rácsok **flexbox dobozokból** jönnek létre.

```html
<div class="row">
    <div class="col">
    
    </div>
    <div class="col">
    
    </div>
</div>
```

Próbáljuk ki a következő példát:

```html
<div class="row">
    <div class="col bg-primary">
    a
    </div>
    <div class="col bg-secondary">
    a
    </div>
</div>
```

## Eszközök

A font-weight tulajdonság a bootstrapben:

* fw-bold
* fw-normal
* fw-light

A font-italic tulajdonság:

* fst-italic
* fst-normal

```html
<div class="fw-bold">alma</div>
```

### Igazítás

* text-start
* text-end
* text-center

A "text-justify" elavult lett a Bootstrap 5 verzióban.

```html
<div class="text-center">alma</div>
```

### Helyek

* m - margin
* p - padding

Melyik oldal?

* t - margin-top
* b - margin-bottom
* s - margin-left
* e - margin-right
* x - -left és -right
* y - -top és -bottom

Méretek:

* 0
* 1 - $spacer * .25
* 2 - $spacer * .5
* 3 - $spacer
* 4 - $spacer * 1.5
* 5 - $spacer * 3
* auto - margin: auto

A $spacer értéke 1rem, azaz 16px alapértelmezetten.

Hármas szintű margó körbe:

```html
<div class="m-3">
Valami
</div>
```

Automatikus margó jobb és bal oldalon:

```html
<div class="mx-auto">
Valami
</div>
```

## Bootstrap gyakorlat

### Kérdések

1.)
Hogyan állítható be Bootstrap segítségével egy doboz körül 3-as szintű margó körbe.

* m-3
* margin-3
* mar-3
* p-3

2.)
Hogyan állítható be Bootstrap segítségével egy doboz körül 3-as szintű felső-margó.

* m-3
* mt-3
* mar-3
* top-margin-3
