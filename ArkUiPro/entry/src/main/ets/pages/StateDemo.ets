/**
 * State的使用说明
 * 不允许直接改变状态变量
 * State变量只有在有触发的情况下使用
 * 不能在自定义组件的build()或@Builder方法里直接改变状态变量，这可能会造成循环渲染的风险。
 * Text('${this.count++}')在全量更新或最小化更新会产生不同的影响
 */
@Entry
@Component
struct CompA {
  @State col1: Color = Color.Yellow;
  @State col2: Color = Color.Green;
  @State count: number = 1;
  build() {
    Column() {
      // 应避免直接在Text组件内改变count的值
      Text(`${this.count++}`)
        .width(50)
        .height(50)
        .fontColor(this.col1)
        .onClick(() => {
          this.col2 = Color.Red;
        })
      Button("change col1").onClick(() =>{
        this.col1 = Color.Pink;
      })
    }
    .backgroundColor(this.col2)
  }
}