@Entry
@Component
struct StepperDemo {
  @State message: string = 'Hello World';
  build() {
    //步骤导航器组件
    Stepper({
      index:0
    }){
      StepperItem() {
        Text('第一页')
          .fontSize(50)
      }
      .nextLabel('Next')
      .status(ItemState.Normal)
      StepperItem() {
        Text('第二页')
          .fontSize(50)
      }
      .prevLabel('Previous')
      .nextLabel('Next')
      .status(ItemState.Waiting)
      StepperItem() {
        Text('第三页')
          .fontSize(50)
      }
      .nextLabel('结束')
      .status(ItemState.Normal)
    }
    .onSkip(()=> {
      console.info('onSkip跳过')
    })
    .onFinish(()=>{
      console.info('onFinish结束')
    })
    .onChange((prevIndex:number, index:number) =>{
      console.info('onChange当前页为: ' + (index + 1))
    })
  }
}