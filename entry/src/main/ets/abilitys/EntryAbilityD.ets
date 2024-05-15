import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

export default class EntryAbilityD extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log("debug_EntryAbilityD: AbilityD onCreate")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    console.log("debug_EntryAbilityD: AbilityD onWindowStageCreate")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/PageD', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });
    try {
      windowStage.on("windowStageEvent", (data: window.WindowStageEventType) => {
        switch (data) {
          case window.WindowStageEventType.SHOWN:
            console.log("debug_EntryAbilityD: windowStageD foreground")
            break;
          case window.WindowStageEventType.ACTIVE:
            console.log("debug_EntryAbilityD: windowStageD active")
            break;
          case window.WindowStageEventType.INACTIVE:
            console.log("debug_EntryAbilityD: windowStageD inactive")
            break;
          case window.WindowStageEventType.HIDDEN:
            console.log("debug_EntryAbilityD: windowStageD background")
            break;
          default:
            break;
        }
      })
    } catch (e) {
    }
  }

  onForeground(): void {
    // Ability has brought to foreground
    console.log("debug_EntryAbilityD: AbilityD onForeground")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    console.log("debug_EntryAbilityD: AbilityD onBackground")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  onWindowStageDestroy(): void {
    console.log("debug_EntryAbilityD: AbilityD onWindowStageDestroy")
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onDestroy(): void {
    console.log("debug_EntryAbilityD: AbilityD onDestroy")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log("debug_EntryAbilityA: AbilityD onNewWant")
  }

}
