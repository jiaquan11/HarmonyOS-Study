@Entry
@Component
struct ToggleDemo {
  @State message: string = 'Hello World';

  build() {
      Row() {
        Column() {
          Toggle({type:ToggleType.Checkbox, isOn:false})
            .selectedColor(Color.Red)
          Toggle({type:ToggleType.Switch, isOn:false})
            .selectedColor(Color.Pink)
            .switchPointColor(Color.Blue)
          Toggle({type:ToggleType.Button, isOn:false}) {
            Text('切换按钮')
          }
          .selectedColor(Color.Yellow)
          .onChange((isON:boolean)=>{
            if (isON) {
              this.message = '开'
            } else {
              this.message = '关'
            }
          })
          Text("当前状态:" + this.message)
        }
        .width('100%')
      }
      .height('100%')
    }
}