import { Component, OnInit } from '@angular/core';
import { Book } from '../models/book.model';
import { CatalogService } from './catalog.service';
import { Observable } from 'rxjs';

@Component({
  selector: 'app-catalog-page',
  templateUrl: './catalog-page.component.html',
  styleUrls: ['./catalog-page.component.css']
})
export class CatalogPageComponent implements OnInit {

  private books: Array<Book>;
  allBooks: any = [];

  constructor(private catServ: CatalogService) {  }

  ngOnInit() {
    this.loadAllBooks();
  }

  // private isEmptyCatalog(): boolean {
  //   return !!this.books && this.books.length === 0;
  // }

  loadAllBooks() {
    this.catServ.getAllBooks().subscribe((data: {}) => {
      this.allBooks = data;
    });
  }

}
