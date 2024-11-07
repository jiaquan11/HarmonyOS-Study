import { Song } from '../model/MusicData'

@Component
export struct MusicList {
  item: Song | null = null

  build() {
    Row() {
      Image(this.item?.img).width(40).aspectRatio(1)
      Text(this.item?.name)
    }
  }
}