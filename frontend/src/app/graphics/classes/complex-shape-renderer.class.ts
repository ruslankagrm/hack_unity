import { Type } from '@angular/core';
import { DynamicComponentsFactory } from './dynamic-components-factory.class';
import { ComplexShapeRenderOptions } from '../types/complex-shape-rendere-options.type';
import { Container } from '../types/container.type';
import { defaultComplexShapeRenderingOptionsFactory } from '../functions/default-complex-shape-render-options.factory';
import { ComponentBehaviorDecorator } from './component-behavior-decorator.class';

export const namespace = 'http://www.w3.org/2000/svg';

export class ComplexShapeRenderer {

  constructor(private readonly container: NonNullable<Readonly<SVGSVGElement>>,
              private readonly dynamicComponentFactory: DynamicComponentsFactory) {
  }

  public appendDynamicComponentToContainer<T = any>
  (type: Type<Readonly<any>>, options?: ComplexShapeRenderOptions) {

    const compiledComponentWithMetaData = this.dynamicComponentFactory.getComponentFromAngularFactory(type);
    const container = this.dynamicComponentFactory.getContentContainer();
    const properties = options ?? defaultComplexShapeRenderingOptionsFactory();

    const { component } = compiledComponentWithMetaData;

    new DynamicComponentContainerDecorator(container, this.container)
      .decorateDynamicComponentContainer(properties)
      .append(component);

    this.container.append(container)
  }

}


export class DynamicComponentContainerDecorator {

  private readonly componentBehaviorDecorator: NonNullable<ComponentBehaviorDecorator>
    = new ComponentBehaviorDecorator(this.target, this.overlay);

  constructor(private readonly target: Container, private readonly overlay: SVGSVGElement) {
    this.componentBehaviorDecorator.decorateComponentContainer();
  }

  public decorateDynamicComponentContainer(options: ComplexShapeRenderOptions): Container {
    this.target.setAttribute('x', options.x.toString());
    this.target.setAttribute('y', options.y.toString());
    this.target.setAttribute('width', options.property.width.toString());
    this.target.setAttribute('height', options.property.height.toString())

    // this.target.classList.add('ui-element-container');

    return this.target;
  }
}


