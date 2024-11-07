import axios, { AxiosResponse } from '@ohos/axios';
import { Song } from '../model/MusicData';
import { JSON } from '@kit.ArkTS';

@Entry
@Component
export struct AxiosDemoPage {
  @State message: string = 'Hello World';
  url: string =
    'https://www.yyq.cn/api/getPlayData?playid=4926%2C4925%2C4924%2C4923%2C4922%2C4921%2C4920%2C4919%2C4918%2C4917%2C4916%2C4915&typeid=3'
  @State songs: Song[] = []

  //支持async/await用法
  async getUser() {
    try {
      const response: AxiosResponse = await axios.get<string, AxiosResponse<Song>, null>(this.url)
      this.songs = response.data
      console.log('ken', JSON.stringify(this.songs))
    } catch (error) {
      console.error(JSON.stringify(error))
    }
  }

  //@Builder：用于重用构建
  @Builder
  delBuilder(index: number) {
    Row() {
      Button('删除')
        .onClick(() => {
          console.log('ken', 'del')
          this.songs.splice(index, 1)
        })
    }
  }

  //局部的重用组件
  @Builder
  musicList(item: Song) {
    Row() {
      Image(item.img).width(40).aspectRatio(1)
      Text(item.name)
    }
  }

  build() {
    Column() {
      Button('获取网络数据')
        .onClick(() => {
          try {
            this.getUser()
            AlertDialog.show({ message: '' })
          } catch (err) {
            AlertDialog.show({ message: JSON.stringify(err) })
          }
        })

      List() {
        ForEach(this.songs, (item: Song, index: number) => {
          ListItem() {
            Row() {
              //可以写成一个单独UI组件,进行重用 比较重量级，不赞成使用
              //歌曲图形
              // Image(item.img).width(40).aspectRatio(1)
              // Text(item.name)
              // MusicList(item)
              this.musicList(item) //局部构建，轻量级
            }
            .width('100%')
            .height(40)
          }
          .padding(10)
          .swipeAction({
            end: this.delBuilder(index)
          })
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}