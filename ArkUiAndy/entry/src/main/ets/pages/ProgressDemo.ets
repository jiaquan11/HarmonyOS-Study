@Entry
@Component
struct ProgressDemo {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        // Progress({value:50, total:100, type:ProgressType.ScaleRing})
        //   .width(300)
        //   .height(300)
        //   .color(Color.Blue)
        //   .style({strokeWidth:20, scaleCount:20, scaleWidth:10})

        LoadingProgress()
          .color(Color.Red)
      }
      .width('100%')
    }
    .height('100%')
  }
}