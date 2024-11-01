//@State装饰器标记的变量必须初始化，不能为空值
//@State支持0bject、class、string、number、boolean、enum类型以及这些类型的数组

//嵌套的类型以及数组中的对象属性无法触发视图更新
/**
 * 应该正确理解：
 * 嵌套的类型在当前的视图组件中无法触发视图更新
 * 在其他视图中变化是会触发视图更新的
 */
//学生类
class Student {
  sname:string
  age:number
  gf?:Student
  constructor(sname: string, age: number, gf?:Student) {
    this.sname = sname
    this.age = age
    this.gf = gf
  }
}

@Entry
@Component
struct TestState {
  // @State message: string = 'Hello World';
  // @State age:number = 18
  // @State isMan:boolean = true;
  @State stu:Student = new Student('张三', 20, new Student('刘大美',18))

  idx = 0
  @State gfs:Student[] = [
    new Student('刘大美', 18),
    new Student('李晓丽',19)
  ]

  build() {
    Column() {
      Text(`${this.stu.sname}:${this.stu.age }`)
        .fontSize(30)
        .onClick(()=>{
          // this.message = 'hello!!!'
          // this.age++
          // this.isMan = false
          this.stu.age++
          if (this.stu.gf) {
            //this.stu.gf.age++;//在这里可以触发下面的文本的视图更新
          }
        })
      // if (this.isMan) {
      //   Text('他是男人')
      //     .fontSize(30)
      // }

      Text(`${this.stu.gf?.sname ?? '未知'}: ${this.stu.gf?.age ?? '未知'}`)
        .fontSize(30)
        .onClick(()=>{
          // this.message = 'hello!!!'
          // this.age++
          // this.isMan = false
          if (this.stu.gf) {
            this.stu.gf.age++;//在这里无法触发当前的视图更新
          }
        })

      Button('添加女友')
        .onClick(()=>{
          this.gfs.push(new Student('女友'+this.idx++, 20))
        })

      ForEach(
        this.gfs,
        (item:Student, index)=>{
          Text(item.sname + ':' + item.age)
            .fontSize(30)
            .onClick(()=>{
              item.age++ //数组中的对象属性无法触发视图更新
            })
        }
      )
    }
  }
}