import { router } from '@kit.ArkUI'

@Entry
@Component
struct WelcomPage {
  //总共5秒钟
  @State time: number = 5
  //定时器的引用
  timer: number = -1

  //生命周期函数,页面显示之前会先调用这个函数
  aboutToAppear(): void {
    //定时器的句柄
    this.timer = setInterval(() => {
      if (this.time <= 0) {
        //清除定时器
        clearInterval(this.timer)
        //跳转到新的页面
        router.replaceUrl({
          url: 'pages/LoginPage'
        })
      }
      this.time--
    }, 1000)
  }

  //生命周期函数,页面销毁的时候执行
  aboutToDisappear(): void {
    //清除定时器
    clearInterval(this.timer)
  }

  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Image($r('app.media.ad'))
      Button(`跳过${this.time}`)
        .backgroundColor('#ccc')
        .fontColor('#fff')
    }
    .height('100%')
    .width('100%')
  }
}