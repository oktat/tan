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
    System.err.println("Hiba! A fájlbaírás sikertelen!");
    System.err.println(e.getMessage());
}
```

A FileWriter konstruktor harmadik paramétere egy logikai típus, ami megmondja, hogy
hozzáféűzésre nyissuk meg az állományt, vagy nem.

## Kivételek eldobása

Ha nem szeretnénk egy metódusban kezelni egy kivételt, továbbdobhatjuk a hívás helyére. Ha VSCode-ban létrehozunk egy "No build tools" típusú Java projektet, abban találunk egy App osztályt, abban pedig egy main() metódust, amely minden kivételt eldob. Ha fájlkezelést ebben a main() metódusban szeretnénk megvalósítani, a kivételet nem szükséges kezelni.

App.java:

```java
import java.io.FileWriter;
import java.nio.charset.Charset;

public class App {
    public static void main(String[] args) throws Exception {

        FileWriter fileWriter = new FileWriter(
            "adat.txt", 
            Charset.forName("utf-8"), 
            true
        );
        fileWriter.write("valami\n");
        fileWriter.close();
    }
}
```

Ha a main() metódusban engedünk tovább egy kivételt, azt többet nem szükséges kezelni.

A fájlkezelést általában nem a főosztályban valósítjuk meg. Legyen például egy Store nevű osztály. A következő kód hibát dob, mivel nem kezeltük a kivételt:

Store.java:

```java
import java.io.FileWriter;
import java.nio.charset.Charset;

public class Store {
    public void storeFile() {
                                 //HIBA
        FileWriter fileWriter = new FileWriter(
            "adat.txt", 
            Charset.forName("utf-8"), 
            true
        );
        fileWriter.write("valami\n");
        fileWriter.close();        
    }
}
```

Dobjuk tovább a kivételt. Meg kell tudunk milyen kivételről van szó. A kódszerkesztő is segít ebben. Aláhúzza  a "new FileWriter()" konstruktort. Ha az egérkurzot ráviszem, akkor kiírja milyne kivételt kell kezelnünk. Esetünkben ez a IOException. Dobjuk csak ezt a kivételet tovább:

Store.java:

```java
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;

public class Store {
    public void storeFile() throws IOException{
        FileWriter fileWriter = new FileWriter(
            "adat.txt", 
            Charset.forName("utf-8"), 
            true
        );
        fileWriter.write("valami\n");
        fileWriter.close();        
    }
}
```

A kódunk már nem ad hibát. A hívás helyén viszont újra előjön a kezeletlen kivétel, ha ott nem dobjuk tovább. Vegyük a main() metódust, amiből kivesszük a kivételek eldobását, és használjuk itt a Store osztályunkat:

App.java:

```java
public class App {
    public static void main(String[] args) {
        Store store = new Store();
        //HIBA:
        store.storeFile();
    }
}
```

A storeFile() metódus hívása hibát jelez. Vagy kezeljük a kivételt, vagy eldobjuk. Kezeljük a kivételet.

A kivételeket illik kezelni, de nem illik továbbengedni egészen a main() metódusig. Készítsünk egy különálló hibakezelő metódust, ahol kezeljük a kivételt. Így tisztamarad a lényegi kódunk. Lássuk újra a Store osztályt.

Store.java:

```java
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;

public class Store {
    public void storeFile() {
        try {
            tryStoreFile();
        } catch (IOException e) {
            System.err.println("Hiba! A kiírás sikertelen!");
            System.err.println(e.getMessage());
        }
    }
    public void tryStoreFile() throws IOException{
        FileWriter fileWriter = new FileWriter(
            "adat.txt", 
            Charset.forName("utf-8"), 
            true
        );
        fileWriter.write("valami\n");
        fileWriter.close();        
    }
}
```

Az eredeti storeFile() metódust átneveztük tryStoreFile()-ra. Itt marad a fájlkezelés az eldobott IOException kivétellel. Ugyanakkor készítettünk egy storeFile() metódust amiben meghívjuk tryStoreFile() metódust, ahol kezeljük a kivételt. A main() metódus ekkor:

App.java

```java
public class App {
    public static void main(String[] args) {
        Store store = new Store();
        store.storeFile();
    }
}
```

## Saját kivétel készítése

A saját kivételeket származtatásból hozzuk létre a két alaposztály egyikéből:

* Exception - ellenőrzött kivétel készítése
* RuntimeException - ellenőrizetlen kivétel készítése

Egy hibára saját kivételt szeretnénk dobni. Például bekérek egy számot, ami nem lehet 0 vagy negatív szám.

Cal.java:

```java
import java.util.Scanner;

