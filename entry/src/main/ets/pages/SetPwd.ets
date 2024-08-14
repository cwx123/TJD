import HeaderTitle from "./components/HeaderTitle"
import { promptAction, router } from '@kit.ArkUI'
import TextInputicon from './components/textinputicon'
//忘记密码后手机登录设置密码
@Entry
@Component
struct SetPwd {
  @State password: string = ''
  @State newPwd: string = ''
  build() {
    Column() {
      HeaderTitle({title: '设置密码'})
      Column() {
        Text("设置安全系数高的密码，以保护您的账号安全")
          .fontSize(14)
          .fontColor("#040415")
          .lineHeight(18)
          .margin({top: 40, bottom: 32})
        Row() {
          TextInputicon({ placeholder: '请输入密码' })
            .height(48)
            .borderRadius(24)
            .backgroundColor("#F2F2F2")
        }
        Row() {
          TextInputicon({placeholder: '请再次确认密码'})
            .height(48)
            .borderRadius(24)
            .backgroundColor("#F2F2F2")
        }
        .margin({top: 14, bottom: 60})
        Text("密码需满足以下要求：").fontSize(14).fontColor("#040415").width("100%")
          .lineHeight(18).fontWeight(600)
        Text("1.至少6个字符；").fontSize(14).fontColor("#040415").width("100%").margin({top: 8}).lineHeight(18)
        Text("2.至少包含字母和数字，不能包含空格。").fontSize(14).fontColor("#040415").width("100%").lineHeight(18)
        Text("密码强度").fontSize(12).fontColor("#040415").width("100%").margin({top: 20, bottom: 14}).lineHeight(18).fontWeight(600)

        Flex({justifyContent: FlexAlign.SpaceAround}) {
          ForEach([0,1,2,3,4,5,6], (item: number, index: number)=> {
            Text()
              .width(40)
              .height(8)
              .backgroundColor(index === 0 || index === 1 || index ===2 ? "#01DC82": "#E5E4E4")
              .borderRadius(4)
          })
        }
        Button('完成')
          .width("100%")
          .margin({top: 44})
          .backgroundColor("#01DC82")
          .fontSize(16)
          .onClick(()=> {
            console.log("密码1", this.password)
            console.log("密码2", this.newPwd)
            if(!(this.password && this.newPwd && this.password === this.newPwd)) {
              promptAction.showToast({message: "密码与确认密码不能为空并且必须一样"})
            }
          })
      }
      .padding({left: 30, right: 30})
    }
    .height("100%")
    .width("100%")

  }
}