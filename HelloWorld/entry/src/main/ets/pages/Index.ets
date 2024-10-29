@Entry
@Component
struct Index { //自定义组件，可复用的ui单元
  @State message: string = 'Hello World';
  build() { //ui描述，声明的方式描述ui结构
    RelativeContainer() {  //容器组件，相对容器组件，用来完成页面布局
      Text(this.message)//基础组件，自带样式和功能的页面元素
        .id('HelloWorld')//属性方法，另外还有事件方法，比如onClick()操作
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .alignRules({//对齐规则
          center: { anchor: '__container__', align: VerticalAlign.Center },//垂直居中
          middle: { anchor: '__container__', align: HorizontalAlign.Center }//水平居中
        })
    }
    .height('100%')
    .width('100%')
  }
}