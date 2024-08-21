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
      Divider()
      Row(){
        Text('添加设备')
          .fontSize(14)
      }
      .onClick(()=>{
        router.pushUrl({url:"pages/view/Equipment/ScanBluetooth"})
        this.controller.close()
      })
    }
    .height('100%')
    .align(Alignment.Center)
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
    width:80,
    height:50,
    offset: { dx: 150, dy: 20 },
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
      Row() {
        Text("我的设备")
          .fontSize(16)
          .fontColor("#FF040415")
          .fontWeight('Bold')
          .fontFamily('PingFang SC-Bold')
        Text("更多")
          .fontSize(14)
          .fontColor("#FF393939")
          .height(20)
      }
      .height(44)
      .padding({left: 25, right: 24, bottom: 12,top:12})
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)
    }

  }
}