@Entry
@Component
struct Page1 {
  @State message: string = 'Hello World';

  build() {
    //Column容器组件，用于布局，垂直方向布局 (主轴为纵轴，交叉轴为横轴)
    Column() {
      Column({ space: 20 }) {
        Text('元素一')
          .fontSize(40)
          .fontColor('#36D')
          .lineHeight(FontWeight.Medium)
        Text('元素二')
          .fontSize(40)
          .fontColor('#36D')
          .lineHeight(FontWeight.Medium)
      }
      .width('100%')
      .height(300)
      // .justifyContent(FlexAlign.SpaceAround)//主轴方向布局的对齐格式
      .alignItems(HorizontalAlign.Start)//交叉轴方向布局的对齐方式
      Text('元素三')
        .fontSize(40)
        .fontColor('#36D')
        .lineHeight(FontWeight.Medium)
    }.width('100%')
  }
}
