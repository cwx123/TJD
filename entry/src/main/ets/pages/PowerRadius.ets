import { router } from "@kit.ArkUI"
@Entry
@Component
struct PowerRadius {
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
        Text("本服务使用中将申请以下权限：").fontSize(15).fontColor("#333333").width("100%")
        Text("相机").fontSize(15).fontColor("#333333").width("100%").margin({top: 24})
        Text("用于扫一扫连接设备或拍摄图片生成头像，海报，表盘的等；")
          .fontSize(14)
          .fontColor("#86868F")
          .width("100%")
          .margin({top: 3})
        Divider().margin({top: 12, bottom: 12})
        Text("位置信息").fontSize(15).fontColor("#333333").width("100%")
        Text("用于天气定位，运动中定位GPS 信号，蓝牙配对或提供位置相关的搜索结果；")
          .fontSize(14)
          .fontColor("#86868F")
          .width("100%")
          .margin({top: 3})
        Divider().margin({top: 12, bottom: 12})
        Text("电话").fontSize(15).fontColor("#333333").width("100%")
        Text("用于关联设备进行配对，以及设备功能如来电提醒等操作（不同设备功能可能存在差异）；")
          .fontSize(14)
          .fontColor("#86868F")
          .width("100%")
          .margin({top: 3})
        Divider().margin({top: 12, bottom: 12})
        Text("通讯录").fontSize(15).fontColor("#333333").width("100%")
        Text("用于设置设备常用联系人，与常用联系人沟通更快捷；")
          .fontSize(14)
          .fontColor("#86868F")
          .width("100%")
          .margin({top: 3,bottom: 41})
        Row() {
          Button("知道了")
            .fontSize(14)
            .width("100%")
            .backgroundColor("#01DC82")
            .onClick(()=> {
              router.pushUrl({url: "pages/swiperExample/Index"})
              console.log('知道了')
            })
        }
        .width("100%")
      }
      .padding({left: 24, right: 24, bottom: 56})

    }
    .width("100%")
    .height("100%")
  }
}