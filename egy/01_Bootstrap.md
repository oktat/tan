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
