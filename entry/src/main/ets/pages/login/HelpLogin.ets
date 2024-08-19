import { router } from '@kit.ArkUI'
interface arrlist {
  Q:string;
  A:string;
}
@Entry
@Component
struct HelpLogin {
  @State helparrlist :Array<arrlist> = [
    {Q:'Q：收不到验证码？',A:'A： 您好，短信可能会延迟，请耐心等一会儿。如果等待一段时间后还是无法收到短信验证码，建议您：\n ' +
      '1.检查您的手机号是否输入正确无误，是否是空号。\n 2.检查您的手机是否已经停机/关机/没有信号。\n ' +
      '3.检查您的垃圾短信箱，确保短信没有被屏蔽。'},
    {Q:'Q：使用手机号登录不了?',A:'A： 若您首次登陆，请先将乐动健康生活  APP升级到最新版本，在登录页面输入手机号后点击「获取短信验证码」；' +
      '输入验证码时，请先勾选「用户协议和隐私政策」左侧的「小圈圈」，然后再进行注册登录。'},
    {Q:'Q：第三方登录失败',A:'A： 您好，如您注册登录时出现了第三方登录，可进行如下检查；\n' +
      '1、确保您已经在手机上登录了第三方应用;\n' +
      '2、因第三方登录服务出现问题，暂无法使用，请使用手机/邮箱账号密码登录; \n' +
      '3、使用不同的第三方账号将会登录不同的‘乐动健康生活’账号，若您有多个第三方账号，' +
      '请确认使用您想登录的‘乐动健康生活’账号所绑定的第三方账号进行登录，否则登录有可能失败;'},
    {Q:'Q：登录时提示「访问频繁/系统繁忙」',A:'A： 您好，如果您登录时出现了「访问频繁」或「系统繁忙」的提示，建议您可以过一段时间再尝试。\n' +
      '温馨提示：正规应用商店下载的乐动健康生活 APP才能保证您的正常使用，如您持续无法登陆可尝试从正规应用商店重新下载。'},
    {Q:'Q：收不到邮箱验证码',A:'A：您好， 邮箱验证码可能会延迟，请耐心等一会儿。 如果等待 -段时间后还是无法收到邮箱验证码；\n' +
      '1、检查您的邮箱地址是否输入正确无误;\n' +
      '2、检查您的邮箱设置是否有问题，误设置为黑名单;\n' +
      '3、检查您的邮箱内存是否满了;'},
    {Q:'Q：一键登录失败?',A:'A：检查您的SIM是否松动，确保SIM卡可被检测；'}
  ]

  build() {
    Column(){
      Row() {
        Image($r("app.media.arrow_left")).width(28).height(28)
          .onClick(() => {
            router.back()
          })
        Text('常见问题')
          .fontSize(18)
          .fontWeight('Bold')
          .fontColor('#FF040415')
          .height(48)
        Text(' ').width(28).height(28)
      }
      .width("100%")
      .height(48)
      .padding({left: 19, right: 24})
      .justifyContent(FlexAlign.SpaceBetween)

      Scroll(){
        List() {
          ForEach(this.helparrlist, (item: arrlist, index: number) => {
            ListItem() {
              // 使用 Text 组件显示问题和答案，或者根据需要自定义布局
              Column() {
                Text(item.Q)
                  .fontSize(16)
                  .fontWeight('Bold')
                  .width("100%")
                  .fontColor('#FF040415')
                  .padding({bottom:8})
                  .fontFamily('PingFang SC-Bold')
                Text(item.A)
                  .fontSize(14)
                  .fontWeight('Normal')
                  .width("100%")
                  .fontColor('#FF040415')
                  .fontFamily('PingFang SC-Bold')
                  .lineHeight(24)
              }
              .width("100%")
              .padding({top:16,left:24,right:24})
              .justifyContent(FlexAlign.Start)
            }
          })
        }
      }
      .padding({bottom:30})
    }
  }
}