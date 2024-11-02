@Entry
@Component
struct ButtonDemo {
  @State message: string = 'Hello World';

  build() {
   Row() {
     Column() {
       Button('登录')
         .type(ButtonType.Capsule)
         .width(150)
         .margin(30)
       Button('登录')
         .type(ButtonType.Circle)
         .stateEffect(true)
         .width(150)
         .margin(30)
       Button('登录')
         .type(ButtonType.Normal)
         .width(150)
         .margin(30)
       Button() {
         Image($r('app.media.delete'))
           .width(40)
           .height(50)
       }
     }
   }
    .height('100%')
    .width('100%')
  }
}