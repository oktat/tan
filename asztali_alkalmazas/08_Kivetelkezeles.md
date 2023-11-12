# Asztali alkalmazások fejlesztése - Kivétel- és állománykezelés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Kivételkezelés

A kivételek abnormális állapotok, amiket kezelünk. Ha fellép egy abnormális állapot, a program kivételt dob.

Kétféle kivétel van a Java nyelvben:

* ellenőrzött - kötelező kezelni
* futási idejű (ellenőrizetlen) - nem kötelező kezelni

A kivételek a try catch utasításokkal kaphatjuk el.

```java
try {
   //a kód ami dobhatja a kivételt
}catch(Exception e) {
    // Mi legyen, ha volt kivétel
}
```

## Fájlkezelés

### Szöveges fájlok olvasása

A Fájl olvasása ellenőrzött kivételt dobhat, ezért try catch szerkezetbe írjuk.

```java
try {
    File file = new File("adat.txt");
    Scanner scanner = new Scanner(file, "utf-8");
    while(scanner.hasNextLine()) {
        System.out.println(scanner.nextLine());
    }
}catch(FileNotFoundException e) {
    System.err.println("Hiba! A fájl nem található!");
}
```

### Szöveges fájlok írása

```java
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
//...

try {
    FileWriter fileWriter = new FileWriter(
        "adat.txt", 
        Charset.forName("utf-8"), 
        true
    );
    fileWriter.write("valami\n");
    fileWriter.close();
} catch (IOException e) {
    System.err.println("Hiba! A fájlbaírása sikertelen!");
    System.err.println(e.getMessage());
}
```

A FileWriter konstruktor harmadik paramétere egy logikai típus, ami megmondja, hogy
hozzáféűzésre nyissuk meg az állományt, vagy nem.
