import { router } from '@kit.ArkUI';

// 定义 RouterError 接口
interface RouterError {
  code: string; // 假设错误代码是字符串类型
  message: string;
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        //添加按钮 以响应用户点击
        Button() {
          Text('Next')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)//设定按钮类型为胶囊型
        .margin({//设置按钮顶部的外边距为20单位
          top:20
        })
        .backgroundColor('#0D9FFB')
        .width('40%')
        .height('5%')

        //跳转按钮绑定onClick事件，点击时跳转到第二页
        .onClick(() => {
          console.info(`Succeeded in clicking the 'Next' button.`)
          //跳转到第二页
          router.pushUrl({url:'pages/Second'}).then(() => {
            console.info(`Succeeded in jumping to the second page.`)
          }).catch((err : RouterError) => {
            console.error(`Failed to jump to the second page.Code is ${err.code}, message is ${err.message}`)
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}