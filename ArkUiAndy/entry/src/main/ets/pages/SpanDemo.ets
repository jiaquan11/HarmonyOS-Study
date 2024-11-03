@Entry
@Component
struct SpanDemo {
  @State message: string = 'Hello World';
  //文本段落组件
  build() {
    Row() {
      Column() {
        Text('我是Text') {
          Span('我是Span')
            .letterSpacing(5)
        }
        .padding(10)
        .borderWidth(1)

        Text() {
          Span('我是Span1')
            .fontSize(16)
            .fontColor(Color.Gray)
            .decoration({type:TextDecorationType.LineThrough,color:Color.Red})
          Span('我是Span2')
            .fontSize(16)
            .fontColor(Color.Blue)
            .fontStyle(FontStyle.Italic)
            .decoration({type:TextDecorationType.Underline,color:Color.Black})
          Span('我是Span3')
            .fontSize(20)
            .fontColor(Color.Gray)
            .decoration({type:TextDecorationType.Overline,color:Color.Green})
        }
        .padding(10)
        .borderWidth(1)

        Text() {
          Span('I am Upper-span')
            .fontSize(12)
            .textCase(TextCase.UpperCase)
            .onClick(()=>{
              console.info('我是Span-onClick')
            })
        }
        .padding(10)
        .borderWidth(1)
      }
      .width('100%')
    }
    .height('100%')
  }
}