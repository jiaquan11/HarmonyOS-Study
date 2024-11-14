import { func, Log, nativeAdd } from 'library';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
        .fontFamily('HarmonyHeiTi')
        .fontWeight(FontWeight.Bold)
        .fontSize(32)
        .fontWeight(700)
        .fontColor($r('app.color.text_color'))
        .textAlign(TextAlign.Start)
        .margin({top:'32px'})
        .width('624px')

      //引用Har的ts类和方法
      Button($r('app.string.buttonts'))
        .id('button')
        .height(48)
        .width('624px')
        .margin({top:'4%'})
        .type(ButtonType.Capsule)
        .fontFamily('HarmonyHeiTi')
        .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
        .backgroundColor($r('app.color.button_background'))
        .fontColor($r('sys.color.ohos_id_color_foreground_contrary'))
        .fontSize($r('sys.float.ohos_id_text_size_button1'))
        .onClick(()=>{
          //引用HAR的类和方法
          Log.info('har msg')
          this.message = 'func return: ' + func()
        })

      //引用Har的native方法
      Button($r('app.string.buttonnative'))
        .id('nativeAdd')
        .height(48)
        .width('624px')
        .margin({ top: '4%', bottom: '6%' })
        .type(ButtonType.Capsule)
        .fontFamily('HarmonyHeiTi')
        .borderRadius($r('sys.float.ohos_id_corner_radius_button'))
        .backgroundColor($r('app.color.button_background'))
        .fontColor($r('sys.color.ohos_id_color_foreground_contrary'))
        .fontSize($r('sys.float.ohos_id_text_size_button1'))
        .onClick(()=>{
          //引用HAR的native方法
          this.message = 'result: ' + nativeAdd(1, 2)
        })
    }
    .width('100%')
    .backgroundColor($r('app.color.page_background'))
    .height('100%')
  }
}