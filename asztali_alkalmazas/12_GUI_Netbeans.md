# Asztali alkalmalzások fejlesztése - GUI Swing fejlesztés Netbeans-ben

* **Szerző:** Sallai András
* Copyright (c) 2023, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [GUI programozási alapok](#gui-programozási-alapok)
* [Beszerzés](#beszerzés)
* [Netbeans projekt indítása](#netbeans-projekt-indítása)
* [Táblázat](#táblázat)

## GUI programozási alapok

Netbeans-ben ugyancsak Swing programozói könyvtárat használjuk, de lehetőségünk van vizulális tervező felület használatára.

## Beszerzés

Szerezzük be a Netbean aktuális stabil verzióját. Webhely.

* [https://netbeans.apache.org/](https://netbeans.apache.org/)

## Netbeans projekt indítása

Három féle projektmenedzser eszközt használhatunk:

* Maven
* Gradle
* Ant

## Táblázat

A Mainframe.java fájlban, ami "JFrame form"-ként lett létrehozva, írunk egy genTable() metódust, majd meghívjuk a konstruktorban:

```java
    public Mainframe() {
        initComponents();
        genTable();
    }
    
    public void genTable() {
        ArrayList<Employee> empList = new ArrayList<>();
        empList.add(new Employee(1, "Erős István", "Szeged", 385.));
        empList.add(new Employee(2, "Tor Bálint", "Szeged", 382.));
        
        Object[] fields = {"Azonosító", "Név", "Település", "Fizetés"};
        
        DefaultTableModel model = new DefaultTableModel();
        model.setColumnIdentifiers(fields);
        table.setModel(model);
        
        for(Employee emp: empList) {
            Vector<String> row = new Vector<>();
            row.add(emp.id.toString());
            row.add(emp.name);
            row.add(emp.city);
            row.add(emp.salary.toString());
            model.addRow(row);
        }        
    }
```
