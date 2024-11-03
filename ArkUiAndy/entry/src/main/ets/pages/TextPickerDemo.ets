@Entry
@Component
struct TextPickerDemo {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        //文本选择器
        TextPicker({range:['苹果1', '橘子2', '桃子3', '葡萄4'], selected:1})
          .defaultPickerItemHeight(80)
          .onChange((value: string|string[],index:number|number[]) => {
            console.info('选中的文本是: ' + value + ', 选中的索引值为' + index)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}