/**
 * @Author : yanfeng
 * @Date : 2024/5/11
 * @Time : 22:16
 * @Desc :
 */
import { common, Want } from '@kit.AbilityKit'

@Entry
@Component
struct PageB {
  build() {
    Column() {
      Text("EntryAbility B")
      Text("跳转到 EntryAbilityA (singleton)")
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
    .height('100%')
  }
}
 