/**
 * 父子组件传递更新的问题
 * 详细说明一下@State,@Prop,@Link,@Provide,@Consume的区别
 * @Prop单向传递
 * 在父组件中声明一个@State成员变量，在子组件中声明一个同名的@Prop成员变量,
 * 使用的时候，从父组件传递变量的值到子组件，父组件变量的值的变化更新，会立即自动同步给子组件更新
 * 注意：@Prop不支持引用对象的传递，只支持普通类型
 * @Link 双向传递
 * 在父组件中声明一个@State成员变量，在子组件中声明一个同名的@Link成员变量,
 * 使用的时候，从父组件传递变量的值到子组件，父组件变量的值的变化更新，会立即自动同步给子组件更新,
 * 同时子组件变量的值的变化更新，会立即自动同步给父组件更新
 * 注意：@Link支持引用对象的传递
 * @Provide,@Consume 双向  相当于广播的形式，性能消耗比较大，不建议使用
 * 在父组件中声明一个@Provide成员变量，在子组件中声明一个同名的@Consume成员变量,
 * 使用的时候，不需要进行传值，但是父组件变量的值的变化更新，会立即自动同步给子组件更新,
 * 同时子组件变量的值的变化更新，会立即自动同步给父组件更新。
 * 一定要同名才能响应更新
 *
 * @Observed和@ObjectLink类装饰器用于在涉及嵌套对象或数组的场景中进行双向数据同步
 * 用于复杂的属性
 * @Observed用于在父组件中监测某个嵌套对象或数组，@ObjectLink用于在子组件中修饰同名的对象
 * 父组件会传递对象到子组件中，实现双向数据同步

 */

/**
 * 一个商品购物车的简单页面
 */
//商品类
@Observed
class Goods {
  static id: number = 1 //商品id
  name: string = `华为手机MateX${Goods.id++}`
  isSelected: boolean = false //商品在购物车中是否选中
}

//统一的卡片样式
@Styles
function card() {
  .width('95%')
  .padding(20)
  .backgroundColor(Color.White)
  .borderRadius(15)
}

//选中商品的文字样式，扩展Text组件样式
@Extend(Text)
function selectedGoodsStyle() {
  .fontColor(Color.Red)
  .fontWeight(FontWeight.Bold)
}

class CarInfo {
  //购物车中的总商品数
  totalGoods: number = 0
  //购物车中选中的商品数
  selectedGoods: number = 0
}

@Entry
@Component
struct StateSample {
  //购物车中的总商品数
  // @State totalGoods:number = 0
  // //购物车中选中的商品数
  // @State selectedGoods:number = 0
  @Provide carInfo: CarInfo = new CarInfo() //父组件，作为数据提供方

  build() {
    Column({ space: 10 }) {
      //1.购物车标题以及选中商品进度
      // Title({totalGoods:this.totalGoods,selectedGoods:this.selectedGoods})
      Title()
      //2.添加商品的按钮
      // Content({totalGoods:$totalGoods,selectedGoods:$selectedGoods})
      // ContentX({carInfo:$carInfo})  //子组件中的link状态可以支持对象引用传值，实现状态UI更新
      ContentX()
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F2F3')
  }
}

/**
 * 状态管理：
 * @Prop修饰符，父组件改变，会引起子组件状态改变，只是单向的
 */
@Component
struct Title {
  @Consume carInfo: CarInfo //子组件中一定要相同命名，才能数据同步

  build() {
    Row() {
      Text('购物车:')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
      Stack() { //将两个组件重叠在一起
        Progress({ value: this.carInfo.selectedGoods, total: this.carInfo.totalGoods, type: ProgressType.Ring }) //圆形进度条
        Row() {
          Text(this.carInfo.selectedGoods.toString())
            .fontSize(24)
          Text('/' + this.carInfo.totalGoods)
            .fontSize(24)
        }
      }
    }
    .card()
    .justifyContent(FlexAlign.SpaceEvenly)
    .margin({ top: 20, bottom: 10 })
  }
}

/**
 * 状态管理：
 * @Link修饰符，父组件改变，会引起子组件状态改变，同时子组件改变，也会引起父组件改变，是
 * 双向的
 */
@Component
struct ContentX {
  //购物车中的总商品数
  // @Link totalGoods:number
  // //购物车中选中的商品数
  // @Link selectedGoods:number  //@Link可以用于对象
  //子组件中一定要相同命名，才能数据同步，不需要通过参数传递的方式传值
  @Consume carInfo: CarInfo
  //购物车商品的数组
  @State goodsList: Goods[] = []

  build() {
    Column() {
      Button('添加商品')
        .width(200)
        .onClick(() => {
          //1.添加商品
          this.goodsList.push(new Goods())
          this.changeGoodsList()
        })
      //3.购物车中商品列表
      List({ space: 10 }) {
        //循环渲染,加载子组件
        ForEach(
          this.goodsList,
          (item: Goods, index:number) => {
            ListItem() {
              GoodsItem({ item: item, onChangeCar: this.changeGoodsList.bind(this) }) //这里要绑定当前this对象
            }
            .swipeAction({ end: this.deleteButton(index) })
          }
        )
      }
      .width('100%')
      .layoutWeight(1)
      .divider({
        strokeWidth: 2,
        color: '#36D',
        startMargin: 10,
        endMargin: 10
      })
      .alignListItem(ListItemAlign.Center)
    }
  }

  //购物车中商品发生改变调用的方法
  changeGoodsList() {
    //1.购物车商品的总数加1
    this.carInfo.totalGoods = this.goodsList.length
    //2.更新购物车中选中的商品数
    this.carInfo.selectedGoods = this.goodsList.filter(item => item.isSelected).length
  }

  @Builder
  deleteButton(index: number) {
    // Button() {
    //   // Image($r('app.media.ic_public_delete'))
    //   //   .width(20)
    //   //   .fillColor(Color.White)
    // }
    Button('删除')
      .width(40)
      .height(40)
      .backgroundColor(Color.White)
      .onClick(() => {
        //1.从数组中删除商品
        this.goodsList.splice(index, 1)
        //2.更新
        this.changeGoodsList()
      })
  }
}

@Component
struct GoodsItem {
  @ObjectLink item?: Goods;
  onChangeCar: () => void = () => {
  }; //提供默认值

  build() {
    Row() {
      if (this.item?.isSelected) {
        Text(this.item.name)
          .fontSize(20)
          .selectedGoodsStyle()
      } else {
        Text(this.item?.name ?? '未知商品')
          .fontSize(20)
      }

      Checkbox()
        .select(this.item?.isSelected ?? false)
        .onChange(val => {
          if (this.item) {
            //1.改变商品的选中状态
            this.item.isSelected = val
            // this.changeGoodsList()
            this.onChangeCar()
          }
        })
    }
    .card()
    .justifyContent(FlexAlign.SpaceAround)
  }
}