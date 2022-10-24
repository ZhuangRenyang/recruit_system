const resumeManageRouter = {
  route: null,
  name: null,
  title: '职位申请管理',
  type: 'folder', // 类型: folder, tab, view
  icon: 'el-icon-files',
  filePath: null, // 文件路径
  order: null,
  inNav: true,
  permission: ['简历管理'],
  children: [{
      title: '未处理的申请',
      type: 'view',
      name: 'wait',
      route: '/application/wait',
      filePath: 'view/application/application-wait.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['简历管理'],
    },
    {
      title: '已通过的申请',
      type: 'view',
      name: 'pass',
      route: '/application/pass',
      filePath: 'view/application/application-pass.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['简历管理'],
    },
    {
      title: '人才库简历',
      type: 'view',
      name: 'fail',
      route: '/application/fail',
      filePath: 'view/application/application-fail.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['简历管理'],
    },
    // {
    //   title: '简历排序',
    //   type: 'view',
    //   name: 'sort',
    //   route: '/application/sort',
    //   filePath: 'view/application/application-sort.vue',
    //   inNav: true,
    //   icon: 'iconfont icon-tushuguanli',
    //   permission: ['简历排序'],
    // },
  ],
}

export default resumeManageRouter
