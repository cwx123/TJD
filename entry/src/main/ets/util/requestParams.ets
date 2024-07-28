import { http } from '@kit.NetworkKit'

/*
  * requestParams接口
  * @url          必填                     访问地址  (后端api访问地址)
  * @method       选填（默认get）           请求方法  (get、post...)
  * @extraData    选填（默认undefined ）    请求参数
 */
export interface requestParams{
  url: string
  method?: http.RequestMethod
  extraData?: object
}