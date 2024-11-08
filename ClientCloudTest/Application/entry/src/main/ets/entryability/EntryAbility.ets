import { abilityAccessCtrl, AbilityConstant, PermissionRequestResult, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { util } from '@kit.ArkTS';
import { initialize } from '@hw-agconnect/hmcore';

export default class EntryAbility extends UIAbility {
  async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): Promise<void> {
    let AtManager = abilityAccessCtrl.createAtManager();
    AtManager.requestPermissionsFromUser(this.context, ['ohos.permission.READ_MEDIA', 'ohos.permission.MEDIA_LOCATION'])
      .then((data: PermissionRequestResult) => {
        hilog.info(0x0000, 'testTag', '%{public}s', 'request permissions from user success' + data);
      })
      .catch((err: Object) => {
        hilog.error(0x0000, 'testTag', 'Failed to request permissions from user. Cause: %{public}s',
          JSON.stringify(err) ?? '');
      });
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');

    //调用云函数之前的初始化操作
    let input = await this.context.resourceManager.getRawFileContent('agconnect-services.json')
    let jsonString = util.TextDecoder.create('utf-8', {
      ignoreBOM:true
    }).decodeWithStream(input, {
      stream: false
    });

    initialize(this.context, JSON.parse(jsonString))
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');
    windowStage.loadContent('pages/CloudStoragePage', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
