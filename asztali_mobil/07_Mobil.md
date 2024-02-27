# Mobil alkalmazások fejlesztése

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## React Native

## Követelmények

* NodeJS LTS
* Git
* VSCode

## Indulás

```cmd
npx create-expo-app hello
cd hello
```

Webes előnézetet fogunk használni, ezért telepítsük a webes felülethez tartozó függőségeket. Győződjünk meg arról, hogy a projekt könyvtárában állunk, majd a függőségek telepítése:

```cmd
npx expo install react-dom react-native-web @expo/webpack-config
```

A Metro Bundler indítása:

```cmd
npx expo start
```

Elindul az Metro Bundler.

```cmd
npx expo start
Starting project at /home/andras/dev/gyak/reactnative/app16/my-app
Starting Metro Bundler
▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄
█ ▄▄▄▄▄ █▀█ █▄█▄▀██ ▄▄▄▄▄ █
█ █   █ █▀▀▀█ ▀▄█▄█ █   █ █
█ █▄▄▄█ █▀ █▀▀█▄▀██ █▄▄▄█ █
█▄▄▄▄▄▄▄█▄▀ ▀▄█ ▀▄█▄▄▄▄▄▄▄█
█▄▄▄▄ █▄▄ ▄▀▄▀▄▀▄▄▄█▄█ █ ██
█ ▄ ▀█▀▄█▄█▄█▀██ ▄▄██▄ █▄ █
█▀▀█▀█▀▄▀▄▄▄█▄ ▀▄▄▀▄▄▄▀ ▀██
█ █▄▀▀▄▄  █  ▄▄█▄▀▀ ▄▀ ▄  █
█▄████▄▄▄▀▄ ▄  ▀▀ ▄▄▄ ▄ ▄▄█
█ ▄▄▄▄▄ █▄ ▄█▀██▀ █▄█ ▀▄  █
█ █   █ █ ▀▀▀▀▄▀ ▄▄   ▄ ▀▀█
█ █▄▄▄█ █ ▄▄█ ██▄  ▀▀█▀▄█ █
█▄▄▄▄▄▄▄█▄▄▄▄█▄█▄██████▄▄▄█

› Metro waiting on exp://192.168.10.110:8081
› Scan the QR code above with Expo Go (Android) or the Camera app (iOS)

› Using Expo Go
› Press s │ switch to development build

› Press a │ open Android
› Press w │ open web

› Press j │ open debugger
› Press r │ reload app
› Press m │ toggle menu
› Press o │ open project code in your editor

› Press ? │ show all commands
```

Webes előnézet indítása:

* w

A Metro Bundler indítható a webes felület azonalli megnyitásával is:

```cmd
npm run web
```

A következő könytárszerkezet és állományok jönnek létre:

```txt
hello/
  |-.expo/
  |-assets/
  |-node_modules/
  |-gitignore
  |-App.js
  |-app.json
  |-babel.config.js
  |-package-lock.json
  `package.json
