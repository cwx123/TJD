import router from '@ohos.router';
@Component
export default struct swiperPage2 {
  build() {
    Column() {
      Text(".")
        .fontColor("#ffffff")
        .fontSize(24)
        .margin({top: 33.5, bottom: 46})

      Row() {
        Image($r("app.media.bg_Intropage2")).width("100%").height("100%")
      }
      .width("100%")
      .height(312)
      .padding({left: 49.5, right: 49.5})

      Text("走跑骑").fontColor("#6B7285").fontSize(18).margin({top: 64, bottom: 8})
      Text("随时随地记录运动").fontColor("#6B7285").fontSize(14)

      // Row() {
      //
      // }.width("100%")

      Button('开启健康生活', { controlSize: ControlSize.SMALL, buttonStyle: ButtonStyleMode.NORMAL })
        .fontColor("#B0B0B8")
        .fontSize(15)
        .width(176)
        .height(40)
        .borderWidth(1)
        .borderColor("#B0B0B8")
        .borderRadius(24)
        .margin({top: 36})
        .backgroundColor("#ffffff")
        .onClick(() => {
          router.pushUrl({url: "pages/MainHome"})
        })
    }
    .width("100%")
    .height("100%")
  }
}