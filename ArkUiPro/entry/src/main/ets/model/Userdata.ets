export class Userinfo {
  usrid: number
  uname: string
  uimg: Resource

  constructor(usrid: number, uname: string, uimg: Resource) {
    this.usrid = usrid
    this.uname = uname
    this.uimg = uimg
  }
}

export class Users {
  uname: string
  upwd: string

  constructor(uname: string, upwd: string) {
    this.uname = uname
    this.upwd = upwd
  }
}