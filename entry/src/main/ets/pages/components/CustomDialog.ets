import common from '@ohos.app.ability.common';
import dataPreferences from '@ohos.data.preferences'
// @CustomDialog
// struct CustomDialogExampleTwo {
//   controllerTwo?: CustomDialogController
//   build() {
//     Column() {
//       Text('我是第二个弹窗')
//         .fontSize(30)
//         .height(100)
//       Button('点我关闭第二个弹窗')
//         .onClick(() => {
//           if (this.controllerTwo != undefined) {
//             this.controllerTwo.close()
//           }
//         })
//         .margin(20)
//     }
//   }
// }
@CustomDialog
@Component
struct CustomDialogExample {
  @Link textValue: string
  @Link inputValue: string

  // dialogControllerTwo: CustomDialogController | null = new CustomDialogController({
  //   builder: CustomDialogExampleTwo(),
  //   alignment: DialogAlignment.Bottom,
  //   onWillDismiss:(dismissDialogAction: DismissDialogAction)=> {
  //     console.info("reason=" + JSON.stringify(dismissDialogAction.reason))
  //     console.log("dialog onWillDismiss")
  //     if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
  //       dismissDialogAction.dismiss()
  //     }
  //     if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
  //       dismissDialogAction.dismiss()
  //     }
  //   },
  //   offset: { dx: 0, dy: -25 } })
  controller?: CustomDialogController
  // 若尝试在CustomDialog中传入多个其他的Controller，以实现在CustomDialog中打开另一个或另一些CustomDialog，那么此处需要将指向自己的controller放在所有controller的后面
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }

  build() {
    // Column() {
    //   Text('Change text').fontSize(20).margin({ top: 10, bottom: 10 })
    //   TextInput({ placeholder: '', text: this.textValue }).height(60).width('90%')
    //     .onChange((value: string) => {
    //       this.textValue = value
    //     })
    //   Text('Whether to change a text?').fontSize(16).margin({ bottom: 10 })
    //   Flex({ justifyContent: FlexAlign.SpaceAround }) {
    //     Button('cancel')
    //       .onClick(() => {
    //         if (this.controller != undefined) {
    //           this.controller.close()
    //           this.cancel()
    //         }
    //       }).backgroundColor(0xffffff).fontColor(Color.Black)
    //     Button('confirm')
    //       .onClick(() => {
    //         if (this.controller != undefined) {
    //           this.inputValue = this.textValue
    //           this.controller.close()
    //           this.confirm()
    //         }
    //       }).backgroundColor(0xffffff).fontColor(Color.Red)
    //   }.margin({ bottom: 10 })
    //
    //   // Button('点我打开第二个弹窗')
    //   //   .onClick(() => {
    //   //     if (this.dialogControllerTwo != null) {
    //   //       this.dialogControllerTwo.open()
    //   //     }
    //   //   })
    //   //   .margin(20)
    // }.borderRadius(10)
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
            Text('乐动健康生活')
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

        Text('11111111')
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
    // 如果需要使用border属性或cornerRadius属性，请和borderRadius属性一起使用。
  }
}

@Entry
@Component
struct CustomDialogUser {
  @State textValue: string = ''
  @State inputValue: string = 'click me'

  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: CustomDialogExample({
      cancel: ()=> { this.onCancel() },
      confirm: ()=> { this.onAccept() },
      textValue: $textValue,
      inputValue: $inputValue
    }),
    cancel: this.exitApp,
    autoCancel: true,
    onWillDismiss:(dismissDialogAction: DismissDialogAction)=> {
      console.info("reason=" + JSON.stringify(dismissDialogAction.reason))
      console.log("dialog onWillDismiss")
      if (dismissDialogAction.reason == DismissReason.PRESS_BACK) {
        dismissDialogAction.dismiss()
      }
      if (dismissDialogAction.reason == DismissReason.TOUCH_OUTSIDE) {
        dismissDialogAction.dismiss()
      }
    },
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
    gridCount: 4,
    customStyle: false,
    cornerRadius: 10,
  })

  // 在自定义组件即将析构销毁时将dialogController置空
  aboutToDisappear() {
    this.dialogController = null // 将dialogController置空
  }

  onCancel() {
    console.info('Callback when the first button is clicked')
  }

  onAccept() {
    console.info('Callback when the second button is clicked')
  }

  exitApp() {
    console.info('Click the callback in the blank area')
  }
  build() {
    Column() {
      Button(this.inputValue)
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        }).backgroundColor(0x317aff)
    }.width('100%').margin({ top: 5 })
  }
}