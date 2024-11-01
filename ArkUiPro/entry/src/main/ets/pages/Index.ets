/**
 * 一个简单的用户注册页面
 */
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State salary:number = 12000

  build() {
    Column({space:30}) {
      //图片显示组件 Image
      /**
       * 在页面声明的文件中，引用自愿，需要使用$r(‘’)的方式
       * 而在脚本配置文件中，直接用"$"的方式，比如如下
       * "startWindowIcon": "$media:startIcon",
       */
      Image($r('app.media.maniu'))//app表示应用资源，sys表示系统资源
      // Image($rawfile('startIcon.png'))
      //通用属性
        .width(300)//宽度
        // .height(300)//高度
        .borderRadius(10)//设置图片边框的圆角
        .interpolation(ImageInterpolation.High)//图片的插值效果
        .onComplete(img => {
          //图片数据加载成功和解码成功时均触发该回调，返回成功读取到的一些关于图片的信息
          //这里必须要加if判断，否则img无法使用
          if (img) {
            console.log('图片的宽度为: '+String(img.width))
          }
        })
        .onError(()=>{
          //图片加载异常时触发该回调
          //加载错误调用的事件
        })

      //基础组件，文本组件
      Text($r('app.string.reg_name'))
        .fontSize(30)//字体大小
        .lineHeight(40)//行高
        // .fontColor('#36D')//字体颜色
        .fontWeight(FontWeight.Medium)//字体粗细
        .onClick(()=>{
          console.log('码牛课堂用户注册')
        })

      Row() {
        Image($r('app.media.Person'))
          .width(30)
          .margin({left:10})
        //基础组件，文本输入框组件
        TextInput({placeholder:'请输入与用户名'})
          .width('80%')
          .height(40)
          // .backgroundColor('#36D')//输入框背景颜色
      }

      Row() {
        Image($r('app.media.lock'))
          .width(30)
          .margin({left:10})
        TextInput({placeholder:'请输入密码'})
          .width('80%')
          .height(40)
          .type(InputType.Password)//文本框类型，InputType.Password密码输入框
          .showPasswordIcon(true)//是否显示密码图标
          .onChange(val=>{//文本框发生变化，都会响应，val为文本框的输入内容
            console.log(val)
          })
      }

      Row() {
        Text('收入:')
          .fontSize(20)
          .padding({left:10})
        //基础组件，滑动条组件
        Slider({
          value:12000,//当前滑动条的值
          min:8000,//滑动条最小值
          max:25000,//滑动条最大值
          step:1000,//滑动步长
          style:SliderStyle.InSet,//滑动与滑轨的样式
          reverse:false//默认从左到右
        })
          .width('70%')
          .showTips(true)//是否显示刻度条百分比
          .backgroundColor('#36D')
          .onChange(val=>{
            console.log(String(val))
            this.salary = val
          })
        Text(String(this.salary)).fontSize(20)
      }

      //基础组件，单选框组件
      //单选框：同一个组内一次只能选择一个
      Row() {
        Text('性别:')
          .fontSize(20)
          .padding({left:10})
        Radio({value:'男', group:'sex'})
          .height(20)
          .width(20)
          .checked(true)//是否选中
          .onChange((isChecked:boolean)=>{
            if (isChecked) {//选中 isChecked为true,未选中为false
              console.log('男')
            }
          })
        Text('男:')
          .fontSize(20)
        Radio({value:'女', group:'sex'})
          .height(20)
          .width(20)
          .checked(true)//是否选中
          .onChange((isChecked:boolean)=>{
            if (isChecked) {//选中 isChecked为true,未选中为false
              console.log('女')
            }
          })
        Text('女:')
          .fontSize(20)
      }.width('100%')

      Row() {
        Text('地址:')
          .fontSize(20)
          .padding({left:10})
        //基础组件，下拉框组件
        Select([{value:'长沙'},
          {value:'北京'},
          {value:'广州'},
          {value:'上海'}])
          .selected(2)//默认选中某一项
          .value('请选择地址')//设置下拉框按钮本身的文本内容
          .font({size:16,weight:FontWeight.Medium})
          .onSelect((index:number, value:string)=>{
            console.log('select: ' + index + ', 值:' + value)
          })
      }.width('100%')

      Row() {
        Text('爱好:')
          .fontSize(20)
          .padding({left:10})
        //基础组件，多选框组件
        //多选框组件控制组件,可以控制组内的多选框
        CheckboxGroup({group:'checkboxGroup'})
          .selectedColor('#007DFF')
          .selectAll(true)
          .onChange((itemName:CheckboxGroupResult)=>{
            console.info("checkbox group content" + JSON.stringify(itemName))
          })
        Text('全选')
          .fontSize(20)
        //选项1
        Checkbox({name:'checkbox1', group:'checkboxGroup'})
          .selectedColor('#007DFF')//选中的颜色
          .select(true)//是否选中
          .onChange((value:boolean)=>{
            console.log('Checkbox1 change is ' + value)
          })
        Text('java')
          .fontSize(20)
        //选项2
        Checkbox({name:'checkbox2', group:'checkboxGroup'})
          .selectedColor('#007DFF')//选中的颜色
          .select(false)//是否选中
          .onChange((value:boolean)=>{
            console.log('Checkbox2 change is ' + value)
          })
        Text('python')
          .fontSize(20)
        //选项3
        Checkbox({name:'checkbox3', group:'checkboxGroup'})
          .selectedColor('#007DFF')//选中的颜色
          .select(false)//是否选中
          .onChange((value:boolean)=>{
            console.log('Checkbox3 change is ' + value)
          })
        Text('arkts')
          .fontSize(20)
      }.width('100%')

      Row() {
        Checkbox()//单选框
        Text('记住我')
          .fontSize(20)
          .fontColor('#36D')
      }
      //基础组件，button按钮组件
      //另外Button内部可以内嵌其它的组件，比如图标等，这里没有操作
      Button('注册')
        .type(ButtonType.Capsule)//胶囊类型，还有Circle和Normal类型
        .onClick(()=>{
          console.log('按钮点击事件')
        })
    }
    .width('100%')
  }
}