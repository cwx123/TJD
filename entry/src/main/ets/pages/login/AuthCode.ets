import HeaderTitle from '../components/LoginTitle'
import { TextInputCodeView } from '../components/TextInputCodeView'
import { router } from '@kit.ArkUI';

@Entry
@Component
struct AuthCode {

  @State counttimer:number=60;
  @StorageLink('phone') phone: string = ''

  aboutToAppear(): void {
    let timer1 = setInterval(()=>{
      if(this.counttimer>0){
        this.counttimer--
      }
    },1000)
  }

  build() {
    Column() {
      HeaderTitle()
      Text('请输入验证码')
        .width('100%')
        .fontSize(20)
        .fontWeight('bold')
        .padding({ bottom: 16, left:46, top: 32 })
        .textAlign(TextAlign.Start)
      Row(){
        Text('验证码已发送至')
          .fontWeight('Regular')
          .fontFamily('PingFang SC-Regular')
          .textAlign(TextAlign.Start)
        Text(this.phone.substring(0,3))
          .fontWeight('bold')
          .padding({left:4})
        Text(this.phone.substring(3,7))
          .fontWeight('bold')
          .padding({left:4})
        Text(this.phone.substring(7,11))
          .fontWeight('bold')
          .padding({left:4})
      }.width('100%') .padding({ left:46, bottom: 74.5 })

      Column() {
        TextInputCodeView()
        Button('登录/注册')
          .width("100%")
          .height(48)
          .margin({ top: 36 })
          .backgroundColor("#01DC82")
          .fontSize(16)
          .onClick(()=>{
            router.pushUrl({url:'pages/login/PerfectInfo'})
          })
        Text(this.counttimer?this.counttimer+' S':'重新获取')
          .padding({top:16,bottom:238})
        Text('验证码已发送，5分钟内有效')
          .width(192).height(60)
          .backgroundColor('#4D4A4A4B')
          .borderRadius(8)
          .fontSize(12)
          .fontColor('#FFFFFFFF')
          .fontWeight('Regular')
          .textAlign(TextAlign.Center)
        Text('《隐私声明》')
          .fontFamily('PingFang SC-Regular')
          .fontSize(12)
          .fontColor('#FF040415')
          .padding({top:21.5})
      }
      .margin({ top: 20 })
      .padding({ left: 43.5, right: 43.5 })
    }
  }
}