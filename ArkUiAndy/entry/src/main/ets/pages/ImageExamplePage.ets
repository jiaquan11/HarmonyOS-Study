import sendableColorSpaceManager from '@ohos.graphics.sendableColorSpaceManager';
import image from '@ohos.multimedia.image';

@Entry
@Component
struct ImageExamplePage {
  @State message: string = 'Hello World';
  build() {
    Row() {
      Column() {
        // Image("images/maniu.png")
        //   .width(150)
        //   .height(150)
        // Image('https://www-file.huawei.com/-/media/corp/home/image/logo_400x200.png')
        //   .width(200)
        //   .height(200)
        // Image($r('app.media.icon'))
        //   .width(100)
        //   .height(100)
        //   .borderRadius(10)
        // Image($rawfile('ManiuCourse.png'))
        //   .width(350)
        //   .height(150)

        // //填充效果
        // Image($r("app.media.image1"))
        //   .objectFit(ImageFit.Contain)
        //   .backgroundColor(0xCCCCCC)
        //   .width(100)
        //   .height(100)
        //重复效果
        // Image($r("app.media.image2"))
        //   .width(110)
        //   .height(115)
        //   .border({width:1})
        //   .objectRepeat(ImageRepeat.X)
        //   .objectFit(ImageFit.ScaleDown)
        //插值效果
        Image($r("app.media.icon"))
          .interpolation(ImageInterpolation.High)
          .width(250)
          .height(250)
      }
      .width('100%')
    }
    .width('100%')
  }
}