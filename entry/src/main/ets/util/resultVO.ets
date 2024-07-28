/*
  * resultVO接口
  * @code 响应码
  * @msg  响应信息
  * @data 响应数据
 */
export default interface resultVO<T>{
  code: number
  msg: string
  data: T
  total?: number
}