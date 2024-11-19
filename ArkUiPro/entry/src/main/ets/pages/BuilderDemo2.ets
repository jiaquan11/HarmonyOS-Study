/**
 * 按引用传递参数时，传递的参数可为状态变量，且状态变量的改变会引起@Builder方法内的UI刷新
 */

// class Tmp {
//   paramA1: string = ''
// }
//
// @Builder function overBuilder(params: Tmp) {
//   Row() {
//     Text(`UseStateVarByReference: ${params.paramA1} `)
//   }
// }
// @Entry
// @Component
// struct BuilderParent {
//   @State label: string = 'Hello';
//   build() {
//     Column() {
//       // 在父组件中调用overBuilder组件时，
//       // 把this.label通过引用传递的方式传给overBuilder组件。
//       overBuilder({ paramA1: this.label })
//       Button('Click me').onClick(() => {
//         // 单击Click me后，UI文本从Hello更改为ArkUI。
//         this.label = 'ArkUI';
//       })
//     }
//   }
// }

//2、
//按引用传递参数时，如果在@Builder方法内调用自定义组件，ArkUI提供$$作为按引用传递参数的范式。
// class Tmp {
//   paramA1: string = ''
// }
//
// @Builder function overBuilder($$: Tmp) {
//   Row() {
//     Column() {
//       Text(`overBuilder===${$$.paramA1}`)
//       HelloComponent2({message: $$.paramA1})
//     }
//   }
// }
//
// @Component
// struct HelloComponent2 {
//   @Prop message: string;
//   build() {
//     Row() {
//       Text(`HelloComponent===${this.message}`)
//     }
//   }
// }
//
// @Entry
// @Component
// struct BuilderParent2 {
//   @State label: string = 'Hello';
//   build() {
//     Column() {
//       // 在父组件中调用overBuilder组件时，
//       // 把this.label通过引用传递的方式传给overBuilder组件。
//       overBuilder({paramA1: this.label})
//       Button('Click me').onClick(() => {
//         // 单击Click me后，UI文本从Hello更改为ArkUI。
//         this.label = 'ArkUI';
//       })
//     }
//   }
// }

/**
 * 按值传递参数
 * 调用@Builder装饰的函数默认按值传递。当传递的参数为状态变量时，状态变量的改变不会引起@Builder方法内的UI刷新。
 * 所以当使用状态变量的时候，推荐使用按引用传递
 */
@Builder function overBuilder(paramA1: string) {
  Row() {
    Text(`UseStateVarByValue: ${paramA1} `)
  }
}
@Entry
@Component
struct BuilderParent2 {
  @State label: string = 'Hello';
  build() {
    Column() {
      overBuilder(this.label)
    }
  }
}