@Entry
@Component
struct SwipperPage {
  @State message: string = '轮播组件';
  //轮播控制对象
  swiperCtl: SwiperController = new SwiperController()

  build() {
    Column() {
      Text(this.message)
        .id('SwipperPageHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Swiper() {
        //子组件
        Text('今天人少').backgroundColor(Color.Yellow)
        Text('今天人少').backgroundColor(Color.Green)
        Text('今天人少').backgroundColor(Color.Pink)
      }
      .width('90%')
      .height(300)

      Divider()

      Swiper(this.swiperCtl) {
        //子组件
        Image($r('app.media.banner1'))
        Image($r('app.media.banner2'))
        Image($r('app.media.banner3'))
        Image($r('app.media.banner4'))
        Image($r('app.media.banner5'))
      }
      .width('90%')
      .height(200)
      .loop(true)
      .autoPlay(true)
      .interval(2000)
      .indicator(true)
      .indicatorStyle({
        size: 30,
        left: 0,
        color: Color.Red
      })

      Row() {
        Button('上一页').onClick(() => {
          this.swiperCtl.showPrevious()
        })
        Button('下一页').onClick(() => {
          this.swiperCtl.showNext()
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}