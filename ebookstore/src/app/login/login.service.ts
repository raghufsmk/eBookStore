import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders, HttpParams } from '@angular/common/http';
import { Observable, throwError, Subject } from 'rxjs';
import { retry, catchError, map } from 'rxjs/operators';
import { User } from '../models/user.model';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  url = 'http://localhost:51714/api/Login/';
  headers: HttpHeaders;

  httpOptions = {
    headers: new HttpHeaders({
      'Content-Type': 'application/json'
    })
  };

  loggedInUserSubject = new Subject<User>();

  constructor(private http: HttpClient) { }

  public loginToBookStore(params: HttpParams): Observable<User[]> {

    return this.http.post<User[]>(this.url, params, this.httpOptions)
      .pipe(
        map(model => {
          const items = model;
          let loggedInUser: User = {
            firstname: model[0].firstname,
            Username: model[0].Username,
            UserCatergory: model[0].UserCatergory,
            cust_id: model[0].cust_id,
            Password: '',
            authToken: model[0].authToken
          };
          console.log(`response ${model}`);
          this.loggedInUserSubject.next(loggedInUser);
          return model;
        }),
        catchError(this.handleError)
      );
  }

  getLoggedInUser(): Observable<any> {
    return this.loggedInUserSubject.asObservable();
  }

  isLogged() {
    return localStorage.getItem('authToken') != null;
  }

  getAuthToken() {
    return localStorage.getItem('authToken');
  }

  getCustID() {
    return JSON.parse(localStorage.getItem('loggedUser'))['cust_id'];
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
