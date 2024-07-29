@Entry
@Component
struct welcome {
  build() {
    Column() {
      Column() {
        Image($r("app.media.title1")).height("60vp").width("60vp")
        Text('欢迎使用').fontColor("#333333").fontSize(15).margin({top: 6, bottom: 6})
        Text('乐动健康生活').fontColor("#333333").fontSize(24)
      }
      .padding({top: 52})
      .layoutWeight(1)

      Column() {
        Row() {
          Flex({wrap: FlexWrap.Wrap, justifyContent: FlexAlign.Start}) {
            Text() {
              Span("本服务需联网，收集个人基本资料，账号信息，运动健康信息，应用信息，网络信息，位置信息，个性化信息，以及您能主动上传的数据，以提供运动健康相关服务，点击‘同意’即表示同意")
                .fontColor("#86868F").fontSize(13)
              Span("《乐动健康生活用户协议》").fontColor("#333333").fontSize(13)
                .onClick(() => {
                  console.log("乐动健康生活用户协议")
                })
              Span("。个人信息处理详情，请参阅关于").fontColor("#86868F").fontSize(13)
              Span("《乐动健康生活隐私声明》").fontColor("#333333").fontSize(13)
                .onClick(() => {
                  console.log("乐动健康生活隐私声明")
                })
              Span("。").fontColor("#86868F").fontSize(13)
            }
            // Text("本服务需联网，收集个人基本资料，账号信息，运动健康信息，应用信息，网络信息，位置信息，个性化信息，以及您能主动上传的数据，以提供运动健康相关服务，点击‘同意’即表示同意")
            //   .fontColor("#86868F").fontSize(12)
            // Text("《乐动健康生活用户协议》").fontSize(13)
            // Text("。个人信息处理详情，请参阅关于").fontColor("#86868F").fontSize(13)
            // Text("《乐动健康生活隐私声明》").fontSize(13)
            // Text("。").fontColor("#86868F").fontSize(13)
          }
        }
        .width("100%")
        .padding({left: 20, right: 20, bottom: 28})

        Row() {
          Button("同意")
            .fontSize(14)
            .width("100%")
            .backgroundColor("#01DC82")
            .onClick(()=> {
              console.log('同意')
            })
        }
        .width("100%")
        .padding({left: 24, right: 24, bottom: 8})

        Row() {
          Button("退出")
            .fontSize(14)
            .width("100%")
            .fontColor("#333333")
            .backgroundColor("#F0F1F0")
            .onClick(()=> {
              console.log('同意')
            })
        }
        .width("100%")
        .padding({left: 24, right: 24, bottom: 56})
      }
    }
    .width("100%")
    .height("100%")
  }
}