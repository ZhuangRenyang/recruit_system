const MsgRouter = {
  name: Symbol('ws-msg'),
  route: '/ws-msg',
  title: '我的沟通',
  type: 'view',
  icon: 'el-icon-chat-line-square',
  filePath: 'view/about/msg.vue',
  order: null,
  inNav: true,
  permission: ['我的沟通'],  // 与数据库字段 name映射
}

export default MsgRouter
