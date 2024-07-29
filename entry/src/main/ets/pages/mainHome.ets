import { TabClass } from '../model'
import homePage from './view/HomePage/Index'
import mine from './view/Mine/Index'
import equipment from './view/Equipment/Index'
import movement from "./view/Movement/Index"
// import trends from "../view/trends/trends"
// import videoDating from "../view/videoDating/videoDating"
// import chat from "../view/chat/chat"


@Entry
@Component
struct MainHome {
  @State tabsData: TabClass[] = [{
    title: '首页',
    name: 'homePage',
    icon: $r("app.media.home_unselect"),
    selectedIcon: $r("app.media.home_select"),
  },{
    title: '运动',
    name: 'movement',
    icon: $r("app.media.activity_unselect"),
    selectedIcon: $r("app.media.activity_select"),
  },{
    title: '设备',
    name: 'equipment',
    icon: $r("app.media.device_unselect"),
    selectedIcon: $r("app.media.device_select")
  },{
    title: '我的',
    name: 'mine',
    icon: $r("app.media.mine_unselect"),
    selectedIcon: $r("app.media.mine_select"),
  }]

  @State currentName: string = 'homePage'

  @Builder
  getTabBar(item: TabClass) {
    Column() {
      if (item.name === this.currentName){
        Image(item.selectedIcon).width(22).height(22)
      }else {
        Image(item.icon).width(22).height(22)
      }
      Text(item.title)
        .fontSize(12)
        .fontWeight(400)
        .fontColor(item.name === this.currentName ?
          '#07CF60' : '#C0C1D8')
        .margin({ top: 5 })
    }.alignItems(HorizontalAlign.Center)
    .height(89)
  }
  build() {
    RelativeContainer(){
      Tabs({ barPosition: BarPosition.End }){
        ForEach(this.tabsData, (item: TabClass) => {
          TabContent(){
            if(item.name === 'homePage') {
              homePage()
            }
            else if(item.name === 'equipment') {
              equipment()
            }
            else if(item.name === 'movement') {
              movement()
            }
            else if(item.name === 'mine') {
              mine()
            }
            else {
              homePage()
            }
          }.tabBar(this.getTabBar(item))
        })
      }
      .onChange(index => {
        this.currentName = this.tabsData[index].name
      })
    }
    .height('100%')
    .width('100%')
  }
}