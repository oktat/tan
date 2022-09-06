# Frontend - JavaScript

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## TypeScript

A TypeScript a Microsoft alkotása. A JavaScript egy szigorított részhalmaza. A böngészők nem ismerik, ezért fordítani kell. A fordítás előnyös a programozók számára, mivel rávilgít több lehetséges hibára.

A TypeScript állományokat .ts kiterjesztésű fájlba írjuk.

## A tsc fordító

Telepítsük a fordítót:

```cmd
npm install -g typescript
```

Ellenőrzés:

```cmd
tsc --version
```

## Helló Világ

A legtöbb JavaScript utasítás változtatás nélkül használható TypeScript nyelvben. Készítsünk egy app.ts nevű fájlt az alábbi tartalommal:

```typescript
console.log('Helló Világ');
```

Fordítás:

```cmd
tsc app.ts
```

A fordítás után, létrejön egy app.js nevű fájl, amit a
böngészők már képesek használni.

## További anyag a témához

* [https://szit.hu/doku.php?id=oktatas:web:typescript:typescript_nyelv](https://szit.hu/doku.php?id=oktatas:web:typescript:typescript_nyelv)
