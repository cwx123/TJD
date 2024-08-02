import HeaderTitle from "../../components/HeaderTitle"
import { router } from '@kit.ArkUI'
@Entry
@Component
struct DestroyAccount {
  build() {
    Column() {
      HeaderTitle({title: '注销账号'})
      Column() {
        Text("注销账号")
          .fontSize(24)
          .fontColor("#040415")
          .lineHeight(33)
          .fontWeight(600)
          .padding({ top: 40, bottom: 28 })
          .width("100%")

        Text("账号被注销后，如下信息将被清空，无法找回")
          .fontSize(14)
          .fontColor("#86868F")
          .lineHeight(20)
          .width("100%")

        Row() {
          Text("")
            .width(4)
            .height(4)
            .backgroundColor("#393939")
            .lineHeight(20)
          Text("各项运动数据、身体数据、健康数据")
            .fontSize(14)
            .fontColor("#393939")
            .lineHeight(20)
            .margin({left: 5})
        }
        .width("100%")
        .padding({top: 40, bottom: 12})

        Row() {
          Text("")
            .width(4)
            .height(4)
            .backgroundColor("#393939")
            .lineHeight(20)
          Text("交易记录")
            .fontSize(14)
            .fontColor("#393939")
            .lineHeight(20)
            .margin({left: 5})
        }
        .width("100%")
        .padding({bottom: 40})
          // .padding({bottom: 40})
          // .width("100%")

        Text("请在此确认是否执行此操作，永久注销此账号？")
          .fontSize(14)
          .fontColor("#040415")
          .lineHeight(20)
          .width("100%")

      }
      .padding({ left: 44 })
      Blank()
      Row() {
        Button('我了解风险，继续')
          .height(44)
          .margin({top: 68})
          .backgroundColor("#01DC82")
          .fontColor("#FFFFFF")
          .fontSize(15)
          .borderRadius(22)
          .onClick(()=> {
            console.log(">>>")
          })
          .width("100%")
      }
      .width("100%")
      .padding({left: 43.5, right: 43.5, bottom: 55})
    }
    .backgroundColor("#F8F8F8")
    .height("100%")
    .width("100%")
  }
}