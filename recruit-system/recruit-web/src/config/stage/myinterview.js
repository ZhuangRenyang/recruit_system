const MyInterviewRouter = {
  route: null,
  name: null,
  title: '我的面试',
  type: 'folder', // 类型: folder, tab, view
  icon: 'el-icon-files',
  filePath: null, // 文件路径
  order: null,
  inNav: true,
  permission: ['我的面试'],
  children: [{
    title: '查看我的面试',
    type: 'view',
    name: 'wait',
    route: '/interview/my-interview',
    filePath: 'view/interview/myInterview.vue',
    inNav: true,
    icon: 'iconfont icon-tushuguanli',
    permission: ['我的面试'],
  }, ],
}

export default MyInterviewRouter
