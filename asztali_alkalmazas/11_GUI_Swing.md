# Asztali alkalmalzások fejlesztése - GUI Swing

* **Szerző:** Sallai András
* Copyright (c) 2023, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [GUI programozási alapok](#gui-programozási-alapok)
* [Dokumentáció](#dokumentáció)
* [Helló Világ](#helló-világ)
* [Az ablak külön fájlban](#az-ablak-külön-fájlban)
* [Használjunk öröklést](#használjunk-öröklést)
* [Ablak felirata](#ablak-felirata)
* [Gomb](#gomb)
* [Elrendezés](#elrendezés)
* [Gomb eseménye](#gomb-eseménye)
* [Bevitel](#bevitel)
* [Táblázat megjelenítése](#táblázat-megjelenítése)
* [Fájlválasztó párbeszédablak](#fájlválasztó-párbeszédablak)
* [Irodalom](#irodalom)

## GUI programozási alapok

A Java Swing egy programozói könyvtár Java alkalmazások számára. Lehetőségünk van interaktív felhasználóbarát alkalmazások létrehozására, ahol grafikus elemeket használunk, úgymint ablak, gombok, szövegdobozok, feliratok, stb.

A Java Swing a AWT, azaz a Abstract Window Toolkit továbbfejlesztése. Az AWT teljesen függ az adott operációs rendszer natív widgeteitől. A Swing ezzel semben teljesen önálló, saját megjelenítés biztosít a widgetek számára.

## Dokumentáció

2023-ban az Java 20 dokumentációja:

* [https://docs.oracle.com/en/java/javase/20/docs/api](https://docs.oracle.com/en/java/javase/20/docs/api)

## Helló Világ

```java
import javax.swing.JFrame;

public class App {
    public static void main(String[] args) throws Exception {
        JFrame frame = new JFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 300);
        frame.setVisible(true);
    }
}
```

## Az ablak külön fájlban

Tegyük az ablakot külön fájlba.

```java
public class App {
    public static void main(String[] args) throws Exception {
        new Mainframe();
    }
}
```

```java
import javax.swing.JFrame;

public class Mainframe {
    
    public Mainframe() {
        JFrame frame = new JFrame();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 300);
        frame.setVisible(true);
    }
}
```

## Használjunk öröklést

```java
import javax.swing.JFrame;

public class Mainframe extends JFrame {
    
    public Mainframe() {
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(400, 300);
        this.setVisible(true);
    }
}
```

## Ablak felirata

Feliratot a JLabel osztály hozhatunk létre.

```java
import javax.swing.JFrame;
import javax.swing.JLabel;

public class Mainframe extends JFrame {
    JLabel label1;
    public Mainframe() {
        this.label1 = new JLabel("Valami");

        this.add(this.label1);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(400, 300);
        this.setVisible(true);
    }
}
```

### JLabel térköz

```java
import java.awt.Color;
import java.awt.FlowLayout;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.border.EmptyBorder;

public class Mainframe extends JFrame {
    JLabel label1;
    public Mainframe() {
        this.label1 = new JLabel("Valami");
        this.label1.setOpaque(true);
        this.label1.setBackground(Color.BLUE);
        this.label1.setForeground(Color.WHITE);
        this.label1.setBorder(new EmptyBorder(10, 10, 10, 10));
        this.label1.setHorizontalAlignment(JLabel.CENTER);

        this.setLayout(new FlowLayout());
        this.add(this.label1);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(400, 300);
        this.setVisible(true);
    }
}
```

### A JLabel méretének beállítása

```java
import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;

import javax.swing.JFrame;
import javax.swing.JLabel;

public class Mainframe extends JFrame {
    JLabel label1;
    public Mainframe() {
        this.label1 = new JLabel("Valami");
        this.label1.setOpaque(true);
        this.label1.setBackground(Color.BLUE);
        this.label1.setForeground(Color.WHITE);
        this.label1.setHorizontalAlignment(JLabel.CENTER);
        this.label1.setPreferredSize(new Dimension(150, 24));

        this.setLayout(new FlowLayout());
        this.add(this.label1);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(400, 300);
        this.setVisible(true);
    }
}

```

### Fontbeállítás

```java
this.label1.setFont(new Font("Veranda", Font.PLAIN, 16));
```

## Gomb

Gombot a JButton osztállyal hozható létre. Például:

```java
JButton valamiButton = new JButton();
valamiButton.setText("Kattints");
```

A konstruktorban is értéket kaphat:

```java
JButton valamiButton = new JButton("Kattints");
```

Adjuk az ablakhoz:

```java
public class App {
    public static void main(String[] args) throws Exception {
        new Mainframe();
    }
}
```

```java
import javax.swing.JButton;
import javax.swing.JFrame;

public class Mainframe extends JFrame {
    
    JButton valamiButton;

    public Mainframe() {
        this.valamiButton = new JButton("Kattints");

        this.add(this.valamiButton);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(400, 300);
        this.setVisible(true);
    }
}
```

## Elrendezés

Tegyük fel két gombot az ablakra.

```java
import java.awt.FlowLayout;

import javax.swing.JButton;
import javax.swing.JFrame;

public class Mainframe extends JFrame {
    
    JButton firstButton;
    JButton secondButton;

    public Mainframe() {
        this.firstButton = new JButton("Első");
        this.secondButton = new JButton("Második");

        this.setLayout(new FlowLayout());
        this.add(this.firstButton);
        this.add(this.secondButton);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(400, 300);
        this.setVisible(true);
    }
}
```

Az elrendezést a this.setLayout() függvény állítja be. Nélküle a második gomb takja az elsőt. A FlowLayout elrendezéskezelő szimlán egymás után helyezi el a kontrollokat.

Az ablak méretet az elrendezéskezelőre is bízhatjuk. Az ablak méretbeállítása helyett használjuk a pack() metódust:

```java
//this.setSize(400, 300);
this.pack();
```

Ha meghagyjuk az ablak méretét, vízszintesen igazíthatjuk komponenseket. A következő állandókat használhatjuk:

* FlowLayout.CENTER
* FlowLayout.LEADING
* FlowLayout.LEFT
* FlowLayout.LEFT
* FlowLayout.RIGHT
* FlowLayout.TRAILING

```java
this.setLayout(new FlowLayout(FlowLayout.LEFT));
```

A FlowLayout() konstruktornak megadható második és harmadik paraméter is:

* hgap - vízszintes köz
* vgap - függőleges köz

Példa:

```java
this.setLayout(new FlowLayout(0, 10, 10));
```

## Gomb eseménye

A következő programban lambda kifejezést használunk, amit a Java 8-ban vezettek be.

```java
import javax.swing.JButton;
import javax.swing.JFrame;

public class Mainframe extends JFrame {
    JButton fooButton;
    
    public Mainframe() {
        this.fooButton = new JButton("Egy");
        this.fooButton.addActionListener(e -> {
            System.out.println("Működik");
        });
        this.add(this.fooButton);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(400, 300);
        this.setVisible(true);
    }
}
```

Az esemény kezelését külön metódusba szokás tenni:

```java
import javax.swing.JButton;
import javax.swing.JFrame;

public class Mainframe extends JFrame {
    JButton fooButton;
    
    public Mainframe() {
        this.fooButton = new JButton("Egy");
        this.fooButton.addActionListener(e -> {
            this.startFoo();
        });
        this.add(this.fooButton);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(400, 300);
        this.setVisible(true);
    }
    public void startFoo() {
        System.out.println("Működik");
    }
}
```

## Bevitel

Mainframe.java:

```java
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextField;

public class Mainframe extends JFrame {
    JButton fooButton;
    JTextField fooField;
    public Mainframe() {
        this.initComponent();
        this.eventHandler();
        this.addComponent();
        this.setFrame();
    }
    public void initComponent() {
        this.fooButton = new JButton("Mehet");
        this.fooField = new JTextField(10);
    }
    public void eventHandler() {
        this.fooButton.addActionListener(e -> {
            fooButtonHandler();
        });
    }
    public void fooButtonHandler() {
        String text = this.fooField.getText();
        System.out.println(text);
    }
    public void addComponent() {
        this.add(this.fooField);
        this.add(this.fooButton);
    }
    public void setFrame() {
        this.setLayout(new BoxLayout(this.getContentPane(), BoxLayout.PAGE_AXIS));
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.pack();
        this.setVisible(true);
    }
}
```

## Táblázat megjelenítése

Employee.java:

```java
public class Employee {
    Integer id;
    String name;
    String city;
    Double salary;
    public Employee(Integer id, String name, String city, double salary) {
        this.id = id;
        this.name = name;
        this.city = city;
        this.salary = salary;
    }    
}
```

Mainframe.java:

```java
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.BoxLayout;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

class Mainframe extends JFrame {
    JScrollPane pane;
    JTable table;
    DefaultTableModel model;

    public Mainframe() {
        this.table = new JTable();        
        this.pane = new JScrollPane(table);
        this.model = new DefaultTableModel();

        String[] fieldNames = {"Az", "Név", "Település", "Fizetés"};
        model.setColumnIdentifiers(fieldNames);        
        table.setModel(model);

        ArrayList<Employee> employeeList = new ArrayList<>();
        employeeList.add(new Employee(
            1, 
            "Erős István", 
            "Szolnok", 
            385));
        employeeList.add(new Employee(
            2, 
            "Csala Ferenc", 
            "Szolnok", 
            382));

        for(Employee emp: employeeList) {
            Vector<String> row = new Vector<>();
            row.add(emp.id.toString());
            row.add(emp.name);
            row.add(emp.city);
            row.add(emp.salary.toString());
            model.addRow(row);
        }
        this.add(this.pane);

        this.setLayout(new BoxLayout(this.getContentPane(), BoxLayout.PAGE_AXIS));
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setSize(400, 300);
        this.setVisible(true);        
    }
}
```

App.java:

```java
public class App {
    public static void main(String[] args) throws Exception {
        new Mainframe();
    }
}
```

## Fájlválasztó párbeszédablak

```java
import javax.swing.JFileChooser;

public class App {
    public static void main(String[] args) throws Exception {
        JFileChooser fc = new JFileChooser();
        fc.showSaveDialog(null);

        String path = fc.getSelectedFile().getPath();
        System.out.println(path);
    }
}
```

## Irodalom

* [https://docs.oracle.com/javase/tutorial/uiswing/](https://docs.oracle.com/javase/tutorial/uiswing/)
