@Entry
@Component
struct DividerDemo {
  @State message: string = 'Hello World';
  //分割线组件
  build() {
    Row() {
      Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
        Text('水平分割线')
          .fontSize(19)
          .fontColor(Color.Black)
        Row()
          .width('100%')
          .height(40)
          .backgroundColor(Color.Blue)
        Divider()
        Row()
          .width('100%')
          .height(40)
          .backgroundColor(Color.Green)

        Text('垂直分割线')
          .fontSize(19)
          .fontColor(Color.Black)
        Flex({ alignItems: ItemAlign.Center, wrap: FlexWrap.Wrap }) {
          Text('bravery').fontSize(18)
          Divider().vertical(true).margin(20).height(15).color(Color.Red)
          Text('effort').fontSize(18)
          Divider().vertical(true).margin(20).height(15).color(Color.Red)
          Text('upward').fontSize(18)
        }
        .width(250)

        Text('自定义样式')
          .fontSize(19)
          .fontColor(Color.Black)
        Row()
          .width('10%')
          .height(40)
          .backgroundColor(Color.Blue)
        Divider()
          .vertical(false)
          .color('0x2788D9')
          .strokeWidth(5)
          .lineCap(LineCapStyle.Round)
        Row().width('100%').height(40).backgroundColor(Color.Green)
      }
      .width('100%')
      .height(350)
      .padding({ left: 35, right: 35, top: 35 })
    }
  }
}