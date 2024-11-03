import { trustedAppService } from '@kit.DeviceSecurityKit'

@Entry
@Component
struct MarqueeDemo {
  @State start:boolean = false
  //跑马灯组件
  build() {
    Flex({ direction:FlexDirection.Column, alignItems:ItemAlign.Center,justifyContent:FlexAlign.Center}) {
      Marquee({
        start:this.start,
        step:50,
        loop:2,
        fromStart:true,
        src:'Running Marquee starts rolling'
      })
        .fontSize(48)
        .onStart(()=>{
          console.info('跑马灯开始滚动')
        })
        .onBounce(()=>{
          console.info('跑马灯完成一次滚动')
        })
        .onFinish(()=>{
          console.info('跑马灯滚动完成')
        })

      Button('开始')
        .onClick(()=>{
          this.start = true
        })
        .width(120)
        .height(40)
        .backgroundColor('#007DFF')
    }
  }
}
