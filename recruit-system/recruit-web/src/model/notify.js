import {
  get,
  put
} from '@/lin/plugin/axios'
class Notify {
  static async get(userName, isRead) {
    try{
      const res = await get('recruit/notify', {
        userName: userName,
        isRead: isRead
      })
      return res
    }catch(err){
      return null;
    }
  }

  static async getAll(userName) {
    const res = await get('recruit/notify/all', {
      userName: userName
    })
    return res
  }

  static async update(userName) {
    const res = await put(`recruit/notify?userName=${userName}`)
    return res
  }
}

export {
  Notify
}
