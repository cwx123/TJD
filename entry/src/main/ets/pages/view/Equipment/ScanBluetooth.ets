import { router } from '@kit.ArkUI'
import { abilityAccessCtrl, PermissionRequestResult } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { access, ble } from '@kit.ConnectivityKit';
//扫描蓝牙页面
@Entry
@Component
struct ScanBluetooth {
  @State title:string='添加设备'//头部标题
  @State onReceiveEventData: string = ''//
  @State isScan: boolean = false//蓝牙打开状态
  @State bluetoothlist:Array<ble.ScanResult> = []//扫描到的蓝牙列表
  @State dataString:string = ''
  @State rotateAngle: number = 0//旋转角度
  @State scanboolean:boolean = true//是否扫描
  @State deviceId:string = ''//设备id
  @State deviceName:string = ''//设备名称
  @State deviceindex:number =0//点击需要连接的设备索引
  @State deviceIdArr : Array<string> = [];

  //获取用户授权蓝牙
  requestPermissionsFromUser() {
    let atManager: abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
    try {
      let context = getContext(this);
      atManager.requestPermissionsFromUser(context, ['ohos.permission.ACCESS_BLUETOOTH'],
        (err: BusinessError, data: PermissionRequestResult) => {
          // console.log('data:' + JSON.stringify(data));
          // console.log('data permissions:' + data.permissions);
          // console.log('data authResults:' + data.authResults);
        });
    } catch (err) {
      console.log(`catch err->${JSON.stringify(err)}`);
    }
  }
  //打开蓝牙扫描
  openbluetooth(){
    this.isScan = !this.isScan
    let onReceiveEvent = (data: Array<ble.ScanResult>) => {
      //返回的单条数据是数组包裹一条对象数据
      let oneDevice : ble.ScanResult = JSON.parse(JSON.stringify(data))[0];
      //过滤返回的数据，将不为空并且不重复的设备加入数组
      if (oneDevice && !this.deviceIdArr.includes(oneDevice.deviceId)) {
        if (oneDevice.connectable && oneDevice.deviceName) {
          this.bluetoothlist.push(oneDevice);
          this.deviceIdArr.push(oneDevice.deviceId);
        }
      }
      console.log('BLE scan device find Arrlist = ' + JSON.stringify(this.bluetoothlist));
    }
    try {
      //开启扫描
      ble.on("BLEDeviceFind", onReceiveEvent);
      //16s后关闭扫描
      setTimeout(()=>{
        this.scanboolean = false
        ble.off("BLEDeviceFind", onReceiveEvent);
      },15000)
      //过滤扫描的设备
      let scanFilter: ble.ScanFilter = {
        deviceId:"XX:XX:XX:XX:XX:XX",
        name:"test",
        // serviceUuid:"xxxx"
      };
      // console.log('scanFilter' + JSON.stringify(scanFilter))
      let scanOptions: ble.ScanOptions = {
        interval: 50,
        dutyMode: ble.ScanDuty.SCAN_MODE_LOW_POWER,
        matchMode: ble.MatchMode.MATCH_MODE_AGGRESSIVE,
      }
      //开始搜寻附近的低功耗蓝牙外围设备。搜索并连接到设备后调用bluetooth.stopBLEScan方法停止搜索
      ble.startBLEScan(null, scanOptions);
    } catch (err) {
      console.log('errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
    }
  }
  //连接蓝牙配对
  connectbluetooth(){

  }
  //雷达图动画
  radarmap(){
    animateTo({
      duration: 5000,
      curve: Curve.Linear,
      iterations: 3, // 设置-1表示动画无限循环
    }, () => {
      this.rotateAngle = 360
    })
  }

  aboutToAppear(): void {
    //获取用户授权蓝牙
    this.requestPermissionsFromUser()
    //打开蓝牙扫描
    this.openbluetooth()

  }
  onPageShow(){
    this.radarmap()
  }

  build() {
    Column(){
      //顶部
      Row() {
        Image($r("app.media.arrow_left"))
          .width(28)
          .height(28)
          .onClick(() => {
            router.back()
          })
        Text(this.title)
          .fontSize(16)
          .fontWeight(400)
          .fontColor(Color.Black)
          .height(48)
        Image($r("app.media.saoyisao"))
          .width(19)
          .height(19)

      }
      .width("100%")
      .height(48)
      .padding({left: 19, right: 24})
      .justifyContent(FlexAlign.SpaceBetween)
      //雷达图
      Row(){
        Stack(){
          Image($r('app.media.img_scan_gif_1'))
            .width(180).height(180)
          Image($r('app.media.img_scan_rotation'))
            .width(180).height(180)
            .rotate({ x: 0, y: 0, z: 1, angle: this.rotateAngle })
            .onClick(() => {
              // this.radarmap()
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
          Text(this.scanboolean?'正在搜索可用设备':'搜索可用设备')
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
            .onClick(()=>{
              this.bluetoothlist = []
              this.openbluetooth()
              this.radarmap()
            })
        }
      }
      // 扫描出来的设备
      Row(){
        Scroll() {
          List() {
            ForEach(this.bluetoothlist, (item:ble.ScanResult,index) => {
              ListItem() {
                Row(){
                  Image($r('app.media.img_scan_device_square'))
                    .width(24).height(37)
                  Column(){
                    Text(item.deviceName)
                    Text(item.deviceId)
                  }
                  .alignItems(HorizontalAlign.Start)
                  Button('连接')
                    .backgroundColor('#FFF0F1F0')
                    .fontColor('#FF07C05D')
                    .fontSize(13)
                    .onClick(() => { // 点击对应设备，高亮并获取设备ID与设备名，用于后续连接
                      this.deviceId = item.deviceId;
                      this.deviceName = item.deviceName;
                      this.deviceindex = index;

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