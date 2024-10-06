# JavaFX

## GUI programozási alapok

A GUI programok a következő elemekből állnak:

* ablak
* konténerek
* komponensek - kontrollok
* menü
* alakzatok
* diagramok
* 3D alakzatok
* egyéb

A GUI programok eseményvezérelten működnek. A legtöbb elem esetén figyelhetünk valamilyen komponenst.

### Komponensek

A komponensek olyan vizuális elemek, amelyeket a program ablakban elhelyezünk. Többféle elnevezés használatos:

* widget
* komponens
* vezérlő

Ezek feliratok, beviteli mezők, nyomógombok, listadbozok, legördülő listadobozok, táblázatok stb.

### Layout

A Layout a GUI elemek szervezését, elrendezést határozzák meg.

### GUI keretrendszerek

* Tkinter (Python)
* Swing (Java)
* Qt (C++, Python - PyQt)
* JavaFX (Java)
* .NET (C#)

### A GUI tervezés lépései

* tervkészítés
* fejlesztés
  * Widgetek létrehozása
  * Eseménykezlők hozzáadása

### Scene Builder UI tervező

A Scene Builder egy vizuális UI tervező eszköz. Lehetővé teszik JavaFX alapú felhasználói felületek gyors és intuitív létrehozását. A felhasznált elemek drag-and-drop módszerrel tehejtők a helyükre.

A Scene Builder FXML fájlokkal dolgozik, ami egy XML alapú leírónyelv. Az FXML a felhasználói felületeket deklaratív módon írja le. A program logikáját Java kóddal valósítjuk meg.

A Scene Builder valós idejű előnézetet kínál (What You See Is What You Get). Lehetőv teszi stíluslapok használatát, a könnyebb testreszabhatóság érdekében.

A Scene Builder a [Gluon weboldaláról tölthető](https://gluonhq.com/) le, vagy használhatjuk a choco parancsot, ha rendelkezésre áll.

```cmd
choco install scenebuilder
```

## JavaFX telepítés

Erre a lépésre nincs szükség, ha Maven vagy Gradle építőeszközt használunk.

Töltsük le a JavaFX-t a következő helyről:

* [https://gluonhq.com/products/javafx/](https://gluonhq.com/products/javafx/)

| JavaFX verzió | Minimum Java JDK |
|-|-|
| 24 | 21 |
| 23 | 21 |
| 21 | 17 |
| 17 | 11 |

A weboldalon válasszuk ki számunkra megfelelő csomagot:

* Window, macOS vagy Linux
* Verzió kiválasztása
* Architecture - a megfelelő processzor - valószínűleg: x64
* Type - a típus legyen SDK

A **Download** gombar kattintva indítsuk a letöltést.

Csomagoljuk ki tetszőleges helyre. Kicsomagolni elég a **lib** könyvtár tartalmát, de ebből minden fájlra szükség van. Ajánlott hely:

* ${userProfile}/Library/javafx

## JavaFX projekt készítése

### VSCode Maven használatával

Indítsuk el a VSCode szerkesztőt. Kérjünk parancs panelt.

* F1
* Create Java Project...
* JavaFX - create from archetype
* Aktiválódik a Java
* Írjuk be a group Id: például: com.example
* Írjuk be a artifact Id: példáu: app01
* Válasszuk ki a projekt melyik könyvtárba készüljön el.
* Terminálban: Fogadjuk el a verzió számot egy **Enter** lenyomásával.
* Terminálban: 13 JavaFX helyett írjuk be a sajátot, vagy **Enter** lenyomásával lépjünk tovább
* Terminálban: nyomjunk egy billentyűt.
* Zárjuk be a VSCode-t, és nyissuk meg azzal a könyvtárral, ahol létrejött a projektünk.

Generáláskor a terminálablakban rákérdez a verzióra, ehhez hasonlót kell lássunk:

```txt
Define value property 'version' 1.0-SNAPSHOT: :
```

A JavaFX verziójának beállítása:

```txt
javafx-version: 13
Y: :
```

A VSCode végül feldob egy párbeszéd ablakot, ami tájékoztat, hogy elkészült a projekt.

A terminálban még egy billentyűnyomást vár:

```txt
* Terminal will reused by tasks, press any key to close it.
```

A projekt beállításait utólag annak gyökérkönyvtárában található **pom.xml** fájlban tehetjük meg.

### Fájlok

A következő könyvtárszerkezetet kapjuk:

```txt
app01/
  |-src/main
  |      |-java/
  |      |   |-com/example/
  |      |   |      |-App.java
  |      |   |      |-PrimaryController.java
  |      |   |      `-SecondaryController.java
  |      |   `mdoule-info.java
  |      `-resources/com/example/
  |                        |-primary.fxml
  |                        `-secondary.fxml
  |-target/
  `-pom.xml
```

### Moduláris fejlesztés

A Java 9-es verziójában bevezették a moduláris fejlesztési lehetőséget. Célja a szervezetebb, karbantarhatóbb, újrafelhasználható kód készítése.

A modulokat a **module-info.java fájlban adjuk meg. Itt határozuk meg a modul nevét és a nyilvános API-kat, amelyeket más modulok elérhetnek.

Egyszerű példa:

```java
module com.example.myapp {
    exports com.example.myapp.api;
    requires java.sql;
}
```

A JavaFX Maven alapú projekt kezdeti modul-info.java állománya:

```java
module com.example {
    requires javafx.controls;
    requires javafx.fxml;

    opens com.example to javafx.fxml;
    exports com.example;
}
```

### Alaposztályok - Application, Stage stb

A projekt belépési pontja az App.java fájl App osztálya. Ez ki van terjesztve az Application elvont osztállyal.

Az **Application** osztály egy start(Stage stage) metódust ír elő. A JavaFX programok itt indulnak.

A main() metódus nem kötelező de használható. A VSCode létrehozza a main() metódust is, mivel ezt keresi indításkor.

A **Stage** osztály jelképezi a program ablakát (színpad). Azon belül jeleneket hozhatunk létre a Scene osztállyal.

### Start metódus

A start() metódusban kell betölteni az FXML állományt. Itt állítjuk be az FXML tartalmát a stage számára, és utasítást adunk a megjelenítésre.

```java
@Override
public void start(Stage stage) throws IOException {
    scene = new Scene(loadFXML("primary"), 640, 480);
    stage.setScene(scene);
    stage.show();
}
```

A main metódusból indításnál egy launch() metódust kell hívni:

```java
public static void main(String[] args) {
    launch();
}
```

A teljes App.java tartalma:

```java
package com.example;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

import java.io.IOException;

/**
 * JavaFX App
 */
public class App extends Application {

    private static Scene scene;

    @Override
    public void start(Stage stage) throws IOException {
        scene = new Scene(loadFXML("primary"), 640, 480);
        stage.setScene(scene);
        stage.show();
    }

    static void setRoot(String fxml) throws IOException {
        scene.setRoot(loadFXML(fxml));
    }

    private static Parent loadFXML(String fxml) throws IOException {
        FXMLLoader fxmlLoader = new FXMLLoader(App.class.getResource(fxml + ".fxml"));
        return fxmlLoader.load();
    }

    public static void main(String[] args) {
        launch();
    }

}
```

Indítás után a start(Stage stage) metódusban aláhúzza a **Stage** osztályt. Ha az egeret a név felé visszük a következőt kapjuk:

```txt
The type Stage from module javafx.graphics may not be accessible to clients due to missing 'requires transitive'
```

A figyelmeztetés megszüntetéséhez transitive módosítóval importálni kell a a javafx.graphics csomagot:

module-info.java:

```java
module com.example {
    requires transitive javafx.graphics;
    requires javafx.controls;
    requires javafx.fxml;

    opens com.example to javafx.fxml;
    exports com.example;
}
```

## JavaFX konténerek

A JavaFX számos konténert kínál használatra. Vannak fixméretű és rugalmas méretű konténerek. A konténerekbe újabb konténereket és kontrollokat tehetünk.

* Pane

### A Pane konténer

A Pane a legegyszerűbb konténer, ami felhasználói felület elemeinek csoportosításra használható. A Pane nem rendelkezik előre definiált elrendezéssel, az elredezést a fejlesztő határozza meg.

A Pane gyermekei számára szabad elhelyezés biztosít, x, y koordinátákon. A Pane konténer gyermekit a getChildren() metódussal érhetjük el.

### Az AnchorPane konténer

Az AnchorPane lehetővé teszi a gyermek elemek rögzített pozicionálását. Meghatározhatunk bal, jobb felső és alsó margót. A Stage vagy a Scene mérete megváltozik az AnchorPane gyermeki automatikusan változtatják méretüket.

## Szöveg

Vegyünk egy Pane konténert, majd tegyük rá szöveget.

* Készítsük el a projektet, például **szoveg** néven.
* Készítsünk a egy mainScene.fxml nevű állományt.
* Nyissuk meg a Scene Builder segítségével.
* Tegyünk fel egy Pane konténet.
* Tegyük fel a Text komponenst.
  * Text értéke: "Helló Világ"
  * fx:id : helloText
* Állítsuk be kontrollert: MainController

Ha group Id **com.example** akkor a kontroller beállítása:

```txt
com.example.MainController
```

Mentés után, a válasszuk a következő menüt:

* View > Show Sample Controller Skeleton

Az előugró ablakban kapunk egy ajánlást, hogyan nézhet ki a MainController tartalma. Egyszerűen mentsük el:

* **Save as...**

### Indítás

Az App.java fájlban állítsuk be, hogy a mainScene.fxml legyen betöltve. Javítsuk:

```java
scene = new Scene(loadFXML("manScene"), 640, 480);
```

Ezt követően indíható a projekt.

### A szöveg beállítása kontrollerből

A Scene Builder-ben elhelyezett szövegnek azt az azonosítót adtuk, hogy helloText. Ennél fogva a MainController osztályban ezen a néven érhetjük le. A követelmény, hogy a MainControllerben legyen az @FXML annotációval deklarálva:

```java
@FXML
private Text helloText;
```

A szöveg beállításához, a MainController.java fájlban készítsünk egy initilize() metódust:

```java
    @FXML
    void initialize() {
        helloText.setText("Új szöveg");
    }
```

### Szöveg színezése

A Color osztály importálásánál ügyeljünk arra, hogy a csomag a következő legyen:

```java
import javafx.scene.paint.Color;

//...

helloText.setFill(Color.BLUE);
```

Néhány beépített szín:

* Color.ALICEBLUE
* Color.ANTIQUEWHITE
* Color.AQUA
* Color.AQUAMARINE
* Color.AZURE
* Color.BEIGE
* Color.BISQUE
* Color.BLACK
* Color.BLANCHEDALMOND
* stb.

Próbáljuk ki több színnel az előző programot.

### RGBA színek

```java
helloText.setFill(new Color(1.0, 0.0, 0.0, 1.0));
```

### Méret

```java
import javafx.scene.text.Font;
//...
helloText.setFont(Font.font(32));
```

## Vonal

Húzzuk az alakzatok közül egy Line komponenst a Pane konténerre.

Nevezzük el, hogy elérhető legyen a kontrollerben. Például:

* fx:id vonal1
* Controller: com.example.MainController

MainController.java

```java
package com.example;

import javafx.fxml.FXML;
import javafx.scene.paint.Color;
import javafx.scene.shape.Line;

public class MainController {
    @FXML
    private Line line1;

    @FXML
    void initialize() {                
        line1.setStroke(Color.RED);
        line1.setStrokeWidth(5);
    }
}
```

## Téglalap

* Recatangle    fx:id   rectangle1
* Controller    com.example.MainController

```java
package com.example;

import javafx.fxml.FXML;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;

public class MainController {
    @FXML
    private Rectangle rectangle1;

    @FXML
    void initialize() {          
        rectangle1.setStroke(Color.CHOCOLATE);
        rectangle1.setStrokeWidth(5);
        rectangle1.setFill(Color.GREEN);
    }
}
```

### Téglalap animálása

MainController.java:

```java
package com.example;

import javafx.animation.TranslateTransition;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.shape.Rectangle;
import javafx.util.Duration;

public class MainController {

    @FXML
    private Rectangle vehicle;

    @FXML
    void onClickStartButton(ActionEvent event) {
        TranslateTransition transition = new TranslateTransition();
        transition.setNode(vehicle);
        transition.setDuration(Duration.seconds(5));
        transition.setByX(500);        
        transition.play();

    }
}
```

Oda-vissza végtelenségig:

```java
@FXML
void onClickStartButton(ActionEvent event) {
    TranslateTransition transition = new TranslateTransition();
    transition.setNode(vehicle);
    transition.setDuration(Duration.seconds(5));
    transition.setCycleCount(TranslateTransition.INDEFINITE);
    transition.setAutoReverse(true);
    transition.setByX(500);
    transition.play();
}
```

Téglalapok versenye:

* [https://github.com/oktat/exCarRace_JavaFX.git](https://github.com/oktat/exCarRace_JavaFX.git)

## Kör

* Circle        fx:id   circle1
* Controller    com.example.MainController

## Ellipszis

* Ellipse       fx:id   ellipse1
* Controller    com.example.MainController

## JavaFX képek

Használjunk PNG formátumot.

A képeket tegyük a .fxml fájlok mellé. Például:

* src/resources/com/example/valam.png

Beállítás Java kódból:

```java
package com.example;

import javafx.fxml.FXML;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

public class MainController {

    @FXML
    private ImageView imageView;

    @FXML
    void initialize() {          
        Image image = new Image(getClass().getResourceAsStream("nyereg-kicsi.jpg"));
        imageView.setImage(image);
    }
}

```

## JavaFX Label

* Label         fx:id   label1
* Controller    com.example.MainController

A Label elérhető kontrollerből, ahol tulajdonságai beállíthatók. A tartalmának beállítása:

```java
label1.setText("Másik tartalom");
```

## JavaFX Button

* Button        fx:id   button1
* Code          On Action: onClickButton1
* Controller    com.example.MainController

A Button elérhető kontrollerből, ahol tulajdonságai beállíthatók. Leginkább úgy használjuk, hogy egy esménykezelőt írunk hozzá.

### Eseménykezelés

```java
package com.example;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;

public class MainController {

    @FXML
    void onClickButton1(ActionEvent event) {
        System.out.println("Működik");
    }
}
```

## TextField és PaswordField

* TextField     fx:id         text1
* Button        On Action     OnClickButton1
* Controller    com.example.MainController

```java
package com.example;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TextField;

public class MainController {

    @FXML
    private TextField text1;

    @FXML
    void onClickButton1(ActionEvent event) {
        System.out.println(text1.getText());
    }
}
```

## Alert

```java
@FXML
void onClickButton1(ActionEvent event) {
    Alert alert = new Alert(Alert.AlertType.INFORMATION);
    alert.setTitle("Információ");
    alert.setHeaderText(null);
    alert.setContentText("Működik");
    alert.showAndWait();        
}
```

## Aszinkron folyamat kezelése

Az aszinkron folyamatok megakaszthatják a program futtatását. Legyen egy nyomógomb kattintását kezelő metódus:

```java
@FXML
void onClickButton1(ActionEvent event) {
    doAsyncProcess();
    System.out.println("Kattintás után");
}
```

Az doAsyncProcess() megakasztja a végrehajtást. A "Kattintás után" szöveg csak akkor íródik a képernyőre, ha az aszinkron folyamat végetért.

Ha szeretnénk a háttérben futtatni a doAsyncProcess() folyamatot:

```java
@FXML
void onClickButton1(ActionEvent event) {
    new Thread(this::doAsyncProcess).start();
    System.out.println("Kattintás után");
}
```

Teljes példakód:

MainController.java:

```java
package com.example;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;

public class MainController {

    @FXML
    void onClickButton1(ActionEvent event) {
        new Thread(this::doAsyncProcess).start();
        System.out.println("Kattintás után");
    }
    private void doAsyncProcess() {
        try {
            this.tryDoAsyncProcess();
        } catch (InterruptedException e) {
            System.err.println("Hiba! Az aszinkron futtatás sikertelen!");
        }
    }
    private void tryDoAsyncProcess() throws InterruptedException{
        Thread.sleep(4000);
        System.out.println("Az aszinkron folyamat véget ért");
    }
}
```
