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
    let loginRequest = new authentication.HuaweiIDProvider().createLoginWithHuaweiIDRequest();
    loginRequest.forceLogin = true;
    loginRequest.idTokenSignAlgorithm = authentication.IdTokenSignAlgorithm.PS256;
    loginRequest.state = util.generateRandomUUID(); // 应用建议使用generateRandomUUID生成state
    // loginRequest.state = 'xxx';  // 元服务自定义生成

    // 执行登录请求，并处理结果
    try {
      let controller = new authentication.AuthenticationController(getContext(this));
      controller.executeRequest(loginRequest, (error: BusinessError<Object>, data) => {
        if (error) {
          this.dealAllErrorl(error);
          return;
        }
        let loginWithHuaweiIDResponse = data as authentication.LoginWithHuaweiIDResponse;
        let state = loginWithHuaweiIDResponse.state;
        if (state != undefined && loginRequest.state != state) {
          console.log(''+state)
          return;
        }
        console.log('Succeeded in login.'+JSON.stringify(loginWithHuaweiIDResponse))
        let loginWithHuaweiIDCredential = loginWithHuaweiIDResponse.data!;
        let code = loginWithHuaweiIDCredential.authorizationCode;
        let idToken = loginWithHuaweiIDCredential.idToken;
        let openID = loginWithHuaweiIDCredential.openID;
        let unionID = loginWithHuaweiIDCredential.unionID;
        console.log('loginWithHuaweiIDCredential',loginWithHuaweiIDCredential)
        console.log(code,idToken,openID,unionID)
        // 开发者处理code, idToken, openID, unionID
      });
    } catch (error) {
      this.dealAllError(error);
    }
  }

  // 错误处理
  dealAllError(error: BusinessError): void {
    console.log( '错误处理', error.code, error.message)
  }
  dealAllErrorl(error: BusinessError<Object>): void {
    console.log('testTag', `Failed to login. Code: ${error.code}, message: ${error.message}`);
  }
  build() {
    Column(){

    }
  }
}