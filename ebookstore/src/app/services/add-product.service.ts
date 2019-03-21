import { Injectable } from '@angular/core';
import { Book } from '../models/book.model';
import { Subject, Observable } from 'rxjs';
import { Product } from '../models/product.model';

@Injectable({
  providedIn: 'root'
})
export class AddProductService {

  // NavbarCounts
  navbarCartCount = 0;
  cartItemSubject = new Subject<Book>();
  cartItemCountSubject = new Subject<number>();
  constructor() { }

  // Adding new Product to cart db if logged in else localStorage
  addToCart(data: Book): void {

    let cartItems: Book[] = JSON.parse(localStorage.getItem('cart_item')) || [];

    if (cartItems.find(x => x.isbn === data.isbn)) {
      // cartItems.splice(cartItems.findIndex(x => x.isbn === row.isbn), 1);
      const index = cartItems.findIndex(x => x.isbn === data.isbn);
      console.log(`${cartItems[index]['title']}'s index found`);
      console.log(`price - ${cartItems[index]['price']}`);
      if (cartItems[index]['quantity'] === undefined) {
        cartItems[index]['quantity'] = 2;
        cartItems[index]['price'] = cartItems[index]['quantity'] * data.price;
        console.log(`updated price - ${cartItems[index]['price']}`);
      } else {
        cartItems[index]['quantity'] = cartItems[index]['quantity'] + 1;
        cartItems[index]['price'] = cartItems[index]['quantity'] * data.price;
        console.log(`updated quantity-repeat - ${cartItems[index]['quantity']}`);
      }
      console.log(`${data.title} added again`);
      // localStorage.setItem('cart_item', JSON.stringify(cartItems));
    } else {
      cartItems.push(data);
    }


    console.log('Adding Book to Cart', 'Book adding to the cart');
    setTimeout(() => {
      localStorage.setItem('cart_item', JSON.stringify(cartItems));
      this.cartItemSubject.next(JSON.parse(localStorage.getItem('cart_item')));
      this.cartItemCountSubject.next(this.getCartItems().length);
      this.calculateLocalCartProdCounts();
    }, 500);
  }

  // returning LocalCarts Product Count
  calculateLocalCartProdCounts() {
    this.navbarCartCount = this.getCartItems().length;
  }

  getTotalCount() {
    this.cartItemCountSubject.next(this.getCartItems().length);
    return this.getCartItems().length;
  }

  getCartTotalCount(): Observable<number> {
    return this.cartItemCountSubject.asObservable();
  }

  getTotalPrice() {
    // calculate total price
    return 10;
  }

  getCartItems(): Book[] {
    const products: Book[] = JSON.parse(localStorage.getItem('cart_item')) || [];
    return products;
  }

  // Fetching Locat CartsProducts
  getLocalCartProducts(): Observable<Book> {
    // const products: Book[] = JSON.parse(localStorage.getItem('cart_item')) || [];
    // return products;
    return this.cartItemSubject.asObservable();
  }

  // Clear cart
  clearCart() {
    localStorage.removeItem('cart_item');
    // this.cartItemSubject.next();
  }

  deleteItem(row: Book): boolean {
    let cartItems: Book[] = JSON.parse(localStorage.getItem('cart_item')) || [];

    if (cartItems.find(x => x.isbn === row.isbn)) {
      cartItems.splice(cartItems.findIndex(x => x.isbn === row.isbn), 1);
      localStorage.setItem('cart_item', JSON.stringify(cartItems));
      return true;
    }
    return false;
  }
}
