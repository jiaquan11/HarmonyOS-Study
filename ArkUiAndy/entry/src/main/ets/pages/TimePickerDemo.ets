@Entry
@Component
struct TimePickerDemo {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        //时间选择器
        TimePicker({
          selected: new Date()
        })
          .useMilitaryTime(true)//是否为24小时制
          .onChange((value:TimePickerResult)=>{
            console.info('选择的时间为: ' + value.hour + '时' + value.minute + '分')
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}