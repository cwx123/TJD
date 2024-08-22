import { router } from '@kit.ArkUI';
@Entry
@Component
export default struct Index {
  @State message: string = '个人中心';

  build() {
    Column() {
      Row() {
        Text(this.message)
          .id('mine')
          .fontSize(22)
          .fontColor("#040415")
          .fontWeight(FontWeight.Bold)
      }
      .height(44)
      .width("100%")
      .padding({left: 14, top: 7, bottom: 16})
      Scroll() {
        Column() {
          // 第一部分
          Column() {
            Row(){
              Row({space:10}){
                Image($r('app.media.mine'))
                  .width(60)
                  .height(60)
                  .borderRadius(6)
                Column({space:10}){
                  Text('注册/登录')
                    .fontColor('#040415')
                    .fontSize(18)
                  Row(){
                    Text('立即登录，数据云同步')
                      .fontColor('#86868F')
                      .fontSize(13)
                  }
                }
                .alignItems(HorizontalAlign.Start)
              }

              Image($r('app.media.arrow_right'))
                .width(22)
                .height(22)
                .onClick(()=>{
                  // router.pushUrl({url:'pages/homePage'})
                })
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({top: 16, left: 16, right: 16, bottom: 20})

            Row(){
              Text('认证信息')
                .fontWeight(500)
              Image($r('app.media.arrow_right'))
                .width(22)
                .height(22)
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({top: 16, left: 16, right: 16, bottom: 12})

            Row({space:10}){
              Image($r('app.media.startIcon'))
                .width(70)
                .height(71)
              Image($r('app.media.startIcon'))
                .width(70)
                .height(71)
              Image($r('app.media.startIcon'))
                .width(70)
                .height(71)
              Image($r('app.media.startIcon'))
                .width(70)
                .height(71)
            }
            .margin({top:10,bottom:10})
          }
          .height(243)
          .width("100%")
          .backgroundColor("#ffffff")
          .borderRadius(12)

          // 第二部分
          Column() {
            Row(){
              Row() {
                Image($r("app.media.mine1")).width(24).height(24)
                Text('我的订单')
                  .fontWeight(500)
                  .fontSize(16)
                  .fontColor("#040415")
                  .margin({left: 14})
              }
              Image($r('app.media.arrow_right'))
                .width(22)
                .height(22)
            }
            .width('100%')
            .height(56)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({top: 15, left: 14, right: 15, bottom: 16})
            Row(){
              Row() {
                Image($r("app.media.mine2")).width(24).height(24)
                Text('健康报告')
                  .fontWeight(500)
                  .fontSize(16)
                  .fontColor("#040415")
                  .margin({left: 14})
              }
              Image($r('app.media.arrow_right'))
                .width(22)
                .height(22)
            }
            .width('100%')
            .height(56)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({top: 15, left: 14, right: 15, bottom: 16})
            Row(){
              Row() {
                Image($r("app.media.mine3")).width(24).height(24)
                Text('我的数据')
                  .fontWeight(500)
                  .fontSize(16)
                  .fontColor("#040415")
                  .margin({left: 14})
              }
              Image($r('app.media.arrow_right'))
                .width(22)
                .height(22)
            }
            .width('100%')
            .height(56)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({top: 15, left: 14, right: 15, bottom: 16})
            Row(){
              Row() {
                Image($r("app.media.mine4")).width(24).height(24)
                Text('个人资料')
                  .fontWeight(500)
                  .fontSize(16)
                  .fontColor("#040415")
                  .margin({left: 14})
              }
              Image($r('app.media.arrow_right'))
                .width(22)
                .height(22)
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .height(56)
            .padding({top: 15, left: 14, right: 15, bottom: 16})
            .onClick(() => {
              router.pushUrl({url: "pages/view/Mine/PersonalData"})
            })
          }
          .height(248)
          .width("100%")
          .backgroundColor("#ffffff")
          .borderRadius(12)
          .margin({top: 10, bottom: 10})
          .padding({top: 8, bottom: 8})

          // 第三部分
          Column() {
            Row(){
              Row() {
                Image($r("app.media.mine5")).width(24).height(24)
                Text('设置')
                  .fontWeight(500)
                  .fontSize(16)
                  .fontColor("#040415")
                  .margin({left: 14})
              }
              Image($r('app.media.arrow_right'))
                .width(22)
                .height(22)
            }
            .width('100%')
            .height(56)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({top: 15, left: 14, right: 15, bottom: 16})
            .onClick(() => {
              router.pushUrl({url: "pages/view/Mine/Setting"})
            })
            Row(){
              Row() {
                Image($r("app.media.mine6")).width(24).height(24)
                Text('常见问题')
                  .fontWeight(500)
                  .fontSize(16)
                  .fontColor("#040415")
                  .margin({left: 14})
              }
              Image($r('app.media.arrow_right'))
                .width(22)
                .height(22)
            }
            .width('100%')
            .height(56)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({top: 15, left: 14, right: 15, bottom: 16})
            Row(){
              Row() {
                Image($r("app.media.mine9")).width(24).height(24)
                Text('问题与反馈')
                  .fontWeight(500)
                  .fontSize(16)
                  .fontColor("#040415")
                  .margin({left: 14})
              }
              Image($r('app.media.arrow_right'))
                .width(22)
                .height(22)
            }
            .width('100%')
            .height(56)
            .justifyContent(FlexAlign.SpaceBetween)
            .padding({top: 15, left: 14, right: 15, bottom: 16})
            Row(){
              Row() {
                Image($r("app.media.mine7")).width(24).height(24)
                Text('检查更新')
                  .fontWeight(500)
                  .fontSize(16)
                  .fontColor("#040415")
                  .margin({left: 14})
              }
              Image($r('app.media.arrow_right'))
                .width(22)
                .height(22)
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .height(56)
            .padding({top: 15, left: 14, right: 15, bottom: 16})

            Row(){
              Row() {
                Image($r("app.media.mine8")).width(24).height(24)
                Text('关于')
                  .fontWeight(500)
                  .fontSize(16)
                  .fontColor("#040415")
                  .margin({left: 14})
              }
              Image($r('app.media.arrow_right'))
                .width(22)
                .height(22)
            }
            .width('100%')
            .justifyContent(FlexAlign.SpaceBetween)
            .height(56)
            .padding({top: 15, left: 14, right: 15, bottom: 16})
          }
          .height(308)
          .width("100%")
          .backgroundColor("#ffffff")
          .borderRadius(12)
          .padding({top: 8, bottom: 8})

        }
        .onClick(()=>{
          router.pushUrl({url:"pages/LoginPage"})
        })
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .layoutWeight(1)

    }
    .linearGradient({
      direction: GradientDirection.Bottom, // 渐变方向
      repeating: false, // 渐变颜色是否重复
      colors: [['#E0FDE2', 0.0], ['#F8F8F8', 1]] // 数组末尾元素占比小于1时满足重复着色效果
    })
    .height('100%')
    .width('100%')
    .padding({left: 10, right: 10})
  }
}