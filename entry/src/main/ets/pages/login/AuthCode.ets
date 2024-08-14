import HeaderTitle from '../components/LoginTitle'
import { KeyCode } from '@kit.InputKit';
import { router } from '@kit.ArkUI';


@Styles function codeline  () {
  .height(4).width(40)
}
@Component
struct codeInputView{
  @State code: string = '';
  @State keyno:number=0;
  @State keyStr:string='code0';

  build() {
    //验证码输入数字
    TextInput()
      .textAlign(TextAlign.Center)
      .backgroundColor('white')
      .maxLength(1)
      .type(InputType.Number)
      .fontWeight('Bold')
      .fontSize(24)
      .key(this.keyStr)
      .onChange((value)=>{
        if(value.length==1){
          if(this.keyno!=5){
            let nextKeyNo: number = this.keyno + 1
            let nextKeyStr = 'code' + nextKeyNo
            focusControl.requestFocus(nextKeyStr)
          }
        }
      })
        // 删除验证码时执行的方法回调
      .onKeyEvent((event: KeyEvent) => {
        if (event.keyCode == KeyCode.KEYCODE_DEL) {
          // 当code值不为空时，删除code值
          if (this.code != '') {
            this.code = ''
          } else if (this.keyno > 0) {
            let preKeyNo: number = this.keyno - 1
            let preKeyStr = 'code' + preKeyNo
            focusControl.requestFocus(preKeyStr)
          }
        }
      })
  }
}


@Entry
@Component
struct AuthCode {
  @State phone:string = '18866669999';
  @State code:string = '111111'
  @State counttimer:number=60;

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
        Row(){
          Flex(){
            codeInputView({keyno:0, keyStr: 'code0',})
            codeInputView({keyno:1, keyStr: 'code1',})
            codeInputView({keyno:2, keyStr: 'code2',})
            codeInputView({keyno:3, keyStr: 'code3',})
            codeInputView({keyno:4, keyStr: 'code4',})
            codeInputView({keyno:5, keyStr: 'code5',})
          }
        }
        Flex({justifyContent:FlexAlign.SpaceAround}){
          Column(){}.codeline().backgroundColor('#01DC82')
          Column(){}.codeline().backgroundColor('#F2F2F2')
          Column(){}.codeline().backgroundColor('#F2F2F2')
          Column(){}.codeline().backgroundColor('#F2F2F2')
          Column(){}.codeline().backgroundColor('#F2F2F2')
          Column(){}.codeline().backgroundColor('#F2F2F2')
        }.width('100%')


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
      // .padding({left: 20, right: 26})
      .margin({ top: 20 })
      .padding({ left: 43.5, right: 43.5 })
    }
  }
}