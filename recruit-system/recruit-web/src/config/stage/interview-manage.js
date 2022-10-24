const InterviewManageRouter = {
  route: null,
  name: null,
  title: '面试管理',
  type: 'folder', // 类型: folder, tab, view
  icon: 'el-icon-files',
  filePath: null, // 文件路径
  order: null,
  inNav: true,
  permission: ['面试管理'],
  children: [{
      title: '查看面试名单',
      type: 'view',
      name: 'wait',
      route: '/interview/manage',
      filePath: 'view/interview/interviewManage.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['面试管理'],
    },
    {
      title: '面试结果',
      type: 'view',
      name: 'pass',
      route: '/interview/pass',
      filePath: 'view/interview/interview-pass.vue',
      inNav: true,
      icon: 'iconfont icon-tushuguanli',
      permission: ['面试管理'],
    }
  ],
}

export default InterviewManageRouter
