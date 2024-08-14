import HeaderTitle from './components/LoginTitle'
//忘记密码
@Entry
@Component
struct ForgetPwd {
  build() {
    Column() {
      HeaderTitle({title: '.', flag: false})
      Column() {
        Text("忘记密码").margin({top: 32, bottom: 18}).fontColor("#040415").fontSize(20).width("100%")
        Text("输入注册的手机号").margin({ bottom: 55}).fontColor("#040415").fontSize(16).width("100%")
        TextInput({placeholder: '请输入手机号码'})
          .height(48)
        Button('下一步')
          .width("100%")
          .margin({top: 36})
          .backgroundColor("#01DC82")
          .fontSize(16)
        // Text("未注册账号验证通过后自动登录").fontColor("#B0B0B8").padding({bottom: 108})
        // Text("其他登录方式").fontColor("#B0B0B8")
        // Row() {
        //   Image($r("app.media.login_dianxin")).width(44).height(44)
        //   Image($r("app.media.login_wechat")).width(44).height(44)
        //   Image($r("app.media.login_qq")).width(44).height(44)
        //   Image($r("app.media.login_ios")).width(44).height(44)
        // }
        // .width("100%")
        // .justifyContent(FlexAlign.SpaceEvenly)
        // .margin({top: 24})
      }
      .padding({left: 43.5, right: 43.5})

    }
    .width("100%")
    .height("100%")
  }
}