public class Cal {
    int num;
    public void input() {
        System.out.print("Szám: ");
        try(Scanner sc = new Scanner(System.in)) {
            String numStr = sc.nextLine();
            num = Integer.parseInt(numStr);
        }        
    }
    public void print() {
        System.out.println("A kért szám: " + num);
    }
}
```

App.java

```java
public class App {
    public static void main(String[] args) {
        Cal cal = new Cal();
        cal.input();
        cal.print();
    }
}
```

Készítsünk saját kivételt:

WrongNumberException.java:

```java
public class WrongNumberException extends RuntimeException{
    public WrongNumberException() {
        super("Hiba! A szám nem megfelelő!");
    }
}
```

Használjuk a kivételt:

Cal.java:

```java
import java.util.Scanner;

public class Cal {
    int num;
    public void input() {
        System.out.print("Szám: ");
        try(Scanner sc = new Scanner(System.in)) {
            String numStr = sc.nextLine();
            num = Integer.parseInt(numStr);
            if (num <= 0) {
                throw new WrongNumberException();
            }
        }        
    }
    public void print() {
        System.out.println("A kért szám: " + num);
    }
}
```

Futtassuk 0 beírt számmal.

A kivételünk lehet ellenőzött is:

WrongNumberException.java:

```java
public class WrongNumberException extends Exception{
    public WrongNumberException() {
        super("Hiba! A szám nem megfelelő!");
    }
}
```

Ebben az esetben az input() metódusban is kezdenünk kell valamit a kivétellel. Itt most eldobjuk:

Cal.java:

```java
import java.util.Scanner;

public class Cal {
    int num;
    public void input() throws WrongNumberException{
        System.out.print("Szám: ");
        try(Scanner sc = new Scanner(System.in)) {
            String numStr = sc.nextLine();
            num = Integer.parseInt(numStr);
            if (num <= 0) {
                throw new WrongNumberException();
            }
        }        
    }
    public void print() {
        System.out.println("A kért szám: " + num);
    }
}
```

A hívás helyén viszont kezeljük, ami most az App osztály:

App.java:

```java
public class App {
    public static void main(String[] args) {
        Cal cal = new Cal();
        try {
            cal.input();    
        } catch (WrongNumberException e) {
            System.err.println("Hiba! Hibás szám!");
            System.err.println(e.getMessage());
        }        
        cal.print();
    }
}
```

### Az ideális kivétel

Saját kivételnél pontosabb eredményt kaphatunk, ha a kivétel szövegét ott adjuk meg, ahol dobjuk a throw utasítással.

WrongNumberException.java:

```java
public class WrongNumberException extends RuntimeException{
    public WrongNumberException(String msg) {
        super(msg);
    }
}
```

Cal.java:

```java
import java.util.Scanner;

public class Cal {
    int num;
    public void input() {
        System.out.print("Szám: ");
        try(Scanner sc = new Scanner(System.in)) {
            String numStr = sc.nextLine();
            num = Integer.parseInt(numStr);
            if (num <= 0) {
                String msg = "A szám nem lehe 0 vagy kisebb!";
                throw new WrongNumberException(msg);
            }
        }
    }
    public void print() {
        System.out.println("A kért szám: " + num);
    }
}
```

## A finally blokk

A try_catch szerkezet tartalmazhat egy harmadik részt is.

```java
try {

}catch() {

} finally {

}
```

A finally blokkot arra tervezték, hogy olyan kódokat futassunk amiket akkor is végre kell hajtani, ha hibára futott egy kódunk. Ilyen lehet az erőforrások lezárása.

### Fájl tárolása finally blokkal

Store.java:

```java
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;

