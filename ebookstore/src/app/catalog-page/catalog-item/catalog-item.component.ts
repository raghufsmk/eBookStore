import { Component, OnInit, Input } from '@angular/core';
import { Book } from '../../models/book.model';
import { AddProductService } from '../../services/add-product.service';
import { MatSnackBar } from '@angular/material';

@Component({
  selector: 'catalog-item',
  templateUrl: './catalog-item.component.html',
  styleUrls: ['./catalog-item.component.css']
})
export class CatalogItemComponent implements OnInit {

  @Input() private item: Book;

  constructor(private addCart: AddProductService, private snackBar: MatSnackBar) { }

  ngOnInit() {
  }

  addToCart(product: Book) {
    this.addCart.addToCart(product);
    this.addedItemNotification(product.title, '');
  }

  addedItemNotification(item: string, action: string) {
    this.snackBar.open(`Added '${item}' to your cart`, action, {
      duration: 2000,
    });
  }

}
