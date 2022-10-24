import {
  get,
  _delete,
  post
} from '@/lin/plugin/axios'
class Follow {
  static async getFollowByUserId(userId) {
    const res = await get(`recruit/follow/${userId}`)
    return res
  }

  static async cancel(userId, companyId) {
    const res = await _delete('recruit/follow/cancel', {
      userId: userId,
      companyId: companyId
    })
    return res
  }

  static async create(data) {
    const res = await post('recruit/follow/add', data)
    return res
  }
}

export {
  Follow
}
