# Projektmunka

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [A projektmunka eszközei](#a-projektmunka-eszközei)
* [Projektfeladat](#projektfeladat)
* [Problémamegoldás webes kereséssel](#problémamegoldás-webes-kereséssel)
* [Mintakódok értelmezése](#mintakódok-értelmezése)

## A projektmunka eszközei

* Git
* Git szerverből egy:
  * GitHub
  * GitLab
  * Bitbucket
* [Trello](https://trello.com/)
* [Slack](https://slack.com/)

## Projektfeladat

Készítsen egy asztali- és egy mobilalkalmazást, amelyek REST API-ból kezelhetővé teszik tantárgyak, tanulók és tanárok adatait.

## Problémamegoldás webes kereséssel

Írnia kell egy programot, ami bekér egy szöveget, majd titkosítja.

Keressen megoldást a titkosításra az Interneten.

## Mintakódok értelmezése

Mit csinál a következő program?

App.java:

```java
public class App {
    public static void main(String[] args) throws Exception {
        Counter myCounter = new Counter(5);
        
        for (int i = 0; i < 7; i++) {
            myCounter.increment();
        }
    }
}
```

Counter.java:

```java
public class Counter {
  private int count;
  private final int limit;

  public Counter(int limit) {
      this.limit = limit;
      this.count = 0;
  }

  public void increment() {
      if (count < limit) {
          count++;
          System.out.println("Current count: " + count);
      } else {
          System.out.println("Limit reached: " + limit);
      }
  }

  public int getCount() {
      return count;
  }
}
```
