import { router } from '@kit.ArkUI';

@Component
export default struct HeaderTitle {
  @State message: string = 'Hello World';
  title: string = ''

  build() {
    Row() {
      Stack() {

        Text(this.title)
          .fontSize(16)
          .fontWeight(400)
          .fontColor(Color.Black)
          .width("100%")
          .height(48)
          .textAlign(TextAlign.Center)
          .fontColor("#000000")
        Image($r("app.media.arrow_left")).width(28).height(28)
          .position({top:10, left: 1})
          .onClick(() => {
            router.back()
          })

      // Text("我的反馈")
      //   .fontSize(14)
      //   .fontWeight(400)
      //   .fontColor(Color.Black)
      //   .height(20)
      //   .textAlign(TextAlign.Center)
      //   .position({top:14, right: 1})
      }
    }
    .width("100%")
    .height(48)
    .padding({left: 10, right: 10})
    .justifyContent(FlexAlign.SpaceAround)

  }
}