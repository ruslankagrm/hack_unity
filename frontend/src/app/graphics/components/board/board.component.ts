import {
  AfterViewInit,
  Component,
  ComponentFactoryResolver,
  ElementRef,
  OnDestroy,
  ViewChild,
  ViewContainerRef
} from '@angular/core';
import { Scope } from '../../classes/view-scope.class';
import { ComplexShapeRenderer } from '../../classes/complex-shape-renderer.class';
import { DynamicComponentsFactory } from '../../classes/dynamic-components-factory.class';
import { ToggleComponent } from '../../../shared/modules/controls/components/toggle/toggle.component';
import { CursorsService } from 'src/app/shared/services/cursors.service';
import { ComplexShapeRendererService } from '../../services/complex-shape-renderer.service';
import { ScopeSharerService } from '../../services/scope-sharer.service';

@Component({
  selector: 'app-board',
  templateUrl: './board.component.html',
  styleUrls: ['./board.component.scss']
})
export class BoardComponent implements AfterViewInit, OnDestroy {

  private scope!: NonNullable<Readonly<Scope>>;
  private complexShapeRenderer!: NonNullable<Readonly<ComplexShapeRenderer>>;
  private dynamicComponentFactory!: DynamicComponentsFactory;

  constructor(
    private readonly complexShapeRendererService: ComplexShapeRendererService,
    private readonly factory: ComponentFactoryResolver,
    public cursorsService: CursorsService,
    private scopeService: ScopeSharerService
  ) {}

  @ViewChild('container')
  private readonly container!: ElementRef<SVGSVGElement>;

  @ViewChild('container', { read: ViewContainerRef })
  private readonly target!: ViewContainerRef;

  public ngAfterViewInit() {
    const viewBox = this.scopeService.getScopeParams();
    this.scope = new Scope(this.container.nativeElement, viewBox);
    this.scopeService.setScope(this.scope);
    // this.cursorsService.connect(this.container.nativeElement);
    this.dynamicComponentFactory = new DynamicComponentsFactory(this.factory, this.target);
    this.complexShapeRenderer = new ComplexShapeRenderer(this.container.nativeElement, this.dynamicComponentFactory);

    this.complexShapeRendererService
      .buildComponentFactory(this.target)
      .buildShapeRenderer(this.container.nativeElement)

  }

  ngOnDestroy(): void {
    this.cursorsService.disconnect();
  }

  public appendDynamicContent() {
    this.complexShapeRenderer.appendDynamicComponentToContainer<ToggleComponent>(ToggleComponent);
  }

}
