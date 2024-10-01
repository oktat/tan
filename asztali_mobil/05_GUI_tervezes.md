# Java GUI

* **Szerző:** Sallai András
* Copyright (c) 2024, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

## A JFrame

```java
import javax.swing.JFrame;

//...

JFrame frame = new JFrame();
frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
frame.setSize(400, 300);
frame.setTitle("Helló");
frame.setVisible(true);
```

```java
import javax.swing.JFrame;
class Mainframe extends JFrame {
  public Mainframe() {
    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    this.setSize(400, 300);
    this.setTitle("Helló");
    this.setVisible(true);
  }
}
```

## Komponensek

```java
JPanel panel = new JPanel();
JButton button = new JButton("Hello");
panel.add(button);
```

```java
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JButton;

class Mainframe extends JFrame {
  JPanel panel;
  JButton button;
  public Mainframe() {

    panel = new JPanel();
    button = new JButton("Hello");
    panel.add(button);
    this.add(panel);

    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    this.setSize(400, 300);
    this.setTitle("Helló");
    this.setVisible(true);
  }
}
```

## Eseménykezelés

```java
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JButton;

class Mainframe extends JFrame {
  JPanel panel;
  JButton button;
  public Mainframe() {

    panel = new JPanel();
    panel.setLayout(null);
    button = new JButton("Hello");
    button.setBounds(100, 100, 100, 30);

    button.addActionListener(e -> {
      System.out.println("Hello");
    });

    panel.add(button);
    this.add(panel);

    this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    this.setSize(400, 300);
    this.setTitle("Helló");
    this.setVisible(true);
  }
}
```

## A Swing dokumentáció

* [https://docs.oracle.com/javase/tutorial/uiswing/](https://docs.oracle.com/javase/tutorial/uiswing/)
* [https://docs.oracle.com/javase/tutorial/uiswing/components/](https://docs.oracle.com/javase/tutorial/uiswing/components/)
