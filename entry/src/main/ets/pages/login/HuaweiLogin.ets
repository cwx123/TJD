import { LoginPanel, loginComponentManager } from '@kit.AccountKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';

@Component
export default  struct PreviewLoginPanelPage {
  // 是否展示LoginPanel组件
  @StorageLink('show') show: boolean = false;
  @StorageLink('myphone') myphone: string |undefined= ''

  // 定义LoginPanel展示的隐私文本，展示用户服务协议、隐私协议和华为账号用户认证协议
  privacyText: loginComponentManager.PrivacyText[] = [{
    text: '已阅读并同意',
    type: loginComponentManager.TextType.PLAIN_TEXT
  }, {
    text: '《用户服务协议》',
    tag: '用户服务协议',
    type: loginComponentManager.TextType.RICH_TEXT,
  }, {
    text: '《隐私协议》',
    tag: '隐私协议',
    type: loginComponentManager.TextType.RICH_TEXT
  }, {
    text: '和',
    type: loginComponentManager.TextType.PLAIN_TEXT
  }, {
    text: '《华为账号用户认证协议》',
    tag: '华为账号用户认证协议',
    type: loginComponentManager.TextType.RICH_TEXT
  }];
  // 定义LoginPanel展示的其他方式登录Icon
  iconArray: loginComponentManager.LoginIcon[] = [{
    icon: $r('app.media.app_icon'),
    tag: '其他方式登录'
  }];
  // 构造LoginPanel组件的控制器
  controller: loginComponentManager.LoginPanelController = new loginComponentManager.LoginPanelController()
    // 当登录类型不是QUICK_LOGIN且未设置协议时，如果需要展示自定义协议弹框，需要设置协议状态为NOT_ACCEPTED
    .setAgreementStatus(loginComponentManager.AgreementStatus.NOT_ACCEPTED)
      // 用户点击其他方式登录展示隐私协议弹框
    .setShowAgreementForOptionalLogin()
    .onClickLoginWithHuaweiIDButton((error: BusinessError, response: loginComponentManager.HuaweiIDCredential) => {
      if (error) {
        this.dealAllError(error);
        return;
      }
      if (response) {
        // 获取到Authorization Code后，传给应用服务器
        this.show = false;
        return;
      }
    })
    .onClickOptionalLoginButton(() => {
      this.show = false;
    })
    .onClickOptionalLoginIcon((error: BusinessError, tag: string) => {
      if (error) {
        this.dealAllError(error);
        return;
      }
      this.show = false;
    })
    .onClickPrivacyText((error: BusinessError, tag: string) => {
      if (error) {
        this.dealAllError(error);
        return;
      }
      // 应用需要根据tag实现协议页面的跳转逻辑
    })
    .onClickCloseButton(() => {
      hilog.info(0x0000, 'testTag', 'onClickCloseButton');
      this.show = false;
    })
    //隐私按钮
    .onChangeAgreementStatus((error: BusinessError, agreementStatus: loginComponentManager.AgreementStatus) => {
      if (error) {
        this.dealAllError(error);
        return;
      }
    })
    //一键登录按钮
    .onClickEvent((error: BusinessError, clickEvent: loginComponentManager.ClickEvent) => {
      if (error) {
        this.dealAllError(error);
        return;
      }
    });

  // 错误处理
  dealAllError(error: BusinessError): void {
    console.log( 'testTag', 'Failed to login, errorCode=%{public}d, errorMsg=%{public}s', error.code,
      error.message)
  }

  build() {
    if (this.show) {
      Stack() {
        LoginPanel({
          show: this.show,
          params: {
            appInfo: {
              appIcon: $r('app.media.ico_login_log'),
              appName: '乐动健康生活',
            },
            privacyText: this.privacyText,
            // 参考华为账号开发指南获取匿名手机号
            anonymousPhoneNumber: this.myphone,
            // verifyPhoneNumber：如果华为账号用户在过去90天内未进行短信验证，是否拉起Account Kit提供的短信验证码页面
            verifyPhoneNumber: true,
            loginType: loginComponentManager.LoginType.QUICK_LOGIN,
          },
          controller: this.controller
        })
      }
      .height('100%')
      .width('100%')
    }
  }
}