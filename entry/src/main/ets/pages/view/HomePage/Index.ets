import text from '@ohos.graphics.text';

@Component
export default struct Index {
  @State message: string = '首页页面';

  build() {
    Column() {
      Row() {
        Text("乐动健康生活").fontSize(22).fontColor("#040415")
        Text("+").fontSize(16).fontColor("#212135")
          .height(20)
          .width(20)
          .borderWidth(1)
          .borderRadius(4)
          .borderColor("#212135")
          .textAlign(TextAlign.Center)
      }
      .height(44)
      .padding({left: 24, right: 24, bottom: 6, top: 16})
      .width("100%")
      .justifyContent(FlexAlign.SpaceBetween)

      Scroll() {
        Column() {
          Stack() {
            Column() {
              Row() {
                Text(".").fontColor("#ffffff")
                Text("i").borderWidth(1).textAlign(TextAlign.Center).fontColor("#B0B0B8")
                  .width(20).height(20).borderRadius(20).borderColor("#B0B0B8")
              }
              .width("100%")
              .height(30)
              .padding({top: 10, right: 17})
              .justifyContent(FlexAlign.SpaceBetween)

              Row() {
                Column() {
                  Row() {
                    Column().width(4).height(8).borderRadius(2).backgroundColor("#38CC7D")
                    Text("站立活动").fontColor("#666666").fontSize(13).margin({left: 5})
                  }.width(180)
                  Text("8").fontWeight(500).fontStyle(20).fontColor("#040415").width(180).height(28).margin({top: 4, bottom: 1})
                  Text("12次").fontStyle(13).fontColor("#666666").width(180)
                }
                Column() {
                  Row() {
                    Column().width(4).height(8).borderRadius(2).backgroundColor("#FBB429")
                    Text("活动热量").fontColor("#666666").fontSize(13).margin({left: 5})
                  }.justifyContent(FlexAlign.End)
                  Text("160").fontWeight(500).fontStyle(20).fontColor("#040415").width(63).height(28).margin({top: 4, bottom: 1})
                  Text("200千卡").fontStyle(13).fontColor("#666666")
                }
              }
              .justifyContent(FlexAlign.SpaceBetween)
              .width("100%")
              .padding({left: 19, right: 20, top: 10})
              .margin({top: 10})

              Row() {
                Column() {
                  Row() {
                    Column().width(4).height(8).borderRadius(2).backgroundColor("#F96656")
                    Text("中高强度").fontColor("#666666").fontSize(13).margin({left: 5})
                  }.width(180)
                  Text("12").fontWeight(500).fontStyle(20).fontColor("#040415").width(180).height(28).margin({top: 4, bottom: 1})
                  Text("30分钟").fontStyle(13).fontColor("#666666").width(180)
                }
                Column() {
                  Row() {
                    Column().width(4).height(8).borderRadius(2).backgroundColor("#3888FF")
                    Text("步数").fontColor("#666666").fontSize(13).margin({left: 5})
                  }.width(63).justifyContent(FlexAlign.Start)
                  Text("6000").fontWeight(500).fontStyle(20).fontColor("#040415").width(63).height(28).margin({top: 4, bottom: 1})
                  Text("10000步").fontStyle(13).fontColor("#666666").width(63)
                }
              }
              .justifyContent(FlexAlign.SpaceBetween)
              .width("100%")
              .padding({left: 19, right: 20, top: 10})
              .margin({top: 20})
            }
            .backgroundColor("#ffffff")
            .borderRadius(12)
            .height(240)
            .width("100%")
            .margin({top: 12})
            Image($r("app.media.card_fourclover")).height(128).width(128).position({top: '12%', left: '30%'})
          }
          Row() {
            Column() {
              Text('运动记录').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08 户外跑步').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('319.88').fontColor("#333333").fontSize(20)
                Span('公里').fontColor("#666666").fontSize(12).margin({left: 4})
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})

            Column() {
              Text('睡眠').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('06').fontColor("#333333").fontSize(20)
                Span('时').fontColor("#666666").fontSize(12).margin({left: 4, right: 4})
                Span('58').fontColor("#333333").fontSize(20).margin({right: 4})
                Span('分').fontColor("#666666").fontSize(12)
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})
          }
          .width("100%")
          .margin({top: 11})
          .justifyContent(FlexAlign.SpaceBetween)
          Row() {
            Column() {
              Text('运动记录').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08 户外跑步').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('319.88').fontColor("#333333").fontSize(20)
                Span('公里').fontColor("#666666").fontSize(12).margin({left: 4})
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})

            Column() {
              Text('睡眠').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('06').fontColor("#333333").fontSize(20)
                Span('时').fontColor("#666666").fontSize(12).margin({left: 4, right: 4})
                Span('58').fontColor("#333333").fontSize(20).margin({right: 4})
                Span('分').fontColor("#666666").fontSize(12)
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})
          }
          .width("100%")
          .margin({top: 11})
          .justifyContent(FlexAlign.SpaceBetween)
          Row() {
            Column() {
              Text('运动记录').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08 户外跑步').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('319.88').fontColor("#333333").fontSize(20)
                Span('公里').fontColor("#666666").fontSize(12).margin({left: 4})
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})

