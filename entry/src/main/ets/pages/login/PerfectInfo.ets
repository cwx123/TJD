import LoginTitle from '../components/LoginTitle';

@Entry
@Component
struct Perfectinfo {
  private selectedDate: Date = new Date('2000-01-01')
  @State sexshow : string = '男生'

  build() {
    Column(){
      LoginTitle({title:'跳过'})
      Column(){
        Text('性别')
          .textAlign(TextAlign.Start)
          .width('100%')
          .padding({left:43.5,bottom:49,top:32})
          .fontWeight('Bold')
          .fontSize(20)
          .fontColor('#FF040415')
          .fontFamily('PingFang SC-Bold')
        Row(){
          Column(){
            Image($r(this.sexshow=='男生'? 'app.media.boyshow':'app.media.boyhide'))
              .width(80)
              .height(80)
            Text('男生')
              .margin({top:25})
              .fontSize(this.sexshow=='男生'?18:15)
              .fontColor(this.sexshow == '男生'?'#FF040415':'#FFB0B0B8')
          }
          .margin({right:44})
          .onClick(()=>this.sexshow = '男生')
          Column(){
            Image($r(this.sexshow=='女生'? 'app.media.boyshow':'app.media.boyhide'))
              .width(80).height(80)
            Text('女生')
              .margin({top:25})
              .fontSize(this.sexshow=='女生'?18:15)
              .fontColor(this.sexshow == '女生'?'#FF040415':'#FFB0B0B8')
          }
          .onClick(()=>this.sexshow = '女生')
        }
        .margin({bottom:50})
        Text('年龄')
          .textAlign(TextAlign.Start)
          .width('100%')
          .padding({left:43.5,bottom:49})
          .fontWeight('Bold')
          .fontSize(20)
          .fontColor('#FF040415')
          .fontFamily('PingFang SC-Bold')
        Row(){
          DatePicker({
            start: new Date('1970-1-1'),
            end: new Date(),
            selected: this.selectedDate
          })
            .padding({left:48,right:48})
            .disappearTextStyle({color: '#FFB0B0B8', font: {size: 18, weight: FontWeight.Regular}})
            .textStyle({color: '#FFB0B0B8', font: {size:18, weight: FontWeight.Regular}})
            .selectedTextStyle({color: '#FF040415', font: {size: 24, weight: FontWeight.Bold}})
            .onDateChange((value: Date) => {
              this.selectedDate = value
              console.info('select current date is: ' + value.toString())
            })
        }.height(210)
        Row(){}
        .width(120)
        .height(4)
        .backgroundColor('#FF01DC82')
        .margin({top:28,bottom:8})
        Text('1/2')
          .fontSize(14)
          .fontColor('#FFAAAAAA')
          .fontFamily('PingFang SC-Regular')
          .padding({bottom:24})
        Button('完成')
          .padding({top:24})
          .backgroundColor('#FF01DC82')
          .width(288).height(48)
          .fontSize(16)
          .fontWeight('Bold')
          .padding({bottom:4})
      }
    }
  }
}