# REST API elérés

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## REST API elérésről

Java 11-től használhatjuk a HttpClient osztályt HTTP kapcsolatokra. A HttpRequest osztályt egy objektumát használjuk egy kérés leírására. Paraméterként az URI osztály használhatjuk, a REST API elérésének megadására. A Egy HttpResponse objektumban fogadjuk a HTTP szerver válaszát, a BodyHandlers osztállyal mondjuk meg, hogy Sztringként szeretnénk kezelni a válaszban érkezett tartalmat.

## Szinkron kérés

Legyen egy get() nevű metódus, amelyben tetszőleges URI alapján, lekérdezzük egy teteszőleges végpontot.

Legyen egy példa, ahol a src/models/Client.java fájl tartalma a következő:

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    public String get(String uri) {
        String response = "";
        try {
            response = tryGet(uri);
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return response;
    }
    public String tryGet(String url) 
            throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(url))
        .build();
        HttpResponse<String> response = 
        client.send(request, BodyHandlers.ofString());
        return response.body();
    }
}
```

Ezek után a Client osztály használata az App.java fájlban:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String url = "https://jsonplaceholder.typicode.com/todos";
        System.out.println(client.get(url));
    }    
}
```

A kérést a client.send() utasítással küldtük el. Ez szinkron módon fut, vagyis amíg a válasz meg nem érkezik, addig az alkalmazás mozdulatlan, nem fut tovább.

## A get() metódus darabolása

Bontsuk fel a get() metódust több részre. Nézzük hány részre osztható fel:

* A kliens létrehozása
* A kérés létrehozása
* A küldés

Vegyük ki a kérés elkészítését, tegyük egy genGetRequest() nevű metódusba.
Ugyanakkor bontsuk fel a "szerelvény". A szerelvény:

```java
        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(url))
        .build();
```

Hogyan bonthatjuk fel? A newbuilder() metódus egy Builder objektumot ad vissza.
A Java nyelvben elég sok Builder osztály van. A következőt használjuk:

* java.net.http.HttpRequest.Builder;

Ez a Builder osztály a HttpRequest osztály egy beépített (Nested) osztálya.

```java
java.net.http.HttpRequest.Builder;

//...

Builder builder = HttpRequest.newBuilder();
```

A builder objektumon futtathatjuk az uri() metódust, ami beállítja a lekérdezendő API címét.

A builder objektumon a build() metódust meghívva megkapjuk a HttpRequest objektumot.

```java
java.net.http.HttpRequest.Builder;

//...
String url = "api_cime";
Builder builder = HttpRequest.newBuilder();
builder.uri(URI.create(url));
HttpRequest request = builder.build();
```

Írjuk meg az eddigiek alapján a genGetRequest() metódust.

```java
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
```

A Client osztály használata; teljes kód:

Client.java

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    public String get(String uri) {
        String response = "";
        try {
            response = tryGet(uri);
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return response;
    }
    public String tryGet(String url) 
            throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = genGetRequest(url);
        HttpResponse<String> response = 
        client.send(request, BodyHandlers.ofString());
        return response.body();
    }
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
}
```

A tryGet() metódusból kivehetjük a küldést is. A kivételkezelést a client.send() metódust kívánja meg, ezért azt is visszük a küldéssel együtt. Legyen a metódus neve sendRequest(). A tryGet() metódus helyi client objektumát globálissá kell tennünk, hogy később más metódusokban ne kelljen példányosítani.

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    HttpClient client;
    public Client() {
        this.client = HttpClient.newHttpClient();
    }

    public String get(String url) {
        HttpRequest request = genGetRequest(url);        
        return sendRequest(request);
    }
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
    public String sendRequest(HttpRequest request) {
        String result = "";
        try {
            result = trySendRequest(request);                     
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return result;
    }
    private String trySendRequest(HttpRequest request) 
            throws IOException, InterruptedException {
        HttpResponse<String> response = 
        this.client.send(request, BodyHandlers.ofString());        
        return response.body();
    }
}
```

## A POST metódus

A kérésgeneráló metódust újra kell írnunk, mivel a kérésbe bele kell tennük egy új TODO adatatit, fejléccel együtt:

```java
    private HttpRequest genPostRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.POST(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }
```

A küldéshez használhatjuk a már meglévő küldő metódust.

A teljes kód, az App osztály újraírásával:

