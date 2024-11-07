import { tabsData } from '../constant/MusicConstants';
import { TabClass } from '../model';
import { AxiosDemoPage } from './AxiosDemoPage';
import { Index } from './Index';

@Entry
@Component
struct MusicDemoPage {
  @State message: string = 'Hello World';
  @State currentName: string = 'recommend'

  @Builder
  getTabBar(item: TabClass) {
    Column() {
      Row() {
        Image(item.icon)
          .fillColor(item.name === this.currentName ? Color.White : $r('app.color.primary_dark'))
          .width(item.name === this.currentName ? 18 : 22)
          .aspectRatio(1)
      }
      .width(22)
      .aspectRatio(1)
      .borderRadius(22)
      .backgroundColor(item.name === this.currentName ? $r('app.color.primary_light') : Color.Transparent)
      .justifyContent(FlexAlign.Center)

      Text(item.title)
        .fontSize(12)
        .fontWeight(400)
        .margin({ top: 5 })
        .fontColor(item.name === this.currentName ? $r('app.color.primary_light') : $r('app.color.primary_dark'))
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        ForEach(tabsData, (item: TabClass, index: number) => {
          TabContent() {
            if (this.currentName == 'recommend') {
              Index()
            } else if (this.currentName == 'find') {
              AxiosDemoPage()
            } else if (this.currentName == 'home') {

            } else if (this.currentName == 'moment') {

            } else {

            }
          }.tabBar(this.getTabBar(item))
        })
      }
      .onChange((index) => {
        console.log('ken', '改变了索引')
        this.currentName = tabsData[index].name
      })
    }
    .height('100%')
    .width('100%')
  }
}