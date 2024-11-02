@Entry
@Component
struct CheckboxDemo {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Row() {
        Text('爱好:')
        Checkbox({name:'checkbox1', group:'group'})
          .select(false)
          .selectedColor(Color.Green)
          .onChange((value:boolean)=>{
            if (value) {
              this.message += '踢球'
            } else {
              this.message = this.message.replace('踢球', '')
            }
          })
        Text('踢球')
        Checkbox({name:'checkbox2', group:'group'})
          .select(true)
          .selectedColor(Color.Red)
          .onChange((value:boolean) => {
            if (value) {
              this.message += '读书'
            } else {
              this.message = this.message.replace('读书', '')
            }
          })
        Text('读书')
        Text('爱好是:' + this.message)
          .margin(20)
      }
      .width('100%')
    }
    .height('100%')
  }
}