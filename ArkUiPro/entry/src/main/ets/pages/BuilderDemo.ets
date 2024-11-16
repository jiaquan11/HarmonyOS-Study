/**
 * @Builder的使用说明
 * 不允许调用没有用@Builder装饰的方法，允许系统组件的参数是TS方法的返回值
 * 直接调用限制：在构建过程中，只有用@Builder装饰的方法可以被直接调用。
 * 返回值使用：没有@Builder装饰的方法可以被调用，其返回值可以用作组件的参数。
 * 这种设计允许在构建过程中灵活地使用计算结果，而不违反构建流程的约束
 */
@Entry
@Component
struct ParentComponent {
  doSomeCalculations() {
  }

  calcTextValue(): string {
    return 'Hello World';
  }

  @Builder doSomeRender() {
    Text(`Hello World`)
  }

  build() {
    Column() {
      // 反例：不能调用没有用@Builder装饰的方法
      // this.doSomeCalculations();

      // 正例：可以调用
      this.doSomeRender();
      // 正例：参数可以为调用TS方法的返回值
      Text(this.calcTextValue())
    }
  }
}