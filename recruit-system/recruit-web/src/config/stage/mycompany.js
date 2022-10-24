const mycompanyRouter = {
  title: '我的企业',
  type: 'view',
  name: Symbol('company-modify'),
  route: '/company/modify',
  filePath: 'view/company/company-modify.vue',
  inNav: true,
  icon: 'el-icon-mobile',
  order: null,
  permission:['企业认证'],
}

export default mycompanyRouter
