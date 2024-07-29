@Entry
@Component
struct LoginPage {
  build() {
    Column() {
      Column() {
        Image($r("app.media.title1")).width(76).height(76).margin({top: 46})
        Text("乐动健康生活").margin({top: 18, bottom: 95}).fontColor("#040415").fontSize(18)
        TextInput({placeholder: '请输入手机号码'})
          .height(48)
        Button('下一步')
          .width("100%")
          .margin({top: 36, bottom:16})
          .backgroundColor("#01DC82")
          .fontSize(16)
        Text("未注册账号验证通过后自动登录").fontColor("#B0B0B8").padding({bottom: 108})
        Text("其他登录方式").fontColor("#B0B0B8")
        Row() {
          Image($r("app.media.login_dianxin")).width(44).height(44)
          Image($r("app.media.login_wechat")).width(44).height(44)
          Image($r("app.media.login_qq")).width(44).height(44)
          Image($r("app.media.login_ios")).width(44).height(44)
        }
        .width("100%")
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({top: 24})
      }
      .padding({left: 43.5, right: 43.5})
      Row() {
        Checkbox({ name: 'checkbox2', group: 'checkboxGroup' })
          .selectedColor('#763DD2')
          .shape(CheckBoxShape.CIRCLE)
          .onChange((value: boolean) => {
            console.info('Checkbox1 change is'+ value)
          })
          .unselectedColor("#A092AB")

        Flex({wrap: FlexWrap.Wrap}) {
          Text() {
            Span("登录即表示同意").fontColor("#86868F").fontSize(13)
            Span("《用户协议》").fontColor("#333333").fontSize(13)
              .onClick(() => {
                console.log("用户协议")
              })
            Span("和").fontColor("#86868F").fontSize(13)
            Span("《隐私协议》").fontColor("#333333").fontSize(13)
              .onClick(() => {
                console.log("隐私协议")
              })
            Span("及").fontColor("#86868F").fontSize(13)
            Span("《运营商服务条款》").fontColor("#333333").fontSize(13)
              .onClick(() => {
                console.log("运营商服务条款")
              })
          }
        }.margin({left: 6})
      }
      .padding({left: 20, right: 26})
      .margin({top: 20})
    }
    .width("100%")
    .height("100%")
  }
}