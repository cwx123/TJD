
import { scanBarcode, scanCore } from '@kit.ScanKit';
import { BusinessError } from '@kit.BasicServicesKit';
// import { ScanBarcodeRes} from  '../../../model/ScanBarcodeRes'

// 定义扫码参数options
let options: scanBarcode.ScanOptions = { scanTypes: [scanCore.ScanType.ALL], enableMultiMode: true, enableAlbum: true };
scanBarcode.startScanForResult(getContext(this), options).then((result: scanBarcode.ScanResult) => {
  let scanType= result.scanType
  let originalValue= result.originalValue

  console.log('scanType',scanType)
  console.log('originalValue',originalValue)
  // ohos.openUrl({ url: '扫码获得的链接' });
}).catch((error: BusinessError) => {
  console.log( '[Scan Sample]', `Failed to get ScanResult by promise with options. Code: ${error.code}, message: ${error.message}`);
})

//扫一扫
@Entry
@Component
struct Sweep {


  build() {
    Column(){
      Button('click')
        .onClick(()=>{
          options
        })
    }
  }
}