@Entry
@Component
struct TabsDemo {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Tabs({barPosition:BarPosition.End}) {
          TabContent() {
            Text('首页的内容').fontSize(30)
          }
          .tabBar('首页')
          TabContent() {
            Text('推荐的内容')
              .fontSize(30)
          }
          .tabBar('推荐')
          TabContent() {
            Text('发现的内容')
              .fontSize(30)
          }
          .tabBar('发现')
          TabContent() {
            Text('我的内容')
              .fontSize(30)
          }
          .tabBar('我的')
        }
      }
    }
    .height('100%')
  }
}