/**
 * 自定义组件的使用
 * 父组件中的函数传递给子组件，并在子组件中调用
 */

@Component
struct Son {
  submitArrow?:()=>void

  build() {
    Row() {
      Button('add')
        .width(80)
        .onClick(() => {
          if (this.submitArrow) {
            this.submitArrow()
          }
        })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .height(56)
  }
}

/**
 * 父组件传递函数到子组件执行，同时更新的是父组件的状态变量
 */
@Entry
@Component
struct Parent {
  @State cnt:number = 0
  submit:()=>void = ()=> {
    this.cnt++;
  }

  build() {
    Column() {
     Text(`${this.cnt}`)
     Son({submitArrow:this.submit})
    }
  }
}