const categoryRouter = {
  route: null,
  name: null,
  title: '职位分类管理',
  type: 'folder', // 类型: folder, tab, view
  icon: 'el-icon-video-camera',
  filePath: null, // 文件路径
  order: null,
  inNav: true,
  permission:['查看分类列表'],
  children: [
    {
      title: '新增分类',
      type: 'view',
      name: 'add',
      route: '/category/add',
      filePath: 'view/category/category-create.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission:['新增分类'],
    },
    {
      title: '分类列表',
      type: 'view',
      name: 'list',
      route: '/category/list',
      filePath: 'view/category/category-list.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission:['查看分类列表'],
    },
  ],
}

export default categoryRouter
