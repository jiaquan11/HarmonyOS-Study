import preferences from '@ohos.data.preferences'
import { defaultState, PlayStateType } from '../models'

/**
 * 首选项工具类，用于记录应用程序的状态
 */
export class PreferencesUtils {
  StoreName = "MN_CLOUD_MUSIC"
  PlayStateKey = 'MN_PLAY_STATE'
  context: Context

  constructor(context: Context) {
    this.context = context
  }

  //获取仓库
  async getStoreage() {
    return preferences.getPreferences(this.context, this.StoreName)
  }

  /**
   * 每次发布事件的时候将状态记录到pre.中
   */
  //存放数据
  async setState(data: PlayStateType) {
    const storeage = await this.getStoreage()
    await storeage.put(this.PlayStateKey, JSON.stringify(data))//将data转换为一个json的字符串
    await storeage.flush()
  }

  //获取数据
  async getState(): Promise<PlayStateType> {
    const storeage = await this.getStoreage()
    return await JSON.parse(await storeage.get(this.PlayStateKey, JSON.stringify(defaultState)) as string) as PlayStateType
    // await JSON.parse( storeage.get(this.PlayStateKey, JSON.stringify(defaultState)) as string  ) as PlayStateType
  }
}