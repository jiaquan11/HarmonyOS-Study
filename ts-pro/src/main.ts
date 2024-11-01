//ts数据类型
//js已有数据类型 number string boolean null undefined 数组
//ts独有数据类型:联合类型、类型别名、接口 (interface)、字面量类型、泛型、枚举、void、any
//注意：TypeScript 和 JavaScript 没有整数类型

let count:number = 100
let msg:string = 'hello'
let isMan:boolean = true //false
let nullValue:null = null
let undefinedValue:undefined = undefined
let names:string[] = ['tom','jerry','kitty']
console.log(count)
console.log(msg)
console.log(isMan)
console.log(nullValue)
console.log(undefinedValue)
console.log(names)

//类型注解
//语法 let 变量名:类型 = 值
// let msg:string = 'hello'
// console.log(msg.concat(' world'))
// console.log(msg.length)

//注解数组类型 语法
//方式一 推荐使用这种方式
let arr:string[] = ['java','python','c++']
//方式二 泛型方式
let arr1:Array<string> = ['js','ts','vue']
//注解数组类型的作用
//限制变量类型为数组，限制数组成员的类型
let arr3:string[] = ['hello','world','zs']
//提示数组的属性和方法以及成员的属性和方法
console.log(arr3.length)
console.log(arr3.join('-'))

//遍历数组
arr3.forEach(item=>console.log(item.concat('...')));

//联合类型
//数组中既可以存放数字，又可以存放字符串
let arr4:(string | number)[] = ['hello',100,'world']
console.log(arr4)
let arr5:string | number[] = 'hello' //注意加括号和不加括号的区别

//类型别名 给复杂的联合类型起别名，用来简化和复用类型
//语法 type 类型别名 = 具体类型 注意：类型别名首字母大写(大驼峰)
let msg2:string | number | boolean = false
let msg3:string | number | boolean = 100

type ItemType = string | number | boolean
let msg4:ItemType = 'hello'
let msg5:ItemType = 100

//函数类型注解
//给函数中参数和返回值的数据类型添加约束
//参数必填 返回值必须满足类型约束
//语法 function 函数名(参数1:类型,参数2:类型):返回值类型{函数体}
function sum(a:number,b:number):number{
    return a + b
}
let result:number = sum(10,20)
console.log(result)

//函数表达式类型注解，箭头函数
//参数和返回值分开注解
const add1 = (a:number,b:number):number => {
    return a + b
}
console.log(add1(10,20))

//整体注解，整体注解一般用于库文件的编写
type AddFunc = (a:number,b:number) => number
const add2:AddFunc = (a,b) => {
    return a + b
}
console.log(add2(10,20))

//可选参数，参数可传可不传，一旦传递实参，就一定要符合注解类型的要求
//可选参数必须放在参数列表的最后
function test(name1:string,name2?:string):string {
    if (name2) {
        return name1 + name2
    }
    return name1
}
console.log(test('hello','world'))
console.log(test('hello'))

//无返回值函数，void表示函数没有返回值，在js中没有返回值的函数默认返回undefined
function test1(firstName:string):void {
    console.log('hello')
}
let data:void = test1('admin')
console.log(data)

//接口类型，用来定义对象数据类型的属性和方法
//语法 interface 接口名{属性:类型,属性:类型}
//{name:'zs',age:18} 
//语法： interface 接口名{属性:类型,属性:类型}
// interface User {
//     name:string,
//     age:number
// }

// let user:User = {
//     name:'zs',
//     age:13
// }
// console.log(user)

//应用场景，前后端数据通信
//前端向后端发送数据
interface UserLogin {
    username:string,
    password:string
}
let usr1:UserLogin = {
    username:'admin',
    password: '123'
}

//前端使用后端数据进行数据渲染
interface User {
    name:string,
    age:number
}
let users:User[] = [
    {name:'zs',age:18},
    {name:'ls',age:19},
    {name:'ww',age:20}
]
//遍历对象数组
users.forEach(item => console.log(item.name))

//接口的可选设置，通过?设置可选属性,可选属性必须放在必选属性后面,可选属性不一定要传递
interface Student {
    id:number,
    name:string,
    height?:number
}
let stu1:Student = {
    id:1,
    name:'zs',
    height:180
}
let stu2:Student = {
    id:2,
    name:'ls'
}
//一旦赋值该属性，就必须符合接口的类型约束

//接口的继承
interface Person {
    name:string,
    age:number
    sex:string
}
interface Worker extends Person {
    salary:number
    wid:number
}
interface Teacher extends Person {
    level:number
    tid:number
}

//type注解对象类型
//语法 type 类型别名 = {属性:数据类型,属性:数据类型}
//type注解和interface注解的区别
//type注解可以直接注解基本类型，联合类型，元组类型，字面量类型，接口类型
type User1 = {
    name:string,
    age:number
}
let user1:User1 = {
    name:'zs',
    age:18
}

interface User2 {
    name:string,
    age:number
}

