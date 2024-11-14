/**
 * 导出HSP中的资源
 * 对外提供的资源封装为一个资源管理类
 */
export class ResManager {
  static getPic():Resource {
    return $r("app.media.app_iconhsp")
  }

  static getDesc():Resource {
    return $r('app.string.shared_desc_hsp')
  }
}