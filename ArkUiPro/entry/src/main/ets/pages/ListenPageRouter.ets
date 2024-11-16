import { uiObserver, router, UIObserver } from '@kit.ArkUI';

/**
 * 自定义组件监听页面生命周期
 * 使用无感监听页面路由的能力，能够实现在自定义组件中监听页面的生命周期。
 */
@Entry
@Component
struct Index {
  listener: (info: uiObserver.RouterPageInfo) => void = (info: uiObserver.RouterPageInfo) => {
    let routerInfo: uiObserver.RouterPageInfo | undefined = this.queryRouterPageInfo();
    if (info.pageId == routerInfo?.pageId) {
      if (info.state == uiObserver.RouterPageState.ON_PAGE_SHOW) {
        console.log(`Index onPageShow`);
      } else if (info.state == uiObserver.RouterPageState.ON_PAGE_HIDE) {
        console.log(`Index onPageHide`);
      }
    }
  }

  aboutToAppear(): void {
    let uiObserver: UIObserver = this.getUIContext().getUIObserver();
    uiObserver.on('routerPageUpdate', this.listener);
  }
  aboutToDisappear(): void {
    let uiObserver: UIObserver = this.getUIContext().getUIObserver();
    uiObserver.off('routerPageUpdate', this.listener);
  }

  build() {
    Column() {
      Text(`this page is ${this.queryRouterPageInfo()?.pageId}`)
        .fontSize(25)
      Button("push self")
        .onClick(() => {
          router.pushUrl({
            url: 'pages/Index'
          })
        })
      Column() {
        SubComponent()
      }
    }
  }
}

@Component
struct SubComponent {
  listener: (info: uiObserver.RouterPageInfo) => void = (info: uiObserver.RouterPageInfo) => {
    let routerInfo: uiObserver.RouterPageInfo | undefined = this.queryRouterPageInfo();
    if (info.pageId == routerInfo?.pageId) {
      if (info.state == uiObserver.RouterPageState.ON_PAGE_SHOW) {
        console.log(`SubComponent onPageShow`);
      } else if (info.state == uiObserver.RouterPageState.ON_PAGE_HIDE) {
        console.log(`SubComponent onPageHide`);
      }
    }
  }

  aboutToAppear(): void {
    let uiObserver: UIObserver = this.getUIContext().getUIObserver();
    uiObserver.on('routerPageUpdate', this.listener);
  }

  aboutToDisappear(): void {
    let uiObserver: UIObserver = this.getUIContext().getUIObserver();
    uiObserver.off('routerPageUpdate', this.listener);
  }

  build() {
    Column() {
      Text(`SubComponent`)
    }
  }
}