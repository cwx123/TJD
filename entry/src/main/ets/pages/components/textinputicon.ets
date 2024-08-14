
@Component
export default struct textibputicon {
  @State text: string = '';
  @State changeType: InputType = InputType.Password;
  @State isVisible: boolean = false;
  @State changeState: boolean = false;
  @State placeholder:string=''
  controller: TextInputController = new TextInputController();

  build() {
    Stack() {
      TextInput({ text: this.text, controller: this.controller ,placeholder:this.placeholder})
        .type(this.changeType)
        .height('100%')
        .showPasswordIcon(false)
        .onChange((value: string) => {
          this.text = value;
        })
      //Image覆盖passwordIcon实现
      Image($r(this.isVisible ? 'app.media.icon_login_show_nomal' : 'app.media.icon_login_hide_nomal'))
        .margin({ left: 230 })
        .width(24)
        .height(24)
        .onClick(() => {
          this.changeState = !this.changeState;
          this.isVisible = !this.isVisible;
          if (this.changeState) {
            this.changeType = InputType.Normal;
          } else {
            this.changeType = InputType.Password;
          }
        })
    }
    .width('100%')
    .height('100%')
  }
}