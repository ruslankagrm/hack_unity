import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ButtonDirective } from './directives/button.directive';



@NgModule({
  declarations: [
    ButtonDirective
  ],
  exports: [
    ButtonDirective
  ],
  imports: [
    CommonModule
  ]
})
export class ButtonsModule { }
