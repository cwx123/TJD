import { authentication } from '@kit.AccountKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { util } from '@kit.ArkTS';

@Entry
@Component
export default  struct LoginWithHuawei {
  aboutToAppear(): void {
    // 创建请求参数
    let stateRequest: authentication.StateRequest = {
      idType: authentication.IdType.UNION_ID,
      idValue: 'xxx' // 该值可以通过华为账号登录接口获取
    }
    let huaweiIdProvider = new authentication.HuaweiIDProvider();
    let request = huaweiIdProvider.createAuthorizationWithHuaweiIDRequest();
    console.log('request:',JSON.stringify(request))
    this.getQuickLoginAnonymousPhone()
    try {
      // 执行获取华为账号登录状态请求，并处理结果
      new authentication.HuaweiIDProvider().getHuaweiIDState(stateRequest).then((data: authentication.StateResult) => {
        let state = data.state;
        console.log('data:',JSON.stringify(state+''))
        // 处理state
      }).catch((error: BusinessError) => {
        this.dealAllError(error);
      })
    } catch (error) {
      this.dealAllError(error);
    }
  }

  getQuickLoginAnonymousPhone() {
    // 创建授权请求，并设置参数
    const authRequest = new authentication.HuaweiIDProvider().createAuthorizationWithHuaweiIDRequest();
    // 获取匿名手机号需传quickLoginAnonymousPhone这个scope，传参之前需要先申请“华为账号一键登录”权限
    //(权限名称为：quickLoginMobilePhone),后续才能获取匿名手机号数据
    authRequest.scopes = ['quickLoginAnonymousPhone'];
    // 用于防跨站点请求伪造
    authRequest.state = util.generateRandomUUID();
    // 一键登录场景该参数只能设置为false
    authRequest.forceAuthorization = false;
    const controller = new authentication.AuthenticationController();
    console.log('成功1')
    try {
      controller.executeRequest(authRequest).then((response: authentication.AuthorizationWithHuaweiIDResponse) => {
        // 获取到UnionID、OpenID、匿名手机号
        console.log('成功2')
        const unionID = response.data?.unionID;
        const openID = response.data?.openID;
        const anonymousPhone = response.data?.extraInfo?.quickLoginAnonymousPhone as string;
        // if (anonymousPhone) {
        //   this.quickLoginAnonymousPhone = anonymousPhone;
        //   return;
        // }
        console.log(unionID,openID,anonymousPhone)
        // 未获取到匿名手机号需要跳转到应用自定义的登录页面
      }).catch((error: BusinessError) => {
        this.dealAllError(error);
      })
    } catch (error) {
      this.dealAllError(error);
    }
  }

  // 错误处理
  dealAllError(error: BusinessError): void {
    console.log( '错误处理', error.code, error.message)
  }
  build() {
    Column(){

    }
  }
}