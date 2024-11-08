import cloud from '@hw-agconnect/cloud'
import { Student } from '../model/Student'
import schema from '../model/schema.json'
import { JSON } from '@kit.ArkTS';

export class DbHelper {
  async update() {
    try {
      const record = await cloud.database({objectTypeInfo:schema, zoneName:"cloudDBZoneName1"}).collection(Student).upsert({
        "stu_id": 5,
        "stuName": "jq",
        "stuSex": "男",
        "stuBir": "1988-12-12"
      });
      console.log('ken', "upsert success, record = " + record)
    } catch (err) {
      console.log('ken', "upsert failed")
    }
  }

  async find() {
    try {
      const resultArray = await cloud.database({objectTypeInfo:schema, zoneName:"cloudDBZoneName1"}).collection(Student).query().get()
      console.log('ken', "query success: " + JSON.stringify(resultArray))
    } catch (err) {
      console.log('ken', "query err: " + JSON.stringify(err))
    }
  }

  async findCond() {
    try {
      const resultArray = await cloud.database({objectTypeInfo:schema, zoneName:"cloudDBZoneName1"})
        .collection(Student).query()
        .lessThan('stu_id', 3)
        .get();
      console.log('ken', "query success: " + JSON.stringify(resultArray))
    } catch (err) {
      console.log('ken', "query err: " + JSON.stringify(err))
    }
  }

  async delete() {
    try {
      const record = await cloud.database({objectTypeInfo:schema, zoneName:"cloudDBZoneName1"}).collection(Student).delete({
        "stu_id": 2
      });
      console.log('ken', "delete success, record = " + record)
    } catch (err) {
      console.log('ken', "delete failed")
    }
  }
}