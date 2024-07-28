@Entry
@Component
struct welcome {
  build() {
    Column() {
      Row() {}
      .width("100%")
      .backgroundColor("#F8F8F8")
      .layoutWeight(1)
      Row() {
        Column() {
          Image($r("app.media.title1")).height("32vp").width("32vp")
        }
        Column() {
          Text('乐动健康生活').fontColor("#333333").fontSize(15)
          Text("快乐运动 健康生活").fontSize(11).fontColor("#86868F").margin({top: 3})
        }
        .margin({left: 16})
      }
      .height("92vp")
      .alignItems(VerticalAlign.Center)
    }
    .width("100%")
    .height("100%")
  }
}