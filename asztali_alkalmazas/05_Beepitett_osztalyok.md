# Asztali alkalmazások fejlesztése - Beépített osztályok

* **Szerző:** Sallai András
* Copyright (c) Sallai András, 2022
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Matematikai osztály

```java
System.out.println(Math.PI);
```

## Véletlen szám generálás

```java
import java.util.Random;
//...
Random random = new Random();
int veletlenSzam.nextInt(3);
```

Kockadobás:

```java
import java.util.Random;
//...
Random random = new Random();
int dobas = veletlen.nextInt(6) + 1;
```

## Konvertlálás

### String egész számmá

```java
System.out.println(Integer.parseInt("45"));
```

### String valós számmáa

```java
System.out.println(Double.parseDouble("45.1234567"));
```

## Bevitel

```java
import java.util.Scanner;
//...

Scanner scanner = new Scanner(System.in);
String nev = scanner.nextLine();
```

```java
import java.util.Scanner;
//...

Scanner scanner = new Scanner(System.in);
int kor = scanner.nextInt();
```

## Karakterláncok

### Stringek hossza

```java
String szo = "alma";
System.out.println(szo.length());
```
