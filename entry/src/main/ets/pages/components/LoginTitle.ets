import { router } from '@kit.ArkUI';

@Component
export default struct LoginTitle {
  flag: boolean = true
  title: string = ''
  @State loginurl:string=''
  aboutToAppear(): void {
    if (this.title=='密码登录') {
      this.loginurl='pages/login/PasswordLogin'
    }
    if (this.title=='免密登录') {
      this.loginurl='pages/LoginPage'
    }
    if (this.title=='帮助') {
      this.loginurl='pages/LoginPage'
    }

  }

  build() {
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
        .fontColor(this.flag? "#000000" : "#ffffff")
        .onClick(()=>{
          console.log('1233344')
          router.pushUrl({url:this.loginurl}, router.RouterMode.Single)
        })
    }
    .width("100%")
    .height(48)
    .padding({left: 19, right: 24})
    .justifyContent(FlexAlign.SpaceBetween)

  }
}