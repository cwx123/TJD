import { router } from '@kit.ArkUI';
@Component
export default struct swiperPage3 {
  build() {
    Column() {
      Text(".")
        .fontColor("#ffffff")
        .fontSize(24)
        .margin({top: 33.5, bottom: 46})

      Row() {
        Image($r("app.media.bg_Intropage4")).width("100%").height("100%")
      }
      .width("100%")
      .height(312)
      .padding({left: 0.5, right: 0.5})

      Text("品牌升级").fontColor("#6B7285").fontSize(18).margin({top: 64, bottom: 8})
      Text("开启新篇章").fontColor("#6B7285").fontSize(14)

      Button('开启健康生活', { controlSize: ControlSize.SMALL, buttonStyle: ButtonStyleMode.NORMAL })
        .fontColor("#FFFFFF")
        .fontSize(15)
        .width(176)
        .height(40)
        .borderRadius(24)
        .margin({top: 36})
        .backgroundColor("#01DC82")
        .onClick(() => {
          router.pushUrl({url: "pages/MainHome"})
        })
    }
    .width("100%")
    .height("100%")
  }
}