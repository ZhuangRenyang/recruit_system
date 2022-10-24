const deliveryBoxRouter = {
  route: null,
  name: null,
  title: '投递箱',
  type: 'folder', // 类型: folder, tab, view
  icon: 'el-icon-takeaway-box',
  filePath: null, // 文件路径
  order: null,
  inNav: true,
  permission: ['我的投递箱'],
  children: [{
    title: '简历投递',
    type: 'view',
    name: 'wait',
    route: '/box/wait',
    filePath: 'view/box/box-application-wait.vue',
    inNav: true,
    icon: 'iconfont icon-tushuguanli',
    permission: ['我的投递箱'],
  }, ],
}

export default deliveryBoxRouter
