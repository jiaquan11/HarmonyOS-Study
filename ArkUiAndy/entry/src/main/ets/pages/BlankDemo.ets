@Entry
@Component
struct BlankDemo {
  @State message: string = 'Hello World';
  //空白填充组件
  build() {
    Column() {
      Row() {
        Text('蓝牙')
          .fontSize(20)
        Blank()
          .color(Color.Blue)
        Toggle({
          type:ToggleType.Switch
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}