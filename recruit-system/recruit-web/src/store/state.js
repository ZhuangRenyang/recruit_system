import stageConfig from '@/config/stage' // 引入舞台配置
import AppConfig from '@/config/index' // 引入项目配置

export default {
  logined: false, // 是否登录
  user: {}, // 当前用户
  sideBarLevel: AppConfig.sideBarLevel || 3,
  defaultRoute: AppConfig.defaultRoute || '/',  // 默认登录后进入的页面,先进入首页连接websocket,不进入 /about
  // 推送消息
  readedMessages: [],
  unreadMessages: [],
  permissions: [], // 每个用户的所有权限
  groupId: "",
  // 舞台配置
  stageConfig,
  // 当前页信息
  currentRoute: {
    config: null,
    treePath: [],
  },
}
