const positionExamineRouter = {
  route: null,
  name: null,
  title: '职位认证审核',
  type: 'folder', // 类型: folder, tab, view
  icon: 'el-icon-connection',
  filePath: null, // 文件路径
  order: null,
  inNav: true,
  permission:['查看分类列表'],
  children: [
    {
      title: '未审核',
      type: 'view',
      name: 'wait',
      route: '/position/examine/wait',
      filePath: 'view/examine/position/position-examine-wait.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission:['查看分类列表'],
    },
    {
      title: '审核通过',
      type: 'view',
      name: 'pass',
      route: '/position/examine/pass',
      filePath: 'view/examine/position/position-examine-pass.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission:['查看分类列表'],
    },
    {
      title: '审核不通过',
      type: 'view',
      name: 'fail',
      route: '/position/examine/fail',
      filePath: 'view/examine/position/position-examine-fail.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission:['查看分类列表'],
    },
  ],
}

export default positionExamineRouter
