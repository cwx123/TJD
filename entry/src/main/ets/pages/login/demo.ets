
import PreferenceUtil from '../../util/preferences';
import router from '@ohos.router';
import promptAction from '@ohos.promptAction';

interface ListContent {
  index: number
  title: string
  content: string
}

let databaseName: string = "MyList"
@Entry
@Component
struct AddPage {
  @State listContent: ListContent = { index: -1, title: '', content: '' }
  // @State contentList : Array<ListContent> = router.getParams() as Array<ListContent>
  @StorageLink('state') value: string = 'add new item'

  build() {
    Stack() {

      TextArea({ placeholder: 'Please input the title! (Title is required)' })
        .onChange(value => {
          this.listContent.title = value
        })
        .fontSize(26)
        .width('90%')
        .position({ x: '5.00%', y: '5.00%' })
        .padding({
          top: '16vp',
          right: '16.00vp',
          bottom: '16.00vp',
          left: '16.00vp'
        })

      TextArea({ placeholder: 'Please input the content' })
        .onChange(value => {
          this.listContent.content = value
        })
        .fontSize(20)
        .width('90%')
        .position({ x: '5.00%', y: '23.00%' })
        .padding({
          top: '16vp',
          right: '16.00vp',
          bottom: '16.00vp',
          left: '16.00vp'
        })


      Button({ stateEffect: true }) {
        Text('SAVE')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
      }
      .onClick(() => {
        if (this.listContent.title != '') {
          // console.log(this.listContent.title + this.listContent.content)
          // this.contentList.push(this.listContent)
          // 如果新增的标题已存在，则停留在现有页面，否则更新列表
          if (!PreferenceUtil.prefMap.get(databaseName)?.getSync(this.listContent.title, false)) {
            AppStorage.set('state', 'add new item')
            router.back({
              url: 'pages/Page1',
              params: { index: null, listContent: this.listContent as ListContent }
            })
          }
          else {
            promptAction.showToast({
              message:'该标题已存在，请重新输入',
              duration:1000,
              bottom:100
            })
          }
        }
        else {
          promptAction.showToast({
            message:'标题不能为空',
            duration:1000,
            bottom:100
          })
        }
        // console.log(this.contentList.toString())
      })
      .height('5%')
      .width('30%')
      .type(ButtonType.Capsule)
      .backgroundColor('#ff0db0fb')
      .position({ x: '10%', y: '92%' })

      Button({ stateEffect: true }) {
        Text('DISCARD')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
      }
      .onClick(() => {
        router.back({ url: 'pages/Page1' })
      })
      .height('5%')
      .width('30%')
      .type(ButtonType.Capsule)
      .backgroundColor('#ffff0909')
      .position({ x: '60%', y: '92%' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}