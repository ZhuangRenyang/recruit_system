# recruit_system
### `介绍`
毕设项目: 校企招聘   答辩结束,放出来造福群众

### `软件架构`
采用前后端分离技术
前端使用vue + ElementUI 
后端: ssm 框架以及 springboot技术栈
持久层: MySql 8
Redis 实现定时任务
使用Websocket 实现前端实时通讯


#### `安装教程`

1.  前端(recruit-web):
        npm install
        npm run eval
2.  后端(recruit-sys):
        导入依赖库
        启动数据库环境:数据库版本 8.0+
        启动redis服务

### `更新说明`:

#### 2022.11.7  v1.0.1

> 修复后台处理心跳包时, 使用 "|" 切割数据导致的bug, 如 "17|" 被切成了 ["1","7","|"]


#### 2022.11.6  v1.0

> 大体项目流程开发完成,项目版本提升至 1.0版本
>
> 优化页面布局,
>
> 统一项目名称为:校企招聘网
>
> 更新.sql文件数据
>
> 增加在线聊天时,可显示对方是否在线状态
>
> 修改首页职位列表展示时为随机顺序
>
> 优化部分ui动画效果
>
> 更换logo
>
> 修复部分旧版浏览器不兼容.replaceAll的bug
>
> 修复部署到服务器会导致无法请求外部api的bug
>
> 修复websocker后台服务监听客户端离线时,没有将客户端的数据移除的bug
>
> 修复使用后置路由时,因 为空名字的路由导致的页面标题为空

#### 2022.10.24  v0.1.8

> 新增首页显示疫情数据。方便应聘者找工作时，了解当地疫情情况
>
> 剔除非必要提交的文件
>
> 优化职位地图ui布局, 修复查看地图时遮罩层重叠的bug

#### 2022.10.17  v0.1.7
> 新增后置路由守卫,优化页面标题变化的实现
>
> 将聊天室的机器人对接小爱的api接口,实现自动回复
>
> 优化聊天时,与机器人的消息被保存到数据库引发的异常
>
> 优化请求机器人api时,有空格字符会造成的异常bug

#### 2022.10.5   v0.1.6
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

#### 2022.10.4   v0.1.5
> 修复发送聊天内容时,头像获取异常的bug
>
> 将连接聊天服务器(ws)的 连接方式修改为配置文件项

