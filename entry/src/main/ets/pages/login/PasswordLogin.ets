import HeaderTitle from '../components/LoginTitle'
import { router } from '@kit.ArkUI'
import TextInputicon from '../components/textinputicon'

@Entry//密码登录
@Component
struct PasswordLogin {
  @State pwd: string = ''
  build() {
    Column() {
      HeaderTitle({title: '免密登录'})
      Column() {
        Image($r("app.media.title1")).width(76).height(76).margin({top: 24})
        Text("乐动健康生活").margin({top: 18, bottom: 49}).fontColor("#040415").fontSize(18)
        TextInput({placeholder: '请输入手机号码'})
          .height(48).margin({bottom:14})
        TextInputicon({placeholder: '请输入密码'})
          .height(48)
        Text('忘记密码')
          .padding({left:200,top:12})
          .fontSize(14)
          .fontWeight('Medium')
          .onClick(()=>{
          router.pushUrl({url:'pages/login/ForgetPassword'},router.RouterMode.Single)
        })
        Button('登录')
          .width("100%")
          .margin({top: 37, bottom:140})
          .backgroundColor("#01DC82")
          .fontSize(16)
        Text("其他登录方式").fontColor("#B0B0B8")
        Row() {
          Image($r("app.media.login_wechat")).width(44).height(44)
          Image($r("app.media.login_qq")).width(44).height(44)
          Image($r("app.media.login_hw")).width(44).height(44)
        }
        .width("100%")
        .justifyContent(FlexAlign.SpaceEvenly)
        .margin({top: 24})
      }
      .padding({left: 43.5, right: 43.5,top:20})
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