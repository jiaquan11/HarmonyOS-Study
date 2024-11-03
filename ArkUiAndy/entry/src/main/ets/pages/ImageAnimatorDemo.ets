@Entry
@Component
struct ImageAnimatorDemo {
  @State state:AnimationStatus = AnimationStatus.Initial
  @State reverse:boolean = false
  @State iterations:number = 1
  //帧动画组件
  build() {
    Column({space:8}) {
      ImageAnimator()
        .images([
          {
            src:$r('app.media.imageAnimator01'),
            duration:100,
            width:300,
            height:300,
            top:0,
            left:0
          },
          {
            src:$r('app.media.imageAnimator02'),
            duration:100,
            width:300,
            height:300,
            top:0,
            left:0
          },
          {
            src:$r('app.media.imageAnimator03'),
            duration:100,
            width:300,
            height:300,
            top:0,
            left:0
          },
          {
            src:$r('app.media.imageAnimator04'),
            duration:100,
            width:300,
            height:300,
            top:0,
            left:0
          },
          {
            src:$r('app.media.imageAnimator05'),
            duration:100,
            width:300,
            height:300,
            top:0,
            left:0
          },
          {
            src:$r('app.media.imageAnimator06'),
            duration:100,
            width:300,
            height:300,
            top:0,
            left:0
          },
          {
            src:$r('app.media.imageAnimator07'),
            duration:100,
            width:300,
            height:300,
            top:0,
            left:0
          },
        ])
        .state(this.state)//用于控制播放状态
        .reverse(this.reverse)//设置播放顺序
        .fillMode(FillMode.None)//设置动画开始和结束后的状态
        .iterations(this.iterations)//默认播放一次，设置为-1表示无限次播放
        .width(300)
        .height(300)
        .margin({top:100})

        .onStart(()=>{//状态回调，动画开始播放时触发
          console.info('动画开始播放')
        })
        .onPause(()=> {//状态回调，动画暂停播放时触发
          console.info('动画暂停播放')
        })
        .onRepeat(()=> {//状态回调，动画重新播放时触发
          console.info('动画重新播放')
        })
        .onCancel(()=> {//状态回调，动画取消播放时触发
          console.info('动画取消播放')
        })
        .onFinish(()=> {//状态回调，动画播放完成时触发
          console.info('动画播放完成')
        })

      Row() {
        Button('开始')
          .width(100)
          .padding(5)
          .onClick(()=>{
            this.state = AnimationStatus.Running
          })
        Button('暂停')
          .width(100)
          .padding(5)
          .onClick(()=>{
            this.state = AnimationStatus.Paused
          })
        Button('停止')
          .width(100)
          .padding(5)
          .onClick(()=>{
            this.state = AnimationStatus.Stopped
          })
      }
      Row() {
        Button('反向播放')
          .width(100)
          .padding(5)
          .onClick(()=>{
            this.reverse = !this.reverse
          })
        Button('播放一次')
          .width(100)
          .padding(5)
          .onClick(()=>{
            this.iterations = 1
          })
        Button('无限循环')
          .width(100)
          .padding(5)
          .onClick(()=>{
            this.iterations = -1
          })
      }
    }
  }
}