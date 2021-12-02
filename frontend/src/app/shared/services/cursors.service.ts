import { DOCUMENT } from '@angular/common';
import { Inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { fromEvent, ReplaySubject, SubscriptionLike } from 'rxjs';
import { filter, map, throttleTime } from 'rxjs/operators';
import { Cursor } from 'src/app/interfaces/cursor';
import { EVENT } from '../websocket/events';
import { WebsocketService } from '../websocket/websocket.service';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class CursorsService {

  private subOn: SubscriptionLike;
  private subSend: SubscriptionLike;
  private _cursors: Map<string, ReplaySubject<Cursor>> = new Map();
  private cursorOwners: ReplaySubject<string[]> = new ReplaySubject(1);
  private _cursorOwners: string[] = [];
  

  constructor(
    @Inject(DOCUMENT) private document,
    private ws: WebsocketService,
    private authService: AuthService
  ) {
  }

  connect(svgContainer: SVGSVGElement): void {
    const mousePoint = svgContainer.createSVGPoint();

    this.subOn = this.ws.on<Cursor>(EVENT.cursor).pipe(
      filter(cursor => cursor.name !== this.authService.name)
    ).subscribe(cursor => {
      if (cursor.name.trim()) {
        if (this._cursorOwners.includes(cursor.name) && this._cursors.has(cursor.name)) {
          this._cursors.get(cursor.name).next(cursor);
        } else {
          const subj = new ReplaySubject<Cursor>(1);
          subj.next(cursor);
          this._cursors.set(cursor.name, subj);
          this._cursorOwners.push(cursor.name);
          this.cursorOwners.next(this._cursorOwners);
        }
      }
    });

    this.subSend = fromEvent<MouseEvent>(this.document, 'mousemove').pipe(
      filter(_ => this.ws.connected),
      throttleTime(33),
      map(event => {
        mousePoint.x = event.clientX;
        mousePoint.y = event.clientY;
        return mousePoint.matrixTransform(svgContainer.getScreenCTM().inverse())
      })
    ).subscribe(event => {
      this.ws.send(EVENT.cursor, {x: event.x, y: event.y, name: this.authService.name});
      this.ws.send(EVENT.cursor, {x: event.x + 100, y: event.y + 100, name: 'Billy'});
    });

    
  }

  disconnect(): void {
    this.subOn.unsubscribe();
    this.subSend.unsubscribe();
  }

  getCursorByName(name: string): ReplaySubject<Cursor> {
    return this._cursors.get(name);
  }

  get cursorOwners$(): Observable<string[]> {
    return this.cursorOwners.asObservable();
  }
}
