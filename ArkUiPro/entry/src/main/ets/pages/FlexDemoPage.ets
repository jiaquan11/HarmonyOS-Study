@Entry
@Component
struct FlexDemoPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Row() {
        Text('个人技能')
          .fontSize(34)
          .fontWeight(600)
      }
      .padding(20)
      .width('100%')

      Flex({
        wrap: FlexWrap.Wrap
      }) {
        Text('C++').backgroundColor('#ccc').margin(10).padding(15)
        Text('Java').backgroundColor('#ccc').margin(10).padding(15)
        Text('Python').backgroundColor('#ccc').margin(10).padding(15)
        Text('大数据').backgroundColor('#ccc').margin(10).padding(15)
        Text('Hadoop').backgroundColor('#ccc').margin(10).padding(15)
        Text('人工智能').backgroundColor('#ccc').margin(10).padding(15)
      }
    }
    .height('100%')
    .width('100%')
  }
}