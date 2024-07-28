import { http } from '@kit.NetworkKit'
import { preferences } from '@kit.ArkData'
import  { getToken, setToken } from './preferencesUtil'
import resultVO from './resultVO'
import { CommonConstants } from './CommonConstants'
import { requestParams } from './requestParams'
import { promptAction, router } from '@kit.ArkUI'
import { BusinessError } from '@ohos.base';

/*
  * request方法
  * @params requestParams接口类型
  * @@return Promise<resultVO<T>>
 */
export const request = async <T>(params: requestParams): Promise<resultVO<T>> => {
  // 基地址
  const baseURL: string = CommonConstants.BASE_URL
  console.log("请求了。。。", JSON.stringify(params))
  // 创建一个HttpRequest对象
  let httpRequest = http.createHttp()
  // 获取token
  let token: preferences.ValueType = await getToken()
  // 完整请求地址
  let requestUrl = baseURL + params.url
  // 发起请求可选参数的类型和取值范围。
  let options: http.HttpRequestOptions = {
    // 请求类型，不传默认get
    method: params.method ?? http.RequestMethod.GET,
    // 请求头
    header: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Language': 'zh',
      'Content-Length': 93,
      'Platform-Source': 'android',
      'App-Type': 'lefun_health',
      'App-Version': '2.5.5',
      'Server-Version': '2.5.0',
      'Phone-Vendor': 'xiaomi',
      token
    },
    // 请求参数，不传默认undefined
    extraData: params.extraData ?? undefined,
    // 必填
    expectDataType: http.HttpDataType.OBJECT
  }
  /*
    * @resolve 请求成功
    * @reject  请求失败
   */
  return new Promise(async (resolve, reject) => {
    console.log("请求地址：", requestUrl)
    console.log("请求header：", JSON.stringify(options))
    /*
      * 发送http请求
      * @url          后端api完整地址
      * @options      发起请求的可选参数
      * @callback     回调函数
     */
    httpRequest.request(
      requestUrl,
      options,
      (err: BusinessError, data: http.HttpResponse) => {
        if (!err) {
          // 处理请求成功的逻辑
          console.info('httpRequest','code:' + JSON.stringify(data.result['code']))
          console.info('httpRequest','msg:' + JSON.stringify(data.result['msg']))
          console.info('httpRequest','data:' + JSON.stringify(data.result['data']))
          // 获得后端返回过来的resultVO
          const res = data.result as resultVO<T>
          if(res.data) {
            if(typeof (typeof res.data)) {

            }
          }
          // token过期
          if(res.code == CommonConstants.TOKEN_INVALIDATION){
            promptAction.showToast({message: CommonConstants.TOKEN_INVALIDATION_MSG})
            //清空历史页面
            router.clear()
            //跳转到登录页
            router.replaceUrl({
              // url: CommonConstants.LOGIN_PAGE_URL
              url: ''
            })
            return
          }
          // 判断响应码
          if(res.code == CommonConstants.CODE_SUCCESS){
            resolve(res)
          }else {
            promptAction.showToast({message: res.msg})
            return
          }
        } else {
          // 处理请求失败的逻辑
          promptAction.showToast({message: CommonConstants.REQUEST_ERROR})
          console.error('error:' + JSON.stringify(err))
          reject(err)
        }
        // 销毁httpRequest对象
        httpRequest.destroy()
      }
    )
  })
}