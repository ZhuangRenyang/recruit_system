# recruit_system
### `介绍`
毕设项目: 招聘   

### `软件架构`
采用前后端分离技术
前端使用vue + ElementUI 
后端: ssm 框架以及 springboot技术栈
持久层: MySql 
Redis 实现定时任务
使用Websocket 实现前端实时通讯


#### `安装教程`

1.  前端: 
        npm install
        npm run eval
2.  后端:
        导入依赖库
        启动数据库环境:数据库版本 8.0+
        启动redis服务

### `更新说明`:

#### 2022.10.5 / v0.1.8
> 新增首页显示疫情数据。方便应聘者找工作时，不方便前往面试
> 剔除非必要提交的文件

#### 2022.10.5 / v0.1.7
> 新增后置路由守卫,优化页面标题变化的实现
>
> 将聊天室的机器人对接小爱的api接口,实现自动回复
>
> 优化聊天时,与机器人的消息被保存到数据库引发的异常
>
> 优化请求机器人api时,有空格字符会造成的异常bug

#### 2022.10.5 / v0.1.6
> 新增查看未读状态的消息之后,修改消息的状态为已读,小红点消失
>
> 新增登录时,如果有未读消息,执行窗口消息提示,并可点击跳转到聊天页面
>
> 删除轮播图处的职位列表数据
>
> 修复友链无法点击bug
>
> 优化冗余代码
>
> 修复查看职位时,无法显示对应的省份
>
> 修改主页面布局,

#### 2022.10.4 / v0.1.5
> 修复发送聊天内容时,头像获取异常的bug
>
> 将连接聊天服务器(ws)的 连接方式修改为配置文件项

>>>>>>> 2df4bb0 (v0.1.8更新)