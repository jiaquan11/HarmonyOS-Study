import router from '@ohos.router';
import { BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct BackPage {
  @State message: string = 'HSP back page';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontFamily('HarmonyHeiTi')
          .fontWeight(FontWeight.Bold)
          .fontSize(32)
          .fontColor($r('app.color.text_color'))
          .margin({ top: '32px' })
          .width('624px')

        Button($r('app.string.back_to_HAP'))
          .id('backToHAP')
          .fontFamily('HarmonyHeiTi')
          .height(48)
          .width('624px')
          .margin({ top: 550 })
          .type(ButtonType.Capsule)
          .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
          .backgroundColor($r('app.color.button_background'))
          .fontColor($r('sys.color.ohos_id_color_foreground_contrary'))
          .fontSize($r('sys.float.ohos_id_text_size_button1'))
            // 绑定点击事件
          .onClick(() => {
            //页面返回router.back方法,但是返回的页面必须是当前页面跳转路径上的页面
            //如果从HSP页面返回HAP页面，url的内容为
            router.back({ //  返回HAP的页面
              url:'pages/Index' // 路径为：`entry/src/main/ets/pages/Index.ets`
            })
          })

        Button($r('app.string.back_to_HSP'))
          .id('backToHSP')
          .fontFamily('HarmonyHeiTi')
          .height(48)
          .width('624px')
          .margin({ top: '4%' , bottom: '6%' })
          .type(ButtonType.Capsule)
          .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
          .backgroundColor($r('app.color.button_background'))
          .fontColor($r('sys.color.ohos_id_color_foreground_contrary'))
          .fontSize($r('sys.float.ohos_id_text_size_button1'))
            // 绑定点击事件
          .onClick(() => {
            //页面路由：跳转到HSP模块的下一个页面
            //注意路由格式
            router.pushUrl({
              url: '@bundle:com.example.hspusedemo/library/ets/pages/MenuPage'
            }).then(() => {
              console.log('push page success');
            }).catch((err: BusinessError) => {
              console.error('pushUrl failed, code is' + err.code + ', message is' + err.message);
            })
          })
      }
      .width('100%')
    }
    .backgroundColor($r('app.color.page_background'))
    .height('100%')
  }
}