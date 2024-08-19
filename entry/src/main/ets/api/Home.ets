import { LoginDTO } from '../dto/LoginDTO'
import { request } from '../util/request';
import { http } from '@kit.NetworkKit';

// url: `/api/app/cuser/auth/0.3/user/login?
// cuserAccount=${loginDto.cuserAccount}
// &loginType=${loginDto.loginType}
// &verificatCode=${loginDto.verificatCode}`,

// 登录接口调用
export function login(loginDto: LoginDTO) {
  return request<string>({
    url: '/api/app/cuser/authcenter/user/login/password',
    extraData: loginDto,
    method: http.RequestMethod.POST,
  })
}
