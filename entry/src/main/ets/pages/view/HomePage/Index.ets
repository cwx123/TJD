@Component
export default struct Index {
  @State message: string = '首页页面';

  build() {
    Column() {

      // Text(this.message)
      //   .id('mine')
      //   .fontSize(50)
      //   .fontWeight(FontWeight.Bold)
      //   .alignRules({
      //     center: { anchor: '__container__', align: VerticalAlign.Center },
      //     middle: { anchor: '__container__', align: HorizontalAlign.Center }
      //   })
    }
    .height('100%')
    .width('100%')
  }
}