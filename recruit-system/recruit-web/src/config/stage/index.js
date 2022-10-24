import adminConfig from './admin' // 引入权限管理路由文件
import companyExamineConfig from './company-examine' // 引入企业认证审核路由文件
import positionExamineConfig from './position-examine' // 引入职位认证审核路由文件
import categoryConfig from './category' // 引入职位分类管理路由文件
import positionConfig from './position' // 引入职位管理路由文件
import resumeManageConfig from './resume-manage' // 引入简历管理路由文件
import mycompanyConfig from './mycompany' // 引入我的企业路由文件
import followConfig from './follow' // 引入我的关注路由文件
import wsMsgConfig from './ws_msg' // 引入在线聊天沟通路由文件
import collectionConfig from './collection' // 引入我的收藏路由文件
import resumeConfig from './resume' // 引入我的简历路由文件
import deliveryBoxConfig from './delivery-box' // 引入投递箱路由文件

import pluginsConfig from './plugin'
import Utils from '@/lin/util/util'
import InterviewConfig from './interview-manage'
import MyInterviewRouterConfig from './myinterview'
// eslint-disable-next-line import/no-mutable-exports
let homeRouter = [{
    title: '职位',
    type: 'view',
    name: Symbol('about'),
    route: '/about',
    filePath: 'view/about/about.vue',
    inNav: true,
    icon: 'iconfont icon-iconset0103',
    order: 1,
  },
  {
    title: '公司',
    type: 'view',
    name: Symbol('company'),
    route: '/company',
    filePath: 'view/about/company.vue',
    inNav: true,
    icon: 'el-icon-monitor',
    order: 2,
  },
  {
    title: '个人中心',
    type: 'view',
    name: Symbol('center'),
    route: '/center',
    filePath: 'view/center/center.vue',
    inNav: false,
    icon: 'iconfont icon-rizhiguanli',
  },
  {
    title: '404',
    type: 'view',
    name: Symbol('404'),
    route: '/404',
    filePath: 'view/error-page/404.vue',
    inNav: false,
    icon: 'iconfont icon-rizhiguanli',
  },
  adminConfig,
  companyExamineConfig,
  positionExamineConfig,
  categoryConfig,
  positionConfig,
  resumeManageConfig,
  mycompanyConfig,
  followConfig,
  collectionConfig,
  resumeConfig,
  deliveryBoxConfig,
  InterviewConfig,
  MyInterviewRouterConfig,
  wsMsgConfig,
  {
    title: '日志管理',
    type: 'view',
    name: Symbol('log'),
    route: '/log',
    filePath: 'view/log/log.vue',
    inNav: true,
    icon: 'iconfont icon-rizhiguanli',
    order: 2,
    permission: ['查询所有日志'],
  },
]

const plugins = [...pluginsConfig]

// 筛除已经被添加的插件
function filterPlugin(data) {
  if (plugins.length === 0) return;
  if (Array.isArray(data)) {
    data.forEach(item => {
      filterPlugin(item)
    })
  } else {
    const findResult = plugins.findIndex(item => data === item)
    if (findResult >= 0) {
      plugins.splice(findResult, 1)
    }
    if (data.children) {
      filterPlugin(data.children)
    }
  }
}

filterPlugin(homeRouter)

homeRouter = homeRouter.concat(plugins)
// 处理顺序
homeRouter = Utils.sortByOrder(homeRouter)
// 使用 Symbol 处理 name 字段, 保证唯一性
const deepReduceName = target => {
  if (Array.isArray(target)) {
    target.forEach(item => {
      if (typeof item !== 'object') {
        return
      }
      deepReduceName(item)
    })
    return
  }
  if (typeof target === 'object') {
    if (typeof target.name !== 'symbol') {
      // eslint-disable-next-line no-param-reassign
      target.name = target.name || Utils.getRandomStr()
      // eslint-disable-next-line no-param-reassign
      target.name = Symbol(target.name)
    }

    if (Array.isArray(target.children)) {
      target.children.forEach(item => {
        if (typeof item !== 'object') {
          return
        }
        deepReduceName(item)
      })
    }
  }
}

deepReduceName(homeRouter)

export default homeRouter
