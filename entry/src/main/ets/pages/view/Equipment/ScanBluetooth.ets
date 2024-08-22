import { router } from '@kit.ArkUI'
import { abilityAccessCtrl, PermissionRequestResult } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import connection from '@ohos.bluetooth.connection';
import { access, ble } from '@kit.ConnectivityKit';
//扫描蓝牙页面
@Entry
@Component
struct ScanBluetooth {
@State title:string='添加设备'
  @State onReceiveEventData: string = ''
  @State isScan: boolean = false
  @State Arrlist:Array<ble.ScanResult> = []
  @State dataString:string = ''
  @State rotateAngle: number = 0//旋转角度
  @State scanboolean:boolean = true


  requestPermissionsFromUser() {
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    try {
      let context = getContext(this);
      atManager.requestPermissionsFromUser(context, ['ohos.permission.ACCESS_BLUETOOTH'],
        (err: BusinessError, data: PermissionRequestResult) => {
          console.log('data:' + JSON.stringify(data));
          console.log('data permissions:' + data.permissions);
          console.log('data authResults:' + data.authResults);
        });
    } catch (err) {
      console.log(`catch err->${JSON.stringify(err)}`);
    }
  }
  openbluetooth(){
    this.isScan = !this.isScan

    let onReceiveEvent = (data: Array<ble.ScanResult>) => {
      console.log('BLE scan device find result = ' + JSON.stringify(data));
      this.Arrlist = JSON.parse(JSON.stringify(data));
      // if (!this.Arrlist.includes(dataString)) {
      //   this.Arrlist.push(dataString);
      // }
      console.log(this.Arrlist+'')
      // this.onReceiveEventData = dataString
    }
    try {
      ble.on("BLEDeviceFind", onReceiveEvent);
      let scanFilter: ble.ScanFilter = {
        // deviceId:"xxxx",
        // name:"test",
        // serviceUuid:"xxxx"
      };
      console.log('scanFilter' + JSON.stringify(scanFilter))
      let scanOptions: ble.ScanOptions = {
        interval: 50,
        dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
        matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
      }
      ble.startBLEScan(null, scanOptions);

    } catch (err) {
      console.log('errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
    }
  }
  // scanbluetooth(){
  //   try {
  //     let result: Array<string> = connection.getPairedDevices();
  //     result.forEach(s => {
  //       let remoteDeviceName: string = connection.getRemoteDeviceName("41:40:6E:E1:53:69");//"32:6C:C7:8E:0C:C9"
  //       console.log('remoteDeviceName',remoteDeviceName)
  //       let localName: string = connection.getLocalName();
  //       console.log('localName',localName)
  //
  //     })
  //     this.scanboolean=false
  //     console.log(this.scanboolean+'2222222222222')
  //   } catch (err) {
  //     console.log('errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
  //   }
  // }
  //扫描旋转动画
  starblue():void{
    animateTo({
      duration: 5000,
      curve: Curve.Linear,
      delay: 500,
      iterations: -1, // 设置-1表示动画无限循环
      expectedFrameRateRange: {
        min: 10,
        max: 120,
        expected: 60,
      }
    }, () => {
      this.rotateAngle = 360
    })
  }

  aboutToAppear(): void {
    //获取用户授权蓝牙
    this.requestPermissionsFromUser()
    //打开蓝牙扫描
    this.openbluetooth()
    //蓝牙匹配名称
    // this.scanbluetooth()
  }

  build() {
    Column(){
      Row() {
        Image($r("app.media.arrow_left")).width(28).height(28)
          .onClick(() => {
            router.back()
          })
        Text(this.title)
          .fontSize(16)
          .fontWeight(400)
          .fontColor(Color.Black)
          .height(48)
          .onClick(()=>{
            // router.pushUrl({url:this.loginurl}, router.RouterMode.Single)
          })
        Image($r("app.media.saoyisao")).width(19).height(19)

      }
      .width("100%")
      .height(48)
      .padding({left: 19, right: 24})
      .justifyContent(FlexAlign.SpaceBetween)
      //雷达图
      Row(){
        Stack(){
          Image($r('app.media.img_scan_gif_1'))
            .width(240).height(240)
          Image($r('app.media.img_scan_rotation'))
            .width(240).height(240)
            .rotate({ x: 0, y: 0, z: 1, angle: this.rotateAngle })
            .onClick(() => {
              this.starblue()
            })
        }
      }
      .margin({bottom:25})
      Row(){
        Column(){
          Text(this.scanboolean?'正在扫描':'扫描结束')
            .fontColor('#FF040415')
            .fontWeight('Bold')
            .fontSize(18)
            .padding({bottom:8})
          Text(this.scanboolean?'正在搜索可用设备':'未发现可用设备')
            .fontColor('#FF86868F')
            .fontSize(13)
          Button(this.scanboolean?'停止搜索':'重新扫描')
            .backgroundColor('#FFE5F7EF')
            .fontColor('#FF07C05D')
            .fontSize(15)
            .fontWeight('Medium')
            .height(44)
            .width(148)
            .margin({top:24})
            .visibility(this.Arrlist.length?Visibility.None:Visibility.Visible)
        }
      }
      // 扫描出来的设备
      Row(){
        Scroll() {
          List() {
            ForEach(this.Arrlist, (item: string) => {
              ListItem() {
                Row(){
                  Image($r('app.media.img_scan_device_square'))
                    .width(24).height(37)
                  Column(){
                    Text('设备名称')
                    Text(item)
                  }
                  .alignItems(HorizontalAlign.Start)
                  Button('连接')
                    .backgroundColor('#FFF0F1F0')
                    .fontColor('#FF07C05D')
                    .fontSize(13)
                    .onClick(()=>{
                    console.log('链接蓝牙')
                  })

                }
                .width('100%')
                .justifyContent(FlexAlign.SpaceAround)
                .height(80)
                .borderRadius(12)
                .backgroundColor('#FFFFFFFF')
                .align(Alignment.Center)
              }
              .width('100%')
              .padding({top:5,bottom:5,left:10,right:10})
            })
          }
          .width('100%').height('100%')
        }
        .height(356)
        .width(700)
        .align(Alignment.Center)
        .width('100%')
      }
      .width('100%')
      .align(Alignment.Center)
      .padding({top:4})
      Text('搜索不到设备？')
        .fontColor('#FF07C05D')
        .margin({top:20,bottom:20})
    }
    .backgroundColor('#FFF8F8F8')
  }
}