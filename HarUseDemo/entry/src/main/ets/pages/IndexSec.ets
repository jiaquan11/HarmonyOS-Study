import {MainPage} from 'library'

@Entry
@Component
struct IndexSec {
  build() {
    Row() {
      //引用HAR的ArkUI组件
      MainPage()
    }
    .height('100%')
  }
}