import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class ConfigService {

  private _config: Object;
  configPath: string;

  constructor(private http: HttpClient) {
    this.configPath = '../../assets/app.config.json';
  }

  getConfig(key: any) {
    return this._config[key];
  }

  load() {
    return new Promise((resolve) => {
      this.http.get(this.configPath)
        // .pipe(map((response: any) => response.json()))
        // .map(res => res.json())
        .subscribe(config => {
          this._config = config;
          resolve();
        });
    });
  }
}