```

A program belépési pontja az App.js.

```javascript
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <Text>Open up App.js to start working on your app!</Text>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
```

Az App.js két import kezdetű sort tartalmaz, majd egy App() nevű függvény és egy styles objektum.

A függvény visszatérési értéke JSX tartalom, ami a JavaScript kiterjesztése. A JSX a JavaScript Syntax Extendsion rövidítése. A JSX hasonló az XML-hez vagy a HTML-hez. Tageket használunk a telefonos felület leírására. A kezdeti tagek:

* View
* Text
* StatusBar

A szabály szerint a JSX egy konténer taggel kezdődik, amely újab konténereket vagy más elemeket tartalmazhat.

A példában a View tag a legkülső tag, amelyben két elem található, a Text és a StatusBar. A Text elemben, ahogy neve is mutatja szöveget lehet megjeleníteni. A StatusBar a telefon képernyőjének alján jelenít meg három navigációs gombot. Ez a navigációs sáv webes előnézetben nem látható.

A View tag tartalmaz egy style attribútumot, amellyel megadhatjuk az elem tartalmának stílusát. Az attribútum értékét idézőjelek helyett kapcsoszárójelbe kell tenni.

A styles objektum állandóként lett létrehozva a StyleSheet objektum segítségével. A kezdeti sablon programban egyetelen szelektor van meghatározva, a container, amihez négy darab stílus utsítás tartozik. A stílus tulajdonságok megegyeznek a JavaScriptben használhatókkal, de az értékeket aposztrófok közzé tesszük. Az egyes stílus-utasításokat vesszővel tagoljuk. Vegyük sorra a megadott stílusokat:

* flex: 1 - A View elem kitölti a rendelkezésre álló helyet.
* backgroundColor: '#fff' - A háttérszín fehér.
* alignItems: 'center' - A flex doboz tartalmát középre igazítjuk vízszintesen.
* justitfyContent: 'center' - A flex doboz tartalmát függőlegesn igazítjuk középre.

Írjuk át az alapértelmezett szöveget, mondjuk "Helló Világ" szövegre.

## Alapvető stílusok

Elsőként írjuk át a View doboz háttérszínét:

```javascript
backgroundColor: 'gold',
```

Ha megpróbáljuk a szöveg színét is beállítani, nem lesz sikerélményünk:

```javascript
color: 'navy',
```

A konténeren nem értelmezhető a szöveg színének beállítása, azt csak a Text elemen használhatjuk.

Készítsünk egy újabb szelektort, például egy "header" nevű szelektort, és mozgassuk a beállítást ebbe a részbe:

```javascript
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'gold',
    alignItems: 'center',
    justifyContent: 'center',
  },
  header: {
    color: 'blue',
  },
});
```

A beállítás most már érvényesül. A fontméret beállítása ugyanígy viselkedik, a View elemre nem használható.

```javascript
  header: {
    color: 'blue',
    fontSize: 34,
  },
```

A fontWeight utasítást is használjuk:

```javascript
  header: {
    color: 'blue',
    fontSize: 34,
    fontWeight: 'bold',
  },
```

### Fejrész és bekezdés

```javascript
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View } from 'react-native';

export default function App() {
  return (
    <View style={styles.container}>
      <View style={styles.header}>
        <Text style={styles.headerText}>Helló Világ</Text>
      </View>
      <View style={styles.body}>
        <Text style={styles.bodyText}>
          Ut tempor deserunt occaecat id velit. 
          Fugiat sunt non commodo exercitation 
          ea in eiusmod non aute irure minim 
          veniam pariatur. Id eu aliquip duis 
          sunt quis irure minim cupidatat aute.
        </Text>
      </View>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,    
    backgroundColor: '#299dc5',
    alignItems: 'center',
    justifyContent: 'center',
    
  },
  header: {
    backgroundColor: '#238ba9',
    padding: 10,
    width: '100%',    
  },
  headerText: {
    color: 'white',
    fontSize: 34,
    fontWeight: 'bold',
    textAlign: 'center',
  },
  body: {
    flex: 2,
    padding: 10,
  },
  bodyText: {
    fontSize: 24,
    backgroundColor: '#f3f2f3',
    padding: 5,
  }
});
```

## Görgetés

Adjunk még 9 bekezdést az alkalmazáshoz.

Webes előnézetben tudjuk görgetni a tartalmat, de telefonon nem. A görgetéshez a ScrollView elemet kell használnunk a View helyett.

```javascript
<ScrollView style={styles.container}>
      {/* ... */}
      <View style={styles.body}>
        <Text style={styles.bodyText}>
          Ut tempor deserunt occaecat id velit. 
          Fugiat sunt non commodo exercitation 
          ea in eiusmod non aute irure minim 
          veniam pariatur. Id eu aliquip duis 
          sunt quis irure minim cupidatat aute.
        </Text>
        {/* ... */}
      </View>
</ScrollView>

{/* ... */}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    // alignItems: 'center',
    // justifyContent: 'center',
  },
});

```

Az alignItems és justifyContent justifyContent tulajdonságok nem működnek a ScrollView-on.

## Képek megjelenítése

```javascript
import { Image } from 'react-native';

{/* ... */}

<Image 
    source={require('./assets/icon.png')}
    style={{width: 100, height: 100 }}
/>

<Image 
    source={require('./assets/valami.jpg')}
    style={{width: 100, height: 100 }}
