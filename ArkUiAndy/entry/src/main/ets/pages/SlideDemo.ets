@Entry
@Component
struct SlideDemo {
  @State message: string = 'Hello World';
  @State value :number = 40
  build() {
    Row() {
      Column() {
        Slider({
          min:0,
          max:100,
          value:40,
          step:10,
          style:SliderStyle.OutSet,
          direction:Axis.Horizontal,
          reverse:false
        })
          .width('90%')
          .blockColor(Color.Blue)
          .trackColor(Color.Red)
          .selectedColor(Color.Green)
          .showSteps(true)
          .showTips(true)
          .trackThickness(10)
          .onChange((value, Mode) => {
            this.value = value
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}