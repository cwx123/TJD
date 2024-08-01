import HeaderTitle from "./components/HeaderTitle"
import { promptAction, router } from '@kit.ArkUI'
@Entry
@Component
struct EditPwd {
  @State pwd: string = ''
  @State password: string = ''
  @State newPwd: string = ''
  build() {
    Column() {
      HeaderTitle({title: '更改密码'})
      Column() {
        Text("输入旧密码")
          .fontSize(14)
          .fontColor("#040415")
          .lineHeight(18)
          .margin({top: 40, bottom: 12})
          .width("100%")
        Row() {
          TextInput({placeholder: '请输入密码'})
            .height(48)
            .type(InputType.Password)
            .borderRadius(24)
            .backgroundColor("#F2F2F2")
            .onChange((value: string) => {
              this.pwd = value
            })
        }
        .margin({bottom: 20})
        Text("输入新密码")
          .fontSize(14)
          .fontColor("#040415")
          .lineHeight(18)
          .margin({bottom: 12})
          .width("100%")
        Row() {
          TextInput({placeholder: '新密码'})
            .height(48)
            .type(InputType.Password)
            .borderRadius(24)
            .backgroundColor("#F2F2F2")
            .onChange((value: string) => {
              this.password = value
            })
        }
        Row() {
          TextInput({placeholder: '确认密码'})
            .height(48)
            .type(InputType.Password)
            .borderRadius(24)
            .backgroundColor("#F2F2F2")
            .onChange((value: string) => {
              this.newPwd = value
            })
        }
        .margin({top: 14, bottom: 16})
        Text("忘记密码?")
          .fontSize(14)
          .fontColor("#040415")
          .lineHeight(18)
          .margin({bottom: 12})
          .width("100%")
          .textAlign(TextAlign.End)
          .margin({bottom: 46})
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
            console.log("密码", this.pwd)
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