import { media } from '@kit.MediaKit'
import { EmitEventType } from '../constants/MusicConstants'
import { PlayStateType, SongItemType } from '../models'
import { emitter } from '@kit.BasicServicesKit'
import { PreferencesUtils } from './PreferencesUtils'
import { Context } from '@ohos.arkui.UIContext'

/**
 * 音频播放类
 */
export class AvPlayerUtils {
  static player: media.AVPlayer | null = null
  static context: Context
  /*
  记录一些歌曲的播放信息
   */
  //歌曲的总时长
  static duration: number = 0
  //歌曲当前的播放时长
  static time: number = 0
  //是否处于播放中
  static isPlay: boolean = false
  // 当前播放模式
  static playMode: 'auto' | 'repeat' | 'random' = 'auto'
  //当前的播放的歌曲列表
  static playList: SongItemType[] = []
  //播放索引
  static playIndex: number = -1

  /**
   * 初始化
   */
  static async init() {
    AvPlayerUtils.player = await media.createAVPlayer()
    /**
     * on为播放器注册事件回调函数
     * stateChange为事件名称：监听状态变化
     * (state) =>{} ：为回调函数，内部调用时会传入一个状态state值
     */
    AvPlayerUtils.player.on('stateChange', (state) => {//音频播放器注册回调函数，stateChange为事件名称,
      switch (state) {
        case 'initialized':
          AvPlayerUtils.player?.prepare()//解析资源
          break
        case 'prepared':
          AvPlayerUtils.player?.play()//播放
          AvPlayerUtils.isPlay = true
          break
      }
    })

    /**
     * on为播放器注册事件回调函数
     * durationUpdate为事件名称：监听播放时长
     * (duration) =>{} ：为回调函数，内部调用时会传入播放资源的总时长
     */
    AvPlayerUtils.player.on('durationUpdate', (duration) => {
      AvPlayerUtils.duration = duration
      console.log('ken', duration)
    })

    /**
     * on为播放器注册事件回调函数
     * timeUpdate为事件名称：监听播放时间戳变化
     * (time) =>{} ：为回调函数，内部调用时会传入播放的实时时间戳
     */
    AvPlayerUtils.player.on('timeUpdate', (time) => {
      AvPlayerUtils.time = time
      //不断的执行，不断的发送播放状态
      //定义一个播放状态，并进行初始化
      const playState: PlayStateType = {//这里定义的是接口的字面量对象
        img: AvPlayerUtils.playList[AvPlayerUtils.playIndex].img,
        name: AvPlayerUtils.playList[AvPlayerUtils.playIndex].name,
        author: AvPlayerUtils.playList[AvPlayerUtils.playIndex].author,
        url: AvPlayerUtils.playList[AvPlayerUtils.playIndex].url,
        playIndex: AvPlayerUtils.playIndex,
        time: AvPlayerUtils.time,
        duration: AvPlayerUtils.duration,
        isPlay: AvPlayerUtils.isPlay,
        playMode: AvPlayerUtils.playMode,
        playList: AvPlayerUtils.playList,
      }
      AvPlayerUtils.updateState(playState)
      console.log('ken', time)
    })
  }

  /**
   * 单曲播放(点击播放某一首歌曲)
   */
  static async singlePlay(song: SongItemType) {
    //判断歌曲播放列表中是否存在该歌曲，存在，判断是否正在播放，如果是正在播放，将歌曲重头播放，如果没有在列表中，添加到列表中.
    //判断是否在播放列表中
    const isList = AvPlayerUtils.playList.some((item: SongItemType) => item.id === song.id)
    //在列表中
    if (isList) {//判断在列表中
      if (AvPlayerUtils.player?.url == song.url) {//同一首歌，且正在当前播放中
        AvPlayerUtils.changePlay()//重置重新播放
      } else {//在列表中，但是没有在当前播放中
        //查找这首歌曲的index
        AvPlayerUtils.playIndex = AvPlayerUtils.playList.findIndex((item: SongItemType) => item.id === song.id)//获取播放索引用来定位url
        AvPlayerUtils.changePlay()//使用列表中播放索引定位到url进行更新播放
      }
    } else { //新歌添加进歌曲列表
      AvPlayerUtils.playList.unshift(song)//将song添加到数组的开头进行播放
      AvPlayerUtils.playIndex = 0
      AvPlayerUtils.changePlay()
    }
  }