```
# 消息码配置文件
# 格式：消息码 -> 消息
code-message[0]=成功
code-message[1]=创建成功
code-message[2]=更新成功
code-message[3]=删除成功
code-message[4]=密码修改成功
code-message[5]=删除用户成功
code-message[6]=更新用户成功
code-message[7]=更新分组成功
code-message[8]=删除分组成功
code-message[9]=添加权限成功
code-message[10]=删除权限成功
code-message[11]=注册成功
code-message[15]=新建分组成功
code-message[9999]=服务器未知错误
code-message[10000]=未携带令牌
code-message[10001]=权限不足
code-message[10010]=授权失败
code-message[10011]=更新密码失败
code-message[10012]=请传入认证头字段
code-message[10013]=认证头字段解析失败
code-message[10020]=资源不存在
code-message[10021]=用户不存在
code-message[10023]=分组不存在，无法新建用户
code-message[10024]=分组不存在
code-message[10025]=找不到相应的视图处理器
code-message[10026]=未找到文件
code-message[10030]=参数错误
code-message[10031]=用户名或密码错误
code-message[10032]=请输入正确的密码
code-message[10040]=令牌失效
code-message[10041]=access token 损坏
code-message[10042]=refresh token 损坏
code-message[10050]=令牌过期
code-message[10051]=access token 过期
code-message[10052]=refresh token 过期
code-message[10060]=字段重复
code-message[10070]=禁止操作
code-message[10071]=已经有用户使用了该名称，请重新输入新的用户名
code-message[10072]=分组名已被使用，请重新填入新的分组名
code-message[10073]=root分组不可添加用户
code-message[10074]=root分组不可删除
code-message[10075]=guest分组不可删除
code-message[10076]=邮箱已被使用，请重新填入新的邮箱
code-message[10077]=不可将用户分配给不存在的分组
code-message[10078]=不可修改root用户的分组
code-message[10080]=请求方法不允许
code-message[10100]=刷新令牌获取失败
code-message[10110]=文件体积过大
code-message[10120]=文件数量过多
code-message[10121]=文件太多，文件总数不可超过${file.nums}
code-message[10130]=文件扩展名不符合规范
code-message[10140]=请求过于频繁，请稍后重试
code-message[10150]=丢失参数
code-message[10160]=类型错误
code-message[10170]=请求体不可为空
code-message[10180]=全部文件大小不能超过
code-message[10190]=读取文件数据失败

code-message[1000]=创建简历成功
code-message[1010]=简历更新成功
code-message[20000]=创建简历失败
code-message[20010]=还未创建简历，请先完成简历的创建
code-message[20020]=简历不存在

code-message[1100]=新增关注成功
code-message[1200]=取消关注成功
code-message[21000]=并未关注该公司
code-message[22000]=该用户并未关注任何公司
code-message[23000]=该用户并未关注该公司
code-message[24000]=已经关注过该公司，不可重复关注

code-message[3000]=更新公司信息成功，请等待管理员审核
code-message[3100]=更新公司状态成功
code-message[3200]=已发起企业认证，请等待管理员审核
code-message[30000]=公司不存在

code-message[40000]=该用户并未收藏任何职位
code-message[45000]=该用户并未收藏该职位
code-message[1500]=取消收藏成功
code-message[1600]=职位收藏成功
code-message[40010]=已经收藏过该职位，不可重复收藏

code-message[2000]=职位下架成功
code-message[2100]=职位发布成功，请等待管理员审核
code-message[2200]=更新职位信息成功，请等待管理员审核
code-message[4000]=更新职位状态成功
code-message[4100]=更新职位浏览量成功
code-message[41000]=职位不存在

code-message[5000]=职位分类新增成功
code-message[5100]=职位分类更新成功
code-message[5200]=职位分类删除成功
code-message[50000]=职位分类不存在
code-message[51000]=没有任何职位分类

code-message[60000]=请先完成企业认证

code-message[6000]=添加观察者成功
code-message[6100]=移除观察者成功

code-message[7000]=简历投递成功
code-message[7100]=更新申请状态成功
code-message[7200]=撤销申请成功
code-message[70000]=不存在该申请
```

#### 2023.4.21   v0.1.6

> 修复SQL数据库,增加主键自增
>
> 修复无法注册的问题
>
> 修复表单无法插入的问题

#### 登录密码
```
INSERT INTO `user` VALUES (1, 'root', '超级管理员', NULL, 'admin@qq.com', '12312312312', '2021-03-14 14:49:21', '2022-11-08 16:30:43', NULL);
INSERT INTO `user` VALUES (4, 'user', '刘同学', NULL, 'admin@qq.com', '12312312312', '2021-04-16 02:02:05', '2022-11-08 16:30:43', NULL);
INSERT INTO `user` VALUES (5, 'user1', '李同学', NULL, 'admin@qq.com', '12312312312', '2021-04-16 02:02:33', '2022-11-08 16:30:43', NULL);
INSERT INTO `user` VALUES (6, 'hr', '陈经理', NULL, 'admin@qq.com', '12312312312', '2021-04-16 02:02:48', '2022-11-08 16:30:43', NULL);
INSERT INTO `user` VALUES (7, 'hr1', '郑经理', NULL, 'admin@qq.com', '12312312312', '2021-04-16 02:03:10', '2022-11-08 16:30:43', NULL);
INSERT INTO `user` VALUES (8, 'admin', '平台管理员', NULL, 'admin@qq.com', '12312312312', '2021-04-16 02:03:27', '2022-11-08 16:30:43', NULL);
INSERT INTO `user` VALUES (9, 'user2', '蓝同学', NULL, 'admin@qq.com', '12312312312', '2021-05-02 15:28:53', '2022-11-08 16:30:43', NULL);
INSERT INTO `user` VALUES (13, 'sysadmin', '系统管理员', NULL, 'admin@qq.com', '12312312312', '2022-03-22 23:28:57', '2022-11-08 16:30:43', NULL);
INSERT INTO `user` VALUES (17, 'eval', '张三', NULL, 'admin@qq.com', '12312312312', '2022-03-22 23:28:57', '2022-11-08 16:30:43', NULL);
```
