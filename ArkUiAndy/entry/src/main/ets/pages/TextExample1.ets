@Entry
@Component
struct TextExample1 {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        // Text('左对齐')
        //   .width(200)
        //   .textAlign(TextAlign.Start)
        //   .border({width:6})
        // Text('中间对齐')
        //   .width(200)
        //   .textAlign(TextAlign.Center)
        //   .border({width:2})
        // Text('右对齐')
        //   .width(200)
        //   .textAlign(TextAlign.End)
        //   .border({width:1})

        // textOverflow和maxLines
        // Text('我是超长文本，超出的部分显示省略号。I am an extra long text, with ellipses displayed for any excess。')
        //   .width(250)
        //   .textOverflow({overflow:TextOverflow.Ellipsis})
        //   .maxLines(1)
        //   .fontSize(12)
        //   .border({width:1})

        // Text('This is the text')
        //   .decoration({type:TextDecorationType.Overline, color:Color.Red})
        //   .borderWidth(1).padding(10).margin(5)
        // Text('This is the text')
        //   .decoration({type:TextDecorationType.LineThrough, color:Color.Red})
        //   .borderWidth(1).padding(10).margin(5)
        // Text('This is the text')
        //   .decoration({type:TextDecorationType.Underline, color:Color.Red})
        //   .borderWidth(1).padding(10).margin(5)

        //testCase
        Text('This is the text content with textCase set to Normal.')
          .textCase(TextCase.Normal)
          .border({ width: 1 }).padding(10).margin(5)
        // 文本全小写展示
        Text('This is the text content with textCase set to LowerCase.')
          .textCase(TextCase.LowerCase)
          .border({ width: 1 }).padding(10).margin(5)
        // 文本全大写展示
        Text('This is the text content with textCase set to UpperCase.')
          .textCase(TextCase.UpperCase)
          .border({ width: 1 }).padding(10).margin(5)
      }
      .width('100%')
    }
    .backgroundColor('0xF1F3F5')
    .height('100%')
  }
}