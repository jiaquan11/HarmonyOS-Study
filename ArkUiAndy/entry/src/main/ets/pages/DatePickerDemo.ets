@Entry
@Component
struct DatePickerDemo {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {
        //日期选择器
        DatePicker({
          start:new Date('1970-1-1'),
          end:new Date('2100-1-1'),
          selected:new Date('2024-01-01')
        })
          .lunar(false)//是否农历
          .onChange((value:DatePickerResult)=>{
            if (value.month) {
              console.info('选择的日期是: ' + value.year + '年' + (value.month+1) + '月' + value.day + '日')
            }
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}