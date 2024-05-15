import { HomeViewModel } from '../vm/HomeViewModel';
import Want from '@ohos.app.ability.Want';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State message: string = '跳转到 EntryAbilityA (singleton)';

  async getHdata() {
    let newMessage = await HomeViewModel.getHomeData()
    this.message = newMessage
  }

  aboutToAppear(): void {
    // this.getHdata()
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.Red)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .onClick(() => {
            let want: Want = {
              bundleName: "com.example.myapplication",
              abilityName: "EntryAbilityA",
              moduleName: "entry",
              parameters: {}
            }
            let context = getContext(this) as common.UIAbilityContext
            context.startAbility(want)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}