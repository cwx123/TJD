
@Entry
@Component
export default struct Index {
  @State message: string = '设备页面';

  build() {
    Column(){
      Row() {
        Text("设备").fontSize(28).fontColor("#040415")
        Text("+").fontSize(16).fontColor("#212135")
          .height(20)
          .width(20)
          .borderWidth(1)
          .borderRadius(4)
          .borderColor("#212135")
          .textAlign(TextAlign.Center)
      }
      .height(44)
      .padding({left: 25, right: 24, bottom: 12,top:12})
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
      Row() {
        Text("我的设备")
          .fontSize(16)
          .fontColor("#040415")
          .fontWeight('Bold')
        Text("更多").fontSize(16).fontColor("#212135")
          .height(20)
          .borderWidth(1)
          .borderRadius(4)
          .borderColor("#FF040415")
          .textAlign(TextAlign.Center)
      }
      .height(44)
      .padding({left: 25, right: 24, bottom: 12,top:12})
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
    }

  }
}