@Entry
@Component
struct Page2 {
  @State message: string = 'Hello World';

  build() {
    //Row容器组件，用于布局，水平方向布局 (主轴为横轴，交叉轴为纵轴)
    Column() {
      Row({ space: 20 }) {
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
      /**
       * 注意：Colomn和Row的主轴和交叉轴刚好是相反的
       */
      // .justifyContent(FlexAlign.SpaceAround)//主轴方向布局的对齐格式
      .alignItems(VerticalAlign.Center) //交叉轴方向布局的对齐方式
      Text('元素三')
        .fontSize(40)
        .fontColor('#36D')
        .lineHeight(FontWeight.Medium)
    }.width('100%')
  }
}