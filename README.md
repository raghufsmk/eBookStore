# Online book store

# UI Ebookstore

UI is developed using  [Angular CLI](https://github.com/angular/angular-cli) version 6.1.1 and Angular-material. The code is available [here](https://github.com/raghufsmk/eBookStore/tree/develop/ebookstore)

## Development server

Run `ng serve` for a dev server. Navigate to `http://localhost:4200/`. The app will automatically reload if you change any of the source files.

# Ebookstore Service

Business logic and Database connectivity to fetch and store data written in RestFull service using ASP.NET WebAPI. Its available under [BookStoreService/BookStore](https://github.com/raghufsmk/eBookStore/tree/develop/BookStoreService/BookStore)

The WebAPI either needs to be deployed in IIS or running before we run UI code.

## Dependency NuGet Packages
* Microsoft.AspNet.Cors
* Microsoft.AspNet.WebApi.WebHost
* Microsoft.IdentityModel
* Microsoft.IdentityModel.JsonWebTokens
* Microsoft.IdentityModel.Tokens
* Newtonsoft.Json

# Database

Database is created with mysql and its available [here](https://github.com/raghufsmk/eBookStore/tree/develop/DB) 

## Setup DB
First all DB objects like Table, Stored Procedure and other schemas needs to created in MySQL db by executing script provided [here](https://github.com/raghufsmk/eBookStore/blob/develop/DB/bookstore_db.sql)

### Add Data
Once DB is created next step is to add data to [book](https://github.com/raghufsmk/eBookStore/blob/develop/DB/insert_book.sql) and [customer](https://github.com/raghufsmk/eBookStore/blob/develop/DB/insert_customer.sql) table 