  /**
   * 重置，切歌曲，通过URL切换歌曲，只能能从最开始的状态进行歌曲的切换
   * @param song
   */
  static async changePlay() {
    await AvPlayerUtils.player?.reset()//重置播放器
    AvPlayerUtils.duration = 0
    AvPlayerUtils.time = 0
    AvPlayerUtils.player!.url = AvPlayerUtils.playList[AvPlayerUtils.playIndex].url//更新当前播放源
  }

  //发布播放状态信息至各个组件
  //什么时候将播放的状态发布出去，什么时候去接受
  /**
   * 使用emitter发送数据最好用字符串的方式发送，对象有嵌套的话，发出去的数据会发生丢失
   * @param playState
   */
  static updateState(playState: PlayStateType) {
    //emitter.emit 是一种用于触发事件并传递数据的机制，广泛应用于事件驱动的编程模型中
    emitter.emit({ eventId: EmitEventType.UPDATE_STATE }, { data: { playStateStr: JSON.stringify(playState) } })
    // 更新首选项(存储当前播放器状态)
    const preferences: PreferencesUtils = new PreferencesUtils(AvPlayerUtils.context)
    preferences.setState(playState)
  }

  /**
   * 加入播放控制
   * 暂停，恢复，上一首，下一首
   */
  static pause() {
    AvPlayerUtils.player?.pause()
    AvPlayerUtils.isPlay = false
  }

  /**
   * 播放模式的切换
   * @param mode
   */
  static changeMode(mode: 'auto' | 'repeat' | 'random') {
    AvPlayerUtils.playMode = mode //更新播放模式
    //定义一个播放状态，并进行初始化，接口字面量对象，占用内存，但是没有实例化，只用来约束
    const playState: PlayStateType = {
      img: AvPlayerUtils.playList[AvPlayerUtils.playIndex].img,
      name: AvPlayerUtils.playList[AvPlayerUtils.playIndex].name,
      author: AvPlayerUtils.playList[AvPlayerUtils.playIndex].author,
      url: AvPlayerUtils.playList[AvPlayerUtils.playIndex].url,
      playIndex: AvPlayerUtils.playIndex,
      time: AvPlayerUtils.time,
      duration: AvPlayerUtils.duration,
      isPlay: AvPlayerUtils.isPlay,
      playMode: AvPlayerUtils.playMode,
      playList: AvPlayerUtils.playList,
    }
    AvPlayerUtils.updateState(playState)
  }

  /**
   * 上一曲，下一曲由播放模式来决定的，需要将播放模式切换
   */
  //上一首
  static prev() {
    //上一首的逻辑：
    if (AvPlayerUtils.playList.length == 0) {
      return
    }
    //随机模式，歌曲数> 1
    if (AvPlayerUtils.playMode == 'random' && AvPlayerUtils.playList.length > 1) {
      //随机非自身
      let index = 0
      do {
        index = Math.floor(Math.random() * AvPlayerUtils.playList.length)
      } while (index == AvPlayerUtils.playIndex)

      AvPlayerUtils.playIndex = index
    } else {//非随机
      AvPlayerUtils.playIndex--
      //超过播放列表
      AvPlayerUtils.playIndex = (AvPlayerUtils.playIndex + AvPlayerUtils.playList.length) % AvPlayerUtils.playList.length
    }
    //切歌
    AvPlayerUtils.singlePlay(AvPlayerUtils.playList[AvPlayerUtils.playIndex])
  }

  //下一首
  static next() {
    if (AvPlayerUtils.playList.length == 0) {
      return
    }
    //随机模式，歌曲数> 1
    if (AvPlayerUtils.playMode == 'random' && AvPlayerUtils.playList.length > 1) {
      //随机非自身
      let index = 0
      do {
        index = Math.floor(Math.random() * AvPlayerUtils.playList.length)
      } while (index == AvPlayerUtils.playIndex)

      AvPlayerUtils.playIndex = index
    } else {
      AvPlayerUtils.playIndex++
      //超过播放列表
      AvPlayerUtils.playIndex = (AvPlayerUtils.playIndex + AvPlayerUtils.playList.length) % AvPlayerUtils.playList.length
    }
    //切歌
    AvPlayerUtils.singlePlay(AvPlayerUtils.playList[AvPlayerUtils.playIndex])
  }
}