import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { HttpClient, HttpParams } from '@angular/common/http';
import { FormGroup, FormBuilder } from '@angular/forms';
import { LoginService } from './login.service';
import { User } from '../models/user.model';
import { Subscription } from 'rxjs';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginForm: FormGroup;
  loggedInUser: User;
  userSubscription: Subscription;
  user: any;

  constructor(private router: Router, private http: HttpClient, private fb: FormBuilder, private loginServ: LoginService) {
    this.loggedInUser = new User();
  }

  ngOnInit() {
    this.loginForm = this.fb.group({
      userName: '',
      password: '',
    });
  }

  onSubmit = function () {
    if (this.loginForm.invalid) {
      return;
    }

    const params = {
      'Username': this.loginForm.get('userName').value,
      'Password': this.loginForm.get('password').value
    };
    this.Authenticate(params);
  };

  public Authenticate = (params: any) => {
    this.loginServ.loginToBookStore(params)
      .subscribe(
        res => {
          if (res.length > 0) {
            this.userSubscription = this.loginServ.getLoggedInUser().subscribe(data => {
              this.user = data;
              console.log(`logged in user ${this.user}`);
              localStorage.setItem('loggedUser', JSON.stringify(data));
              localStorage.setItem('authToken', data['authToken']);
            });
            // localStorage.setItem('loggedUser', JSON.stringify(this.user));
            // localStorage.setItem('firstname', this.user.firstname);
            this.router.navigate(['catalog']);
          } else {
            this.loginForm.reset();
          }
        },
        error => {
          console.log('There was an error while retrieving Posts !!!' + error);
        });
  }
}
