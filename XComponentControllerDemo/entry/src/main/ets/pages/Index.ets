import nativeRender from 'libnativerender.so';

class MyXComponentController extends XComponentController {
    onSurfaceCreated(surfaceId: string): void {
      console.log('onSurfaceCreated surfaceId: ${surfaceId}');
      nativeRender.SetSurfaceId(BigInt(surfaceId));
    }

    onSurfaceChanged(surfaceId: string, rect: SurfaceRect): void {
      console.log('onSurfaceChanged surfaceId: ${surfaceId}, rect:${ArkTSON.stringify(rect)}');
      nativeRender.ChangeSurface(BigInt(surfaceId), rect.surfaceWidth, rect.surfaceHeight);
    }

    onSurfaceDestroyed(surfaceId: string): void {
      console.log('onSurfaceDestroyed surfaceId: ${surfaceId}');
      nativeRender.DestroySurface(BigInt(surfaceId));
    }
}

@Entry
@Component
struct Index {
  @State currentStatus: string = "index";
  xComponentController: XComponentController = new MyXComponentController();

  build() {
      Column() {
        Column({ space: 10 }) {
          XComponent({
            type: XComponentType.SURFACE,
            controller: this.xComponentController
          })
          Text(this.currentStatus)
            .fontSize("24fp")
            .fontWeight(500)
        }
        .onClick(() => {
          let surfaceId = this.xComponentController.getXComponentSurfaceId();
          nativeRender.ChangeColor(BigInt(surfaceId));//触摸XComponent界面，切换颜色绘制
          let hasChangeColor: boolean = false;
          if (nativeRender.GetXComponentStatus(BigInt(surfaceId))) {
            hasChangeColor = nativeRender.GetXComponentStatus(BigInt(surfaceId)).hasChangeColor;
          }
          if (hasChangeColor) {
            this.currentStatus = "change color";
          }
        })

        Row() {
          Button("Draw Star")
            .fontSize("16fp")
            .fontWeight(500)
            .margin({ bottom: 24 })
            .onClick(() => {
              let surfaceId = this.xComponentController.getXComponentSurfaceId();
              nativeRender.DrawPattern(BigInt(surfaceId));
              let hasDraw: boolean = false;
              if (nativeRender.GetXComponentStatus(BigInt(surfaceId))) {
                hasDraw = nativeRender.GetXComponentStatus(BigInt(surfaceId)).hasDraw;
              }
              if (hasDraw) {
                this.currentStatus = "draw star";
              }
            })
            .width("53.6%")
            .height(40)
        }
        .width("100%")
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Bottom)
        .layoutWeight(1)
      }
      .width('100%')
      .height('100%')
    }
  }
