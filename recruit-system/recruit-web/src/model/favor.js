import {
  get,
  _delete,
  post
} from '@/lin/plugin/axios'
class Favor {
  static async getFavorByUserId(userId) {
    const res = await get(`recruit/favor/${userId}`)
    return res
  }

  static async cancel(userId, positionId) {
    const res = await _delete('recruit/favor/cancel', {
      userId: userId,
      positionId: positionId
    })
    return res
  }

  static async create(data) {
    const res = await post('recruit/favor', data)
    return res
  }
}

export {
  Favor
}
