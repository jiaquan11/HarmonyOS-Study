@Entry
@Component
struct TextAreaDemo {
  @State text: string = 'Hello World';
  controller:TextAreaController = new TextAreaController()

  build() {
    Row() {
      Column() {
        // TextArea()
        // TextArea({placeholder:'我是提示文本'})
        // TextArea({text:'我是当前文本内容'})
        // TextArea({controller:this.controller})
        // TextArea({placeholder:'请输入文本',text:this.text, controller:this.controller})

        // TextArea()
        //   .fontColor(Color.Blue)
        //   .fontSize(20)
        //   .fontStyle(FontStyle.Italic)
        //   .fontWeight(FontWeight.Bold)
        //   .fontFamily('Arial')
        //   .width(300)
        //   .height(40)
        //   .backgroundColor(Color.Gray)

        // TextArea({controller:this.controller})
        // Button('设置光标位置')
        //   .onClick(()=>{
        //     this.controller.caretPosition(3)
        //   })

        TextArea({placeholder:'请输入账号'})
          .onChange((value:string)=>{
            this.text = value
          })
        Text(this.text)
      }
      .width('100%')
      .backgroundColor(0xE6F2FD)
    }
    .height('100%')
  }
}