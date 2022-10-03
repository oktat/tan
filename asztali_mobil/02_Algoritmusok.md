# Algoritmusok és adatszerkezetek

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Algoritmusok bonyolultsága

### Bonyolultság

Az algorimtus bonyolultságával azt mérjük, hogy n méretű bemenet mennyi ideig tart feldolgozni. A bonyolultságot általában időben mérjük, de néha térben is elemzünk, ahol a memóriaigény az érdeklődésünk köre.

Az elméleti számítástechnika egyik ága ezzel foglalkozik, ezt nevezzük komplexitás elméletnek. Valójában az elemzések során fontosabb az algoritmus összetettségének vizsgálata, szemben az idővel.

#### Példák

Ha egy rendezetlen tömbben keresünk egy elemet, a keresési idő arányosan nő a lista méretével. Ekkor azt mondhatjuk, hogy a keresési idő lineáris.

Ha rendezett tömbben keresünk, a keresés gyorsabb lesz. Ez egy logaritmikus bonyolultság.

Ha egy tömbben az első elem a keresett érték, konstanst idő, a bonyolultság.

Keressünk egy rendezetlen listában minden ismétlődés. A bonyolultság ekkor négyzetes.

Egyetlen elem bonyolultáságnak ellenőrzése lineáris bonyolultásgú.

#### A bonyolultságok jelölése

A bonyolultságot átlagos esetben a nagy θ betűvel jelöljük.

![Bonyolultság jelölése](images/bonyolultsag.png)

Néhány algorimtus bonyoltsága a legrosszabb esetben:

* beszúró rendezés O(n2)
* buborék rendezés O(n2)
* gyors rendezés O(n2)
* shell-rendezés O(n log2 n) - függ a használt sorozattól
* összefésülő rendezés O(n log n)

A legrosszabb eset jelölőit látjuk a következő ábrán:

![Legrosszab eset jelölői](images/legrosszabb.png)

A bemenetet tengelyét 1000-re növeltem, amin látszik, hogy a legrosszabb esetet a faktoriális mutatja be.

### Tömb

Öt egész szám tárolására alkalmas tömb:

```java
int[] szamok = new int[5];
a[0] = 35;
a[1] = 22;
a[2] = 72;
a[3] = 14;
a[4] = 28;
```

```java
int[] szamok = {35, 22, 72, 14, 28};
```

```java
import java.util.ArrayList;
//...

ArrayList<Integer> szamLista = new ArrayList<>();

szamLista.add(35);
szamLista.add(22);
szamLista.add(72);
szamLista.add(14);
szamLista.add(28);
```

```java
import java.util.ArrayList;
import java.util.Arrays;
//...

Integer[] szamok = {35, 22, 72, 14, 28}
ArrayList<Integer> szamLista = new ArrayList<>(Arrays.asList(b));

//bejárás:
for(Integer szam : szamLista) {
    System.out.println(szam);
}
```

```java
import java.util.LinkedList;
//...

LinkedList<Integer> szamLista = new LinkedList<>();

szamLista.add(35);
szamLista.add(22);
szamLista.add(72);
szamLista.add(14);
szamLista.add(28);
```

Teljeskód:

```java
import java.util.LinkedList;

public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("LinkedList használata");

        LinkedList<Integer> szamLista = new LinkedList<>();
        szamLista.add(35);
        szamLista.add(22);
        szamLista.add(72);
        szamLista.add(14);
        szamLista.add(28);
        for(Integer szam : szamLista) {
            System.out.println(szam);
        }
    }
}
```

### Lista műveletek

Bejárás:

```java
for(Integer szam : szamokLista) {
    System.out.println(szam);
}
```

Tartalmazás:

```java
boolean tartalmaz = szamokLista.contains(5);
```

Elem index alapján:

```java
Integer szam = szamokLista.get(2);
```

Index keresése:

```java
int index = szamokLista.indexOf(5);
```

Visszaadja milyen indexnél található a keresett elem. Ha az elem nincs a listában, akkor -1 értéket kapjuk.

Törlés index alapján:

```java
Integer szam = szamok.remove(0);
```

Törli az adott indexű elemet, majd visszatér az elemmel.

### Elemi adatszerkezetek

#### Verem

![Verem](images/verem.png)

#### Sor

![Sor](images/sor.png)

#### Láncolt lista

![Láncolt lista](images/lancolt_lista_1.png)

![Kétirányba láncolt lista](images/lancolt_lista_ketiranyban_lancolt.png)

#### Fák

A gráfok olyan pontok halmaza, amelyeket vonalakkal kötünk össze.

![Gráf](images/graf_001.png)

A fa egy speciális gráf. Fa adatszerkezetben a bejárás gyorsabb, szemben a listákkal.

A gráfelmélet alapján a fák meghatározása:

* körmentes (két elem között csak egyetlen út létezik)
* összefüggő egyszerű gráfok

Fa esetén létezik egy kiemelt csomópont, a gyökérelem.

![Fa](images/001_fa.png)

![A fa részei](images/002_fa_reszei.png)

A bináris fák, sepecilis fák, mivel minden elemnek legfeljebb két gyermekeleme lehet.

![Bináris fa](images/003_binarisfa.png)

![Bináris fa 2](images/004_binarisfa.png)

### Hashmap

A HashMap kulcs-értékpárok tárolására alkalmas lista.

