const followRouter = {
  title: '我的关注',
  name: Symbol('follow'),
  route: '/follow',
  type: 'view', // 类型: folder, tab, view
  icon: 'el-icon-mouse',
  filePath: 'view/user/follow.vue', // 文件路径
  order: null,
  inNav: true,
  permission:['查看我的关注'],
}

export default followRouter