/>
```

Kép az Internetről

```javascript
<Image source={{
    width: 200,
    height: 300,
    uri: "https://valahol.hu/valami.png",
}}>
```

## Bevitel

```javascript
import React from 'react';
import {  StyleSheet, Text, TextInput, View } from 'react-native';
 
export default function App() {
  const [text, onChangeText] = React.useState('');
  return (
    <View style={styles.container}>
      <Text>Szám</Text>
      <TextInput 
        style={styles.input} 
        onChangeText={text => onChangeText(text)}
        />
      <Text>{text}</Text>
    </View>
  );
}
 
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  input: {    
    borderColor: 'blue',
    borderWidth: 1,
    backgroundColor: 'lightblue',
    width: '80%',
  },
});
```

## Jelszó bekérés

```javascript
<TextInput 
    secureTextEntry={true}
/>
```

## Gombok

```javascript
import { Button } from 'react-native';

{/* ... */}

<View style={styles.container}>
    <Button title='Nyomd meg'/>
</View>
```

Esemény kezelése:

```javascript
<Button 
title='Nyomd meg'
onPress={() => alert('Működik')}
/>
```

## Saját gombok

```javascript
<TouchableHighlight
          style={styles.runButton}
          onPress={handleButton}
          >
          <Text style={styles.runText}>BUTTON</Text>
</TouchableHighlight>
```

### Gomb külön fájlban

Button.js:

```javascript
import React from 'react';
import { StyleSheet, Text, TouchableHighlight } from 'react-native';
 
const Button = (props) => {
    return (
        <TouchableHighlight
        style={styles.button}
        onPress={props.onPress}
        >
            <Text style={styles.buttonText}>Számít</Text>
        </TouchableHighlight>
 
    );
}
 
export default Button;
 
const styles = StyleSheet.create({
    button: {
        backgroundColor: 'blue',
        marginTop: 10,
        padding: 10,
        borderRadius: 3,
 
    },
    buttonText: {
        color: 'white',
        paddingLeft: 10,
        paddingRight: 10,
        fontSize: 22,
    },    
});
App.js
```

App.js

```javascript
import { StatusBar } from 'expo-status-bar';
import { useState } from 'react';
import { StyleSheet, Text, View } from 'react-native';
import Button from './components/Button';
 
export default function App() {
  const [num, setNum] = useState('');
 
  return (
    <View style={styles.container}>
      <Text>Gomb teszt</Text>
 
      <Button onPress={() => setNum(35)} />
 
      <Text>{num}</Text>
 
      <StatusBar style="auto" />
    </View>
  );
}
 
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'aqua',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
```

## Bekérés gyakorlat

Olyan alkalmazást szeretnénk készíteni, ami bekér egy háromszög alapját és magasságát, majd kiszámítja a területét.

```javascript
import { StatusBar } from 'expo-status-bar';
import { useState } from 'react';
import { StyleSheet, Text, TouchableHighlight, View } from 'react-native';
import { TextInput } from 'react-native';
 
function calcTriangleArea(base, height) {
  return base * height / 2;
}
 
export default function App() {
  const [base, setBase] = useState('');
  const [height, setHeight] = useState('');
  const [area, setArea] = useState('');
  function startCalc() {
    let result = calcTriangleArea(base, height);
    setArea(result);
  }
  return (
    <View style={styles.container}>
      <Text>Triangle</Text>
      <Text>Háromszög területszámítás</Text>
 
      {/* Alap bekérése */}
      <Text>Alap</Text>
      <TextInput
      style={styles.input}
      onChangeText={base => setBase(base)}
      />
 
      {/* Magasság bekérése */}
      <Text>Magasság</Text>
      <TextInput
      style={styles.input}
      onChangeText={height => setHeight(height)}
      />
 
      {/* Saját nyomógomb */}
      <TouchableHighlight
        style={styles.button}
        onPress={startCalc}
      >
        <Text style={styles.buttonText}>Számít</Text>
      </TouchableHighlight>
 
      <Text>Terület</Text>
      {/* TERÜLET */}
      <TextInput
      style={styles.input}
      onChangeText={area => setArea(area)}
      value={area}
      />
 
      <StatusBar style="auto" />
    </View>
  );
}
 
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: 'aqua',
    alignItems: 'center',
    justifyContent: 'center',
  },
  button: {
    backgroundColor: 'blue',
    marginTop: 10,
    padding: 10,
    borderRadius: 3,
 
  },
  butotnText: {
    color: 'white',
    paddingLeft: 10,
    paddingRight: 10,
    fontSize: 22,
  },
  input: {
    backgroundColor: 'white',
    height: 30,
  }
});
```

## Lista megjelenítése

A listák megjelenítésére a két leggyakrabban használt elm:

* FlatList
* SectionList

Készítsünk egy adathalmazt, amit meg fogunk jeleníteni:

```javascript
const employees = [
  {id: 1, name: 'Erős István', city: 'Szeged'},
  {id: 2, name: 'Táncos Ernő', city: 'Szeged'},
  {id: 3, name: 'Szabó Tamás', city: 'Szeged'}
];
```

Megjelenítés FlatList elemben:

```javascript
<FlatList 
data={employees}
renderItem={({ item }) => (
  <View style={styles.item}>
    <Text>{item.name}</Text>
    <Text>{item.city}</Text>
  </View>
  )}
