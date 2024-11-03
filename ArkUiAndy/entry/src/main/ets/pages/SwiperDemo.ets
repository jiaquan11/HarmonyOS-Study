import sendableColorSpaceManager from '@ohos.graphics.sendableColorSpaceManager';

@Entry
@Component
struct SwiperDemo {
  @State message: string = 'Hello World';
  private  swiperController:SwiperController = new SwiperController();
  //Swiper轮播布局
  build() {
    // Row() {
    //   Swiper() {
    //     Text('0')
    //       .width('90%')
    //       .height('100%')
    //       .fontSize(30)
    //       .backgroundColor(Color.Gray)
    //       .textAlign(TextAlign.Center)
    //     Text('1')
    //       .width('90%')
    //       .height('100%')
    //       .fontSize(30)
    //       .backgroundColor(Color.Green)
    //       .textAlign(TextAlign.Center)
    //     Text('2')
    //       .width('90%')
    //       .height('100%')
    //       .fontSize(30)
    //       .backgroundColor(Color.Blue)
    //       .textAlign(TextAlign.Center)
    //   }
    //   .height('35%')
    //   .loop(true)
    //   .autoPlay(true)
    //   .interval(1000)
    //   .vertical(true)
    //   .displayCount(2)
    // }
    Column({space:5}) {
      Swiper(this.swiperController) {
        Text('0')
          .width('90%')
          .height('100%')
          .fontSize(30)
          .backgroundColor(Color.Gray)
          .textAlign(TextAlign.Center)
        Text('1')
          .width('90%')
          .height('100%')
          .fontSize(30)
          .backgroundColor(Color.Green)
          .textAlign(TextAlign.Center)
        Text('2')
          .width('90%')
          .height('100%')
          .fontSize(30)
          .backgroundColor(Color.Blue)
          .textAlign(TextAlign.Center)
      }
      .height('35%')
      .loop(true)

      Row({space:12}) {
        Button('showNext')
          .onClick(()=>{
            //通过controller切换到后一页
            this.swiperController.showNext();
          })
        Button('showPrevious')
          .onClick(()=>{
            //通过controller切换到前一页
            this.swiperController.showPrevious();
          })
      }
    }
    .height('100%')
    .width('100%')
  }
}