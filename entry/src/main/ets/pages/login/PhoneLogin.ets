import LoginTitle from '../components/LoginTitle'
import router from '@ohos.router';
import { Person } from '../../Dataapp/d1';
import { PersistenceV2 } from '@kit.ArkUI';
import Dialog from '../components/Dialog'

@Entry
@ComponentV2
struct PhoneLogin {
  @Local person: Person = PersistenceV2.connect(Person, () => new Person)!
  myphoney:string = this.person.phone.replace(this.person.phone.slice(3,7),'****')

  build() {
    Column() {
      LoginTitle({title:'帮助'})
      Column() {
        Image($r("app.media.title1"))
          .width(76)
          .height(76)
          .margin({top: 46})
        Text("乐动健康生活")
          .margin({top: 18, bottom: 65.5})
          .fontColor("#040415")
          .fontSize(18)
        Text(this.myphoney)
          .fontSize(28)
          .fontColor('#FF040415')
          .fontFamily('PingFang SC-Heavy')
          .fontWeight('Heavy')
        Text("未注册账号验证通过后自动登录")
          .fontColor("#FF040415")
          .fontSize(12)
          .padding({top:10.5})
        Button('本机号码一键登录')
          .width("100%")
          .margin({top: 58, bottom:16})
          .backgroundColor("#01DC82")
          .fontSize(16)
          .onClick(()=>{
            // router.pushUrl({url:'pages/view/Mine/Index'})

          })
        // Dialog()
        Text("其他登录方式").fontColor("#B0B0B8").padding({top: 164})

        Row() {
          Image($r("app.media.icon_login_phone_nomal")).width(44).height(44)
          Image($r("app.media.login_wechat")).width(44).height(44)
          Image($r("app.media.login_qq")).width(44).height(44)
          Dialog().width(44).height(44)
            .onClick(()=>{
              router.pushUrl({url:'pages/login/demo1'})
            })
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
          .width(13)

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
            Span("《天翼账号认证服务条款》").fontColor("#333333").fontSize(13)
              .onClick(() => {
                console.log("运营商服务条款")
              })
          }
        }.margin({left: 6})
      }
      .padding({left: 20, right: 30})
      .margin({top: 20})
    }
    .width("96%")
    .height("100%")
  }
}