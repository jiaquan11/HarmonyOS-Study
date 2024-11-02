import { Font } from '@ohos.arkui.UIContext';

@Entry
@Component
struct TextInputDemo {
  @State message: string = 'Hello World';
  @State text:string = ''
  controller: TextInputController = new TextInputController()

  build() {
    Row() {
      Column() {
        // TextInput()
        // TextInput({placeholder:'我是提示文本'})
        // TextInput({text:'我是当前文本内容'})
        // TextInput({controller:this.controller})
        // TextInput({placeholder:'请输入文本',text:this.text,controller:this.controller})

        // TextInput()
        //   .fontColor(Color.Blue)
        //   .fontSize(30)
        //   .fontStyle(FontStyle.Italic)
        //   .fontWeight(FontWeight.Bold)
        //   .fontFamily('Arial')
        //   .width(300)
        //   .height(60)
        //   .backgroundColor(Color.Grey)

        // TextInput({placeholder: '请输入账号'})
        //   .placeholderColor('#007DFF')
        //   .placeholderFont({size:30,weight:FontWeight.Bold,family:'cursive',style:FontStyle.Italic})

        // TextInput({placeholder:'请输入文本'})
        //   .type(InputType.PhoneNumber)

        // TextInput({controller:this.controller})
        // Button('设置光标位置')
        //   .onClick(()=>{
        //     this.controller.caretPosition(2)
        //   })

        TextInput({placeholder:'请输入账号:'})
          .onChange((value:string) =>{
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