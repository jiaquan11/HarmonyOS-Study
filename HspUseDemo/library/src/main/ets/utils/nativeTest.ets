import native from 'liblibrary.so'

export function nativeMulti(a:number, b:number):number {
  let result:number = native.multi(a, b)
  return result
}