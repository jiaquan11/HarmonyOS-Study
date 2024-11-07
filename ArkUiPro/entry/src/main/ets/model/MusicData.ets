export class Song {
  id: number = 0
  album_id: number = 0
  // 歌曲名
  name: string = ''
  // 时长
  duration: number = 0
  cover: string = ''
  lang: string = ''
  listen_end: number = 0
  // 歌手名
  performer: string = ''
  mp3_wav: string = ''
  style: string = ''
  img: string = ''
  // 播放地址
  src: string = ''
  // 专辑
  album: Album | null = null
  // constructor(id: number, album_id: number, name: string, duration: number, cover: string, lang: string,
  //   listen_end: number, performer: string, mp3_wav: string, style: string, img: string, src: string, album: Album) {
  //   this.id = id
  //   this.album_id = album_id
  //   this.name = name
  //   this.duration = duration
  //   this.cover = cover
  //   this.lang = lang
  //   this.listen_end = listen_end
  //   this.performer = performer
  //   this.mp3_wav = mp3_wav
  //   this.style = style
  //   this.img = img
  //   this.src = src
  //   this.album = album
  // }
}

export class Album {
  id: number
  name: string
  alias_name: string
  sub_name: string
  product_code: number
  editor_code: number
  bar_code: string
  performer: string
  version: string
  link: string
  main_version: number
  album_desc: string
  intro: string
  issue_time: string
  issue_state: string
  issue_company: string
  issue_area: number
  copyright: number
  money: number
  graphy: string
  style: string
  lang: string
  is_hot: number
  sort_hot: number
  audit: number
  disc_count: number
  cover: string
  tag: string
  created_at: string
  updated_at: string
  deleted_at: null

  constructor(id: number, name: string, alias_name: string, sub_name: string, product_code: number, editor_code: number,
    bar_code: string, performer: string, version: string, link: string, main_version: number, album_desc: string,
    intro: string, issue_time: string, issue_state: string, issue_company: string, issue_area: number,
    copyright: number, money: number, graphy: string, style: string, lang: string, is_hot: number, sort_hot: number,
    audit: number, disc_count: number, cover: string, tag: string, created_at: string, updated_at: string,
    deleted_at: null) {
    this.id = id
    this.name = name
    this.alias_name = alias_name
    this.sub_name = sub_name
    this.product_code = product_code
    this.editor_code = editor_code
    this.bar_code = bar_code
    this.performer = performer
    this.version = version
    this.link = link
    this.main_version = main_version
    this.album_desc = album_desc
    this.intro = intro
    this.issue_time = issue_time
    this.issue_state = issue_state
    this.issue_company = issue_company
    this.issue_area = issue_area
    this.copyright = copyright
    this.money = money
    this.graphy = graphy
    this.style = style
    this.lang = lang
    this.is_hot = is_hot
    this.sort_hot = sort_hot
    this.audit = audit
    this.disc_count = disc_count
    this.cover = cover
    this.tag = tag
    this.created_at = created_at
    this.updated_at = updated_at
    this.deleted_at = deleted_at
  }
}