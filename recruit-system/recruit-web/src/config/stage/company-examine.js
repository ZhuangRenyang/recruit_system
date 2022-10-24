const companyExamineRouter = {
  route: null,
  name: null,
  title: '企业认证审核',
  type: 'folder', // 类型: folder, tab, view
  icon: 'el-icon-open',
  filePath: null, // 文件路径
  order: null,
  inNav: true,
  permission:['查看分类列表'],
  children: [
    {
      title: '未审核',
      type: 'view',
      name: 'wait',
      route: '/company/examine/wait',
      filePath: 'view/examine/company/company-examine-wait.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission:['查看分类列表'],
    },
    {
      title: '审核通过',
      type: 'view',
      name: 'pass',
      route: '/company/examine/pass',
      filePath: 'view/examine/company/company-examine-pass.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission:['查看分类列表'],
    },
    {
      title: '审核不通过',
      type: 'view',
      name: 'fail',
      route: '/company/examine/fail',
      filePath: 'view/examine/company/company-examine-fail.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission:['查看分类列表'],
    },
  ],
}

export default companyExamineRouter
