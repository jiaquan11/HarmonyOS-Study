import cloud, { VerifyCodeAction } from '@hw-agconnect/cloud';

@Entry
@Component
struct LoginPage {
  @State message: string = '用户登录';
  @State verifyCode:string = '';
  @State phoneNum:string = '';
  @State phonepwd:string = 'Qin123456';

  build() {
    Column() {
      Text()
        .id('LoginPageHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Row () {
        TextInput({ placeholder:'请输入手机号码', text:$$this.phoneNum })
      }
      Row() {
        TextInput({ placeholder:'请输入验证码', text:$$this.verifyCode })
      }

      Row() {
        Button('注册用户').onClick(
          () => {
            cloud.auth().createUser({
              kind: 'phone',
              countryCode: '86',
              phoneNumber: this.phoneNum,
              password: this.phonepwd,//可以给用户设置初始密码，后续可以用密码来登录
              verifyCode: this.verifyCode
            }).then(result => {
              // 创建用户成功
              AlertDialog.show({message:'创建用户成功：'+JSON.stringify(result)})
            }).catch((error:Object) => {
              // 创建用户失败
              AlertDialog.show({message:'创建用户失败：'+JSON.stringify(error)})
            })
          }
        )

        Button('账号密码登录').onClick( () => {
          cloud.auth().signIn({
            credentialInfo: {
              kind: 'phone',
              phoneNumber: this.phoneNum,
              countryCode: '86',
              password: this.phonepwd
            }
          }).then(user => {
            //登录成功
            AlertDialog.show({message:'登录成功'+JSON.stringify(user)})
            console.info('ken', JSON.stringify(user));
          }).catch((error: Object) => {
            //登录失败
            AlertDialog.show({message:'登录失败'+JSON.stringify(error)})
          });
        })

        Button('手机号码验证码登录').onClick( () => {
          cloud.auth().signIn({
            credentialInfo: {
              kind: 'phone',
              phoneNumber: this.phoneNum,
              countryCode: '86',
              verifyCode: this.verifyCode
            }
          }).then(user => {
            //登录成功
            AlertDialog.show({message: '登录成功'+JSON.stringify(user)})
          }).catch( (error:Object) => {
            //登录失败
            AlertDialog.show({message: '登录失败'+JSON.stringify(error)})
          });
        })
      }

      Row() {
        Button('申请验证码').onClick(
          () => {
            cloud.auth().requestVerifyCode({
              action: VerifyCodeAction.REGISTER_LOGIN,
              lang: 'zh_CN',
              sendInterval: 60,
              verifyCodeType: {
                phoneNumber: this.phoneNum,
                countryCode: '86',
                kind: "phone"
              }
            }).then(verifyCodeResult => {
              //验证码申请成功
              AlertDialog.show({message:'申请成功：'+JSON.stringify(verifyCodeResult)})
            }).catch((error:Object) => {
              //验证码申请失败
              AlertDialog.show({message:'申请错误：'+JSON.stringify(error)})
            });
          }
        )

        Button('登录').onClick( () => {
          cloud.auth().signIn({
            credentialInfo:{
              kind: 'phone',
              countryCode: 'string',
              phoneNumber: 'string',
              password: 'string',
              verifyCode: 'string'
            }
          }).then().catch()
        })

        Button('退出').onClick( () => {
          cloud.auth().signOut().then(() => {
            //登出成功
            AlertDialog.show({message:'退出成功！'})
          }).catch((error: Object) => {
            //登出失败
            AlertDialog.show({message:'退出失败！'+JSON.stringify(error)})
          });
        })
      }
    }
    .height('100%')
    .width('100%')
  }
}