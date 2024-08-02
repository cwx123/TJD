import HeaderTitle from "../../components/HeaderTitle"
import { promptAction, router } from '@kit.ArkUI'
@Entry
@Component
struct SetPwd {
  @State password: string = ''
  @State newPwd: string = ''
  @State chatToggle: boolean = true
  build() {
    Column() {
      HeaderTitle({title: '账户与安全'})

      Column() {
        Text("你已使用微信登录")
          .fontSize(12)
          .fontColor("#B0B0B8")
          .lineHeight(16)
          .padding({left: 24, top: 25, bottom: 8})
          .width("100%")
        Row() {
          Column() {
            Text("手机号")
              .fontSize(16)
              .fontColor("#040415")
              .lineHeight(22)
              .padding({bottom: 4})
              .width(140)
            Text("188****9999")
              .fontSize(14)
              .fontColor("#86868F")
              .lineHeight(20)
              .width(140)
          }
          Text("更改")
            .fontSize(16)
            .fontColor("#ffffff")
            .lineHeight(20)
            .width(60)
            .height(28)
            .backgroundColor("#01DC82")
            .borderRadius(14)
            .textAlign(TextAlign.Center)
        }
        .width("100%")
        .height(80)
        .backgroundColor("#ffffff")
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({left: 24, right: 24})

        Row() {
          Column() {
            Text("设置密码")
              .fontSize(16)
              .fontColor("#040415")
              .lineHeight(22)
              .padding({bottom: 4})
              .width(140)
            Text("未设置")
              .fontSize(14)
              .fontColor("#FF5857")
              .lineHeight(20)
              .width(140)
          }
          Image($r('app.media.arrow_right'))
            .width(22)
            .height(22)
        }
        .width("100%")
        .height(80)
        .backgroundColor("#ffffff")
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({left: 24, right: 24})
        .margin({top: 10})
        .onClick(() => {
          router.pushUrl({url: "pages/SetPwd"})
        })

        Text("第三方账号绑定")
          .fontSize(12)
          .fontColor("#B0B0B8")
          .lineHeight(16)
          .padding({left: 24, top: 32, bottom: 8})
          .width("100%")

        Row() {
          Text("微信")
            .fontSize(16)
            .fontColor("#040415")
            .lineHeight(22)
            .padding({bottom: 4})
            .width(140)
          // Flex({ justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
            Toggle({ type: ToggleType.Switch, isOn: this.chatToggle })
              .selectedColor('#01DC82')
              .switchPointColor('#FFFFFF')
              .onChange((isOn: boolean) => {
                console.info('Component status:' + isOn)
                this.chatToggle = isOn
              })
              .width(48)
              .height(28)
          // }
        }
        .width("100%")
        .height(56)
        .backgroundColor("#ffffff")
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({left: 24, right: 24})
        Row() {
          Text("QQ")
            .fontSize(16)
            .fontColor("#040415")
            .lineHeight(22)
            .padding({bottom: 4})
            .width(140)
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor('#01DC82')
            .switchPointColor('#FFFFFF')
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn)
            })
            .width(48)
            .height(28)
        }
        .width("100%")
        .height(56)
        .backgroundColor("#ffffff")
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({left: 24, right: 24})
        Row() {
          Text("苹果")
            .fontSize(16)
            .fontColor("#040415")
            .lineHeight(22)
            .padding({bottom: 4})
            .width(140)
          Toggle({ type: ToggleType.Switch, isOn: false })
            .selectedColor('#01DC82')
            .switchPointColor('#FFFFFF')
            .onChange((isOn: boolean) => {
              console.info('Component status:' + isOn)
            })
            .width(48)
            .height(28)
        }
        .width("100%")
        .height(56)
        .backgroundColor("#ffffff")
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({left: 24, right: 24})

        Row() {
          Column() {
            Text("注销账号")
              .fontSize(16)
              .fontColor("#040415")
              .lineHeight(22)
              .padding({bottom: 4})
              .width(140)
            Text("注销后无法恢复")
              .fontSize(14)
              .fontColor("#86868F")
              .lineHeight(20)
              .width(140)
          }
          Image($r('app.media.arrow_right'))
            .width(22)
            .height(22)
        }
        .width("100%")
        .height(80)
        .backgroundColor("#ffffff")
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({left: 24, right: 24})
        .margin({top: 16})
        .onClick(() => {
          router.pushUrl({url: "pages/view/Mine/DestroyAccount"})
        })

        // Text("密码需满足以下要求：").fontSize(14).fontColor("#040415").width("100%")
        //   .lineHeight(18).fontWeight(600)
        // Text("1.至少6个字符；").fontSize(14).fontColor("#040415").width("100%").margin({top: 8}).lineHeight(18)
        // Text("2.至少包含字母和数字，不能包含空格。").fontSize(14).fontColor("#040415").width("100%").lineHeight(18)
        // Text("密码强度").fontSize(12).fontColor("#040415").width("100%").margin({top: 20, bottom: 14}).lineHeight(18).fontWeight(600)

        // Flex({justifyContent: FlexAlign.SpaceAround}) {
        //   ForEach([0,1,2,3,4,5,6], (item: number, index: number)=> {
        //     Text()
        //       .width(40)
        //       .height(8)
        //       .backgroundColor(index === 0 || index === 1 || index ===2 ? "#01DC82": "#E5E4E4")
        //       .borderRadius(4)
        //   })
        // }
        Row() {
          Button('退出登录')
            .width(176)
            .height(44)
            .margin({top: 68})
            .backgroundColor("#F0F1F0")
            .fontColor("#FF5857")
            .fontSize(15)
            .borderRadius(22)
            .onClick(()=> {
              console.log("密码1", this.password)
              console.log("密码2", this.newPwd)
              if(!(this.password && this.newPwd && this.password === this.newPwd)) {
                promptAction.showToast({message: "密码与确认密码不能为空并且必须一样"})
              }
            })
        }
      }
    }
    .backgroundColor("#F8F8F8")
    .height("100%")
    .width("100%")

  }
}