//type注解对象类型，配合交叉类型实现继承
type LoginUser = User & {
    password:string
}
let loginUser:LoginUser = {
    name:'zs',
    age:18,
    password:'123'
}

//字面量类型
//字面量类型是一种具体的值，可以作为类型注解使用
//字面量类型的值只能是指定的值
let msg6:string = 'success' //非字面量类型，可以修改值
msg = 'error'
msg = 'fail'

//如下是字面量类型
let msg7:'success'
// msg7 = 'error' //报错，字面量类型值不能修改

//字面量类型的应用场景
//用来约束变量的值只能是指定的值
// let sex:'男' | '女'  //只能是男或女

type Sex = '男' | '女'
let sex:Sex = '男'
sex = '女'

//element-ui中的message方法
type Button = {
    type:'success' | 'error' | 'warning' | 'info',
}
let button:Button = {
    type:'success'
}

//const注解
//const注解用来约束常量的数据类型
const msg8 = 'hello'
// msg8 = 'world' //报错，常量不能修改值

//类型断言，获取页面中的id为link的a元素，尝试通过点语法获取href属性
let aLink = document.getElementById('link')
//ts给我们的类型推论并不一定准确，开发者更清楚变量的类型，可以使用as关键字进行类型断言
let aLink1 = document.getElementById('link') as HTMLAnchorElement
// console.log(aLink1.href)

//类型断言会绕过类型检查，不建议使用，因为可能会导致运行时错误
//类型断言会欺骗TypeScript编译器，无法避免运行时错误

//说明:利用断言把val变量的类型指定为精确的number，
//但是传参的时候还是可以传递number类型或者string类型均满足类型要求，
//但是传递string会导致运行时错误
function test2(value:string | number) {
    console.log((value as number).toFixed(3))
}
// test2('100') //报错，运行时错误

//any类型 变量被注解为any类型，表示该变量可以存储任意类型的数据
//any类型可以绕过类型检查，不建议使用
// let data:any = {name:'zs',age:18}


//泛型，不预先指定具体的类型，而在使用的时候再指定类型的一种特性
// interface UserData {
//     code:number
//     msg:string
//     data:{
//         username:string
//         age:number
//     }
// }

// interface GoodsData {
//     code:number
//     msg:string
//     data:{
//         id:number
//         goodsName:string
//     }
// }
//泛型接口
//语法： interface 接口名<T>{} T为声明的泛型参数，接口中的属性和方法可以使用泛型参数
//泛型接口如何定义
//1、找到可变的类型部分通过泛型<T>抽象为泛型参数(定义参数)
// interface ResponseData<T> {
//     code:number
//     msg:string
//     data:T
// }
// //2、在使用泛型的时候，把具体类型传入到泛型参数位置(传参)
// //定义具体的接口类型
// interface UserData {
//     username:string
//     age:number
// }
// interface GoodsData {
//     id:number
//     goodsName:string
// }
// //传入具体数据类型
// let userData:ResponseData<UserData> = {
//     code:200,
//     msg:'success',
//     data:{
//         username:'admin',
//         age:20
//     }
// }
// let goodsData:ResponseData<GoodsData> = {
//     code:200,
//     msg:'success',
//     data:{
//         id:1,
//         goodsName:'apple'
//     }
// }

//泛型别名
//语法：type 类型别名<T> = {} T为声明的泛型参数，类型别名中的属性和方法可以使用泛型参数
type ResponseData<T> = {
    code:number
    msg:string
    data:T
}
type UserData = {
    username:string
    age:number
}

type GoodsData = {
    id:number
    goodsName:string
}
let userData:ResponseData<UserData> = {
    code:200,
    msg:'success',
    data:{
        username:'admin',
        age:20
    }
}
let goodsData:ResponseData<GoodsData> = {
    code:200,
    msg:'success',
    data:{
        id:1,
        goodsName:'apple'
    }
}


//泛型函数
//语法 function 函数名<T>(参数:类型):返回值类型{}
//T即可声明一个泛型参数，整个函数中(参数，返回值，函数体)都可以使用泛型参数
//案例:设置一个函数createArray，可以创建指定长度，指定默认值的数组
//同时将每一项都填充一个默认值(多种类型)
function createArray<T>(length:number,value:T):T[] {
    let res = []
    for (let i = 0; i < length; i++) {
        res[i] = value
    }
    return res
}
let arr6 = createArray<string>(3,'abc')
console.log(arr6)

//泛型约束，泛型的特点就是灵活不确定
//泛型函数的内容需要访问一些特定类型才有的属性，此时会有类型错误，需要通过泛型约束解决
function test22<T>(val:T) {
    // console.log(val.length) //报错，泛型约束
}

//定义泛型接口 泛型接口中加入特定的属性
interface LengthObj {
    length:number
}
//定义函数，在泛型函数的类型T继承泛型接口
function printLen<T extends LengthObj>(val:T) {
    console.log(val.length)
}
printLen([1,2,3,4,5])
printLen('h')
// printLen(100)//报错，泛型约束