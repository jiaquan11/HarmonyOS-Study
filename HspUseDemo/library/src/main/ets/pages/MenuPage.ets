import { router } from '@kit.ArkUI';

@Entry
@Component
struct MenuPage {
  @State message: string = 'Menu Page';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
          //页面路由返回：返回HSP的页面
          router.back({
            url: '@bundle:com.example.hspusedemo/library/ets/pages/BackPage'
            // url:'pages/BackPage' //这样是错误的
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}