@Entry
@Component
struct SelectDemo {
  @State message: string = 'Hello World';
 //下拉框组件
  build() {
    Row() {
      Column() {
        Select([
          {value:'新建', icon:$r('app.media.startIcon')},
          {value:'打开', icon:$r('app.media.startIcon')},
          {value:'关闭', icon:$r('app.media.startIcon')},
          {value:'保存', icon:$r('app.media.startIcon')}
        ])
          .selected(3)
          .value('文件')
          .font({size:20,weight:500})
          .fontColor('#182431')
          .selectedOptionFont({size:22, weight:500})
          .optionFont({size:26, weight:600})
          .onSelect((index:number, value:string) =>{
            console.info('文件下拉菜单选择: ' + value)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}