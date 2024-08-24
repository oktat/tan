# Asztali alkalmazások fejlesztése - Vezérlési szerkezetek

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Szelekció](#szelekció)
* [Iteráció](#iteráció)

## Szelekció

### if

```java
int num = 30;
if (num > 30) {
    System.out.prinln("nagyobb");
}
```

```java
int num = 30;
if (num > 30) {
    System.out.prinln("nagyobb");
}else {
    System.out.prinln("kisebb vagy egyenlő");
}
```

## Iteráció

### for

```java
for(int i=0; i<5; i++) {
    System.out.println(i);
}
```

### while

```java
int i=0;
while(i<5) {
    System.out.println(i);
    i++;
}
```

### do-while

```java
int i=0;
do {
    System.out.println(i);
    i++;
} while(i<5);
```

### for-each

A for utasítás használható tömbök, listák bejárására. Más programozási nyelvekben ezt foreach, vagy forEach néven ismerjük. Itt az each csak arra utal, hogyan használom a for utasítást.

```java
int[] numbers = {1, 2, 3, 4, 5};
for(int num : numbers) {
    System.out.println(num);
}
```
