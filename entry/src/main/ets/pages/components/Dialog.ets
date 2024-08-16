import { BusinessError } from '@ohos.base';
import { ComponentContent } from "@ohos.arkui.node";
import { Person } from '../../Dataapp/d1';
import { PersistenceV2 } from '@kit.ArkUI';


class Params {
  text: string = ""
  phone:string = ''
  constructor(text: string,phone:string) {
    this.text = text;
    this.phone=phone
  }
}//传参

@Builder
function buildText(params: Params) {
  Row(){
    Column() {
      Row(){
        Column(){
          Image($r('app.media.ico_tab_home_unselect'))
            .width(27.5)
            .height(27.5)
        }
        .width(40)
        .height(40)
        .backgroundColor('#FF07DA75')
        .borderRadius('50%')
        .alignItems(HorizontalAlign.Center)
        .justifyContent(FlexAlign.Center)
        Column(){
          Text(params.text)
            .fontSize(15)
            .textAlign(TextAlign.Center)
            .fontWeight(FontWeight.Bold)
            .fontColor('#FF666666')
            .fontWeight('Bold')
            .padding(8)
            .fontFamily('PingFang SC-Bold')
        }
        Blank()
        Column(){
          Image($r('app.media.ico_cancel'))
            .width(24).height(24)
            .onClick(()=>{
              // let uiContext = this.getUIContext();
              // // 获取PromptAction实例
              // let promptAction = uiContext.getPromptAction();
              // // 关闭自定义弹框
              // promptAction.close();
            })
        }
      }
      .width('100%')
      .padding({bottom:41.5})

      Text(params.phone)
        .fontSize(28)
        .fontColor('#FF040415')
        .textAlign(TextAlign.Center)
        .fontWeight('Heavy')
        .padding({bottom:2})
        .fontFamily('PingFang SC-Heavy')
      Text('华为账号绑定号码')
        .fontSize(15)
        .fontColor('#FF040415')
        .textAlign(TextAlign.Center)
        .fontWeight(FontWeight.Regular)
        .padding({ left:14,right:14,bottom:32.5})
      Button('一键登录')
        .width("100%")
        .backgroundColor('#FF01DC82')
        .fontColor('#FFFFFFFF')
        .fontWeight('Bold')
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
        }
      }
      .margin({top: 12.5})
      .width('100%')
      .padding({right:30,bottom:28})
    }
    .width("96%")
    .borderRadius(8)
    .backgroundColor('#FFF0F0F0')
    .padding(20)
  }
  .height("100%")
  .visibility(800)
  .padding({top:416})
  // 定义进场出场转场动画效果
  .transition(TransitionEffect.OPACITY.animation({duration: 800})
    .combine(TransitionEffect.translate({y: 100})))
} //自定义组件的内容


@Entry
@ComponentV2
export default struct Index {
  message: string = "乐动健康生活"
  @Local person: Person = PersistenceV2.connect(Person, () => new Person)!
  myphoney:string = this.person.phone.replace(this.person.phone.slice(3,7),'****')

  build() {
    Row() {
      Column() {
        Image($r("app.media.login_hw"))
          .width(44)
          .height(44)
          .onClick(() => {
            let uiContext = this.getUIContext();
            let promptAction = uiContext.getPromptAction();
            let contentNode = new ComponentContent(uiContext, wrapBuilder(buildText), new Params(this.message,this.myphoney));
            try {
              promptAction.openCustomDialog(contentNode);
            } catch (error) {
              let message = (error as BusinessError).message;
              let code = (error as BusinessError).code;
              console.error(`OpenCustomDialog args error code is ${code}, message is ${message}`);
            };
          })
      }

      .width('100%')
      .height('100%')
    }
    .height('100%')
  }
}
