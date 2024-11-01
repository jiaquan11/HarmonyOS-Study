/**
 * 自定义组件
 */
@Component
struct HelloComponent {
  @State message: string = 'Hello, World';
  build() {
    //HelloComponent自定义组件组合系统组件Row和Text
    Row() {
      Text(this.message)
        .onClick(()=> {
        this.message = 'Hello, ArkUI';
      })
    }
  }
}

@Entry
@Component
struct Test1 {
  @State message: string = 'Hello World';
  build() {
    Column() {
      Text('ArkUI Message')
      HelloComponent({message: 'Hello, World'});//调用自定义的组件
      Divider()
      HelloComponent({message:'您好'})
    }
  }
}