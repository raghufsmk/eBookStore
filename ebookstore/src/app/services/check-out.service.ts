import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';
import { Order } from '../models/order.model';
import { LoginService } from '../login/login.service';
import { Router } from '@angular/router';
import { ConfigService } from './config.service';

@Injectable({
  providedIn: 'root'
})
export class CheckOutService {
  url: string;
  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  };

  constructor(private http: HttpClient, private loginServ: LoginService, private router: Router, private configData: ConfigService) {
    this.url = this.configData.getConfig('OrderUrl');
   }

  public checkOutOrder(params: any): Observable<any> {

    if (this.loginServ.isLogged()) {
      this.httpOptions.headers.append('Authorization', this.loginServ.getAuthToken());
    } else {
      this.router.navigate(['login']);
    }

    return this.http.post<any>(this.url, params, this.httpOptions)
      .pipe(
        retry(1),
        catchError(this.handleError)
      );
  }
  // Error handling
  handleError(error) {
    let errorMessage = '';
    if (error.error instanceof ErrorEvent) {
      // Get client-side error
      errorMessage = error.error.message;
    } else {
      // Get server-side error
      errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
    }
    // window.alert(errorMessage);
    console.log(errorMessage);
    return throwError(errorMessage);
  }
}
