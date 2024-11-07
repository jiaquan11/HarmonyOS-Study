/**
 * 需要通过播放类同步到各个播放页面的数据对象
 */
export interface PlayStateType {
  img: string
  name: string
  author: string
  url: string
  playIndex: number
  time: number
  duration: number
  isPlay: boolean
  playMode: 'auto' | 'repeat' | 'random'
  playList: SongItemType[]
}

export class PlayStateModel implements PlayStateType {
  img: string = ''
  name: string = ''
  author: string = ''
  url: string = ''
  playIndex: number = 0
  time: number = 0
  duration: number = 0
  isPlay: boolean = false
  playMode: 'auto' | 'repeat' | 'random' = 'auto'
  playList: SongItemType[] = null!

  constructor(playState: PlayStateType) {
    this.img = playState.img
    this.name = playState.name
    this.time = playState.time
    this.author = playState.author
    this.url = playState.url
    this.playIndex = playState.playIndex
    this.duration = playState.duration
    this.isPlay = playState.isPlay
    this.playMode = playState.playMode
    this.playList = playState.playList
  }
}

//定义一个默认播放状态的实例
export const defaultState: PlayStateType = new PlayStateModel({
  img: '',
  name: '',
  author: '',
  url: '',
  playIndex: 0,
  time: 0,
  duration: 0,
  isPlay: false,
  playMode: 'auto',
  playList: []
})

/**
 * 歌曲信息
 */
export interface SongItemType {
  id: string
  url: string
  name: string
  author: string
  img: string
}

/**
 * 推荐列表
 */
export interface RecommendListType {
  img: string
  title: string
  count: string
}

/**
 * 每日推荐
 */
export interface RecommendDailyType {
  img: string
  title: string
  type: string
  top: string
  bottom: string
}

/**
 * 评论列表
 */
export interface MomentListType {
  author: string
  avatar: string
  content: string
  comment: number
  like: number
  song: SongItemType
}

/**
 * 搜藏列表类型
 */
export interface FavoriteListType {
  name: string
  nickName: string
  avatar: ResourceStr
  songs: SongItemType[]
}

export class SongItemTypeModel implements SongItemType {
  id: string
  url: string
  name: string
  author: string
  img: string

  constructor(id: string, url: string, name: string, author: string, img: string) {
    this.id = id
    this.url = url
    this.name = name
    this.author = author
    this.img = img
  }
}

export class RecommentListTypeModel implements RecommendListType {
  img: string
  title: string
  count: string

  constructor(img: string, title: string, count: string) {
    this.img = img
    this.title = title
    this.count = count
  }
}

export class RecommendDailyTypeModel implements RecommendDailyType {
  img: string
  title: string
  type: string
  top: string
  bottom: string

  constructor(img: string, title: string, type: string, top: string, bottom: string) {
    this.img = img
    this.title = title
    this.type = type
    this.top = top
    this.bottom = bottom
  }
}

export class MomentListTypeModel implements MomentListType {
  author: string
  avatar: string
  content: string
  comment: number
  like: number
  song: SongItemType

  constructor(author: string, avatar: string, content: string, comment: number, like: number, song: SongItemType) {
    this.author = author
    this.avatar = avatar
    this.content = content
    this.comment = comment
    this.like = like
    this.song = song
  }
}

export class FavoriteListTypeModel implements FavoriteListType {
  name: string
  nickName: string
  avatar: ResourceStr
  songs: SongItemType[]

  constructor(name: string, nickName: string, avatar: ResourceStr, songs: SongItemType[]) {
    this.name = name
    this.nickName = nickName
    this.avatar = avatar
    this.songs = songs
  }
}