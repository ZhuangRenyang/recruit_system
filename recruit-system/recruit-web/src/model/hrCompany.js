import {
  get,
  post
} from '@/lin/plugin/axios'
class HRCompany {
  static async get(hrID) {
    const res = await get(`recruit/hr-company/${hrID}`)
    return res
  }

  static async create(hrID, companyID) {
    const res = await post(`recruit/hr-company/?hrID=${hrID}&companyID=${companyID}`)
    return res
  }
}

export {
  HRCompany
}
