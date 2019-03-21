import { Component, OnInit } from '@angular/core';
import { AddProductService } from '../services/add-product.service';
import { Book } from '../models/book.model';
import { MatTableDataSource, MatSnackBar } from '@angular/material';
import { Router } from '@angular/router';
import { Subscription } from 'rxjs';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { CheckOutService } from '../services/check-out.service';
import { Order } from '../models/order.model';
import { Product } from '../models/product.model';
import { LoginService } from '../login/login.service';



@Component({
  selector: 'app-shopping-cart',
  templateUrl: './shopping-cart.component.html',
  styleUrls: ['./shopping-cart.component.css']
})
export class ShoppingCartComponent implements OnInit {

  cartItems: any = [];
  displayedColumns: string[];
  dataSource: MatTableDataSource<Book>;
  totalCount: number;
  subscription: Subscription;
  productData: Array<Product> = [];

  constructor(private fetchCart: AddProductService, private router: Router,
    private placeOrder: CheckOutService, private loginServ: LoginService,
    private snackBar: MatSnackBar, public dialog: MatDialog) {
    this.displayedColumns = ['position', 'name', 'weight', 'quantity', 'symbol', 'delete'];
    this.updateCartItems();
  }

  ngOnInit() {
    this.totalCount = this.fetchCart.getTotalCount();
    console.log(`Total Count ${this.totalCount}`);
  }

  clearCartItem() {
    this.fetchCart.clearCart();
    this.updateCartItems();
    this.totalCount = this.fetchCart.getTotalCount();
  }

  redirectToCatalog() {
    this.router.navigate(['catalog']);
  }

  deleteItemFromCart(row: any) {
    console.log(`Remove item - ${row}`);
    if (this.fetchCart.deleteItem(row)) {
      console.log(`Deleted item - ${row}`);
    } else {
      console.log(`Not deleted`);
    }
    this.updateCartItems();
  }

  updateCartItems() {
    this.cartItems = this.fetchCart.getCartItems();
    this.dataSource = this.cartItems;
    this.totalCount = this.fetchCart.getTotalCount();
  }

  checkout() {
    // Create object for Order
    let productItem: Product;
    this.cartItems = this.fetchCart.getCartItems();
    for (let item of this.cartItems) {
      productItem = new Product();
      productItem.isbn = item['isbn'];
      productItem.quantity = (item['quantity'] === undefined) ? 1 : item['quantity'];
      this.productData.push(productItem);
      console.log(`ISBN - ${item['isbn']}; Quantity- ${item['quantity']}`);
    }

    const params = {
      'cust_id': this.loginServ.getCustID(),
      'products': this.productData
    };

    this.placeOrder.checkOutOrder(params).subscribe(
      res => {
        console.log(res);
        if (res) {
          this.snackBar.open(`Order has been placed succesfully`, '', {
            duration: 2000,
          });
          this.clearCartItem();
        }
      },
      error => {
        console.log('There was an error while retrieving Posts !!!' + error);
      });

  }
}