public class Store {
    FileWriter fileWriter;
    public void storeFile() {
        try {
            tryStoreFile();
        } catch (IOException e) {
            System.err.println("Hiba! A kiírás sikertelen!");
            System.err.println(e.getMessage());
        } finally {            
            try {
                fileWriter.close();    
            } catch (IOException e) {
                System.err.println("Hiba! A bezárás sikertelen!");
                System.err.println(e.getMessage());                
            }
        }
    }
    private void tryStoreFile() throws IOException{
        fileWriter = new FileWriter(
            "adat.txt",
            Charset.forName("utf-8"), 
            true
        );
        fileWriter.write("valami\n");
        fileWriter.close();        
    }
}
```

A fileWriter objektumot globálissá tettük, hogy a hibakezelő metódusból is elérhető legyen.

App.java:

```java
public class App {
    public static void main(String[] args) {
        Store store = new Store();
        store.storeFile();
    }
}
```

## Több kivétel elkapása egyszerre

A try_catch szerkezetnek lehet több catch ága is:

```java
try {
   //kód
}catch (IOException e){
    e.printStackTrace();
}catch (GeneralSecurityException e){
    e.printStackTrace();
}catch (ClassNotFoundException e){
    e.printStackTrace();
}
```

A sorrendnél vegyük figyelembe, hogy a specifikustól a generikusok kivételek felé haladjunk. Vegyük például a fájlkezelés két kivételét:

```java
try {
   //fájlkezelő kód
}catch (FileNotFoundExcepton e){
    e.printStackTrace();
}catch (IOException e){
    e.printStackTrace();
}
```

Nézzük meg a Java dokumentációban a FileNotFoundException öröklési hierarchiáját. Azt látjuk, hogy a FileNotFoundException a IOException-ből lett származtatva, vagyis a IOExceptoin általánosabb (generikusabb), a FileNotFoundException specifikusabb. Ezért előbb tesszük a FileNotFoundException, és csak utána a IOExceptiont.

Ha a sorrend fordított, a IOException minden kivételt elfogna és sosem teljesülne a FileNotFoundException ág.

A több catch ágat tartalmazó try_catch szerekezeteknek is lehet egy finally blokk a végén.

## Beépített kivételek

Sok beépített metódus áll rendelkezésre a Java nyelvben. Itt most veszünk egyet.

Ha egy metódus még nincs megvalítva, dobhatunk java.lang.UnsupportedOperationException kivételt.

```java
throw new UnsupportedOperationException();
```

## Automatikusan lezárt erőforrások

Egy try(){} blokk segítségével a zárójelben megadott erőforrások automatikusan bezáródnak. Az sc objektum automatikus bezárása:

Input.java:

```java
import java.util.Scanner;

public class Input {
    public String next(String msg) {
        System.out.print(msg);
        try(Scanner sc = new Scanner(System.in)) {
            return sc.nextLine();
        }          
    }
}
```

Ez nem tévesztendő össze a try_catch hibakezelővel.

A fenti kód futtatása main() metódusban:

App.java:

```java
public class App {
    public static void main(String[] args) {
        Input input = new Input();
        String nev = input.next("Név: ");
        System.out.println("Üdv: "+ nev);
    }
}
```

### Fájl zárás automatikusan lezárt erőforrással

Fentebb már megtanultuk, hogy a kivételeket külön metódusban kezelejük. A try(){} blokk maradhat, miközben a kivételt továbbdobjuk.

Store.java:

```java
import java.io.FileWriter;
import java.io.IOException;
import java.nio.charset.Charset;

public class Store {
    public void storeFile() {
        try {
            tryStoreFile();
        } catch (IOException e) {
            System.err.println("Hiba! A kiírás sikertelen!");
            System.err.println(e.getMessage());
        }
    }
    private void tryStoreFile() throws IOException{
        try(FileWriter fileWriter = new FileWriter(
            "adat.txt",
            Charset.forName("utf-8"), 
            true
        )) {
            fileWriter.write("valami\n");
        }

    }
}
```

A try_catch szerkezetben felesleges a finally blokk is. A tryStoreFile() metódusban felesleges a close() metódus hívása.
