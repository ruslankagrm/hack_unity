import { Injectable } from '@angular/core';
import { BoardItem } from '../models/board-item.model';
import { Observable, of } from 'rxjs';

@Injectable({
  providedIn: 'root',
})
export class BoardRepository {

  private readonly api = 'api/';

  constructor() {
  }

  getBoard(id: string): Observable<BoardItem> {
    return of(null);
  }

  updateBoard(id: string, board: BoardItem): Observable<BoardItem> {
    return of(null);
  }

}
