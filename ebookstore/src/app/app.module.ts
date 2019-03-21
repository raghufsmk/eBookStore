import { BrowserModule } from '@angular/platform-browser';
import { NgModule, NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA  } from '@angular/core';

import { MaterialModule } from './shared/material.module';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FlexLayoutModule } from '@angular/flex-layout';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';


import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { HomePageComponent } from './home-page/home-page.component';
import { AdvanceSearchComponent } from './advance-search/advance-search.component';
import { CatalogPageComponent } from './catalog-page/catalog-page.component';
import { CatalogItemComponent } from './catalog-page/catalog-item/catalog-item.component';
import { CatalogService } from './catalog-page/catalog.service';
import { ShoppingCartComponent } from './shopping-cart/shopping-cart.component';
import { ShoppingCardItemComponent } from './shopping-cart/shopping-card-item/shopping-card-item.component';
import { LoginComponent } from './login/login.component';

import {AddProductService} from './services/add-product.service';

@NgModule({
  declarations: [
    AppComponent,
    PageNotFoundComponent,
    HomePageComponent,
    AdvanceSearchComponent,
    CatalogPageComponent,
    CatalogItemComponent,
    ShoppingCartComponent,
    ShoppingCardItemComponent,
    LoginComponent
  ],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    FlexLayoutModule,
    MaterialModule,
    HttpClientModule,
    FormsModule,
    ReactiveFormsModule,
    AppRoutingModule
  ],
  providers: [CatalogService, AddProductService],
  bootstrap: [AppComponent],
  schemas: [NO_ERRORS_SCHEMA,
    CUSTOM_ELEMENTS_SCHEMA]
})
export class AppModule { }
