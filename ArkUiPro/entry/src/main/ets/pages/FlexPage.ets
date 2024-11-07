@Entry
@Component
struct FlexPage {
  @State message: string = 'Hello World';

  build() {
    //相当于Row布局
    //相当于Column布局
    //可以代替Row,column,还是会优先选择row,column
    Flex({
      direction: FlexDirection.Column,
      justifyContent: FlexAlign.SpaceEvenly,
      alignItems: ItemAlign.Start
    }) {
      Text('1').width(50).height(60).backgroundColor(Color.Yellow)
      Text('2').width(50).height(60).backgroundColor(Color.Grey)
      Text('3').width(50).height(60).backgroundColor(Color.Pink)
    }
    .height('100%')
    .width('100%')
  }
}