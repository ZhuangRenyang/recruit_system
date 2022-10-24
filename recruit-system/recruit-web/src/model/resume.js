import {
  get,
  post,
  put,
  _delete
} from '@/lin/plugin/axios'
class Resume {
  static async create(data) {
    const res = await post('recruit/resume', data)
    return res
  }

  static async getByUserId(userId) {
    const res = await get(`recruit/resume/get/${userId}`)
    return res
  }

  static async update(userId, data) {
    const res = await put(`recruit/resume/${userId}`, data)
    return res
  }

  static async getById(id) {
    const res = await get(`recruit/resume/${id}`)
    return res
  }

  static async updateEducation(data) {
    const res = await put(`recruit/resume/education/update`, data)
    return res
  }

  static async createEducation(data) {
    const res = await post('recruit/resume/education', data)
    return res
  }

  static async delEducation(id) {
    const res = await _delete(`recruit/resume/education/${id}`)
    return res
  }

  static async updateProject(data) {
    const res = await put(`recruit/resume/project/update`, data)
    return res
  }

  static async createProject(data) {
    const res = await post('recruit/resume/project', data)
    return res
  }

  static async delProject(id) {
    const res = await _delete(`recruit/resume/project/${id}`)
    return res
  }

  static async updateExperience(data) {
    const res = await put(`recruit/resume/experience/update`, data)
    return res
  }

  static async createExperience(data) {
    const res = await post('recruit/resume/experience', data)
    return res
  }

  static async delExperience(id) {
    const res = await _delete(`recruit/resume/experience/${id}`)
    return res
  }

}

export {
  Resume
}
