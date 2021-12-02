import { Type } from '@angular/core';

export type ComponentType = {[key: string]: Type<any>};

export interface BoardItem {
  positionX: number;
  positionY: number;
  width: number;
  height: number;
  name: string;
  componentType: ComponentType;
  children: BoardItem[];
}
