import { Routes, RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';

import { HomePageComponent } from './home-page/home-page.component';
import { PageNotFoundComponent } from './page-not-found/page-not-found.component';
import { CatalogPageComponent } from './catalog-page/catalog-page.component';
import { ShoppingCartComponent } from './shopping-cart/shopping-cart.component';
import { LoginComponent } from './login/login.component';
import { NeedAuthGuardService } from './shared/need-auth-guard.service';

export const appRoutes: Routes = [
    { path: '', component: CatalogPageComponent },
    { path: 'catalog', component: CatalogPageComponent },
    // { path: 'catalog/:id', component: components.CatalogItemPreviewComponent },
    { path: 'cart', component: ShoppingCartComponent, canActivate: [NeedAuthGuardService] },
    { path: 'login', component: LoginComponent },
    { path: '**', component: PageNotFoundComponent }
];


@NgModule({
    imports: [RouterModule.forRoot(appRoutes, { useHash: true })],
    exports: [RouterModule]
})
export class AppRoutingModule { }
