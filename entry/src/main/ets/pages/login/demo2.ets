// 导入所需的模块
import { loginComponentManager, LoginWithHuaweiIDButton } from '@kit.AccountKit';
import { BusinessError } from '@kit.BasicServicesKit';

// 登录页面组件
@Entry
@Component
struct LoginPage {
  // 定义一个控制器属性
  private controller: loginComponentManager.LoginWithHuaweiIDButtonController =
    new loginComponentManager.LoginWithHuaweiIDButtonController();
  private onLogin = (error: BusinessError | null, response: loginComponentManager.HuaweiIDCredential | null) => {
    if (error) {
      // 处理登录错误
      console.error('Login failed:', error);
      // 这里可以添加用户错误提示逻辑
    } else if (response) {
      // 处理登录成功
      console.log('Login success:', response);
      // 登录成功后的逻辑处理，例如跳转到主界面
      // 这里可以添加你的页面跳转逻辑
    } else {
      // 处理未知错误
      console.error('Login failed: Unknown error');
    }
  };

  build() {
    // 使用Flex布局
    Column() {
      // 添加登录按钮
      LoginWithHuaweiIDButton({
        params: {
          style: loginComponentManager.Style.BUTTON_RED,
          loginType: loginComponentManager.LoginType.ID,
          borderRadius: 10, // 圆角大小
          supportDarkMode: true // 支持暗黑模式
        },
        controller: this.controller // 绑定控制器
      })
        .width(300) // 设置按钮宽度
        .height(50) // 设置按钮高度
        .margin({ top: 100 }) // 设置按钮上方外边距
        .onClick(() => this.controller.onClickLoginWithHuaweiIDButton(this.onLogin));
         // 设置按钮点击事件，直接调用onLogin
    }
    .width('100%') // 页面宽度充满
    .height('100%') // 页面高度充满
    .justifyContent(FlexAlign.Center) // 居中显示
  }



}