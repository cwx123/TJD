import LoginTitle from './components/LoginTitle'
import router from '@ohos.router';

PersistentStorage.persistProp('phone', '19133339999');

@Entry
@Component
struct LoginPage {
  phone1 :string=''
  customPopup: boolean = false
  @StorageLink('phone') phone: string = '19133339999'

  @Builder popupBuilder() {
    Row() {
      Text('请输入正确的手机号或者邮箱').fontSize(10)
    }
    .height(50)
    .padding(5)
  }

  handleInput(value: string) {
    const phoneRegex = /^1[3-9]\d{9}$/;
    if (phoneRegex.test(value)) {
      this.phone=value
      router.pushUrl({ url: 'pages/login/AuthCode' })
    } else {
      this.customPopup = true
    }
  }
  build() {
    Column() {
      LoginTitle({title: '密码登录'})
      Column() {
        Image($r("app.media.title1")).width(76).height(76).margin({top: 46})
        Text("乐动健康生活").margin({top: 18, bottom: 95}).fontColor("#040415").fontSize(18)
        TextInput({placeholder: '请输入手机号码'})
          .height(48)
          .inputFilter('[0-9]',()=>{
            return 0
          })
          .onChange((value: string) => {
            this.phone1 = value

          })
        Button('下一步')
          .width("100%")
          .margin({top: 36, bottom:16})
          .backgroundColor("#01DC82")
          .fontSize(16)
          .onClick(()=>{
            this.handleInput(this.phone1);

            let timer2 = setTimeout(()=>{
              this.customPopup = false
            },4000)
          })
          .bindPopup(this.customPopup, {
            builder: this.popupBuilder,
            targetSpace: 220,
            enableArrow: false, // 气泡弹出时不显示箭头
            onStateChange: (e) => {
              if (!e.isVisible) {
                this.customPopup = false
              }
            }
          })

        Text("未注册账号验证通过后自动登录").fontColor("#B0B0B8").padding({bottom: 148})
        Text("其他登录方式").fontColor("#B0B0B8")

        Row() {
          Image($r("app.media.login_dianxin")).width(44).height(44)
            .onClick(()=>{
              router.pushUrl({url:'pages/login/PhoneLogin'})
            })
          Image($r("app.media.login_wechat")).width(44).height(44)
          Image($r("app.media.login_qq")).width(44).height(44)
          Image($r("app.media.login_hw")).width(44).height(44)
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
            console.log('Checkbox1 change is'+ value)
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
            Span("《运营商服务条款》").fontColor("#333333").fontSize(13)
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