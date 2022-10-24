const collectionRouter = {
  title: '我的收藏',
  name: Symbol('collection'),
  route: '/collection',
  type: 'view', // 类型: folder, tab, view
  icon: 'el-icon-coordinate',
  filePath: 'view/user/collection.vue', // 文件路径
  order: null,
  inNav: true,
  permission:['查看我的收藏'],
}

export default collectionRouter
