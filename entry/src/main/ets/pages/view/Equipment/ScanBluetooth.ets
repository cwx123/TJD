import { router } from '@kit.ArkUI'
import { abilityAccessCtrl, PermissionRequestResult } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import connection from '@ohos.bluetooth.connection';
import { access } from '@kit.ConnectivityKit';
//扫描蓝牙页面
@Entry
@Component
struct ScanBluetooth {
@State title:string='添加设备'
  @State onReceiveEventData: string = ''
  @State isScan: boolean = false
  @State Arrlist:Array<string> = []
  @State dataString:string = ''

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
    let onReceiveEvent = (data: Array<string>) => {
      this.dataString = JSON.stringify(data)
      this.Arrlist.push(this.dataString)
    }
    try {
      connection.on('bluetoothDeviceFind', onReceiveEvent);
      connection.startBluetoothDiscovery();
    } catch (err) {
      console.log('errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
    }
  }
  scanbluetooth(){
    try {
      let result: Array<string> = connection.getPairedDevices();
      result.forEach(s => {

        let remoteDeviceName: string = connection.getRemoteDeviceName("41:40:6E:E1:53:69");//"32:6C:C7:8E:0C:C9"
        console.log('remoteDeviceName',remoteDeviceName)
        let localName: string = connection.getLocalName();
        console.log('localName',localName)

      })
    } catch (err) {
      console.log('errCode: ' + (err as BusinessError).code + ', errMessage: ' + (err as BusinessError).message);
    }
  }

  aboutToAppear(): void {
    this.requestPermissionsFromUser()
    this.openbluetooth()
    this.scanbluetooth()
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
        Image($r("app.media.saoyisao")).width(28).height(28)

      }
      .width("100%")
      .height(48)
      .padding({left: 19, right: 24})
      .justifyContent(FlexAlign.SpaceBetween)
      Row(){
        Scroll() {
          List() {
            ForEach(this.Arrlist, (item: string) => {
              ListItem() {
                Text(item)
              }
              .width('100%')
            })
          }
          .width('100%').height('100%')
        }
        .height(400)
        .width(700)
        .align(Alignment.Center)
        .width('100%')
      }
      .width('100%')
      .align(Alignment.Center)
    }
  }
}