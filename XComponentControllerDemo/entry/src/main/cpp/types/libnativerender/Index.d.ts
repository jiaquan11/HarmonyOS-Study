declare class XComponentContextStatus {
  hasDraw: boolean;
  hasChangeColor: boolean;
}

export const SetSurfaceId: (surfaceId: bigint) => void
export const ChangeSurface: (surfaceId: bigint, width: number, height: number) => void
export const DestroySurface: (surfaceId: bigint) => void
export const DrawPattern: (surfaceId: bigint) => void
export const ChangeColor: (surfaceId: bigint) => void
export const GetXComponentStatus: (surfaceId: bigint) => XComponentContextStatus
