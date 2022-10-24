import {
  get,
  put,
  post
} from '@/lin/plugin/axios'
class Company {
  static async getById(id) {
    const res = await get(`recruit/company/${id}`)
    return res
  }

  static async update(id, data) {
    const res = await put(`recruit/company/${id}`, data)
    return res
  }

  static async getByState(state, page, count) {
    const res = await get(`recruit/company/page/${state}`, {
      page: page,
      count: count
    })
    return res
  }

  static async updateState(id, state) {
    const res = await put(`recruit/company/state/${id}?state=${state}`)
    return res
  }

  static async create(data) {
    const res = await post('recruit/company', data)
    return res
  }

  static async getByName(name) {
    const res = await get('recruit/company/search', {
      name: name
    })
    return res
  }

  static async getByKeyword(page, count, keyword) {
    const res = await get('recruit/company/page/keyword', {
      page: page,
      count: count,
      keyword: keyword
    })
    return res
  }

  static async findHotCompany() {
    const res = await get('recruit/company/find')
    return res
  }
}

export {
  Company
}
