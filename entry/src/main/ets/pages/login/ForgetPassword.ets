import HeaderTitle from '../components/LoginTitle'
import {  router } from '@kit.ArkUI';


@Entry
@Component
struct ForgetPassword {
  @StorageLink('phone') phone: string = '19133339999'


  build() {
    Column() {
      HeaderTitle()
      Text('忘记密码')
        .fontSize(20)
        .fontWeight('bold')
        .padding({bottom:16,right:222,top:32})
      Text('输入注册的手机号')
        .fontWeight('Regular')
        .padding({right:170,bottom:55.5})
      Column(){
        TextInput({placeholder:'请输入手机号'})
          .height(48)
          .onChange((value: string) => {
            this.phone = value
          })
        Button('下一步')
          .width("100%")
          .height(48)
          .margin({top: 36, bottom:76})
          .backgroundColor("#01DC82")
          .fontSize(16)
          .onClick(()=>{
            router.pushUrl({url:'pages/login/AuthCode'},router.RouterMode.Single)
          })
      }
      // .padding({left: 20, right: 26})
      .margin({top: 20})
      .padding({left: 43.5, right: 43.5})
    }

  }
}