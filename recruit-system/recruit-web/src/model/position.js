import {
  get,
  put,
  _delete,
  post
} from '@/lin/plugin/axios'
class Position {
  static async getByState(state, page, count) {
    const res = await get(`recruit/position/page/${state}`, {
      page: page,
      count: count
    })
    return res
  }

  static async getById(id) {
    const res = await get(`recruit/position/${id}`)
    return res
  }

  static async updateState(id, state) {
    const res = await put(`recruit/position/state/${id}?state=${state}`)
    return res
  }

  static async updateHits(id) {
    const res = await put(`recruit/position/hits/${id}`)
    return res
  }

  static async getByHrId(hrID, page, count) {
    const res = await get(`recruit/position/page/hr/${hrID}`, {
      page: page,
      count: count
    })
    return res
  }

  static async delete(id) {
    const res = await _delete(`recruit/position/${id}`)
    return res
  }

  static async updatePosition(id, data) {
    const res = await put(`recruit/position/${id}`, data)
    return res
  }

  static async create(data) {
    const res = await post('recruit/position', data)
    return res
  }

  static async getByKeyword(page, count, keyword) {
    const res = await get('recruit/position/page/keyword', {
      page: page,
      count: count,
      keyword: keyword
    })
    return res
  }

  static async sortByHits() {
    const res = await get('recruit/position/sort')
    return res
  }
}

export {
  Position
}