```java
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.Iterator;
class Program03
{
    public static void main(String args[])
    {
        HashMap<String, String> m = new HashMap<String, String>();
        m.put("alma", "apple");
        m.put("asztal", "table");
        m.put("szék", "chair");
 
        System.out.println(m.get("asztal"));
 
        System.out.println(m.containsKey("alma"));
        System.out.println(m.containsValue("apple"));
 
        Set<Map.Entry<String, String>> h = m.entrySet();
        System.out.println("------------------");        
        Iterator<Map.Entry<String, String>> i = h.iterator();
        while(i.hasNext())
        {
            Map.Entry<String, String> elem = i.next();
            System.out.println("Kulcs: "+elem.getKey()+
                "\térték: "+ elem.getValue());
        }
        System.out.println("------------------");
 
        System.out.println("------------------");        
        for (Map.Entry<String, String> entry : m.entrySet())
        {
            System.out.println(entry.getKey() + "\t" + entry.getValue());
        }
        System.out.println("------------------");
 
        String magyar = m.get("alma");
        System.out.println("Az alma jelentése: " + magyar);
 
        Set h2 = m.keySet();
        System.out.println("Van-e alma: " + h2.contains("alma"));
 
        String s = m.remove("asztal");
        System.out.println("Töröleve ez: " + s); //Eredmény: table
 
        m.clear();
        System.out.println(m.size());
    }
}
```

* [https://docs.oracle.com/javase/8/docs/api/java/util/HashMap.html](https://docs.oracle.com/javase/8/docs/api/java/util/HashMap.html)

### Rekurzió

Ha egy függvény vagy egy metódus önmagát hívja, akkor rekurzióról beszélünk. Ciklikusan újra és újra önmagát hívja, ezért alkalmas ciklus kiváltására is. A rekurzió írásánál ügyelnünk arra, hogy gondskodni kell annak megszakításáról, különben végtelen ciklust kapunk.

A következő példa visszafele írja ki a számokat 9-től, és minden szám után a Joe szót írja szóközzel.

```java
class Program {
    static void ki(int i) {
        System.out.println(i + " Joe");     
 
        if(i>0)
            ki(i-1);
    }   
 
    public static void main(String args[]) {
        ki(9);
    }
}
```

A rekurzió megszakításáról az if állítás gondoskodik.

A következő program bekéri a számokat 0 végjelig:

```java
import java.util.Scanner;
 
class Program { 
    static void szamok() {
        Scanner input = new Scanner(System.in); 
        System.out.print("Szam: ");
        int szam = input.nextInt();
        input = null;
        if(szam != 0)
            szamok();
    }   
 
    public static void main(String args[]) {
        szamok();
    }
}
```

### Nevezetes algoritmusok

#### Buborék rendezés

A buborékrendezés pszeudókódja:

```txt
ciklus i = n-1 .. 1
  ciklus j = 0 .. i-1
    ha t[j] > t[j+1] akkor 
      b = t[j+1]
      t[j+1] = t[j]
      t[j] = b
    ha vége
  ciklus vége
ciklus vége
```

Java megvalósítás:

```java
class Program
{
    public static void main(String args[])
    {
        int[] tomb = {4, 8, 1, 3, 5, 2, 6};
        int n = 7; // A tömb elemeinek száma
 
        for(int i= n-1; i>0; i--)
            for(int j=0; j<i; j++)
                if(tomb[j] > tomb[j+1])
                {
                    int tmp = tomb[j];
                    tomb[j] = tomb[j+1];
                    tomb[j+1] = tmp;
                }
 
        for(int i=0; i<n; i++)
            System.out.print(tomb[i] + " ");
        System.out.println();
    }
}
```

#### Rendezés beszúrással

```txt
ciklus i = 0 .. n-1
  kulcs = t[i]
  j = i - 1
  ciklus amíg j >= 0 és t[j] > kulcs
    t[j+1] = t[j]
    j = j - 1
  ciklus vége
  t[j+1] = kulcs
ciklus vége
```

Java megvalósítás:

```java
public class App {
    public static void main(String[] args) throws Exception {
        System.out.println("Rendezés beszúrással");

        int[] t = {4, 8, 1, 3, 5, 2, 6};
        int n = 7; // A tömb elemeinek száma

        for (int i = 0; i < n; i++) {
            int kulcs = t[i];
            int j = i - 1;
            while(j>=0 && t[j]>kulcs) {
                t[j+1] = t[j];
                j = j - 1;                
            }
            t[j+1] = kulcs;
        }

        for(int i=0; i<n; i++)
            System.out.print(t[i] + " ");
        System.out.println();        
    }
}
```

#### Gyorsrendezés

A gyorsrendezés átlagos bonyolultsága: θ( n log n)

A gyorsrendezést két módon szokták megvalósítani:

* tömbbel
* helyben (helyére vivő eljárással)

A gyorsrendezést általában rekuzívan valósítják meg.

#### Bináris keresés

* [https://szit.hu/doku.php?id=oktatas:programozas:programozasi_tetelek:mondatszeru_leiras#binaris_logaritmikus_vagy_felezeses_kereses](https://szit.hu/doku.php?id=oktatas:programozas:programozasi_tetelek:mondatszeru_leiras#binaris_logaritmikus_vagy_felezeses_kereses)