Client.java:

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    HttpClient client;
    public Client() {
        this.client = HttpClient.newHttpClient();
    }

    public String get(String url) {
        HttpRequest request = genGetRequest(url);        
        return sendRequest(request);
    }
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
    
    public String post(String url, String body) {
        HttpRequest request = this.genPostRequest(url, body);        
        return this.sendRequest(request);
    }
    private HttpRequest genPostRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.POST(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String sendRequest(HttpRequest request) {
        String result = "";
        try {
            result = trySendRequest(request);                     
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return result;
    }
    private String trySendRequest(HttpRequest request) 
            throws IOException, InterruptedException {
        HttpResponse<String> response = 
        this.client.send(request, BodyHandlers.ofString());        
        return response.body();
    }
}
```

App.java:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String url = "https://jsonplaceholder.typicode.com/todos";
        // System.out.println(client.get(url));

        String newTodo = 
            "{ \"userId\":10, " +
            "\"title\":\"Eldobom a telefonom\", "+
            "\"completed\": false }";
        System.out.println(client.post(url, newTodo));
    }
}
```

## A PUT metódus

A put() és a genPutRequest() metódus:

```java
    public String put(String url, String body) {
        HttpRequest request = this.genPutRequest(url, body);
        return this.sendRequest(request);
    }
    private HttpRequest genPutRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.PUT(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }
```

A teljes kód a put() használatával:

Client.java

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    HttpClient client;
    public Client() {
        this.client = HttpClient.newHttpClient();
    }

    public String get(String url) {
        HttpRequest request = genGetRequest(url);        
        return sendRequest(request);
    }
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
    
    public String post(String url, String body) {
        HttpRequest request = this.genPostRequest(url, body);        
        return this.sendRequest(request);
    }
    private HttpRequest genPostRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.POST(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String put(String url, String body) {
        HttpRequest request = this.genPutRequest(url, body);
        return this.sendRequest(request);
    }
    private HttpRequest genPutRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.PUT(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String sendRequest(HttpRequest request) {
        String result = "";
        try {
            result = trySendRequest(request);                     
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return result;
    }
    private String trySendRequest(HttpRequest request) 
            throws IOException, InterruptedException {
        HttpResponse<String> response = 
        this.client.send(request, BodyHandlers.ofString());        
        return response.body();
    }
}
```

App.java

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String url = "https://jsonplaceholder.typicode.com/todos";
        // System.out.println(client.get(url));

        // String newTodo = 
        //     "{ \"userId\":10, " +
        //     "\"title\":\"Eldobom a telefonom\", "+
        //     "\"completed\": false }";
        // System.out.println(client.post(url, newTodo));
        
        String modifiedTodo = 
            "{ \"userId\":10, " +
            "\"title\":\"Nem eszem cukrot 1 hónapig\", "+
            "\"completed\": false }";
        System.out.println(client.put(url + "/1", modifiedTodo));
    }
}
```

## A DELETE metódus

Írjuk meg a delete() metódust a genDeleteRequest() metódussal együtt.

Client.java:

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    HttpClient client;
    public Client() {
        this.client = HttpClient.newHttpClient();
    }

    public String get(String url) {
        HttpRequest request = genGetRequest(url);        
        return sendRequest(request);
    }
    private HttpRequest genGetRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        return builder.build();
    }
    
    public String post(String url, String body) {
        HttpRequest request = this.genPostRequest(url, body);        
        return this.sendRequest(request);
    }
    private HttpRequest genPostRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.POST(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String put(String url, String body) {
        HttpRequest request = this.genPutRequest(url, body);
        return this.sendRequest(request);
    }
    private HttpRequest genPutRequest(String url, String body) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.PUT(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String delete(String url) {
        HttpRequest request = this.genDeleteRequest(url);
        return this.sendRequest(request);
    }
    private HttpRequest genDeleteRequest(String url) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        builder.DELETE();
        return builder.build();        
    }

    public String sendRequest(HttpRequest request) {
        String result = "";
        try {
            result = trySendRequest(request);                     
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return result;
    }
    private String trySendRequest(HttpRequest request) 
            throws IOException, InterruptedException {
        HttpResponse<String> response = 
        this.client.send(request, BodyHandlers.ofString());        
        return response.body();
    }
}
```

App.java

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String url = "https://jsonplaceholder.typicode.com/todos";
        // System.out.println(client.get(url));

        // String newTodo = 
        //     "{ \"userId\":10, " +
        //     "\"title\":\"Eldobom a telefonom\", "+
        //     "\"completed\": false }";
        // System.out.println(client.post(url, newTodo));
        
        // String modifiedTodo = 
        //     "{ \"userId\":10, " +
        //     "\"title\":\"Nem eszem cukrot 1 hónapig\", "+
        //     "\"completed\": false }";
        // System.out.println(client.put(url + "/1", modifiedTodo));

        System.out.println(client.delete(url + "/1"));
    }
}
```

## Azonosítás beállítása

Client.java:

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpRequest.Builder;
import java.net.http.HttpResponse.BodyHandlers;

public class Client {
    HttpClient client;
    public Client() {
        this.client = HttpClient.newHttpClient();
    }

    public String get(String url) {
        HttpRequest request = genGetRequest(url);        
        return sendRequest(request);
    }
    private HttpRequest genGetRequest(String url, String... args) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        if(args.length > 0) {
            String token = args[0];
            builder.header("Authorization", "Bearer " + token);            
        }
        return builder.build();
    }
    
    public String post(String url, String body, String... args) {
        HttpRequest request = this.genPostRequest(url, body, args);        
        return this.sendRequest(request);
    }
    private HttpRequest genPostRequest(String url, String body, String... args) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        if(args.length > 0) {
            String token = args[0];
            builder.header("Authorization", "Bearer " + token);            
        }        
        builder.POST(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String put(String url, String body, String... args) {
        HttpRequest request = this.genPutRequest(url, body, args);
        return this.sendRequest(request);
    }
    private HttpRequest genPutRequest(String url, String body, String... args) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        if(args.length > 0) {
            String token = args[0];
            builder.header("Authorization", "Bearer " + token);            
        }
        builder.PUT(HttpRequest.BodyPublishers.ofString(body));
        return builder.build();
    }

    public String delete(String url, String... args) {
        HttpRequest request = this.genDeleteRequest(url, args);
        return this.sendRequest(request);
    }
    private HttpRequest genDeleteRequest(String url, String... args) {
        Builder builder = HttpRequest.newBuilder();
        builder.uri(URI.create(url));
        builder.header("Content-Type", "application/json");
        if(args.length > 0) {
            String token = args[0];
            builder.header("Authorization", "Bearer " + token);            
        }
        builder.DELETE();
        return builder.build();
    }

    public String sendRequest(HttpRequest request) {
        String result = "";
        try {
            result = trySendRequest(request);                     
        } catch (IOException e) {
            System.err.println("Hiba! A lekérés sikertelen!");
            System.err.println(e.getMessage());
        } catch (InterruptedException e) {
            System.err.println("Hiba! Megszakadt lekérés!");
            System.err.println(e.getMessage());            
        }
        return result;
    }
    private String trySendRequest(HttpRequest request) 
            throws IOException, InterruptedException {
        HttpResponse<String> response = 
        this.client.send(request, BodyHandlers.ofString());        
        return response.body();
    }
}
```

App.java:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String url = "https://jsonplaceholder.typicode.com/todos";
        // System.out.println(client.get(url));

        // String newTodo = 
        //     "{ \"userId\":10, " +
        //     "\"title\":\"Eldobom a telefonom\", "+
        //     "\"completed\": false }";
        // System.out.println(client.post(url, newTodo));
        
        // String modifiedTodo = 
        //     "{ \"userId\":10, " +
        //     "\"title\":\"Nem eszem cukrot 1 hónapig\", "+
        //     "\"completed\": false }";
        // System.out.println(client.put(url + "/1", modifiedTodo));

        System.out.println(client.delete(url + "/1"));
    }
}
```

## Objektum JSON formátumba

Készítsünk egy Todo.java nevű osztályt:

Todo.java:

```java
package models;

public class Todo {
    private Integer id;
    private Integer userId;
    private String title;
    private Boolean completed;
    public Todo(Integer userId, String title, Boolean completed) {
        this.userId = userId;
        this.title = title;
        this.completed = completed;
    }
    public Todo(Integer id, Integer userId, String title, Boolean completed) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.completed = completed;
    }
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getUserId() {
        return userId;
    }
    public void setUserId(Integer userId) {
        this.userId = userId;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public Boolean getCompleted() {
        return completed;
    }
    public void setCompleted(Boolean completed) {
        this.completed = completed;
    }
    
}
```

Hivatkozzuk meg a Gson library-t.

Hozzunk létre egy gson objektumot, majd alakítsuk át a todo objektumot JSON stringgé.

```java
        Gson gson = new Gson();

        Todo todo = new Todo(10, 
            "Eldobom a telefonom", false);        
        String newTodo = gson.toJson(todo);
        System.out.println(client.post(url, newTodo));
```

## Objektumból JSON újra módosítással

```java
        //...
        Todo todo = new Todo(10,
            "Nem eszek curot 1 hónapig", false);        
        String modifiedTodo = gson.toJson(todo);
        System.out.println(client.put(url + "/1", modifiedTodo));
```

## Aszinkron kérés

Aszinkron kérés esetén a válasz megérkezéstől függetlenül az program tovább fut.

Aszinkron módon megvalósított Client osztály:

```java
package models;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.concurrent.CompletableFuture;

public class Client {
    public CompletableFuture<String> get(String uri) 
            throws IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(uri))
        .build();        

        return client.sendAsync(request, BodyHandlers.ofString())
        .thenApply(HttpResponse::body);
    }
}
```

Használata App.java fájlban:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String uri = "https://jsonplaceholder.typicode.com/todos";
        System.out.println(client.get(uri).join());
    }    
}
```

## Hozzáadás

Szeretnénk felvenni új elemet. Egészítsük ki a Client osztályt egy post() metódussal.

```java
    public CompletableFuture<String> post(String uri, String body, String... token) {
        HttpClient client = HttpClient.newHttpClient();
        List<String> headers = new ArrayList<>();
        headers.add("Content-Type");
        headers.add("application/json");

        if(token.length > 0) {
            headers.add("Authorizatin");
            headers.add("Bearer " + token[0]);
        }

        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(uri))
        .headers(headers.toArray(String[]::new))
        .POST(HttpRequest.BodyPublishers.ofString(body))
        .build();

        return client.sendAsync(request, BodyHandlers.ofString())
        .thenApply(HttpResponse::body);
    }
