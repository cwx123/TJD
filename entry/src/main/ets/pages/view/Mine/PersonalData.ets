import { PersonalDataModel } from '../../../model/personalDataModel';
import HeaderTitle from '../../components/HeaderTitle';
import { router } from '@kit.ArkUI';

@Preview
@Entry
@Component
struct Index {
  @State message: string = '个人资料';
  @State personalData: PersonalDataModel = {
    gender: '男',
    birthday: '2000-01-01',
    height: '170',
    weight: '60',
    movingTarget: 20000
  };

  build() {
    Column() {
      HeaderTitle({ title: this.message })

      Column() {
        Row() {
          Row() {
            Text('性别')
              .fontWeight(500)
              .fontSize(16)
              .fontColor("#040415")
              .margin({ left: 10 })
          }
          Row() {
            Text(this.personalData.gender).fontColor("#7F7F7F").fontSize(14)
            Image($r('app.media.arrow_right'))
              .width(22)
              .height(22)
          }
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({
          top: 15,
          left: 14,
          right: 15,
          bottom: 16
        })

        Row() {
          Divider()
        }
        .padding({ left: 25, right: 14 })

        Row() {
          Row() {
            Text('生日')
              .fontWeight(500)
              .fontSize(16)
              .fontColor("#040415")
              .margin({ left: 10 })
          }
          Row() {
            Text(this.personalData.birthday).fontColor("#7F7F7F").fontSize(14)
            Image($r('app.media.arrow_right'))
              .width(22)
              .height(22)
          }
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({
          top: 15,
          left: 14,
          right: 15,
          bottom: 16
        })

        Row() {
          Divider()
        }
        .padding({ left: 25, right: 14 })

        Row() {
          Row() {
            Text('身高')
              .fontWeight(500)
              .fontSize(16)
              .fontColor("#040415")
              .margin({ left: 10 })
          }
          Row() {
            Text(this.personalData.height).fontColor("#7F7F7F").fontSize(14)
            Text(){Span('cm')}.fontColor("#7F7F7F").margin({left : 2})
            Image($r('app.media.arrow_right'))
              .width(22)
              .height(22)
          }
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({
          top: 15,
          left: 14,
          right: 15,
          bottom: 16
        })

        Row() {
          Divider()
        }
        .padding({ left: 25, right: 14 })

        Row() {
          Row() {
            Text('体重')
              .fontWeight(500)
              .fontSize(16)
              .fontColor("#040415")
              .margin({ left: 10 })
          }
          Row() {
            Text(this.personalData.weight).fontColor("#7F7F7F").fontSize(14)
            Text(){Span('kg')}.fontColor("#7F7F7F").margin({left : 2})
            Image($r('app.media.arrow_right'))
              .width(22)
              .height(22)
          }
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({
          top: 15,
          left: 14,
          right: 15,
          bottom: 16
        })

        Row() {
          Divider()
        }
        .padding({ left: 25, right: 14 })

        Row() {
          Row() {
            Text('运动目标')
              .fontWeight(500)
              .fontSize(16)
              .fontColor("#040415")
              .margin({ left: 10 })
          }
          Row() {
            Text(this.personalData.movingTarget + '').fontColor("#7F7F7F").fontSize(14)
            Text(){Span('步')}.fontColor("#7F7F7F").margin({left : 2})
            Image($r('app.media.arrow_right'))
              .width(22)
              .height(22)
          }
        }
        .width('100%')
        .height(56)
        .justifyContent(FlexAlign.SpaceBetween)
        .padding({
          top: 15,
          left: 14,
          right: 15,
          bottom: 16
        })
      }
      .backgroundColor("#ffffff")
      .borderRadius(12)
      .width("100%")
      .margin({ top: 10 })
    }
    .backgroundColor("#F8F8F8")
    .height('100%')
    .width('100%')
    .padding({ left: 10, right: 10 })
  }
}