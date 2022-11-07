import {
  get,
  post,
  put,
  _delete
} from '@/lin/plugin/axios'
import axios from "axios"
class Application {
  static async create(data) {
    const res = await post('recruit/application', data)
    return res
  }

  static async getByHrId(hrID, state) {
    const res = await get(`recruit/application/page/${hrID}`, {
      state: state
    })
    return res
  }

  static async updateState(id, state) {
    const res = await put(`recruit/application/state/${id}?state=${state}`)
    return res
  }

  static async delete(id) {
    const res = await _delete(`recruit/application/${id}`)
    return res
  }

  static async sortByGrade(hrID) {
    const res = await get(`recruit/application/sort/${hrID}`)
    return res
  }

  static async getByPositionIdAndUserId(positionId, userId) {
    const res = await get('recruit/application', {
      positionId: positionId,
      userId: userId
    })
    return res
  }

  static async getByUserId(userId, count, page) {
    try{
      const res = await get(`recruit/application/page/find/${userId}`, {
        userId: userId,
        count: count,
        page: page,
      })
      return res
    }catch(e){
      console.log("appliction.47:",e);
      return {total:0}
    }
  }

  
  static async getMsg(msg) {
    try{
      let data = await axios.get(`/msg-api/api/api-xiaoai/talk.php?msg=${msg}`);
      return {
        total:1,
        // data:await axios.get(`https://v.api.aa1.cn/api/api-xiaoai/talk.php?msg=${msg}`)
        data:data.data ? data.data : data
      }
    }catch(e){
      // console.log("自动回复失败:",e);
      return {total:0,data:"对不起，暂不支持该功能，你和我聊点儿别的吧"}
    }
  }

  static async ESsituation(){
    return await axios.get(`http://iwenwiki.com/wapicovid19/ncov.php?key=62e34ad34025d5d5127135efa58d4ca8`)
  }
}

export {
  Application
}