```

Az App osztályban a használat:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String uri = "http://[::1]:8000/employees";
        String body = "{ \"name\": \"Erős István\", " +
         "\"city\": \"Szeged\", " +
         "\"salary\": 389 }";
        System.out.println(body);
        System.out.println(client.post(uri, body).join());
    }    
}
```

A headers.toArray(String[]::new) utasítás a kollekció tartalmát sztring tömbbé alakítja.

## Frissítés

Frissítéshez a írjuk meg a put() metódust:

```java
    public CompletableFuture<String> put(String uri, String body, String... token) {
        HttpClient client = HttpClient.newHttpClient();
        List<String> headers = new ArrayList<>();
        headers.add("Content-Type");
        headers.add("application/json");

        if(token.length > 0) {
            headers.add("Authorization");
            headers.add("Bearer " + token[0]);
        }

        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(uri))
        .headers(headers.toArray(String[]::new))
        .PUT(HttpRequest.BodyPublishers.ofString(body))
        .build();

        return client.sendAsync(request, BodyHandlers.ofString())
        .thenApply(HttpResponse::body);
    }
```

A metódus használata:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String uri = "http://[::1]:8000/employees/2";
        String body = "{ \"name\": \"Csípős Valér\", " +
         "\"city\": \"Szolnok\", " +
         "\"salary\": 381 }";
        System.out.println(body);
        System.out.println(client.put(uri, body).join());
    }    
}
```

Vegyük észre az uri objektumbana 2-s azonosítót. A client objektumon pedig a put() metódus hívást.

## Törlés

Hozzuk létre a delete() metódust, ami alkalmas törlésre:

```java
    public CompletableFuture<String> delete(String uri, String... token) {
        HttpClient client = HttpClient.newHttpClient();

        List<String> headers = new ArrayList<>();
        headers.add("Content-Type");
        headers.add("application/json");

        if(token.length > 0) {
            headers.add("Authorization");
            headers.add("Bearer " + token[0]);
        }

        HttpRequest request = HttpRequest.newBuilder()
        .uri(URI.create(uri))
        .headers(headers.toArray(String[]::new))
        .DELETE()
        .build();
        
        return client.sendAsync(request, BodyHandlers.ofString())
        .thenApply(HttpResponse::body);
    }
```

Használata:

```java
import models.Client;

public class App {
    public static void main(String[] args) throws Exception {
        Client client = new Client();
        String uri = "http://[::1]:8000/employees/3";
        System.out.println(client.delete(uri).join());
    }    
}

```

## Telejes kód

A teljes kódot javítva a GitHubon megtaláljuk:

* [https://github.com/oktat/empclient](https://github.com/oktat/empclient)

Lehetséges REST API:

* [https://github.com/oktat/empjs](https://github.com/oktat/empjs)
