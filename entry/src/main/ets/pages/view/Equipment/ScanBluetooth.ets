import { router } from '@kit.ArkUI'

//扫描蓝牙页面
@Entry
@Component
struct ScanBluetooth {
@State title:string='添加设备'

  build() {
    Column(){
      Row() {
        Image($r("app.media.arrow_left")).width(28).height(28)
          .onClick(() => {
            router.back()
          })
        Text(this.title)
          .fontSize(16)
          .fontWeight(400)
          .fontColor(Color.Black)
          .height(48)
          .onClick(()=>{
            // router.pushUrl({url:this.loginurl}, router.RouterMode.Single)
          })
        Image($r("app.media.saoyisao")).width(28).height(28)

      }
      .width("100%")
      .height(48)
      .padding({left: 19, right: 24})
      .justifyContent(FlexAlign.SpaceBetween)
      Row(){
        Stack(){

        }
        .width(240)
        .height(240)
        .backgroundColor('#ccc')
      }
      .width('100%')
      .align(Alignment.Center)
    }
  }
}