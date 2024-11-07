import { dailyRecommend, recommendList, swiperList } from '../constants/MusicConstants';
import { RecommendDailyType, RecommendListType } from '../models';

/**
 * tab推荐页面布局
 */
@Component
export struct RecommondPage {
  //搜索组件
  @Builder
  SearchInputComponent() {
    Row() {
      Row({ space: 4 }) {
        Image($r('app.media.ic_search'))
          .width(20)
          .aspectRatio(1)//图像的宽度和高度相等
          .fillColor('#7a828e')
        Text('只因你太美🔥')
          .fontColor('#7a828e')
          .layoutWeight(1)
        Image($r('app.media.ic_code'))
          .width(20)
          .aspectRatio(1)
          .fillColor('#7a828e')
      }
      .width('100%')
      .padding(12)
      .borderRadius(60)
      .backgroundColor('#FFEEEE')
    }
    .width('100%')
    .padding(12)
  }

  //轮播图
  @Builder
  SwipperComponent() {
    Row() {
      Swiper() {
        ForEach(swiperList, (item: string) => {
          Row() {
            Image(item)
              .width('100%')
          }
          .borderRadius(8)
          .clip(true)
        })
      }
      .margin(8)
      .autoPlay(true)
    }
    .width('100%')
    .padding(12)
  }

  //标题栏
  @Builder
  TitleBar(title: string) {
    Row() {
      Text(title)
        .fontWeight(FontWeight.Bold)
        .fontColor(Color.Gray)
      Text('更多')
        .fontColor(Color.Gray)
    }
    .width('100%')
    .padding(8)
    .justifyContent(FlexAlign.SpaceBetween)
  }

  //每日推荐
  @Builder
  DailyRecomment() {
    Column() {
      this.TitleBar('每日推荐')
      Row() {
        Scroll() {//滚动组件
          Row({ space: 10 }) {
            ForEach(dailyRecommend, (item: RecommendDailyType) => {
              Column() {
                Text(item.type)
                  .width('100%')
                  .textAlign(TextAlign.Start)
                  .fontColor(Color.White)
                  .fontWeight(FontWeight.Bold)
                  .fontSize(12)
                  .padding(8)
                  .backgroundColor(item.top)

                Stack({ alignContent: Alignment.Top }) {//图片位于顶部
                  Image(item.img)
                    .width('100%')
                    .aspectRatio(1)
                }

                Text(item.title)
                  .width('100%')
                  .fontSize(12)
                  .padding(12)
                  .fontColor('#FFe9DFDF')
                  .backgroundColor(item.bottom)
              }
              .width('40%')
              .borderRadius(8)
              .clip(true)
            })
          }
          .padding({
            left: 8,
            right: 8
          })
        }
        .width('100%')
        .scrollable(ScrollDirection.Horizontal)//水平滚动
      }
    }
  }

  //推荐歌单
  @Builder
  RecommentListComponent() {
    Column() {
      this.TitleBar('推荐歌单')
      Row() {
        Scroll() {
          Row({ space: 8 }) {
            ForEach(recommendList, (item: RecommendListType) => {
              Column() {
                Row() {
                  Image(item.img)
                    .width('100%')
                    .borderRadius(8)

                  Text(item.count)
                    .fontColor(Color.White)
                    .fontSize(12)
                    .fontWeight(FontWeight.Bold)
                    .position({ x: 6, y: 6 })
                }

                Text(item.title)
                  .textAlign(TextAlign.Start)
                  .fontSize(12)
                  .fontColor('#FFE9DFDF')
                  .maxLines(2)
                  .textOverflow({
                    overflow: TextOverflow.Ellipsis
                  })
                  .margin({ top: 8 })
              }
              .justifyContent(FlexAlign.SpaceBetween)
              .width('30%')
            })
          }
        }
        .width('100%')
        .scrollable(ScrollDirection.Horizontal)
      }
      .padding({
        left: 8,
        right: 8
      })
    }
  }

  build() {
    Column() {
      this.SearchInputComponent();//搜索框组件
      this.SwipperComponent()//轮播组件
      this.DailyRecomment()//每日推荐组件
      this.RecommentListComponent()//推荐列表组件
    }
    .height('100%')
    .width('100%')
  }
}
