const positionRouter = {
  route: null,
  name: null,
  title: '职位管理',
  type: 'folder', // 类型: folder, tab, view
  icon: 'el-icon-camera',
  filePath: null, // 文件路径
  order: null,
  inNav: true,
  permission:['查看已发布的职位'],
  children: [
    {
      title: '发布职位',
      type: 'view',
      name: 'CreatePosition',
      route: '/position/create',
      filePath: 'view/position/position-create.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission:['发布职位'],
    },
    {
      title: '已发布的职位',
      type: 'view',
      name: 'ListPosition',
      route: '/position/list',
      filePath: 'view/position/position-list.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission:['查看已发布的职位'],
    },
  ],
}

export default positionRouter
