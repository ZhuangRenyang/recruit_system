import _axios, {
  post,
  get,
  put
} from '@/lin/plugin/axios'
import {
  saveTokens
} from '../util/token'
import store from '@/store'

export default class User {
  /**
   * 分配用户
   * @param {object} data 注册信息
   */
  static register(data) {
    return _axios({
      method: 'post',
      url: 'recruit/user/register',
      data,
      handleError: true,
    })
  }

  /**
   * 登陆获取tokens
   * @param {string} username 用户名
   * @param {string} password 密码
   */
  static async getToken(username, password) {
    const tokens = await post('recruit/user/login', {
      username,
      password,
    })
    saveTokens(tokens.access_token, tokens.refresh_token)
    return tokens
  }

  /**
   * 获取当前用户信息，并返回User实例
   */
  static async getInformation() {
    const info = await get('recruit/user/information')
    const storeUser = store.getters.user === null ? {} : store.getters.user
    return Object.assign({
      ...storeUser
    }, info)
  }

  /**
   * 获取当前用户信息和所拥有的权限
   */
  static async getPermissions() {
    const info = await get('recruit/user/permissions')
    const storeUser = store.getters.user === null ? {} : store.getters.user
    return Object.assign({
      ...storeUser
    }, info)
  }

  /**
   * 获取当前用户分组
   */
  static async getGroup() {
    const id = store.getters.user === null ? "" : store.getters.user.id
    const res = await get('recruit/user/getGroup/' + id)
    return res
  }

  /**
   * 用户修改密码
   * @param {string} newPassword 新密码
   * @param {string} confirmPassword 确认新密码
   * @param {string} oldPassword 旧密码
   */
  static updatePassword({
    old_password,
    new_password,
    confirm_password
  }) {
    return put('recruit/user/change_password', {
      new_password,
      confirm_password,
      old_password,
    })
  }

  
  //** 获取验证码 */
  static async getMailCode(mail) {
    const res = await post('recruit/user/getMailCode',{mail})
    return res
  }
  
  //** 找回密码 */
  static async forgotPwd(data) {
    const res = await post('recruit/user/forgot_password',{data})
    return res
  }

  
  //** 找回密码 */
  static async getID_UserData(data) {
    const res = await post('recruit/user/getID_UserData',{data})
    return res
  }
}
