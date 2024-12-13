# Frontend - Integrációs teszt

* **Szerző:** Sallai András
* Copyright (c) 2022, Sallai András
* Licenc: [CC Attribution-Share Alike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/)
* Web: [https://szit.hu](https://szit.hu)

## Tartalomjegyzék

* [Tartalomjegyzék](#tartalomjegyzék)
* [Az integrációs teszt](#az-integrációs-teszt)
* [Projekt készítése](#projekt-készítése)
* [A HttpClient modul használata](#a-httpclient-modul-használata)
* [A fő komponens teszt javítása](#a-fő-komponens-teszt-javítása)
* [A szolgáltatás teszt javítása](#a-szolgáltatás-teszt-javítása)
* [Szolgáltatás elkészítése](#szolgáltatás-elkészítése)
* [Szolgáltatás használata](#szolgáltatás-használata)
* [Az emp komponens tesztelése](#az-emp-komponens-tesztelése)

## Az integrációs teszt

Az egyes szoftverkomponenseket együttesen vizsgáljuk.

Ebben a fejezetben az Angular egyes részeinek együttműködését teszteljük.

## Projekt készítése

```cmd
ng new emper
cd emper
code .
```

Komponens és szolgáltatás:

```cmd
ng generate component emp
ng generate service api
```

## A HttpClient modul használata

```typescript
import { provideHttpClient } from '@angular/common/http';

//...

providers: [
    provideHttpClient()
]
```

## A fő komponens teszt javítása

```typescript
//src/app/app.component.spec.ts
import { TestBed } from '@angular/core/testing';
import { AppComponent } from './app.component';
import { provideHttpClient } from '@angular/common/http';

describe('AppComponent', () => {
  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [AppComponent],
      providers: [provideHttpClient()],
    }).compileComponents();
  });

  it('should create the app', () => {
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.componentInstance;
    expect(app).toBeTruthy();
  });

});
```

Csak az első tesztet hagytuk meg. A TestBed konfigirációjában megadtuk a provideHttpClient() metódust.

## A szolgáltatás teszt javítása

```typescript
import { TestBed } from '@angular/core/testing';

import { ApiService } from './api.service';
import { provideHttpClient } from '@angular/common/http';

describe('ApiService', () => {
  let service: ApiService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [provideHttpClient()],
    });
    service = TestBed.inject(ApiService);
  });

  it('service should be created in api.service.spec', () => {
    expect(service).toBeTruthy();
  });
});
```

## Szolgáltatás elkészítése

```typescript
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ApiService {

  constructor(private http: HttpClient) { }

  getEmployees() {
    return this.http.get('http://localhost:8000/employees');
  }
}
```

## Szolgáltatás használata

Az emp komponensben használjuk a szolgáltatást

```typescript
//src/app/emp/emp.component.ts
import { Component } from '@angular/core';
import { ApiService } from '../shared/api.service';

@Component({
  selector: 'app-emp',
  standalone: true,
  imports: [],
  templateUrl: './emp.component.html',
  styleUrl: './emp.component.css'
})
export class EmpComponent {

  employees: any[] = [];

  constructor(private api: ApiService) {}

  ngOnInit() {
    this.api.getEmployees().subscribe((data: any) => {
      console.log(data);
      this.employees = data;
    });
  }
}
```

```html
//src/app/emp/emp.component.html
<p>emp works!</p>

<ul>
  @for(emp of employees; track emp.id) {
    <li>{{emp.name}} - {{emp.city}} - {{emp.salary}} Ft</li>
  }
</ul>
```

## Az emp komponens tesztelése

```typescript
import { ComponentFixture, TestBed } from '@angular/core/testing';
import { EmpComponent } from './emp.component';
import { of } from 'rxjs';
import { ApiService } from '../shared/api.service';

//Létrehozunk egy Mock objektumot
class MocApiService {
  getEmployees() {
    return of([
      { id: 1, name: 'Erős Lajos', city: 'Pécs', salary: 300 },
      { id: 2, name: 'Szi István', city: 'Pécs', salary: 100 },
    ]);
  }
}

describe('EmpComponent', () => {
  let component: EmpComponent;
  let fixture: ComponentFixture<EmpComponent>;
  let apiService: ApiService;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [EmpComponent],
      /*
      Az ApiService szolgáltatás helyettesítjük
      a MocApiService szolgáltatással:
      */
      providers: [{ 
        provide: ApiService, 
        useClass: MocApiService
      }],
    })
    .compileComponents();

  });

  beforeEach(() => {
    fixture = TestBed.createComponent(EmpComponent);
    component = fixture.componentInstance;
    //Az ApiService injektálása:
    apiService = TestBed.inject(ApiService);
    fixture.detectChanges();
  });

  it('Az EmpComponent létrehozható', () => {
    expect(component).toBeTruthy();
  });

  it('Az EmpComponent-be betöltődik 2 dolgozó', () => {
    expect(component.employees.length).toBe(2);
  });

  it('rederli a sablonfájlba', () => {
    const compiled = fixture.nativeElement;
    expect(compiled.querySelectorAll('li').length).toBe(2);
  })
  it('A rederlt listában az első elem Erős Lajos', () => {
    const compiled = fixture.nativeElement;
    expect(compiled.querySelector('li').textContent).toContain('Erős Lajos');
  })
});
```
