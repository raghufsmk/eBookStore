import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { AddProductService } from '../services/add-product.service';
import { Subscription } from 'rxjs';
import { LoginService } from '../login/login.service';
import { User } from '../models/user.model';

@Component({
  selector: 'app-home-page',
  templateUrl: './home-page.component.html',
  styleUrls: ['./home-page.component.css']
})
export class HomePageComponent implements OnInit {
  applicationTitle: string;
  totalCartItem: number;
  loggedInUser: User;
  user: any;
  username: string;

  cartCountSubscription: Subscription;
  userSubscription: Subscription;

  constructor(private router: Router, private fetchCart: AddProductService, private loginServ: LoginService) {
    this.applicationTitle = 'Online Book Store';
    this.loggedInUser = new User();
    this.cartCountSubscription = this.fetchCart.getCartTotalCount().subscribe(count => { this.totalCartItem = count; });
    this.userSubscription = this.loginServ.getLoggedInUser().subscribe(data => {
      this.user = JSON.parse(localStorage.getItem('loggedUser'));
      this.username = data.Username;
      if (this.user === null) {
        localStorage.setItem('loggedUser', JSON.stringify(data));
        localStorage.setItem('authToken', data['authToken']);
      }
      console.log(`user ${this.user}`);
    });
  }

  themes = [
    {
      name: 'Your Account',
      href: ''
    },
    {
      name: 'Your Orders',
      href: ''
    },
    {
      name: 'Your Wishlist',
      href: ''
    }
  ];

  ngOnInit() {
  }

  redirectToCart() {
    this.router.navigate(['cart']);
  }

  redirectToLogin() {
    this.router.navigate(['login']);
  }

}
