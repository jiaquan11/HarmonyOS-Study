import { DbHelper } from '../utils/DbHelper';

@Entry
@Component
struct TextPage {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Row() {
        Button('新增')
          .onClick(()=>{
            new DbHelper().update()
          })

        Button('查找')
          .onClick(()=>{
            new DbHelper().find()
          })

        Button('条件查找')
          .onClick(()=>{
            new DbHelper().findCond()
          })

        Button('删除')
          .onClick(()=>{
            new DbHelper().delete()
          })
      }
      .borderWidth(1)
      .borderColor(Color.Red)
    }
    .height('100%')
    .width('100%')
  }
}