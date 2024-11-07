@Entry
@Component
struct PropDemoPage {
  @State username: string = 'admin';

  build() {
    Column() {
      LoginCom({username:this.username})
      Button('父组件修改')
        .onClick(()=>{
          try {
            this.username = '小牛'
          } catch (err) {
            AlertDialog.show({message:JSON.stringify(err)})
          }
        })

      Button('父获取值')
        .onClick(()=>{
          try {
            AlertDialog.show({message:this.username})
          } catch (err) {
            AlertDialog.show({message:JSON.stringify(err)})
          }
        })
    }
    .height('100%')
    .width('100%')
  }
}

//子组件
@Component
struct LoginCom {
  // @State username:string = ''
  @Prop username:string = ''
  build() {
    Column() {
      Text(this.username)
        .width('80%')
        .margin(10)
        .backgroundColor(Color.Pink)
        .borderRadius(10)
        .height(50)

      TextInput({text:this.username})
    }
  }
}