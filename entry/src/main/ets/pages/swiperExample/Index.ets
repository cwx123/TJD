import swiperPage1 from './swiperPage1'
import swiperPage2 from './swiperPage2'
import swiperPage3 from './swiperPage3'
import swiperPage4 from './swiperPage4'
@Entry
@Component
struct Index {
  build() {
    Column() {
      Column() {
        Text("跳过").width("100%").fontSize(15).fontColor("#B0B0B8").height(44)
          .textAlign(TextAlign.End).padding({right: 24})
        Swiper() {
          swiperPage1()
          swiperPage2()
          swiperPage3()
          swiperPage4()
        }
        .index(0) // 初始化索引值
        .autoPlay(false) // 自动播放
        // .interval(2000) // 自动播放间隔时间 默认3000
        .loop(false) // 是否开启循环
        .indicator(new DotIndicator()
          .itemWidth(8)
          .itemHeight(8)
          .selectedItemWidth(8)
          .selectedItemHeight(8)
          .color("#F2F2F2")
          .selectedColor("#01DC82")
          .bottom(60)
          ) // 是否启用导航点指示器

      }
      .width("100%")
      .layoutWeight(1)
      Column() {
        Text(".").fontColor("#ffffff").height("100%").fontSize(30)
      }
      .width("100%")
      .height(40)
    }
    .width("100%")
    .height("100%")
  }
}