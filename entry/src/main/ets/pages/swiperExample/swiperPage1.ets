import router from '@ohos.router';
@Component
export default struct swiperPage1 {
  build() {
    Column() {
      Text("欢迎来到乐动健康生活！")
        .fontColor("#6B7285")
        .fontSize(24)
        .margin({top: 33.5, bottom: 46})

      Row() {
        Image($r("app.media.bg_Intropage1")).width("100%").height("100%")
      }
      .width("100%")
      .height(312)
      .padding({left: 49.5, right: 49.5})

      Text("记录健康状况").fontColor("#6B7285").fontSize(18).margin({top: 64, bottom: 8})
      Text("跟踪你的身体变化").fontColor("#6B7285").fontSize(14)

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