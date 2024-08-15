//验证码输入框
interface codeOne {
  str: string ,
  isBorder: boolean
}


@Entry
@Component
export struct TextInputCodeView {
  // 验证码
  @State code: string = ''
  @State ind:number =1
  // 验证码位数
  @Prop
  someArrayLength: number = 6
  someArray: number[] = []


  aboutToAppear(): void {
    this.someArray = Array.from({length: this.someArrayLength})
  }

  build() {
    Stack() {
      Row() {
        ForEach(this.someArray, (item: number,index:number) => {
          //加间隙
          if (index != 0) {
            Blank()
          }
          //index + 1 ：表示输入框的位置。
          //填写验证码
          if (this.code.length >= index + 1 ) {
            this.OneText({ str:this.code.substring(index, index + 1),  isBorder: index + 1 === this.someArray.length})
          } else {
            //没有验证码
            this.OneText({
              str:'',
              isBorder: this.code.length + 1 === index + 1
            })
          }
        }, (item: number ,index: number) => JSON.stringify(index + 1))    //键值标识
      }
      .width('100%')

      TextInput({ placeholder: "" })
        .width('100%')
        .height('100%')
        .inputFilter('[0-9]')
        .maxLength(this.someArray.length)
        .caretColor(Color.Transparent)
        .fontColor(Color.Transparent)
        .borderColor(Color.Transparent)
        .backgroundColor(Color.Transparent)
        .onChange((value: string) => {
          this.code = value
          this.ind = value.length
        })
        .onSubmit(async () => {
          //回车事件
        })
      Flex({justifyContent:FlexAlign.SpaceAround}){
        Column(){}.backgroundColor(this.ind>=1?'#01DC82':'#F2F2F2').height(4).width(40)
        Column(){}.backgroundColor(this.ind>=2?'#01DC82':'#F2F2F2').height(4).width(40)
        Column(){}.backgroundColor(this.ind>=3?'#01DC82':'#F2F2F2').height(4).width(40)
        Column(){}.backgroundColor(this.ind>=4?'#01DC82':'#F2F2F2').height(4).width(40)
        Column(){}.backgroundColor(this.ind>=5?'#01DC82':'#F2F2F2').height(4).width(40)
        Column(){}.backgroundColor(this.ind>=6?'#01DC82':'#F2F2F2').height(4).width(40)
      }.width('100%').margin({top:40})
    }
    .width('100%')
    .height(60)
  }

  //参数：验证码内容，是否显示边框
  @Builder OneText(item:codeOne) {
    //判断，是否选中当前的输入框，是否有内容 。是当前选中的，没有内容，显示 |
    Text(item.isBorder && !item.str ? '|' : item.str as string)
      .width(50)
      .height(50)
      .textAlign(TextAlign.Center)
      .fontSize(20)
      .fontColor(item.isBorder && !item.str ?'#ffdd4f46' : Color.Black)
      .borderRadius(8)

  }
}