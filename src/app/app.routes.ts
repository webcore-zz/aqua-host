import { loadRemoteModule } from "@angular-architects/module-federation";
import { Routes } from "@angular/router";
import { HomeComponent } from "../home/home.component";

export const routes: Routes = [
  {
    path: "",
    component:HomeComponent,
    pathMatch:"full"
  },
  {
    path: "thermostat",
    loadComponent: () =>
        loadRemoteModule('thermostat', './Component').then((m) => m.AppComponent),
  },
];
