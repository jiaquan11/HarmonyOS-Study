@Entry
@Component
struct RadioDemo {
  @State message: string = '女';
  build() {
    Row() {
      Row() {
        Text('性别：')
        Radio({value:'radio1', group:'group'})
          .checked(false)
          .onChange((isChecked:boolean) => {
            if (isChecked) {
              this.message = '男'
            } else {
              this.message = '女'
            }
          })
        Text('男')
        Radio({value:'radio2', group:'group'})
          .checked(true)
        Text('女')

        Text('当前性别是：' + this.message)
          .margin(20)
      }
      .width('100%')
    }
    .height('100%')
  }
}