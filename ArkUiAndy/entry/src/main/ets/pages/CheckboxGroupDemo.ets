@Entry
@Component
struct CheckboxGroupDemo {
  @State message: string = 'Hello World';
  //复选框群组组件
  build() {
    Column() {
      Flex({ justifyContent:FlexAlign.Start, alignItems:ItemAlign.Center}) {
        CheckboxGroup({group:'groupName'})
          .selectAll(true)
          .selectedColor(Color.Red)
          .onChange((itemName:CheckboxGroupResult)=>{
            console.info('多选框群组选择状态: ' + JSON.stringify(itemName))
          })
        Text('全选')

        Flex({ justifyContent:FlexAlign.Start, alignItems:ItemAlign.Center}) {
          Checkbox({name:'多选框1', group:'groupName'})
            .onChange((value:boolean) => {
              console.info('多选框1' + (value?'被选中':'未选中'))
            })
          Text('多选框1')
        }.margin({left:36})
        Flex({ justifyContent:FlexAlign.Start, alignItems:ItemAlign.Center}) {
          Checkbox({name:'多选框2', group:'groupName'})
            .onChange((value:boolean) => {
              console.info('多选框2' + (value?'被选中':'未选中'))
            })
          Text('多选框2')
        }.margin({left:36})
        Flex({ justifyContent:FlexAlign.Start, alignItems:ItemAlign.Center}) {
          Checkbox({name:'多选框3', group:'groupName'})
            .onChange((value:boolean) => {
              console.info('多选框3' + (value?'被选中':'未选中'))
            })
          Text('多选框3')
        }.margin({left:36})
      }
    }
  }
}