import { router } from '@kit.ArkUI'

//设备头部加号弹框
@CustomDialog
struct EquipmentDialog {
  cancel?: () => void
  confirm?: () => void
  controller: CustomDialogController

  build() {
    Column() {
      Row(){
        Text('扫一扫')
          .fontSize(14)
      }
      Divider().padding({top:5,bottom:5})
      Row(){
        Text('添加设备')
          .fontSize(14)
      }
      .onClick(()=>{
        router.pushUrl({url:"pages/view/Equipment/ScanBluetooth"},router.RouterMode.Single)
        this.controller.close()
      })
    }
    .height('100%')
    .align(Alignment.Center)
    .justifyContent(FlexAlign.Center)
  }
}



@Component
export default struct Index {
  @State message: string = '设备页面';
  dialogController: CustomDialogController = new CustomDialogController({
    builder: EquipmentDialog({
      cancel: ()=> { this.onCancel() },
      confirm: ()=> { this.onAccept() },
    }),
    width:100,
    height:60,
    offset: { dx: 150, dy: -310 },

  })
  onCancel() {
    this.dialogController.close()
    console.log('1111111111111')
  }

  onAccept() {
    console.log('Callback when the second button is clicked')
  }

  build() {
    Column(){
      //顶部
      Row() {
        Text("设备").fontSize(28).fontColor("#040415")
        Text("+").fontSize(16).fontColor("#212135")
          .height(20)
          .width(20)
          .borderWidth(1)
          .borderRadius(4)
          .borderColor("#212135")
          .textAlign(TextAlign.Center)
          .onClick(()=>{
            this.dialogController.open()
          })
      }
      .height(44)
      .padding({left: 25, right: 24, bottom: 12,top:12})
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
      // Row() {
      //   Text("我的设备")
      //     .fontSize(16)
      //     .fontColor("#FF040415")
      //     .fontWeight('Bold')
      //     .fontFamily('PingFang SC-Bold')
      //   Text("更多")
      //     .fontSize(14)
      //     .fontColor("#FF393939")
      //     .height(20)
      // }
      // .height(44)
      // .padding({left: 25, right: 24, bottom: 12,top:12})
      // .width("100%")
      // .justifyContent(FlexAlign.SpaceBetween)
      Row(){
        Image($r('app.media.ico_device_network_unconnect'))
          .width(20).height(20)
          .margin({right:8.5,left:14})
        Text('网络未连接')
          .fontSize(14)
          .fontColor('#FF040415')
          .fontWeight('bold')
        Blank()
        Text('请检查网络设置')
          .fontColor('#FF86868F')
          .fontSize(13)
        Image($r('app.media.arrow_right'))
          .width(22).height(22)
      }
      .width('90%')
      .height(48)
      .backgroundColor('#FFF0F1F0')
      .borderRadius(12)
      .margin({top:10,bottom:10})
      .visibility(Visibility.None)
      Row(){
        Stack({ alignContent: Alignment.Start }){
          Image($r("app.media.bg_device_add"))
            .width(355)
            .height(120)
            .borderRadius(12)
          Column(){
            Text('添加设备')
              .fontColor('#FF040415')
              .fontWeight('Bold')

            Text('可添加多台设备')
              .fontColor('#FF86868F')
              .fontSize(12)
              .padding({top:2})
          }
          .width(120)
          .alignItems(HorizontalAlign.Start)
          .padding({left:14})
        }
      }
      .padding({bottom:16})
      Row(){
       Column(){
         Row(){
           Text('推荐表盘')
             .fontColor('#FF040415')
             .fontWeight('Bold')
           Text('更多')
             .fontSize(14)
             .fontColor('#FF393939')
         }
         .width('90%')
         .justifyContent(FlexAlign.SpaceBetween)
         .padding({bottom:8})

         Stack({ alignContent: Alignment.Bottom }){
           Image($r("app.media.bg_dials_empty"))
             .width(355)
             .height(184)
             .borderRadius(12)
           Text('去绑定设备')
             .width(131)
             .height(32)
             .lineHeight(24)
             .fontSize(14)
             .fontWeight('Medium')
             .fontColor('#FF86868F')
             .textAlign(TextAlign.Center)
             .border({width:1,radius:24,color:'#FF86868F'})
             .margin({bottom:14.5})
             .onClick(()=>{
               router.pushUrl({url:"pages/view/Equipment/ScanBluetooth"},router.RouterMode.Single)
             })
         }
       }
      }
      Column(){
        Row(){
          Text('帮助指南')
            .fontColor('#FF040415')
            .fontWeight('Bold')
        }
        .width('90%')
        .padding({bottom:8})
        .justifyContent(FlexAlign.Start)

        Column(){
          Row(){
            Image($r('app.media.icon_device_help'))
              .height(72).width(72)
            Column(){
              Text('手机权限设置')
                .fontColor('#FF393939')
                .fontSize(15)
                .fontWeight('Bold')
                .padding({bottom:4})
              Text('允许后手表与手机连接更稳定')
                .fontWeight('Medium')
                .fontColor('#FFB0B0B8')
                .fontSize(12)
            }
            .alignItems(HorizontalAlign.Start)
            .margin({right:60,left:8})
            Image($r('app.media.arrow_right'))
              .width(22).height(22)
          }
        }
        .width(355)
        .height(102)
        .borderRadius(12)
        .backgroundColor('#FFFFFFFF')
        .justifyContent(FlexAlign.Center)
      }
      .padding({top:16})
    }
    .backgroundColor('#FFF8F8F8')
    .height('100%')
  }
}