/>
```

A teljes kód:

```javascript
import { StatusBar } from 'expo-status-bar';
import { FlatList, StyleSheet, Text, View } from 'react-native';
 
 
const employees = [
  {id: 1, name: 'Erős István', city: 'Szeged'},
  {id: 2, name: 'Táncos Ernő', city: 'Szeged'},
  {id: 3, name: 'Szabó Tamás', city: 'Szeged'}
];
 
export default function App() {
 
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Dolgozók</Text>
 
      <FlatList 
      data={employees}
      renderItem={({ item }) => (
        <View style={styles.item}>
          <Text>{item.name}</Text>
          <Text>{item.city}</Text>
        </View>
        )}      
      />
 
 
      <StatusBar style="auto" />
    </View>
  );
}
 
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
    width: 200,
  },
  item: {
    flexDirection: 'row',
  },
  title: {
    marginTop: 24,
  },
});
```

### Lista több CSS-sel

```javascript
import { FlatList, StyleSheet, Text, View } from 'react-native';
 
 
const employees = [
  {id: 1, name: 'Erős István', city: 'Szeged'},
  {id: 2, name: 'Táncos Ernő', city: 'Szeged'},
  {id: 3, name: 'Szabó Tamásaaa', city: 'Szeged'}
];
 
export default function App() {
 
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Dolgozók</Text>
 
      <FlatList 
      style={styles.flat}
      data={employees}
      renderItem={({ item, index }) => (
        <View style={styles.item}>
          <Text style={[
            styles.subItem, 
            index % 2 === 0 ? styles.evenRow : styles.oddRow,
          ]}>{item.name}</Text>
          <Text style={[
            styles.subItem, 
            index % 2 === 0 ? styles.evenRow : styles.oddRow,
          ]}>{item.city}</Text>
        </View>
        )}      
      />
    </View>
  );
}
 
const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#299dc5',
    alignItems: 'center',
    justifyContent: 'center',    
  },
  item: {
    flexDirection: 'row',
    width: '100%',
    paddingTop: 1,
  },
  title: {
    marginTop: 24,
    fontSize: 34,
  },
  flat: {
    width: '100%',
  },
  subItem: {
    fontSize: 16,
    flex: 1,
    color: '#333',
    padding: 5,    
  },
  evenRow: {
    backgroundColor: '#2395c0',
  },
  oddRow: {
    backgroundColor: '#2591c4',
  },
});
```

## Adatok REST API szerverről

Adatokat a fetch() utasítással hozhatunk le REST API szerverről. A telefon folyamatos frissítése miatt a useEffect() függvényen belül hívjuk:

```javascript
  useEffect(() => {
    fetch(dataURL)
    .then((response) => response.json())
    .then((data) => {
      setName(data.name);
      setCity(data.city);
      setSalary(data.salary);
    })
    .catch((error) => alert(error))
    .finally(()=>setLoading(false));
  }, []);
```

## Továbbiak

* [https://szit.hu/doku.php?id=oktatas:telefon:react_native](https://szit.hu/doku.php?id=oktatas:telefon:react_native)
