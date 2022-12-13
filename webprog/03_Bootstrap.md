# Webprogramozás - Bootstrap

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

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

## Bootstrap NodeJS-el

Van bootstrap csomag, telepítsük:

```bash
npm install bootstrap
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

### Háttér

* bg-primary
* bg-secondary
* bg-success
* bg-danger
* bg-warning
* bg-info


## Konténerek

```html
<div class="container">

</div>
```

## Rácsok

Maximum 12 darab oszlop hozható létre.

```html
<div class="row">
    <div class="col">
    
    </div>
    <div class="col">
    
    </div>
</div>
```

## Eszközök

* font-weight-bold
* font-weight-normal
* font-italic

### Igazítás

* text-start
* text-justify
* text-end
* text-center

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

Példa:

```html
<div class="mx-auto">
Valami
</div>
```
