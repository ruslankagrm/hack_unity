import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderModule } from './shared/modules/header/header.module';
import { ButtonsModule } from './shared/modules/buttons/buttons.module';
import { ControlsModule } from './shared/modules/controls/controls.module';
import { SceneComponent } from './scene/scene.component';
import { TabsComponent } from './tabs/tabs/tabs.component';
import { TabDirective } from './tabs/tab.directive';
import { WelcomeComponent } from './welcome/welcome.component';
import { GraphicsModule } from './graphics/graphics.module';
import { WebsocketModule } from './shared/websocket/websocket.module';
import { environment } from 'src/environments/environment';
import { ScrollableChipsModule } from './shared/modules/scrollable-chips/scrollable-chips.module';

@NgModule({
  declarations: [
    AppComponent,
    SceneComponent,
    TabsComponent,
    TabDirective,
    WelcomeComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HeaderModule,
    ButtonsModule,
    ControlsModule,
    GraphicsModule,
    WebsocketModule.config({
      url: environment.ws
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
