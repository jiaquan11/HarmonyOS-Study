@Entry
@Component
struct TabsDemo2 {
  //标签页布局
  @State message: string = 'Hello World';
  @State currentIndex:number = 0
  private tabsController:TabsController = new TabsController()

  @Builder TabBuilder(title:string, targetIndex:number) {
    Column() {
      Text(title)
        .fontColor(this.currentIndex == targetIndex? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(()=>{
      this.currentIndex = targetIndex
      this.tabsController.changeIndex(this.currentIndex)
    })
  }

  build() {
    Row() {
      Column() {
        Tabs({barPosition:BarPosition.End, controller:this.tabsController}) {
          TabContent() {
            Text('首页的内容').fontSize(30)
          }
          .tabBar(this.TabBuilder('首页',0))
          TabContent() {
            Text('推荐的内容')
              .fontSize(30)
          }
          .tabBar(this.TabBuilder('推荐',1))
          TabContent() {
            Text('发现的内容')
              .fontSize(30)
          }
          .tabBar(this.TabBuilder('发现',2))
          this.TabBuilder('发现',2)
          TabContent() {
            Text('我的内容')
              .fontSize(30)
          }
          .tabBar(this.TabBuilder('我的内容',3))
        }
        .onChange((index) => {
          this.currentIndex = index
        })
      }
    }
    .height('100%')
  }
}