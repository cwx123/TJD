import { login } from '../api/Home'

@Entry
@Component
struct Login {
  aboutToAppear() : void{
    console.log("进来了")
    // 调取账号登录接口
    login({userAccount: '18588420551', loginType: '0', passWord:'a123456', loginTripartiteType: '00'})
      .then(res=>{
        console.log('接口返回数据', JSON.stringify(res))
      })
  }
  build() {
  }
}