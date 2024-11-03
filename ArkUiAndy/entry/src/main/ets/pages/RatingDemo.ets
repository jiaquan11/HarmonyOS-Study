@Entry
@Component
struct RatingDemo {
  @State message: string = 'Hello World';
  @State rating:number = 3.5
  //评分组件
  build() {
    Column() {
     Rating({rating:3.5, indicator:false})//indicator是否作为展示使用
       .margin(24)
       .stars(10)
       .stepSize(2)
       .starStyle({
         backgroundUri:'/common/star_bg.png',
         foregroundUri:'/common/star_fg.png',
         secondaryUri:'/common/star_2.png'
       })

       .onChange((value:number) =>{
         this.rating = value
        })
      Text('客服评分: ' + this.rating)
        .fontSize(26)
        .margin(16)
    }
  }
}