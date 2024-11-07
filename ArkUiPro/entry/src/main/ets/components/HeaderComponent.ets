/**
 * 这是一个独立的自定义的组件
 * 每个页面都必须有一个且只有一个@Entry
 * 至于第一个page的加载则由脚本或者EntryAbility.ets中控制
 */
@Entry
@Component
export struct Header { //自定义组件,可复用ui单元
  private title: ResourceStr = ''

  build() {
    Row({ space: 10 }) { //title部分
      Image($r('app.media.ic_public_back'))
        .width(30)
        .interpolation(ImageInterpolation.High)
      Text(this.title)
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Blank() //空白组件，用于填充
      Image($r('app.media.ic_public_refresh'))
        .width(30)
        .interpolation(ImageInterpolation.High)
    }
    .width('100%')
    .height(30)
    .margin({ top: 20, bottom: 20 })
  }
}