            Column() {
              Text('睡眠').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('06').fontColor("#333333").fontSize(20)
                Span('时').fontColor("#666666").fontSize(12).margin({left: 4, right: 4})
                Span('58').fontColor("#333333").fontSize(20).margin({right: 4})
                Span('分').fontColor("#666666").fontSize(12)
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})
          }
          .width("100%")
          .margin({top: 11})
          .justifyContent(FlexAlign.SpaceBetween)
          Row() {
            Column() {
              Text('运动记录').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08 户外跑步').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('319.88').fontColor("#333333").fontSize(20)
                Span('公里').fontColor("#666666").fontSize(12).margin({left: 4})
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})

            Column() {
              Text('睡眠').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('06').fontColor("#333333").fontSize(20)
                Span('时').fontColor("#666666").fontSize(12).margin({left: 4, right: 4})
                Span('58').fontColor("#333333").fontSize(20).margin({right: 4})
                Span('分').fontColor("#666666").fontSize(12)
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})
          }
          .width("100%")
          .margin({top: 11})
          .justifyContent(FlexAlign.SpaceBetween)
          Row() {
            Column() {
              Text('运动记录').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08 户外跑步').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('319.88').fontColor("#333333").fontSize(20)
                Span('公里').fontColor("#666666").fontSize(12).margin({left: 4})
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})

            Column() {
              Text('睡眠').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('06').fontColor("#333333").fontSize(20)
                Span('时').fontColor("#666666").fontSize(12).margin({left: 4, right: 4})
                Span('58').fontColor("#333333").fontSize(20).margin({right: 4})
                Span('分').fontColor("#666666").fontSize(12)
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})
          }
          .width("100%")
          .margin({top: 11})
          .justifyContent(FlexAlign.SpaceBetween)
          Row() {
            Column() {
              Text('运动记录').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08 户外跑步').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('319.88').fontColor("#333333").fontSize(20)
                Span('公里').fontColor("#666666").fontSize(12).margin({left: 4})
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})

            Column() {
              Text('睡眠').fontColor("#333333").fontSize(15).fontWeight(500).width("100%").height(21)
              Text('08/08').fontColor("#666666").fontSize(12).fontWeight(500).width("100%").height(16.5).margin({top: 2})
              Image($r("app.media.home_cycle")).width(60).height(60).margin({top: 12, bottom: 12})
              Text() {
                Span('06').fontColor("#333333").fontSize(20)
                Span('时').fontColor("#666666").fontSize(12).margin({left: 4, right: 4})
                Span('58').fontColor("#333333").fontSize(20).margin({right: 4})
                Span('分').fontColor("#666666").fontSize(12)
              }
              .width("100%")
            }
            .borderRadius(12)
            .height(172)
            .width("48%")
            .backgroundColor("#ffffff")
            .padding({left: 14, top: 12})
          }
          .width("100%")
          .margin({top: 11})
          .justifyContent(FlexAlign.SpaceBetween)
        }
      }
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Off)
      .edgeEffect(EdgeEffect.Spring)
      .layoutWeight(1)
    }
    .backgroundColor("#F8F8F8")
    .height('100%')
    .width('100%')
    .padding({left: 10, right: 10})
  }
}