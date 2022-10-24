const resumeRouter = {
  name: Symbol('resume-create'),
  route: '/resume-create',
  title: '我的简历',
  type: 'view',
  icon: 'el-icon-folder',
  filePath: 'view/resume/resume-modify.vue',
  order: null,
  inNav: true,
  permission: ['查询简历'],
}

export default resumeRouter
