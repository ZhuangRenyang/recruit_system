import {
  get,
  put,
  _delete,
  post
} from '@/lin/plugin/axios'
class Category {
  static async getAll(page, count) {
    const res = await get('recruit/category/page', {
      page: page,
      count: count
    })
    return res
  }

  static async getById(id) {
    const res = await get(`recruit/category/${id}`)
    return res
  }

  static async update(id, data) {
    const res = await put(`recruit/category/${id}`, data)
    return res
  }

  static async delete(id) {
    const res = await _delete(`recruit/category/${id}`)
    return res
  }

  static async createCategory(data) {
    const res = await post('recruit/category', data)
    return res
  }

  static async getList() {
    const res = await get('recruit/category')
    return res
  }

  static async show() {
    const res = await get('recruit/category/show')
    return res
  }
}

export {
  Category
}
