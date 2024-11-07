import { Userinfo, Users } from '../model/Userdata';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct RefreshDemoPage {
  @State message: string = 'Hello World';
  @State isRefresh: boolean = false

  users: Userinfo[] = [
    new Userinfo(1, '小灵通', $r('app.media.ic_mine')),
    new Userinfo(2, '大灵通', $r('app.media.ic_mine')),
    new Userinfo(3, '无畏无惧', $r('app.media.ic_mine')),
    new Userinfo(4, '漫步云端', $r('app.media.ic_mine')),
    new Userinfo(5, '田阔', $r('app.media.ic_mine')),
    new Userinfo(1, '小灵通', $r('app.media.ic_mine')),
    new Userinfo(2, '大灵通', $r('app.media.ic_mine')),
    new Userinfo(3, '无畏无惧', $r('app.media.ic_mine')),
    new Userinfo(4, '漫步云端', $r('app.media.ic_mine')),
    new Userinfo(5, '田阔', $r('app.media.ic_mine')),
    new Userinfo(1, '小灵通', $r('app.media.ic_mine')),
    new Userinfo(2, '大灵通', $r('app.media.ic_mine')),
    new Userinfo(3, '无畏无惧', $r('app.media.ic_mine')),
    new Userinfo(4, '漫步云端', $r('app.media.ic_mine')),
    new Userinfo(5, '田阔', $r('app.media.ic_mine')),
  ]

  aboutToAppear(): void {
    let user:Users = router.getParams() as Users
    console.log('ken', JSON.stringify(user))
  }

  build() {
    Column() {
      Refresh({refreshing: $$this.isRefresh}){
        List(){
          ForEach(this.users, (item: Userinfo)=>{
            ListItem(){
              Row(){
                Image(item.uimg).width(40).aspectRatio(1)
                Text(item.uname).layoutWeight(1)
              }.borderRadius(5)
              .padding(15)
              .backgroundColor(Color.Pink)
              .margin(10)
            }
          })
        }
      }.onStateChange( (status: RefreshStatus)=>{
        console.log('ken', status, this.isRefresh);
      })
      .onRefreshing( //刷新中，和服务器的交互中 isRefresh = true
        ()=>{
          setTimeout(()=>{
            //去服务器加载数据
            this.isRefresh = false
            console.log('ken', 'refreshing over');
          }, 2000)
          //从服务获取数据
          // await axios.get()
          // this.isRefresh = false
        })
    }
    .height('100%')
    .width('100%')
  }
}