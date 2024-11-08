import cloud, { ProgressEvent, VerifyCodeAction } from '@hw-agconnect/cloud';
import fs from '@ohos.file.fs';

let storage = cloud.storage();

@Entry
@Component
struct CloudStoragePage {
  @State message: string = '云存储';

  build() {
    Column() {
      Text(this.message)
        .id('CloudStoragePageHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

      Row() {
        Button('上传').onClick(async () => {
          // 1. 获取本地文件路径。getLocalPicPath由开发者自行实现，函数返回本地文件的路径或URI即可。
          // let localPicPath: string = await this.getLocalPicPath();
          let file = fs.openSync(getContext(this).filesDir + '/hello2.txt', fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE)
          fs.writeSync(file.fd, "hello ,sdaklfjasdklfjsdalkfasdj!")//创建一个文件，并写入字符
          let localPicPath: string = getContext(this).filesDir + "/hello2.txt"

          AlertDialog.show({ message: localPicPath })
          AlertDialog.show({ message: JSON.stringify(storage) })

          // 2. 上传至云端
          let uploadResult = await storage.upload({
            localPath: localPicPath,
            cloudPath: 'doc/hello2.txt',
            onUploadProgress: (p: ProgressEvent) => {
              console.log(`ken:bytes:${p.loaded} total:${p.total}`)
            }
          })
          AlertDialog.show({ message: JSON.stringify(uploadResult) })
          // 3. 打印上传结果
          // console.log(`ken:${uploadResult.bytesTransferred} totalByteCount:${uploadResult.totalByteCount}`)
          AlertDialog.show({
            message: `ken:${uploadResult.bytesTransferred} totalByteCount:${uploadResult.totalByteCount}`
          })
        })

        Button('用户登录').onClick(() => {
          cloud.auth().signIn({
            credentialInfo: {
              kind: 'phone',
              phoneNumber: '13824428790',
              countryCode: '86',
              password: 'Qin123456.'
            }
          }).then(user => {
            //登录成功
            AlertDialog.show({ message: '登录成功' + JSON.stringify(user) })
            console.info('ken', JSON.stringify(user));
          }).catch((error: Object) => {
            //登录失败
            AlertDialog.show({ message: '登录失败' + JSON.stringify(error) })
          });
        })

        Button('列举').onClick(async () => {
          let listFiles = await storage.list({
            cloudPath: "doc/"
          })

          let files: string[] = listFiles.fileList
          AlertDialog.show({ message: JSON.stringify(files) })
        })

        Button('下载').onClick(() => {

        })

        Button('登出').onClick(() => {
          cloud.auth().signOut().then(() => {
            AlertDialog.show({ message: '登出成功！' })
          })
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
                phoneNumber: '13824428790',
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

        Button('手机号码验证码登录').onClick( () => {
          cloud.auth().signIn({
            credentialInfo: {
              kind: 'phone',
              phoneNumber: '13824428790',
              countryCode: '86',
              verifyCode: '193270'
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
    }
    .height('100%')
    .width('100%')
  }
}