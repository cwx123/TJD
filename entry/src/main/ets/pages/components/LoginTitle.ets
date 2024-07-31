import { router } from '@kit.ArkUI';

@Component
export default struct LoginTitle {
  flag: boolean = true
  title: string = ''

  build() {
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
        .fontColor(this.flag? "#000000" : "#ffffff")
    }
    .width("100%")
    .height(48)
    .padding({left: 19, right: 24})
    .justifyContent(FlexAlign.SpaceBetween)

  }
}