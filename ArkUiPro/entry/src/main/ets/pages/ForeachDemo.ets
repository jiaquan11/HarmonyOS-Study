//定义一个类，这个类代表的就是数据源数据
import { Header } from '../components/HeaderComponent'

class Item {
  name: string //商品名称
  image: ResourceStr //图片地址
  price: number //商品价格
  discount: number //商品折扣
  //构造函数，用来实例化商品对象,商品打折默认0
  constructor(name: string, image: ResourceStr, price: number, discount: number = 0) {
    this.name = name
    this.image = image
    this.price = price
    this.discount = discount;
  }
}

//自定义构建函数:全局的,需要在前面添加function
@Builder function MyBuilderFunction(item: Item) {
  Row({ space: 10 }) { //商品部分1
    Image(item.image)
      .width('35%') //商品图片
    Column() {
      if (item.discount) { //商品有折扣，4个text组件
        Text(item.name)
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text('原价￥ ' + item.price)
          .fontSize(18)
          .fontColor('#F36')
          .decoration({ type: TextDecorationType.LineThrough })
        Text('折后价￥ ' + (item.price - item.discount))
          .priceStyle(18, '#F36')
        Text('补贴￥ ' + item.discount)
          .priceStyle(30, '#36D')
      } else { //商品不打折，2个text组件
        Text(item.name)
          .priceStyle(18, '#F36')
        Text('￥ ' + item.price)
          .priceStyle(18, '#F36')
      }
    }
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
  .width('100%')
  .backgroundColor('#FFF')
  .borderRadius(20)
  .height(120)
}

/**
 * 全局的样式函数,@Stytles支持的是通用的属性和组件
 */
@Styles function myStylesFunction() {
  .width('100%')
  .height('100%')
  .backgroundColor('#EFEFEF')
  .padding(20)
}

/**
 *和@Styles不同，@Extend仅支持定义在全局，不支持在组件内部定义
 * @Extend仅支持全局，用于扩展的是原生组件样式(也就是说是单一组件，需指定，比如Text)
 * 可以通过参数传递
 */
@Extend(Text) function priceStyle(size: number, color: string) {
  .fontSize(size)
  .fontWeight(FontWeight.Bold)
  .fontColor(color)
}

@Entry
@Component
struct ForeachDemo {
  @State message: string = 'Hello World';
  private items: Array<Item> = [
    new Item('华为mateX3', $r('app.media.matex3'), 13888, 1000),
    new Item('华为mate60Pro', $r('app.media.mate60pro2'), 6888),
    new Item('小米14', $r('app.media.xiaomi14'), 4999),
    new Item('苹果15promax', $r('app.media.iphone15'), 12888),
    new Item('荣耀magic6', $r('app.media.magic'), 4299),
    new Item('荣耀magic6', $r('app.media.magic'), 4299),
    new Item('荣耀magic6', $r('app.media.magic'), 4299),
    new Item('荣耀magic6', $r('app.media.magic'), 4299),
    new Item('荣耀magic6', $r('app.media.magic'), 4299),
  ]

  build() {
    Column() {
      Header({ title: '出货列表' })//自定义组件
        .margin({ bottom: 30 })

      List({ space: 10 }) {
        //循环渲染，通过数据源去渲染组件，子组件必须可以被包含在父组件中
        ForEach(
          this.items, //数据源
          (item: Item) => {
            ListItem() { //list组件中必须要有子组件，ListItem中只有一个根组件
              this.MyBuilderFunction1(item); //自定义的局部构建函数
              // MyBuilderFunction(item);//自定义的全局构建函数
            }
          }
        )
      }
      .listDirection(Axis.Vertical) //默认的排列方式 垂直方向  Axis.Vertical：水平方向
      .layoutWeight(1)
      .width('100%')
      .divider({
        strokeWidth: 2,
        color: '#36D',
        startMargin: 10,
        endMargin: 10
      }) //列表分隔线
    }.myStylesFunction()
  }

  //局部的自定义构建函数,必须在component的struct组件里面,不需要加function
  @Builder MyBuilderFunction1(item: Item) {
    Row({ space: 10 }) { //商品部分1
      Image(item.image)
        .width('35%') //商品图片
      Column() {
        if (item.discount) { //判断,如果非0 就是true 如果商品有打折,4个text组件
          Text(item.name)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
          Text('原价¥  ' + item.price)
            .fontSize(18)
            .fontColor('#F36')
            .decoration({ type: TextDecorationType.LineThrough })
          Text('折后价¥ ' + (item.price - item.discount))
            .priceStyle(18, '#F36')
          Text('补贴¥ ' + item.discount)
            .priceStyle(30, '#36D')
        } else { //商品不打折,2个text组件
          Text(item.name)
            .priceStyle(18, '#F36')
          Text('¥ ' + item.price)
            .priceStyle(18, '#F36')
        }
      }.height('100%')
      .alignItems(HorizontalAlign.Center)
    }.width('100%')
    .backgroundColor('#FFF')
    .borderRadius(20)
    .height(120)
  }

  //局部的样式函数，同样不需要加function,但是使用的时候需要加this
  @Styles myStylesFunction1() {
    .width('100%')
    .height('100%')
    .backgroundColor('#EFEFEF')
    .padding(20)
  }
}