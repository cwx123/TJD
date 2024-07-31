import text from '@ohos.graphics.text';
import HeaderTitle from "../../components/HeaderTitle"

@Entry
@Component
export default struct Setting {
  @State message: string = '设置';

  build() {
    Column() {
      HeaderTitle({title: this.message})
      Column() {
        Row(){
          Row() {
            Image($r("app.media.mine2")).width(24).height(24)
            Text('账号与安全')
              .fontWeight(500)
              .fontSize(16)
              .fontColor("#040415")
              .margin({left: 14})
          }
          Image($r('app.media.arrow_right'))
            .width(22)
            .height(22)
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({top: 15, left: 14, right: 15, bottom: 16})
      }
      .backgroundColor("#ffffff")
      .borderRadius(12)
      .height(52)
      .width("100%")
      .margin({top: 10})

      Column() {
        Row(){
          Row() {
            Image($r("app.media.mine2")).width(24).height(24)
            Text('单位')
              .fontWeight(500)
              .fontSize(16)
              .fontColor("#040415")
              .margin({left: 14})
          }
          Row() {
            Text('公制').fontColor("#7F7F7F").fontSize(14)
            Image($r('app.media.arrow_right'))
              .width(22)
              .height(22)
          }
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({top: 15, left: 14, right: 15, bottom: 16})

        Row(){
          Divider()
        }
        .padding({left: 51,right: 14})
        Row(){
          Row() {
            Image($r("app.media.mine2")).width(24).height(24)
            Text('清理缓存')
              .fontWeight(500)
              .fontSize(16)
              .fontColor("#040415")
              .margin({left: 14})
          }
          Image($r('app.media.arrow_right'))
            .width(22)
            .height(22)
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({top: 15, left: 14, right: 15, bottom: 16})
      }
      .backgroundColor("#ffffff")
      .borderRadius(12)
      // .height(52)
      .width("100%")
      .margin({top: 10})
    }
    .backgroundColor("#F8F8F8")
    .height('100%')
    .width('100%')
    .padding({left: 10, right: 10})
  }
}