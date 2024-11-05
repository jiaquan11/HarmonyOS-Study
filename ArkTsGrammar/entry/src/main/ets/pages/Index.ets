import { media } from '@kit.MediaKit';

enum Man {
  GoodMan,
  BadMan,
  SexMan
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  build() {
    Column() {
      Button('字符串类型')
        .onClick(()=>{
          //字符串类型，字符的数组
          /**
           * 单引号，双引号，反引号，都可以表示字符串，但是反引号的作用还可以
           * 用于进行拼接变量
           */
          let s1:string = 'hello, this is demo'
          let s2:string = 'hello, this is demo'
          let n:number = 100
          let s3:string = `hello, this price is ${n} \t s1`
          console.info('ken: ', s3)
        })

      Button('枚举类型').onClick(()=> {
        //枚举类型及其取值
        let you:Man = Man.GoodMan
        console.log('ken', you==0)
        console.log('ken', you===0);
      })

      Button('联合类型').onClick(()=> {
        let avPlayer:media.AVPlayer | null = null
        let score:string | number | null = 'A'
        score = 80
        score = null
      })

      Button('数组类型').onClick(()=> {
        let arr:string[] = ['1', '2', '3', '4']
        let arr2:number[] = new Array(10)
        //下标
        console.log('ken', arr[3]);
        //支持动态扩容
        arr2[100] = 100
        console.log('ken', arr2.length);
      })

      Button('函数').onClick(()=> {
        //可变函数调用
        printNum(10, 20,30)

        //箭头函数的使用
        fn1()
        let ret = fn2(10)

        //函数类型
        let fn3:myFunType = printCfg
        fn3()
      })
    }
    .height('100%')
    .width('100%')
  }
}

//可选参数的函数
function getArea(a:number, b?:number):number {
  if (b == undefined) {
    return -1
  }
  let area = a * b;
  return area
}

//Rest参数：可变参数(可传多个)
//必须放在参数列表的最后一个位置，不能是中间，也不能是开头
function printNum(...nums:number[]) {
  let res = 0;
  for (let n of nums) {
    res += n
  }
  return res
}

//无参数也无返回值的箭头函数
let fn1 = ()=>{
  console.log('ken', '箭头函数。。。')
}

let fn2 = (n:number):number=>{
  return 0
}

//自定义的一个函数类型，相当于一个函数的指针，引用
type myFunType = ()=> void
function printCfg() {
  for (let i = 0; i < 10; i++) {
    for (let j = 0; j < i; j++) {
      console.log(j+ '*' + i + '=' + (i*j))
    }
  }
}