@Component
export struct MainPage {
  @State message: string = 'HAR MainPage';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(32)
          .fontWeight(FontWeight.Bold)
      }
      .margin({ top: '32px' })
      .height(56)
      .width('624px')

      //弹性容器布局
      Flex({ justifyContent: FlexAlign.Center, alignItems: ItemAlign.Center, alignContent: FlexAlign.Center }) {
        Column() {
          Image($r('app.media.startIcon'))
            .width('33%')
          Text($r('app.string.page_show'))
            .fontSize(14)
            .fontColor($r('app.color.text_color'))
        }
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}