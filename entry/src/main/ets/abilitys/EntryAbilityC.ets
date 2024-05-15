import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';

const TAG = "debug_EntryAbilityC"

export default class EntryAbilityC extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log("debug_EntryAbilityC: AbilityC onCreate")
    console.log(TAG, "啦啦啦啦啦啦")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    console.log("debug_EntryAbilityC: AbilityC onWindowStageCreate")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/PageC', (err) => {
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
            console.log("debug_EntryAbilityC: windowStageC foreground")
            break;
          case window.WindowStageEventType.ACTIVE:
            console.log("debug_EntryAbilityC: windowStageC active")
            break;
          case window.WindowStageEventType.INACTIVE:
            console.log("debug_EntryAbilityC: windowStageC inactive")
            break;
          case window.WindowStageEventType.HIDDEN:
            console.log("debug_EntryAbilityC: windowStageC background")
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
    console.log("debug_EntryAbilityC: AbilityC onForeground")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    console.log("debug_EntryAbilityC: AbilityC onBackground")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  onWindowStageDestroy(): void {
    console.log("debug_EntryAbilityC: AbilityC onWindowStageDestroy")
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onDestroy(): void {
    console.log("debug_EntryAbilityC: AbilityC onDestroy")
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    console.log("debug_EntryAbilityA: AbilityC onNewWant")
  }

}
