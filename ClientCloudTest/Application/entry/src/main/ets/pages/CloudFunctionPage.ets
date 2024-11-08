import { async } from '@hw-agconnect/cloud/src/main/ets/storage/upload/task';
import cloud from '@hw-agconnect/cloud';

@Entry
@Component
struct CloudFunctionPage {
  @State message: string = '云函数调用';

  build() {
    Column() {
      Text(this.message)
        .id('CloudFunctionPageHelloWorld')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)

        Button("hello-click-fn")
          .onClick(async()=>{
          let functionResult = await cloud.callFunction({
            name:"fn-film",
            params:{
              "param1":"val1",
              "param2":"val2"
            }
          });
          let returnValue:string = functionResult.getValue();
          AlertDialog.show({message:JSON.stringify(returnValue)})
        });
    }
    .height('100%')
    .width('100%')
  }
}