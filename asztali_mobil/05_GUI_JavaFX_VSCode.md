# JavaFX VSCode

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Telepítés](#telepítés)
* [Scene Builder használata](#scene-builder-használata)
* [JavaFX projekt készítése](#javafx-projekt-készítése)
* [JavaFX konténerek](#javafx-konténerek)
* [Komponensek](#komponensek)
* [Button](#button)
* [Szöveges komponensek](#szöveges-komponensek)
* [Alert](#alert)
* [Az initilize metódus](#az-initilize-metódus)
* [CheckBox](#checkbox)
* [RadioButton](#radiobutton)
* [ChoiceBox](#choicebox)
* [ListView](#listview)
* [TableView](#tableview)

## Telepítés

### Scene Builder beszerzése

Látogassuk meg a következő weboldalt:

* [https://openjfx.io/](https://openjfx.io/) (2024)

* SceneBuilder-23.0.0.msi

Ügyeljünk arra, hogy a Scene Builder 23-hoz minimum Java 21 szükséges.

A Scene Builder alapértelmezetten a felhasználó profiljába telepszik.

### JavaFX beszerzése

Erre a lépésre csak akkor van szükség, ha No build tools módban generálunk JavaFX projektet.

Látogassuk meg a következő weboldalt:

* [https://openjfx.io/](https://openjfx.io/) (2024)

Ügyeljünk arra, hogy a 21-s JavaFX-nek, minimum 17-s Java szükséges. Használjunk LTS verziót.

| JavaFX | Minium JDK |
|-|-|
| JavaFX 24 | JDK 21 |
| JavaFX 23 | JDK 21 |
| JavaFX 21 | JDK 17 |

A weboldalon keressük meg az operációs rendszernek megfelelő csomagot, a kívánt verziót. Az architektúánál válasszuk ki a processzorunkat, ami valószínűleg x64 lesz. A **Type** legyen **SDK**.

A letöltés után ezekhez hasonló fájlokat kapunk:

* openjfx-23_windows-x64_bin-sdk.zip
* openjfx-23_linux-x64_bin-sdk.zip

Csomagoljuk ki őket programozói könyvtár gyűjteményünkbe. Legyen például:

* Library

A Library könyvtár lehet a felhasználó saját könyvtárába. Windowson például:

* C:\Users\user\Library

Elég a csomagban lévő lib könyvtár kicsomagolása.

### VSCode beállítása

Szükséges bővítmények:

* Extension Pack for Java
* SceneBuilder extension for Visual Studio Code

Scene Builder beállítása:

* F1 parancs panel
* Configure Scene Builder path

* c:\Users\janos\AppData\Local\SceneBuilder\

## Scene Builder használata

Indítás után:

![Scene Builder indulás után](images/scenebuilder_indulas.png)

Üres projekt:

![Scene Builder üres projekt](images/scene_builder_ures_projekt.png)

Indulás után baloldalon harmonikasáv eszközön találjuk a konténereket és a kontrollokat.

* Containers
* Controls

A konténerek arra használhatók, hogy azokban újabb konténereket vagy kontrollokat helyezzünk el.

Tegyünk fel egy Panel nevű konténert, majd rakjunk rá gombot (Button).

## JavaFX projekt készítése

### VSCode projekt készítése

A VSCode segítségvel több módon készíthetünk JavaFX projektet. Itt most Maven projektet fogunk készíteni.

Nyissuk meg a parancs panelt, majd válasszuk a **Create Java Project** lehetőséget. Azon belül a **JavaFX** pontot válasszuk.

* F1
* Create Java Project
* JavaFX - create from archetype

Ezt követően adjuk meg a gorup Id-t. Például:

* com.example

Majd adjuk meg az artifact Id-t, ami a projekt neve is egyben:

* app01

Az előugró párbeszédablakban válasszuk ki a projekt helyét.

Egy kérdést kapunk a terminálablakban, ahol beállíthatjuk a projekt verzióját. Ha az 1.0-SNAPSHOT megfele nekünk, csak nyomjunk egy **Enter**-t.

Ezt követően a letöltendő JavaFX verzióját kérdezi meg. Ha megfelel nekünk az alapértelmezés, csak nyomjunk **Enter**.

Ha elkészült a projekt a VSCode egy párbeszédablakban adja tudtunkra, a terminálablak pedig még egy billentyűnyomást vár.

Zárjuk be a VSCode-t, majd nyissuk meg az elkészült projekt könyvtárát.

### A létrejött könyvtárszerkezet

```txt
app01/
  |-src/
  |  `-main/
  |     |-java/
  |     |  `-com/
  |     |     `-example/
  |     |        |-App.java
  |     |        |-PrimaryController.java
  |     |        `-SecondaryController.java
  |     |-resources/
  |     |  `-com/
  |     |     `-example/
  |     |        |-primary.fxml
  |     |        `-secondary.fxml
  |     `-module-info.java
  |-target/
  `-pom.xml
```

### A főosztály

App.java:

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

A JavaFX projektet használhatjuk csak Java nyelven megírva, vagy tehetjük külön FXML fájlokba a felhasználói felületet. Az FXML állományok valójában szimpla XML fájlok. Az FXML fájl kiterjesztése:

* .fxml

Az App osztályban van egy start() metódus ezzel indul a program. A main() metódus nem lenne kötelező, de a VSCode így képes elindítani.

A setRoot() metódus segítségével lehet beállítani más FXML fájlokat más osztályokban. Az FXML állomány betöltését a loadFXML() metódus végzi.

### A Stage és Scene

A program ablakát a Stage osztály jelképezi. Az ablakon belül egy FXML egy Scene, vagyis egy jelent.

Az FXML fájl cseréje, tulajdonképpen a Scene cseréjét jelenti.

![JavaFX felépítése](images/javafx_szerkezete.png)

### Moduláris fejlesztés

```java
module com.example {
    requires javafx.controls;
    requires javafx.fxml;

    opens com.example to javafx.fxml;
    exports com.example;
}
```

Vegyük fel a javafx.graphics modult transitive módban:

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

Tegyünk a Scene Builder-ben egy Panel konténert középre.

```xml
<?xml version="1.0" encoding="UTF-8"?>

<?import javafx.scene.layout.Pane?>

<Pane maxHeight="-Infinity" maxWidth="-Infinity" 
minHeight="-Infinity" minWidth="-Infinity" 
prefHeight="400.0" prefWidth="600.0" 
xmlns="http://javafx.com/javafx/21" 
xmlns:fx="http://javafx.com/fxml/1" />
```

A Panel egy fix méretű tároló. Ha felteszünk egy komponenst, az adott helyen fog megjelenni a program futása során.

A Panel méret igazodik az App osztályban megadott mérethez:

```java
scene = new Scene(loadFXML("mainScene"), 640, 480);
```

## Komponensek

A komponenseket Scene Builder-ben baloldalon találjuk a harmonikasáv **Controls** szakaszában.

Néhány komponens, amiket érintei fogunk:

* Button
* CheckBox
* ComboBox
* Label
* ListView
* PasswordField
* RadioButton
* TableColumn
* TableView
* TextField

## Button

A Button egy általános nyomógomb a JavaFX-ben.

### Beállítások

A Scene Builder-ben a beállításokat a jobboldali harmónikasávban találjuk. A következő szakaszok érhetők el:

* Properties
* Layout
* Code

A Properties tartalmazza a gomb tulajdonságait. A Layout az elrendezéshez ad segítséget. A Code részben adhatjuk, meg, milyen metódussal szeretnénk reagálni kattintás esetén.

### Eseménykezelés

Az eseménykezelés beállítása Scene Builder-ben:

* Meg kell adni a kontrollert.
* Meg kell adni, milyen eseményre, milyen metódus fusson.

A kontrollert a baloldali harmonikasáv, **Controller** szakaszában állíthatjuk be.

Tegyük fel, hogy com/example csomagunk van. A kontroller, amit használni szeretnénk MainController-nek nevezzük el, vagyis az útvonala:

* src/main/java/com/example/MainController.java

Ebben az esetben a következő beállítás szükséges:

* com.example.MainController

Egy FXML fájl számára egyetlen kontroller állítható be.

Az eseménykezelő metódust a baloldali harmónika következő szakaszában állíthatjuk: **Code**.

Többféle eseményre is reagálhatunk. Válasszuk a **On Action** beviteli mezőt. Legyen gombunk kezelő metódusa például:

* onClickButton

Ebben a formában kell beírni, csak a metódus nevét.

### A MainController

Hozzuk létre a MainController nevű fájlt. A Scene Builder segítséget ad, hogyan tültsük ki. Kattintsunk a **View** menü utolsó pontjára: **Show Sample Controller Skeleton**.

Tegyük fel a Panel-re egy Button-t, ha még nem tettük volna meg. Nézzük meg mit ajánl a Scene Builder:

```java
package com.example;

import javafx.event.ActionEvent;

public class MainController {

    @FXML
    void onClickButton(ActionEvent event) {

    }

}
```

A párbeszédablak mentésre is lehetőséget ad a **Save as...** nyomógombba.

Azokat a metódusokat, amelyeket a Scene Builder-ben hivatkozunk, és bekerülnek a .fxml fájlba, egy @FXML annotációval kell megjelölni.

Írjunk egy egyszerű tevékenységet. Kattintásra a konzolra írjuk ki, hogy "Helló".

```java
@FXML
  void onClickButton(ActionEvent event) {
    System.out.println("Helló");
  }
```

## Szöveges komponensek

Néhény szöveges komponens:

* Label
* TextField
* PasswordField

### Label

A Label segítségével egyszerű feliratok jeleníthetők meg a felületen.

A baloldali harmonikasáv **Control** szakaszából húzzunk egy **Label**-t a Panel-re.

A jobboldali harmonikasáv **Properties** szakaszában állítsuk be a **Text** tulajdonságát. Ez lesz a felirata.

### Felirat változtatása

Ha szeretnénk a feliat tartalmát megváltoztatni, adnunk kell számára egy azonosítót. Legyen például **triangleLabel**.

ez a jobboldali harmonikasáv, **Code** szakaszában kell beállítani. Keressük meg a **fx:id** mezőt. Majd írjuk be a nevet.

Nézzük meg újból mit ajánl a Scene Builder:

* View > **Show Sample Controller Skeleton**

Most azonban vigyázzunk, mert eddig munkánkat felülírhatjuk, ha mentünk.

Vegyünk észre, hogy a triangleLabel-t betette osztály adattaggént MainController osztályba, az ajánló ablakban. Másoljuk ki, és illesszük be a MainController.java fájlba.

### TextField

A TextField segítségével bevitelimezőt lehet létrehozni.

Tegyünk balról egy TextField nevű komponenst a Panel-re.

Jobboldali harmonikasáv **Code** szakaszában állítsunk be egy azonosítót. Legyen például baseText.

Hozzuk létre a MainControllerben a megfelelő adattagot.

### PasswordField

A PasswordField segítségével olyan bevitelimező hozható létre, ahol a gépelés során csak pontok jelennek meg.

## Alert

```java
import javafx.scene.control.Alert;

//...

Alert alert = new Alert(Alert.AlertType.INFORMATION);
alert.setHeaderText(null);
alert.setContentText("Hello World!");
alert.showAndWait();
```

## Az initilize metódus

Készíts egy mainScene.fxml fájlt. Tégy fel egy Panel tárolót. Erre tegyünk például egy Label komponenst, legyen a neve például label1.

Jelöljük meg a kontrollernek a MainController-t, majd hozzuk is létre.

Írjuk át a MainController-ből a label1 feliratát.

```java
package com.example;

import javafx.fxml.FXML;
import javafx.scene.control.Label;

public class MainController {

    @FXML
    private Label label1;

    @FXML
    void initialize() {
        label1.setText("Új szöveg");        
    }
}
```

Vegyük észre az initilize() metódus előtt az @FXML annotációt.

Másik lehetőség az Initilizable használata:

```java
package com.example;

import java.net.URL;
import java.util.ResourceBundle;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;

public class MainController implements Initializable {

    @FXML
    private Label label1;

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        label1.setText("Új szöveg");        
    }
}
```

## CheckBox

MainController.java:

```java
package com.example;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.CheckBox;

public class MainController {

    @FXML
    private CheckBox acceptCheckbox;

    @FXML
    void onClickButton(ActionEvent event) {

        if (acceptCheckbox.isSelected()) {
            System.out.println("Elfogadva");
        }else {
            System.out.println("Nincs elfogadva");
        }

    }

}
```

### CheckBox listában

A Scene Builder-ben:

```txt
Pane
  |-Button    onClickSendButton()
  |-Label     Melyik hozzávaló van meg?
  |-Label     Túrós sütemény
  `-ListView  listView
```

```java
package com.example;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.CheckBox;
import javafx.scene.control.ListView;

public class MainController {

    @FXML
    private ListView<CheckBox> listView;

    @FXML
    void initialize() {
        ObservableList<CheckBox> options = FXCollections.observableArrayList(
            new CheckBox("500 g túró"),
            new CheckBox("6 tojás"),
            new CheckBox("300 g tejföl"),
            new CheckBox("70 g mandulaliszt"),
            new CheckBox("40 g bambuszrostliszt"),
            new CheckBox("120 g vaj"),
            new CheckBox("12 g sütőport"),
            new CheckBox("10-100 g édesítő (ízlés szerint)")
            );
        listView.getItems().addAll(options);
    }
    @FXML
    void onClickSendButton(ActionEvent event) {
        StringBuilder sb = new StringBuilder();
        sb.append("A hiányzó hozzávalók: \n");
        for (CheckBox checkBox : listView.getItems()) {
            if (!checkBox.isSelected()) {
                sb.append(checkBox.getText());
                sb.append(", ");
            }
        }
        System.out.println(sb.toString());
    }
}
```

### CheckBox GridPane rácsban

Tegyük fel a Scene Builder-ben a következőket:

```txt
Pane
  |-GridPane  gridPane
  `-Button    onClickSendButton()
```

MainController.java:

```java
package com.example;

import javafx.collections.FXCollections;
import javafx.collections.ObservableList;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.CheckBox;
import javafx.scene.layout.GridPane;


public class MainController {

    @FXML
    private GridPane gridPane;

    ObservableList<CheckBox> options = FXCollections.observableArrayList();;

    @FXML
    void initialize() {
        
        for (Integer i = 1; i <= 10; i++) {
            options.add(new CheckBox(i.toString()));
        }

        int row = 0;
        int col = 0;
        for (CheckBox option : options) {
            gridPane.add(option, col, row);
            col++;
            if (col > 3) {
                row++;
                col = 0;
            }
        }
    }
    @FXML
    void onClickSendButton(ActionEvent event) {
        StringBuilder sb = new StringBuilder();
        sb.append("Választottak: \n");
        for (CheckBox checkBox : options) {
            if (checkBox.isSelected()) {
                sb.append(checkBox.getText());
                sb.append(", ");
            }
        }
        System.out.println(sb.toString());
    }
}
```

## RadioButton

Scene Builder-ben tegyük fel egy Pane konténert, három RadioButton-t és egy Button elemet.

```txt
Pane
  |-RadioButton     alma    Toggle Group: fruitGroup
  |-RadioButton     körte   Toggle Group: fruitGroup
  |-RadioButton     barack  Toggle Group: fruitGroup
  `-Button          Küldés  onClicSendButton()
```

MainController.java:

```java
package com.example;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.RadioButton;
import javafx.scene.control.ToggleGroup;

public class MainController {

    @FXML
    private ToggleGroup fruitGroup;

    @FXML
    void onClickSendButton(ActionEvent event) {
        RadioButton selectedRadioButton = (RadioButton) fruitGroup.getSelectedToggle();
        if (selectedRadioButton != null) {
            System.out.println(selectedRadioButton.getText());
        }
    }
}
```

### RadioButton gyakorlat 1

* Készítsen alkalmazást amely 3 képet tartalmaz.
* A képeken legyen 3 féle étel.
* Minden kép alatt legyen egy rádiógomb.
* Legyn egy nyomógomb, amivel elküldjük a választást.

## ChoiceBox

```txt
Pane
  |-ComboBox               comboBox
  `-Button      Küldés     onClickSEndButton
```

MainController.java:

```java
package com.example;

import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;

public class MainController {

    @FXML
    private ChoiceBox<String> choicebox;

    @FXML
    void initialize() {
        choicebox.getItems().addAll(
            "alma",
            "körte",
            "szilva");
    }

    @FXML
    void onClickStartButton() {
        System.out.println(choicebox.getValue());
    }
}
```

### ChoiceBox azonosítóval

```txt
Pane
  |-ChoiceBox              choicebox
  `-Button      Küldés     onClickStartButton
```

MainController.java:

```java
package com.example;

import java.util.ArrayList;
import java.util.List;

import javafx.fxml.FXML;
import javafx.scene.control.ChoiceBox;
import javafx.util.Pair;
import javafx.util.StringConverter;

public class MainController {

    @FXML
    private ChoiceBox<Pair<Integer, String>> choicebox;

    @FXML
    void initialize() {

        List<Pair<Integer, String>> list = new ArrayList<>();
        list.add(new Pair<Integer, String>(1, "alma"));
        list.add(new Pair<Integer, String>(2, "körte"));
        list.add(new Pair<Integer, String>(3, "barack"));
        choicebox.setConverter(new StringConverter<Pair<Integer, String>>() {
            @Override
            public String toString(Pair<Integer, String> object) {
                return object.getValue();
            }

            @Override
            public Pair<Integer, String> fromString(String string) {
                return null;
            }
        });

        choicebox.getItems().addAll(list);
    }

    @FXML
    void onClickStartButton() {
        System.out.println(choicebox.getValue().getKey());
    }

}
```

## ListView

```txt
Pane
  |-ListView            listView
  `-Button     Küldés   onClickSendButton
```

```java
package com.example;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.ListView;

public class MainController {

    @FXML
    private ListView<String> listView;

    @FXML
    void initialize() {
        listView.getItems().addAll(
            "Item 1", 
            "Item 2", 
            "Item 3"
            );
    }

    @FXML
    void onClickSendButton(ActionEvent event) {
        System.out.println(listView.getSelectionModel().getSelectedItem());        
    }
}
```

## TableView

Használt osztályok:

* TableView
* TableColumn
* Initializable (interface)

### Dolgozók névvel

```txt
Pane
  |-TableView                         empTable
  |   |-TableColumn     Id            idColumn
  |   `-TableColumn     Név           nameColumn
  `-Button              Hozzáadás     onClickAddButton
```

### Employee modell

```java
package com.example;

public class Employee {
  Integer id;
  String name;

  public Employee(Integer id, String name) {
    this.id = id;
    this.name = name;
  }
  public Integer getId() {
    return id;
  }
  public void setId(Integer id) {
    this.id = id;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  
}
```

### A MainController a táblázat számára

MainController.java:

```java
package com.example;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.cell.PropertyValueFactory;

public class MainController {

    @FXML
    private TableColumn<Employee, Integer> idColumn;

    @FXML
    private TableColumn<Employee, String> nameColumn;

    @FXML
    private TableView<Employee> empTable;

    @FXML
    void initialize() {
        idColumn.setCellValueFactory(new PropertyValueFactory<>("id"));
        nameColumn.setCellValueFactory(new PropertyValueFactory<>("name"));
        
        empTable.getItems().add(new Employee(1, "Csabai Péter"));
        empTable.getItems().add(new Employee(2, "Erős István"));
        empTable.getItems().add(new Employee(3, "Heves Ferenc"));
    }

    @FXML
    void onClickSendButton(ActionEvent event) {
        empTable.getItems().add(new Employee(4, "Csali Gábor"));
    }
}
```

### Feltöltés listából

```java
@FXML
void initialize() {
    idColumn.setCellValueFactory(new PropertyValueFactory<>("id"));
    nameColumn.setCellValueFactory(new PropertyValueFactory<>("name"));

    ObservableList<Employee> empList = FXCollections.observableArrayList();
    empList.add(new Employee(1, "Csabai Péter"));
    empList.add(new Employee(2, "Erős István"));
    empList.add(new Employee(3, "Heves Ferenc"));        

    empTable.setItems(empList);
}
```
