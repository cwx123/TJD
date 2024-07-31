import text from '@ohos.graphics.text';

@Component
export default struct Index {
  @State message: string = '首页页面';

  build() {
    Column() {
      Row() {
        Text("乐动健康生活").fontSize(22).fontColor("#040415")
        Text("+").fontSize(16).fontColor("#212135")
          .height(20)
          .width(20)
          .borderWidth(1)
          .borderRadius(4)
          .borderColor("#212135")
          .textAlign(TextAlign.Center)
      }
      .height(44)
      .padding({left: 24, right: 24, bottom: 6, top: 16})
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)

      Column() {

      }
      .backgroundColor("#ffffff")
      .borderRadius(12)
      .height(240)
      .width("100%")
      .margin({top: 12})
    }
    .backgroundColor("#F8F8F8")
    .height('100%')
    .width('100%')
    .padding({left: 10, right: 10})
  }
}