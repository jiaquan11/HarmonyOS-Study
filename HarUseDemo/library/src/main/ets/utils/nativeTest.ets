import native from 'liblibrary.so'

export function nativeAdd(a:number, b:number) {
  let result:number = native.add(a, b)
  return result;
}