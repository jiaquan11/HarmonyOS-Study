import { EmitEventType, tabsData } from '../constants/MusicConstants';
import { PlayStateModel, PlayStateType, TabClass } from '../models';
import { RecommondPage } from './recommondPage';
import SongListPage from './SongListPage2';
import { emitter } from '@kit.BasicServicesKit';
import PlayerNav from '../components/playerNav';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  //当前项
  @State currentName: string = 'recommend';
  // 订阅事件
  @State playState: PlayStateType = new PlayStateModel({} as PlayStateType)//实例化PlayStateModel类，调用默认的构造函数
  //页面显示出来前：接收其它页面的更新事件
  aboutToAppear() {
    //注册事件接收回调函数，接收新的播放状态
    emitter.on({ eventId: EmitEventType.UPDATE_STATE }, (data: emitter.EventData) => {
      if (data.data != null) {
        console.log('ken', '接收到数据：' + JSON.stringify(data.data))
        this.playState = new PlayStateModel(JSON.parse(data.data.playStateStr))
      }
    })
  }

  @Builder
  getTabBar(item: TabClass) {
    Column() {
      Row() {
        Image(item.icon)
          .fillColor(item.name === this.currentName ? Color.White : $r('app.color.primary_dark'))
          .width(18)
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
  }

  build() {
    Stack() {
      Stack({ alignContent: Alignment.Bottom }) {//层叠布局
        Tabs({ barPosition: BarPosition.End }) {
          ForEach(tabsData, (item: TabClass) => {
            TabContent() {
              if (item.name === 'recommend') {
                //推荐
                RecommondPage()
              } else if (item.name === 'find') {
                //发现
                SongListPage()
              } else if (item.name === 'home') {
                //漫游
              } else if (item.name === 'moment') {
                //动态
              } else if (item.name === 'mine') {
                //我的
              } else {
                SongListPage()
              }
            }
            .tabBar(this.getTabBar(item))
            .backgroundColor('#FFFFFF')
          })
        }
        .barHeight(60)
        .onChange(index => {
          this.currentName = tabsData[index].name
        })

        // 背景播放
        if (this.currentName !== 'mine') {//非 "我的" tab上可以层叠显示一个背景播放条
          PlayerNav({ playState: $playState })//将当前页面的playState变量传递到子组件
            .translate({ y: -60 })//垂直向上平移60个单位
            .onClick(() => {//点击这个背景播放条，会跳转到一个播放页
              AlertDialog.show({ message: '播放列表' })
              router.pushUrl({
                url: 'pages/Play'
              })
            })
        }
      }
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#FFFFFF')
  }
}