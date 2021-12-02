import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';
import { BoardItem } from '../models/board-item.model';
import { BoardRepository } from '../repository/board.repository';

@Injectable({
  providedIn: 'root'
})
export class BoardStateService {

  state$ = new BehaviorSubject<BoardItem>(null);

  constructor(
    private repo: BoardRepository,
  ) {

  }

  updateBoard(): void {

  }

}
