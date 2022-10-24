/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : recruit

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 2022/8/30
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '申请状态,0:待查看,1:已查看,2:通过初筛,3:邀面试,4:未通过',
  `apply_time` datetime(0) NULL DEFAULT NULL COMMENT '申请时间',
  `resume_id` int(11) NOT NULL COMMENT '简历id',
  `position_id` int(11) NOT NULL COMMENT '职位id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `hr_id` int(11) NOT NULL COMMENT 'HR id',
  `company_id` int(10) NULL DEFAULT NULL COMMENT '公司id',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `delete_time` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES (46, 1, NULL, 10, 1, 9, 6, 1, '2022-04-10 18:44:46', '2022-04-10 18:44:46', NULL);
INSERT INTO `application` VALUES (47, 1, NULL, 10, 2, 9, 6, 1, '2022-04-10 18:44:48', '2022-04-10 18:44:48', NULL);
INSERT INTO `application` VALUES (48, 0, NULL, 10, 3, 9, 7, 2, '2022-04-10 18:44:48', '2022-04-10 18:44:48', NULL);
INSERT INTO `application` VALUES (49, 1, NULL, 10, 4, 9, 7, 2, '2022-04-10 18:44:48', '2022-04-10 18:44:48', NULL);
INSERT INTO `application` VALUES (50, 0, NULL, 10, 5, 9, 7, 2, '2022-04-10 18:45:25', '2022-04-10 18:45:25', NULL);
INSERT INTO `application` VALUES (51, 0, NULL, 10, 8, 9, 7, 2, '2022-04-10 18:45:25', '2022-04-10 18:45:25', NULL);
INSERT INTO `application` VALUES (52, 0, NULL, 10, 9, 9, 7, 2, '2022-04-10 18:45:25', '2022-04-10 18:45:25', NULL);
INSERT INTO `application` VALUES (53, 0, NULL, 10, 10, 9, 7, 1, '2022-04-10 18:45:26', '2022-04-10 18:45:26', NULL);
INSERT INTO `application` VALUES (54, 1, NULL, 10, 12, 9, 6, 1, '2022-04-10 18:45:27', '2022-04-10 18:45:27', NULL);
INSERT INTO `application` VALUES (55, 1, NULL, 10, 13, 9, 6, 1, '2022-04-10 18:45:28', '2022-04-10 18:45:28', NULL);
INSERT INTO `application` VALUES (56, 1, NULL, 10, 16, 9, 7, 2, '2022-04-10 18:45:30', '2022-04-10 18:45:30', NULL);
INSERT INTO `application` VALUES (57, 0, NULL, 10, 15, 9, 7, 2, '2022-04-10 18:45:31', '2022-04-10 18:45:31', NULL);
INSERT INTO `application` VALUES (58, 2, NULL, 10, 18, 9, 6, 1, '2022-04-10 18:45:31', '2022-04-10 18:45:31', NULL);
INSERT INTO `application` VALUES (59, 1, NULL, 1, 1, 4, 6, 1, '2022-04-10 18:46:49', '2022-04-10 18:46:49', NULL);
INSERT INTO `application` VALUES (60, 0, NULL, 1, 3, 4, 7, 2, '2022-04-10 18:46:50', '2022-04-10 18:46:50', '2022-05-08 16:31:00');
INSERT INTO `application` VALUES (61, 0, NULL, 1, 5, 4, 7, 2, '2022-04-10 18:46:50', '2022-04-10 18:46:50', '2022-04-24 21:36:44');
INSERT INTO `application` VALUES (62, 1, NULL, 1, 9, 4, 7, 2, '2022-04-10 18:46:51', '2022-04-10 18:46:51', NULL);
INSERT INTO `application` VALUES (63, 2, NULL, 1, 12, 4, 6, 1, '2022-04-10 18:46:52', '2022-04-10 18:46:52', NULL);
INSERT INTO `application` VALUES (64, 1, NULL, 1, 13, 4, 6, 1, '2022-04-10 18:46:52', '2022-04-10 18:46:52', NULL);
INSERT INTO `application` VALUES (65, 0, NULL, 1, 19, 4, 6, 1, '2022-04-14 11:16:00', '2022-04-14 11:16:00', NULL);
INSERT INTO `application` VALUES (66, 0, NULL, 2, 1, 5, 6, 1, '2022-04-24 17:35:34', '2022-04-24 17:35:34', '2022-04-24 18:29:00');
INSERT INTO `application` VALUES (67, 0, NULL, 2, 2, 5, 6, 1, '2022-04-24 17:35:36', '2022-04-24 17:35:36', NULL);
INSERT INTO `application` VALUES (68, 0, NULL, 2, 3, 5, 7, 2, '2022-04-24 17:35:36', '2022-04-24 17:35:36', '2022-04-24 18:29:06');
INSERT INTO `application` VALUES (69, 0, NULL, 2, 5, 5, 7, 2, '2022-04-24 17:35:37', '2022-04-24 17:35:37', NULL);
INSERT INTO `application` VALUES (70, 1, NULL, 2, 10, 5, 7, 1, '2022-04-24 17:35:38', '2022-04-24 17:35:38', NULL);
INSERT INTO `application` VALUES (71, 0, NULL, 2, 12, 5, 6, 1, '2022-04-24 17:35:39', '2022-04-24 17:35:39', NULL);
INSERT INTO `application` VALUES (72, 1, NULL, 2, 19, 5, 6, 1, '2022-04-24 17:35:42', '2022-04-24 17:35:42', NULL);
INSERT INTO `application` VALUES (73, 2, NULL, 2, 15, 5, 7, 2, '2022-04-24 17:35:44', '2022-04-24 17:35:44', NULL);
INSERT INTO `application` VALUES (74, 1, NULL, 1, 18, 4, 6, 1, '2022-04-26 18:05:53', '2022-04-26 18:05:53', NULL);
INSERT INTO `application` VALUES (75, 0, NULL, 1, 2, 4, 6, 1, '2022-04-26 18:11:07', '2022-04-26 18:11:07', NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `key_word` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类关键字',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分类描述',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  `delete_time` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `categoryName_UNIQUE`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Java开发','Java', '这个分类是Java开发', '2021-05-02 00:29:10.235', '2021-05-02 00:29:10.235', NULL);
INSERT INTO `category` VALUES (2, 'C++开发','C++', '这个分类是C++开发', '2021-05-02 00:29:17.152', '2021-05-02 00:29:17.152', NULL);
INSERT INTO `category` VALUES (3, '前端开发','前端', '这个分类是前端开发', '2021-05-02 00:29:37.067', '2021-05-02 00:29:37.067', NULL);
INSERT INTO `category` VALUES (4, '后端开发','后端', '这个分类是后台开发', '2021-05-02 00:29:48.987', '2021-05-02 00:29:48.987', NULL);
INSERT INTO `category` VALUES (5, '数据挖掘','数据', '这个分类是数据挖掘', '2021-05-02 00:30:03.599', '2021-05-02 00:30:03.599', NULL);
INSERT INTO `category` VALUES (6, '大数据开发','大数据', '这个分类是大数据开发', '2021-05-02 00:30:19.041', '2021-05-02 00:30:19.041', NULL);
INSERT INTO `category` VALUES (7, '测试开发','测试', '这个分类是测试开发', '2021-05-02 00:30:28.050', '2021-05-02 00:30:28.050', NULL);
INSERT INTO `category` VALUES (8, '软件测试','软件', '这个分类是软件测试', '2021-05-02 00:30:38.467', '2021-05-02 00:30:38.467', NULL);
INSERT INTO `category` VALUES (9, 'PHP开发','PHP','这个分类是php开发', '2021-05-02 00:31:44.027', '2021-05-02 00:31:44.027', NULL);
INSERT INTO `category` VALUES (10, 'GO开发','GO', '这个分类是GO开发', '2021-05-02 00:32:06.827', '2021-05-02 00:32:06.827', NULL);
INSERT INTO `category` VALUES (11, 'web前端','web', '这个分类是Web前端', '2021-05-02 00:33:26.299', '2021-05-02 00:33:26.299', NULL);
INSERT INTO `category` VALUES (12, '算法开发','算法', '这个分类是算法开发', '2021-05-02 00:33:37.904', '2021-05-02 00:33:37.904', NULL);
INSERT INTO `category` VALUES (13, 'python开发','python', '这个分类是python开发', '2021-05-02 00:35:49.622', '2021-05-02 00:35:49.622', NULL);

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公司名称',
  `foreign_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司外文名',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '总部地点',
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司logo',
  'poster' varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司封面',
  `mission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公司使命',
  `description` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公司简介',
  `state` int(11) NOT NULL DEFAULT 0 COMMENT '公司状态',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  `delete_time` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, '阿里巴巴', 'Alibaba', '中国杭州1', 'https://tse3-mm.cn.bing.net/th/id/OIP-C.gtflipNQAb12CcZQtSdXnQHaEN?w=303&h=180&c=7&r=0&o=5&pid=1.7' , 'https://ts2.cn.mm.bing.net/th?id=OIP-C.UCpKKMGG4i87r-bgNoNTigHaFH&w=300&h=207&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '让天下没有难做的生意', '阿里巴巴集团经营多项业务，另外也从关联公司的业务和服务中取得经营商业生态系统上的支援。业务和关联公司的业务包括：淘宝网、天猫、聚划算、全球速卖通、阿里巴巴国际交易市场、1688、阿里妈妈、阿里云、蚂蚁金服、菜鸟网络等', 1, '2021-05-01 18:30:16.062', '2021-05-01 18:30:16.062', NULL);
INSERT INTO `company` VALUES (2, '腾讯', 'Tencent', '广东深圳','https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2'  , 'https://img.zcool.cn/community/01900d596873e8a8012193a3c0201d.jpg@1280w_1l_2o_100sh.jpg', '通过互联网服务提升人类生活品质', '深圳市腾讯计算机系统有限公司成立于1998年11月，由马化腾、张志东、许晨晔、陈一丹、曾李青五位创始人共同创立.是中国最大的互联网综合服务提供商之一，也是中国服务用户最多的互联网企业之一。', 1, '2021-05-01 18:31:32.539', '2021-05-01 18:31:32.539', NULL);
INSERT INTO `company` VALUES (3, '百度', 'BaiDu', '广东深圳', 'https://img.zcool.cn/community/011a5357b64c620000018c1b9e7e67.png@2o.png'  , 'https://img.zcool.cn/community/013f735739d9fb6ac72580ed89e16a.jpg@1280w_1l_2o_100sh.jpg', '用科技让复杂的世界更简单', '百度是拥有强大互联网基础的领先AI公司。百度愿景是：成为最懂用户，并能帮助人们成长的全球顶级高科技公司', 1, '2021-05-01 18:43:48.372', '2021-05-01 18:43:48.372', NULL);
INSERT INTO `company` VALUES (4, '字节跳动', 'ByteDance', '中国北京','https://tse4-mm.cn.bing.net/th/id/OIP-C.xk8FKrw_AYcVPpXbWu3aUwHaHa?w=172&h=180&c=7&r=0&o=5&pid=1.7' , 'https://www.gsm.pku.edu.cn/__local/C/05/38/E06DDA47A955434057E07991C04_BC660E22_38246.jpeg', '建设全球创作与交流平台', '北京字节跳动科技有限公司，成立于2012年3月，是最早将人工智能应用于移动互联网场景的科技企业之一，是中国北京的一家信息科技公司，', 1, '2021-05-01 18:45:27.184', '2021-05-01 18:45:27.184', NULL);
INSERT INTO `company` VALUES (5, '京东', 'JD', '中国北京', 'https://ts2.cn.mm.bing.net/th?id=OIP-C.C0sXk2GtO2SPLwJkgDnxYQHaF7&w=279&h=223&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2'  , 'https://img.zcool.cn/community/0174e85c6f5afea801203d221dd069.jpg@1280w_1l_2o_100sh.jpg', '网购上京东，省钱又放心', '京东（股票代码：JD），中国自营式电商企业，创始人刘强东担任京东集团董事局主席兼首席执行官 [1]  。旗下设有京东商城、京东金融、拍拍网、京东智能、O2O及海外事业部等', 1, '2021-05-01 18:46:22.717', '2021-05-01 18:46:22.717', NULL);
INSERT INTO `company` VALUES (6, '网易', 'NetEase', '广东广州', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2' ,' https://img.zcool.cn/community/0130b158e657f5a8012049efa1e2d4.png@2o.png ', '以匠心、致创新', '网易公司（NASDAQ: NTES），1997年由创始人兼CEO丁磊先生在广州创办， [1]  2000年在美国NASDAQ股票交易所挂牌上市，是中国领先的互联网技术公司', 1, '2021-05-01 18:47:08.115', '2021-05-01 18:47:08.115', NULL);
INSERT INTO `company` VALUES (7, '深信服', 'Sangfor', '广东深圳','https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2' ,' https://ts2.cn.mm.bing.net/th?id=OIP-C.UCpKKMGG4i87r-bgNoNTigHaFH&w=300&h=207&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '让IT更简单、更安全、更有价值', '深信服是一家专注于企业级安全、云计算及IT基础设施的产品和服务供应商，拥有深信服智安全、信服云和深信服新IT三大业务品牌，致力于让用户的IT更简单、更安全、更有价值', 0, '2021-05-01 18:51:11.858', '2021-05-01 18:51:11.858', NULL);
INSERT INTO `company` VALUES (8, '快手', 'KuaiShou', '中国北京' ,'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2' ,'https://ts2.cn.mm.bing.net/th?id=OIP-C.UCpKKMGG4i87r-bgNoNTigHaFH&w=300&h=207&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2 ', '痴迷于为客户创造价值', '快手科技有限公司于2015年3月20日在海淀分局登记成立。法定代表人银鑫。公司经营范围包括从事互联网文化活动；出版物零售；技术开发等', 0, '2021-05-01 18:52:22.259', '2021-05-01 18:52:22.259', NULL);
INSERT INTO `company` VALUES (9, '作业帮', 'HomeworkHelp', '中国北京', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '让优质教育触手可及', '作业帮致力于为全国中小学生提供全学科的学习辅导服务，作业帮累计激活用户设备突破8亿 [1]  ，月活用户约1.7亿 [2]  ，是中小学在线教育领军品牌', 0, '2021-05-01 18:54:10.459', '2021-05-01 18:54:10.459', NULL);
INSERT INTO `company` VALUES (10, '拼多多', 'Pdd', '中国上海', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '致力于为最广大用户提供服务', '拼多多 [1]  是国内移动互联网的主流电子商务应用产品。专注于C2M拼团购物的第三方社交电商平台，成立于2015年9月，用户通过发起和朋友、家人、邻居等的拼团，可以以更低的价格，拼团购买优质商品', 0, '2021-05-01 18:56:03.429', '2021-05-01 18:56:03.429', NULL);
INSERT INTO `company` VALUES (11, '猿辅导', 'ApeCounseling','贵阳'  , 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '为用户打造精细化优品', '猿辅导在线教育公司的估值达到155亿美元，在全球教育科技独角兽公司中排名首位。这也是中国教育科技公司首次跻身全球教育科技独角兽第一名', 0, '2021-05-01 18:57:24.683', '2021-05-01 18:57:24.683', NULL);
INSERT INTO `company` VALUES (12, '斗鱼', 'DouYu', '湖北武汉', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '每个人的直播平台', '斗鱼TV是一家弹幕式直播分享网站，为用户提供视频直播和赛事直播服务。 [1-2]  斗鱼TV的前身为ACFUN生放送直播，于2014年1月1日起正式更名为斗鱼TV', 0, '2021-05-01 19:02:20.713', '2021-05-01 19:02:20.713', NULL);
INSERT INTO `company` VALUES (13, '虎扑', 'HuPu', '广东广州' , 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '打造认真、温暖、有趣，服务中国年轻人的直文化社区', '虎扑成立于2004年，是以篮球论坛起家，专业体育营销为根基的社区平台，创始人为程杭。截至2020年5月，虎扑用户数已超过1亿，活跃用户数达8000万，其中90%以上为男性用户', 1, '2021-05-01 19:03:15.465', '2021-05-01 19:03:15.465', NULL);
INSERT INTO `company` VALUES (14, '爱奇艺', 'IQIYI', '中国北京', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '让梦想绽放,让快乐简单', '爱奇艺 [1]  是由龚宇于2010年4月22日创立的在线视频网站 [2]  ，2011年11月26日启动“爱奇艺”品牌并推出全新标志', 2, '2021-05-01 19:04:06.589', '2021-05-01 19:04:06.589', NULL);
INSERT INTO `company` VALUES (15, '奇安信', 'QianXin', '中国北京', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '提供最安全的保障', '奇安信集团，是中国最大的网络安全公司之一，专门为政府、企业，教育、金融等机构和组织提供企业级网络安全技术、产品和服务', 2, '2021-05-01 19:05:28.171', '2021-05-01 19:05:28.171', NULL);
INSERT INTO `company` VALUES (16, '360', 'Qihoo', '中国北京', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '让世界更安全更美好', '奇虎360 [1]  是（北京奇虎科技有限公司）的简称，由周鸿祎于2005年9月创立，主营360杀毒为代表的免费网络安全平台和拥有360安全大脑等业务的公司', 2, '2021-05-01 19:06:13.395', '2021-05-01 19:06:13.395', NULL);
INSERT INTO `company` VALUES (17, '顺丰', 'ShunFeng', '广东深圳', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '为用户提供最快的服务', '顺丰是国内的快递物流综合服务商，总部位于深圳，经过多年发展，已初步建立为客户提供一体化综合物流解决方案的能力', 0, '2021-05-01 19:07:11.436', '2021-05-01 19:07:11.436', NULL);
INSERT INTO `company` VALUES (18, '好未来', 'TAL', '中国北京', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '用科技推动教育进步', '好未来是一个以智慧教育和开放平台为主体，以素质教育和课外辅导为载体，在全球范围内服务公办教育，助力民办教育，探索未来教育新模式的科技教育公司', 0, '2021-05-01 19:07:51.721', '2021-05-01 19:07:51.721', NULL);
INSERT INTO `company` VALUES (19, '钛动科技', 'TecDo', '广东广州', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '为商业化赋能', '钛动科技（TEC-DO）是基于大数据和商业智能的国际化企业服务公司。旗下拥有专注移动效果广告的Mobisummer业务品牌与全球大媒体代理UniAgency', 0, '2021-05-01 19:08:39.832', '2021-05-01 19:08:39.832', NULL);
INSERT INTO `company` VALUES (20, '道一云', 'DO', '广东广州', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '成为受人尊重、世界一流的全球化企业', '广州市道一信息技术有限公司（Do1 Information Technology Ltd.），创立于2004年，秉承“诚信专业，共创价值”的理念，专注于移动信息化领域的软件系统开发和业务应用创新', 2, '2021-05-01 19:09:56.695', '2021-05-01 19:09:56.695', NULL);
INSERT INTO `company` VALUES (21, '凡科', 'Faisco', '广东广州', 'https://ts1.cn.mm.bing.net/th?id=OIP-C.MNGhxuyWyDuiI8Upb74AswHaDo&w=350&h=171&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2', '', '助力于中小企业', '广州凡科互联网科技股份有限公司（简称凡科）是一家助力中小企业数字化经营升级的企业', 1, '2021-05-01 19:10:40.543', '2021-05-01 19:10:40.543', NULL);

-- ----------------------------
-- Table structure for education
-- ----------------------------
DROP TABLE IF EXISTS `education`;
CREATE TABLE `education`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_id` int(11) NULL DEFAULT NULL COMMENT '简历id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学校名称',
  `major` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业',
  `diploma` int(10) NOT NULL COMMENT '学历（0 高中，1 大学专科，2 大学本科，3 硕士研究生， 4 博士研究生）',
  `descriptions` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `start_time` date NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` date NULL DEFAULT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of education
-- ----------------------------
INSERT INTO `education` VALUES (1, 2, '江西财经大学', '软件工程', 2, '学习了XXX课程。', '2014-09-01', '2018-06-30');
INSERT INTO `education` VALUES (2, 1, '广州大学', '计算机科学与技术', 2, '主修课程：离散数学、算法与数据结构、计算机组成原理、计算机操作系统、计算机网络基础、计算机编译原理、计算机数据库原理、C语言/c++语言、Java语言等。', '2015-08-15', '2019-06-13');
INSERT INTO `education` VALUES (3, 1, '江西师范大学', '教育技术学', 3, '主修课程：教育技术学、教学系统设计、计算机教育基础、网络教育应用、网站开发等。', '2019-08-28', '2022-06-28');
INSERT INTO `education` VALUES (5, 10, '江西财经大学', '金融学', 2, 'XXXXXXXXXXXXXX', '2016-09-01', '2020-06-30');

-- ----------------------------
-- Table structure for experience
-- ----------------------------
DROP TABLE IF EXISTS `experience`;
CREATE TABLE `experience`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_id` int(11) NOT NULL COMMENT '简历ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公司名称',
  `position` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职位',
  `start_time` date NOT NULL COMMENT '开始时间',
  `end_time` date NOT NULL COMMENT '结束时间',
  `performance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of experience
-- ----------------------------
INSERT INTO `experience` VALUES (1, 1, '今日头条', '后端开发实习生', '2021-01-31', '2021-03-30', '1、负责公司的后端开发和维护工作。\n2、根据业务设计代码逻辑，用前沿的技术做高效率高可用的后端业务代码。\n3、和公司团队协作，积极和前端同学协商接口与业务，积极讨论创新想法。');
INSERT INTO `experience` VALUES (2, 1, '腾讯', '实习生', '2021-12-29', '2022-02-25', ' 1、负责项目实施后的后续技术支持和服务工作\n 2、负责项目模块的开发和测试工作\n 3、规范工作习惯：按要求提交工作计划、填写工作日志。');

-- ----------------------------
-- Table structure for favor
-- ----------------------------
DROP TABLE IF EXISTS `favor`;
CREATE TABLE `favor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `position_id` int(11) NOT NULL COMMENT '职位id',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  `delete_time` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favor
-- ----------------------------
INSERT INTO `favor` VALUES (10, 4, 1, '2021-05-03 01:25:22.523', '2021-05-03 01:25:22.523', '2022-05-07 17:37:08.000');
INSERT INTO `favor` VALUES (11, 5, 13, '2022-03-21 16:24:19.771', '2022-03-21 16:24:19.771', NULL);
INSERT INTO `favor` VALUES (12, 5, 14, '2022-03-21 16:24:20.414', '2022-03-21 16:24:20.414', NULL);
INSERT INTO `favor` VALUES (13, 5, 10, '2022-03-21 16:24:21.183', '2022-03-21 16:24:21.183', NULL);
INSERT INTO `favor` VALUES (14, 5, 9, '2022-03-21 16:24:21.471', '2022-03-21 16:24:21.471', NULL);
INSERT INTO `favor` VALUES (15, 5, 5, '2022-03-21 16:24:21.800', '2022-03-21 16:24:21.800', NULL);
INSERT INTO `favor` VALUES (16, 5, 4, '2022-03-21 16:24:22.128', '2022-03-21 16:24:22.128', NULL);
INSERT INTO `favor` VALUES (17, 4, 2, '2022-03-27 12:11:55.464', '2022-03-27 12:11:55.464', '2022-05-08 16:30:03.000');
INSERT INTO `favor` VALUES (18, 4, 3, '2022-03-27 12:11:55.826', '2022-03-27 12:11:55.826', '2022-05-08 16:30:05.000');
INSERT INTO `favor` VALUES (19, 4, 4, '2022-03-27 12:11:56.260', '2022-03-27 12:11:56.260', NULL);
INSERT INTO `favor` VALUES (20, 4, 5, '2022-03-27 12:11:56.699', '2022-03-27 12:11:56.699', NULL);
INSERT INTO `favor` VALUES (21, 4, 10, '2022-03-27 12:11:57.570', '2022-03-27 12:11:57.570', NULL);
INSERT INTO `favor` VALUES (22, 4, 13, '2022-03-27 12:11:58.185', '2022-03-27 12:11:58.185', NULL);
INSERT INTO `favor` VALUES (23, 4, 16, '2022-03-27 12:12:00.188', '2022-03-27 12:12:00.188', NULL);
INSERT INTO `favor` VALUES (24, 4, 8, '2022-04-14 10:55:32.104', '2022-04-14 10:55:32.104', NULL);
INSERT INTO `favor` VALUES (25, 4, 19, '2022-04-14 11:15:59.231', '2022-04-14 11:15:59.231', NULL);
INSERT INTO `favor` VALUES (26, 9, 1, '2022-04-23 23:27:12.594', '2022-04-23 23:27:12.594', NULL);
INSERT INTO `favor` VALUES (27, 9, 2, '2022-04-23 23:27:18.066', '2022-04-23 23:27:18.066', NULL);
INSERT INTO `favor` VALUES (28, 4, 9, '2022-04-24 21:35:42.951', '2022-04-24 21:35:42.951', NULL);
INSERT INTO `favor` VALUES (29, 4, 18, '2022-04-26 17:47:14.656', '2022-04-26 17:47:14.656', NULL);

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'LOCAL' COMMENT 'LOCAL 本地，REMOTE 远程',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `size` int(11) NULL DEFAULT NULL,
  `md5` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'md5值，防止上传重复文件',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `md5_del`(`md5`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (31, 'https://bjck.xilikeli.cn/d193c7c0032e49ab8ccd2693f671712a.jpg', 'REMOTE', 'd193c7c0032e49ab8ccd2693f671712a.jpg', '.jpg', 412113, 'fa6da5303bb3ec756930374bb7441cb3', '2021-04-28 18:48:47.200', '2021-04-28 18:48:47.200', NULL);
INSERT INTO `file` VALUES (32, 'https://bjck.xilikeli.cn/4196ba1430da48048af4bb0e20de8973.jpg', 'REMOTE', '4196ba1430da48048af4bb0e20de8973.jpg', '.jpg', 4292, '08c41f4726b9ea16ef6ab58b118d5333', '2021-04-30 00:04:45.776', '2021-04-30 00:04:45.776', NULL);
INSERT INTO `file` VALUES (33, 'https://bjck.xilikeli.cn/61007a1aced342c9baef58d423610e39.png', 'REMOTE', '61007a1aced342c9baef58d423610e39.png', '.png', 83745, '7557e132018ff3632c7e5d64d68e49c5', '2021-05-01 01:01:10.903', '2021-05-01 01:01:10.903', NULL);
INSERT INTO `file` VALUES (34, 'https://bjck.xilikeli.cn/9696498b521f47d1aafe016004234aef.jpg', 'REMOTE', '9696498b521f47d1aafe016004234aef.jpg', '.jpg', 11158, '36eb1cced734253310a2520ba909ac4e', '2021-05-01 01:01:47.425', '2021-05-01 01:01:47.425', NULL);
INSERT INTO `file` VALUES (35, 'https://bjck.xilikeli.cn/985e4c8904c1465eb2c36b5e555944e5.jpg', 'REMOTE', '985e4c8904c1465eb2c36b5e555944e5.jpg', '.jpg', 17416, '1331a5bc146adc150d25f492fb8580ac', '2021-05-01 01:02:10.822', '2021-05-01 01:02:10.822', NULL);
INSERT INTO `file` VALUES (36, 'https://bjck.xilikeli.cn/37adacbf87824b8985c2bda34b92814a.jpg', 'REMOTE', '37adacbf87824b8985c2bda34b92814a.jpg', '.jpg', 11305, '10aad4dfde69f16f8a05ae0dc8c563be', '2021-05-01 01:02:41.457', '2021-05-01 01:02:41.457', NULL);
INSERT INTO `file` VALUES (37, 'https://bjck.xilikeli.cn/d4332bf5036d42cfbcc41354afac15c6.jpg', 'REMOTE', 'd4332bf5036d42cfbcc41354afac15c6.jpg', '.jpg', 13034, '31d318b04d8b32d23dde50e286e04ce7', '2021-05-01 01:06:21.898', '2021-05-01 01:06:21.898', NULL);
INSERT INTO `file` VALUES (38, 'https://bjck.xilikeli.cn/09b9faf67a2c4424b9af39bd4a97bbcf.jpg', 'REMOTE', '09b9faf67a2c4424b9af39bd4a97bbcf.jpg', '.jpg', 12219, '5e1d51bd9343403a01ed5884e09dae51', '2021-05-01 01:06:39.166', '2021-05-01 01:06:39.166', NULL);
INSERT INTO `file` VALUES (39, 'https://bjck.xilikeli.cn/3b0536056bea4515a5c76ea6adbfef54.jpg', 'REMOTE', '3b0536056bea4515a5c76ea6adbfef54.jpg', '.jpg', 20268, '2dceda14fb8703ca6b032d71cad79734', '2021-05-01 01:06:57.916', '2021-05-01 01:06:57.916', NULL);
INSERT INTO `file` VALUES (40, 'https://bjck.xilikeli.cn/be618111bca54c2799311fc3cbfb5acc.jpg', 'REMOTE', 'be618111bca54c2799311fc3cbfb5acc.jpg', '.jpg', 4142, 'c4a22c1d6435e53bc6005df4cedde276', '2021-05-01 01:07:13.412', '2021-05-01 01:07:13.412', NULL);
INSERT INTO `file` VALUES (41, 'https://bjck.xilikeli.cn/206b502ca1274501b76d73b53aa0977d.jpg', 'REMOTE', '206b502ca1274501b76d73b53aa0977d.jpg', '.jpg', 18130, '02470e4604fb2dd1cd8ba61cc85a5b81', '2021-05-01 01:07:29.469', '2021-05-01 01:07:29.469', NULL);
INSERT INTO `file` VALUES (42, 'https://bjck.xilikeli.cn/2f7c993816914bd2ae471fe98099816c.jpg', 'REMOTE', '2f7c993816914bd2ae471fe98099816c.jpg', '.jpg', 13268, '5bc9dd9a4200b111884027043cdf95f7', '2021-05-01 01:07:46.922', '2021-05-01 01:07:46.922', NULL);
INSERT INTO `file` VALUES (43, 'https://bjck.xilikeli.cn/fbd1420b42234858ae6dfa12824e4f41.png', 'REMOTE', 'fbd1420b42234858ae6dfa12824e4f41.png', '.png', 12691, 'e1d6bfa400986151fdfee0d11bd06f90', '2021-05-01 01:08:04.641', '2021-05-01 01:08:04.641', NULL);
INSERT INTO `file` VALUES (44, 'https://bjck.xilikeli.cn/c2bed6eea8e34774a1adfa284443775a.jpg', 'REMOTE', 'c2bed6eea8e34774a1adfa284443775a.jpg', '.jpg', 18293, '72ee2eb638b67760da3941dffcafdde8', '2021-05-01 01:14:07.640', '2021-05-01 01:14:07.640', NULL);
INSERT INTO `file` VALUES (45, 'https://bjck.xilikeli.cn/aacbfb466130455e96ec3003b8d73c34.jpg', 'REMOTE', 'aacbfb466130455e96ec3003b8d73c34.jpg', '.jpg', 5534, '69eeb68f91a706013f60fd42ac89550a', '2021-05-01 01:16:21.626', '2021-05-01 01:16:21.626', NULL);
INSERT INTO `file` VALUES (46, 'https://bjck.xilikeli.cn/ee285ddeda3c40f692d65cee5ac9d7a1.jpg', 'REMOTE', 'ee285ddeda3c40f692d65cee5ac9d7a1.jpg', '.jpg', 10064, '80ecdc9a3e2ea4a8ec4e716d4784982c', '2021-05-01 01:19:39.946', '2021-05-01 01:19:39.946', NULL);
INSERT INTO `file` VALUES (47, 'https://bjck.xilikeli.cn/cd97e9246eb24f6d9d18eeac49ba628b.png', 'REMOTE', 'cd97e9246eb24f6d9d18eeac49ba628b.png', '.png', 10991, '78fbb3a8af0407480ea9765723b6a97f', '2021-05-01 01:20:08.338', '2021-05-01 01:20:08.338', NULL);
INSERT INTO `file` VALUES (48, 'https://bjck.xilikeli.cn/e373c1f9607f4d6d9f56072068ea143f.jpg', 'REMOTE', 'e373c1f9607f4d6d9f56072068ea143f.jpg', '.jpg', 14062, '6b2ad19e80b4bef7e56ed1c2afc21c03', '2021-05-01 01:20:29.383', '2021-05-01 01:20:29.383', NULL);
INSERT INTO `file` VALUES (49, 'https://bjck.xilikeli.cn/f74a1f157cfd4baba30d398edb985bfd.jpg', 'REMOTE', 'f74a1f157cfd4baba30d398edb985bfd.jpg', '.jpg', 25002, '2bc98f57d4c1fc9e59d5dd24ddc2252e', '2021-05-01 01:20:44.460', '2021-05-01 01:20:44.460', NULL);
INSERT INTO `file` VALUES (50, 'https://bjck.xilikeli.cn/4c557cc89b65467c9cd5d5037b2b53f1.jpg', 'REMOTE', '4c557cc89b65467c9cd5d5037b2b53f1.jpg', '.jpg', 33745, '22f74d12491af3e9c9dff02285a1c3af', '2021-05-01 01:20:59.282', '2021-05-01 01:20:59.282', NULL);
INSERT INTO `file` VALUES (51, 'https://bjck.xilikeli.cn/258c6beeb2e94a96beb3fd3f894e7d83.jpg', 'REMOTE', '258c6beeb2e94a96beb3fd3f894e7d83.jpg', '.jpg', 12287, '28db5dd7f87c63a32e1072e63da0e640', '2021-05-01 01:23:14.929', '2021-05-01 01:23:14.929', NULL);
INSERT INTO `file` VALUES (52, 'https://bjck.xilikeli.cn/c8d1a57303e54bffb03a55b6b6562948.jpg', 'REMOTE', 'c8d1a57303e54bffb03a55b6b6562948.jpg', '.jpg', 34211, '8459e6af665e5639825725e33ebd2c51', '2021-05-01 01:23:31.556', '2021-05-01 01:23:31.556', NULL);
INSERT INTO `file` VALUES (53, 'https://bjck.xilikeli.cn/f072f1a5153c4307bf7679a7ea34711b.jpg', 'REMOTE', 'f072f1a5153c4307bf7679a7ea34711b.jpg', '.jpg', 6122, 'f76d4c186014edb3a125ea0c8091483c', '2021-05-01 01:26:10.579', '2021-05-01 01:26:10.579', NULL);
INSERT INTO `file` VALUES (54, 'https://bjck.xilikeli.cn/f90380ad9b914f99bd7dae730394355f.jpg', 'REMOTE', 'f90380ad9b914f99bd7dae730394355f.jpg', '.jpg', 6078, '900d80e54087abdf7619a12553c936bf', '2021-05-01 01:26:39.587', '2021-05-01 01:26:39.587', NULL);
INSERT INTO `file` VALUES (55, 'https://bjck.xilikeli.cn/d32b315f471d4d708e8ebb906b5e89f6.jpg', 'REMOTE', 'd32b315f471d4d708e8ebb906b5e89f6.jpg', '.jpg', 6826, '4d559681e064168ea5d3db0b0b5f5ea3', '2021-05-01 01:27:03.289', '2021-05-01 01:27:03.289', NULL);
INSERT INTO `file` VALUES (56, 'https://bjck.xilikeli.cn/ac8989aa465c43d4ba461caadbf093e3.jpg', 'REMOTE', 'ac8989aa465c43d4ba461caadbf093e3.jpg', '.jpg', 6966, '7a9ff732a519084f2877bc7668c10a87', '2021-05-01 01:27:26.751', '2021-05-01 01:27:26.751', NULL);
INSERT INTO `file` VALUES (57, 'https://bjck.xilikeli.cn/9df55880b6ba4dc5b63f938d35b55369.jpg', 'REMOTE', '9df55880b6ba4dc5b63f938d35b55369.jpg', '.jpg', 5425, '5e440aeb6ed2947f422462bddc206f4c', '2021-05-01 01:28:22.598', '2021-05-01 01:28:22.598', NULL);
INSERT INTO `file` VALUES (58, 'https://bjck.xilikeli.cn/ac202af0171f4c028298b807b2196962.jpg', 'REMOTE', 'ac202af0171f4c028298b807b2196962.jpg', '.jpg', 24342, 'b3bc06f45a36cf01de807ba30f40ac0a', '2021-05-01 01:32:42.421', '2021-05-01 01:32:42.421', NULL);
INSERT INTO `file` VALUES (59, 'https://bjck.xilikeli.cn/a8747f7b82c440499e3d5a6bbf8cc848.jpg', 'REMOTE', 'a8747f7b82c440499e3d5a6bbf8cc848.jpg', '.jpg', 56236, '3ab9fb96c89ace6e8163db54741c3961', '2021-05-01 01:33:54.920', '2021-05-01 01:33:54.920', NULL);
INSERT INTO `file` VALUES (60, 'https://bjck.xilikeli.cn/9736f5824e8d4f29a5083e8767760deb.jpg', 'REMOTE', '9736f5824e8d4f29a5083e8767760deb.jpg', '.jpg', 9589, '76c02bc203d36bfafdb131f111dda90c', '2021-05-01 19:15:02.098', '2021-05-01 19:15:02.098', NULL);
INSERT INTO `file` VALUES (61, 'https://bjck.xilikeli.cn/c3f0cfdd32b04bceb099eaccd821767c.jpg', 'REMOTE', 'c3f0cfdd32b04bceb099eaccd821767c.jpg', '.jpg', 6242, '278e9765cff7eb87857a7b0b21176961', '2021-05-02 15:30:35.757', '2021-05-02 15:30:35.757', NULL);
INSERT INTO `file` VALUES (62, 'https://bjck.xilikeli.cn/72d0786bad734967803d882ce5cbbbfc.jpg', 'REMOTE', '72d0786bad734967803d882ce5cbbbfc.jpg', '.jpg', 4320, '2591efd5e2ecf6003aa191aa0870b537', '2022-05-03 18:45:49.435', '2022-05-03 18:45:49.435', NULL);

-- ----------------------------
-- Table structure for follow
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `company_id` int(11) NOT NULL COMMENT '公司id',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of follow
-- ----------------------------
INSERT INTO `follow` VALUES (3, 4, 14, '2022-03-19 16:03:21.514', '2022-03-19 16:03:21.514', NULL);
INSERT INTO `follow` VALUES (4, 4, 1, '2022-03-19 16:03:29.271', '2022-03-19 16:03:29.271', NULL);
INSERT INTO `follow` VALUES (5, 4, 2, '2022-03-19 16:03:34.081', '2022-03-19 16:03:34.081', NULL);
INSERT INTO `follow` VALUES (6, 1, 19, '2022-03-21 10:29:01.954', '2022-03-21 10:29:01.954', NULL);

-- ----------------------------
-- Table structure for group
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分组名称，例如：搬砖者',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '分组信息：例如：搬砖的人',
  `level` tinyint(2) NOT NULL DEFAULT 3 COMMENT '分组级别 1：root 2：guest 3：user  root（root、guest分组只能存在一个)',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name_del`(`name`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES (1, 'root', '超级用户组', 1, '2021-03-14 14:49:20.899', '2021-03-14 14:49:20.899', NULL);
INSERT INTO `group` VALUES (2, 'JobSeeker(求职者)', '求职者', 4, '2021-03-14 14:49:20.952', '2022-05-07 18:56:18.677', NULL);
INSERT INTO `group` VALUES (3, 'hr(招聘者)', '招聘者 ', 3, '2021-03-31 15:30:04.822', '2022-05-07 18:56:30.575', NULL);
INSERT INTO `group` VALUES (4, 'admin(平台管理员)', '平台管理员', 2, '2021-03-31 16:50:43.681', '2022-05-07 18:56:39.096', NULL);
INSERT INTO `group` VALUES (5, 'sysadmin(系统管理员)', '系统管理员', 3, '2022-03-22 23:28:20.929', '2022-05-07 18:56:45.597', NULL);

-- ----------------------------
-- Table structure for group_permission
-- ----------------------------
DROP TABLE IF EXISTS `group_permission`;
CREATE TABLE `group_permission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '分组id',
  `permission_id` int(10) UNSIGNED NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_id_permission_id`(`group_id`, `permission_id`) USING BTREE COMMENT '联合索引'
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of group_permission
-- ----------------------------
INSERT INTO `group_permission` VALUES (26, 2, 5);
INSERT INTO `group_permission` VALUES (27, 2, 6);
INSERT INTO `group_permission` VALUES (28, 2, 7);
INSERT INTO `group_permission` VALUES (17, 2, 19);
INSERT INTO `group_permission` VALUES (18, 2, 20);
INSERT INTO `group_permission` VALUES (19, 2, 22);
INSERT INTO `group_permission` VALUES (20, 2, 23);
INSERT INTO `group_permission` VALUES (21, 2, 26);
INSERT INTO `group_permission` VALUES (22, 2, 28);
INSERT INTO `group_permission` VALUES (23, 2, 29);
INSERT INTO `group_permission` VALUES (24, 2, 31);
INSERT INTO `group_permission` VALUES (25, 2, 33);
INSERT INTO `group_permission` VALUES (39, 2, 39);
INSERT INTO `group_permission` VALUES (97, 3, 8);
INSERT INTO `group_permission` VALUES (99, 3, 8);
INSERT INTO `group_permission` VALUES (101, 3, 8);
INSERT INTO `group_permission` VALUES (103, 3, 8);
INSERT INTO `group_permission` VALUES (105, 3, 8);
INSERT INTO `group_permission` VALUES (5, 3, 9);
INSERT INTO `group_permission` VALUES (2, 3, 11);
INSERT INTO `group_permission` VALUES (96, 3, 12);
INSERT INTO `group_permission` VALUES (98, 3, 12);
INSERT INTO `group_permission` VALUES (100, 3, 12);
INSERT INTO `group_permission` VALUES (102, 3, 12);
INSERT INTO `group_permission` VALUES (104, 3, 12);
INSERT INTO `group_permission` VALUES (3, 3, 13);
INSERT INTO `group_permission` VALUES (4, 3, 14);
INSERT INTO `group_permission` VALUES (6, 3, 15);
INSERT INTO `group_permission` VALUES (7, 3, 16);
INSERT INTO `group_permission` VALUES (29, 3, 17);
INSERT INTO `group_permission` VALUES (8, 3, 25);
INSERT INTO `group_permission` VALUES (9, 3, 27);
INSERT INTO `group_permission` VALUES (10, 3, 30);
INSERT INTO `group_permission` VALUES (31, 3, 34);
INSERT INTO `group_permission` VALUES (30, 3, 35);
INSERT INTO `group_permission` VALUES (38, 3, 40);
INSERT INTO `group_permission` VALUES (11, 4, 10);
INSERT INTO `group_permission` VALUES (106, 4, 12);
INSERT INTO `group_permission` VALUES (12, 4, 17);
INSERT INTO `group_permission` VALUES (13, 4, 18);
INSERT INTO `group_permission` VALUES (14, 4, 21);
INSERT INTO `group_permission` VALUES (15, 4, 24);
INSERT INTO `group_permission` VALUES (16, 4, 32);
INSERT INTO `group_permission` VALUES (32, 4, 34);
INSERT INTO `group_permission` VALUES (33, 4, 35);
INSERT INTO `group_permission` VALUES (41, 5, 36);
INSERT INTO `group_permission` VALUES (42, 5, 37);
INSERT INTO `group_permission` VALUES (95, 5, 38);
INSERT INTO `group_permission` VALUES (94, 5, 41);
INSERT INTO `group_permission` VALUES (80, 5, 42);
INSERT INTO `group_permission` VALUES (81, 5, 43);
INSERT INTO `group_permission` VALUES (82, 5, 44);
INSERT INTO `group_permission` VALUES (83, 5, 45);
INSERT INTO `group_permission` VALUES (84, 5, 46);
INSERT INTO `group_permission` VALUES (85, 5, 47);
INSERT INTO `group_permission` VALUES (86, 5, 48);
INSERT INTO `group_permission` VALUES (87, 5, 49);
INSERT INTO `group_permission` VALUES (88, 5, 50);
INSERT INTO `group_permission` VALUES (89, 5, 51);
INSERT INTO `group_permission` VALUES (90, 5, 52);
INSERT INTO `group_permission` VALUES (91, 5, 53);
INSERT INTO `group_permission` VALUES (93, 5, 54);
INSERT INTO `group_permission` VALUES (76, 5, 55);
INSERT INTO `group_permission` VALUES (78, 5, 56);

-- ----------------------------
-- Table structure for hr_company
-- ----------------------------
DROP TABLE IF EXISTS `hr_company`;
CREATE TABLE `hr_company`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hr_id` int(11) NOT NULL COMMENT 'HR id',
  `company_id` int(11) NOT NULL COMMENT '公司id',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hr_company
-- ----------------------------
INSERT INTO `hr_company` VALUES (8, 6, 1, '2021-04-05 23:44:40.489', '2021-04-05 23:44:40.489', NULL);
INSERT INTO `hr_company` VALUES (9, 7, 2, '2021-04-16 12:41:13.414', '2021-04-16 12:41:13.414', NULL);

-- ----------------------------
-- Table structure for interview
-- ----------------------------
DROP TABLE IF EXISTS `interview`;
CREATE TABLE `interview`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_id` int(11) NOT NULL COMMENT '简历编号',
  `user_id` int(11) NOT NULL COMMENT '用户名',
  `company_id` int(11) NOT NULL COMMENT '公司名称',
  `position_id` int(11) NOT NULL COMMENT '应聘职位名称',
  `hr_id` int(10) NOT NULL COMMENT 'hr id',
  `time` datetime(0) NULL DEFAULT NULL COMMENT '面试时间',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '面试地点',
  `comments` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '面试评价',
  `status` int(11) NOT NULL COMMENT '面试状态（0未开始，1面试通过，2面试不通过）',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '面试备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of interview
-- ----------------------------
INSERT INTO `interview` VALUES (1, 10, 9, 1, 2, 6, '2022-04-02 01:30:00', '广州市天河区珠江新城80号24楼', '面试表现良好，符合预期', 2, NULL, NULL, NULL, '如需修改面试时间请提前联系13756568888，祝面试顺利！');
INSERT INTO `interview` VALUES (2, 1, 4, 1, 1, 6, '2022-03-29 10:30:00', '深圳市南山区科技园666号6楼', '职位不匹配', 3, NULL, NULL, NULL, '期待你的到来');
INSERT INTO `interview` VALUES (3, 1, 4, 1, 13, 6, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `interview` VALUES (4, 10, 9, 1, 13, 6, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `interview` VALUES (5, 2, 5, 1, 19, 6, '2022-04-06 02:00:00', '广东省深圳市南山区科技园777号21层', NULL, 1, NULL, NULL, NULL, '请提前准备3份个人简历，期待你的到来！');
INSERT INTO `interview` VALUES (6, 1, 4, 1, 18, 6, '2022-04-29 02:00:00', '无', NULL, 1, NULL, NULL, NULL, '本次面试采用电话面试，请在面试时间前10分钟准备。');
INSERT INTO `interview` VALUES (7, 10, 9, 2, 4, 7, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `interview` VALUES (8, 1, 4, 2, 9, 7, '2022-04-15 10:00:00', '测试', '面试表现良好', 2, NULL, NULL, NULL, '测试。。。。。。。。。。。。。');
INSERT INTO `interview` VALUES (9, 2, 5, 1, 10, 7, '2022-03-30 07:00:00', '广州市天河区珠江新城66号6楼', NULL, 1, NULL, NULL, NULL, '如需改约面试时间，请联系HR助理电话（13658582020）。祝面试顺利！');
INSERT INTO `interview` VALUES (10, 10, 9, 2, 16, 7, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);
INSERT INTO `interview` VALUES (11, 10, 9, 1, 12, 6, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `username` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status_code` int(11) NULL DEFAULT NULL,
  `method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1021 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (6, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-03-28 17:48:28', '2022-03-28 17:48:28', NULL);
INSERT INTO `log` VALUES (7, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-03-28 17:48:58', '2022-03-28 17:48:58', NULL);
INSERT INTO `log` VALUES (8, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-03-28 17:49:14', '2022-03-28 17:49:14', NULL);
INSERT INTO `log` VALUES (9, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-03-28 17:49:20', '2022-03-28 17:49:20', NULL);
INSERT INTO `log` VALUES (10, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-03-28 17:52:41', '2022-03-28 17:52:41', NULL);
INSERT INTO `log` VALUES (11, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-04 11:55:56', '2022-04-04 11:55:56', NULL);
INSERT INTO `log` VALUES (12, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-04 11:56:21', '2022-04-04 11:56:21', NULL);
INSERT INTO `log` VALUES (13, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-04 12:04:04', '2022-04-04 12:04:04', NULL);
INSERT INTO `log` VALUES (14, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-04 12:04:08', '2022-04-04 12:04:08', NULL);
INSERT INTO `log` VALUES (15, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-04 12:04:13', '2022-04-04 12:04:13', NULL);
INSERT INTO `log` VALUES (16, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-05 19:23:09', '2022-04-05 19:23:09', NULL);
INSERT INTO `log` VALUES (17, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-05 21:00:01', '2022-04-05 21:00:01', NULL);
INSERT INTO `log` VALUES (18, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-05 21:01:53', '2022-04-05 21:01:53', NULL);
INSERT INTO `log` VALUES (19, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-05 21:05:43', '2022-04-05 21:05:43', NULL);
INSERT INTO `log` VALUES (20, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-05 21:06:35', '2022-04-05 21:06:35', NULL);
INSERT INTO `log` VALUES (21, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-05 21:06:58', '2022-04-05 21:06:58', NULL);
INSERT INTO `log` VALUES (22, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-05 21:20:24', '2022-04-05 21:20:24', NULL);
INSERT INTO `log` VALUES (23, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-05 21:21:24', '2022-04-05 21:21:24', NULL);
INSERT INTO `log` VALUES (24, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-05 21:22:17', '2022-04-05 21:22:17', NULL);
INSERT INTO `log` VALUES (25, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 10:31:04', '2022-04-09 10:31:04', NULL);
INSERT INTO `log` VALUES (26, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 14:12:35', '2022-04-09 14:12:35', NULL);
INSERT INTO `log` VALUES (27, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 14:14:30', '2022-04-09 14:14:30', NULL);
INSERT INTO `log` VALUES (28, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 14:16:37', '2022-04-09 14:16:37', NULL);
INSERT INTO `log` VALUES (29, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 14:24:00', '2022-04-09 14:24:00', NULL);
INSERT INTO `log` VALUES (30, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 14:42:56', '2022-04-09 14:42:56', NULL);
INSERT INTO `log` VALUES (31, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 15:06:27', '2022-04-09 15:06:27', NULL);
INSERT INTO `log` VALUES (32, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 16:41:32', '2022-04-09 16:41:32', NULL);
INSERT INTO `log` VALUES (33, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 23:03:45', '2022-04-09 23:03:45', NULL);
INSERT INTO `log` VALUES (34, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-09 23:06:02', '2022-04-09 23:06:02', NULL);
INSERT INTO `log` VALUES (35, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 23:08:27', '2022-04-09 23:08:27', NULL);
INSERT INTO `log` VALUES (36, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 23:09:35', '2022-04-09 23:09:35', NULL);
INSERT INTO `log` VALUES (37, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 23:11:47', '2022-04-09 23:11:47', NULL);
INSERT INTO `log` VALUES (38, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-09 23:13:55', '2022-04-09 23:13:55', NULL);
INSERT INTO `log` VALUES (39, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 09:50:52', '2022-04-10 17:50:52', NULL);
INSERT INTO `log` VALUES (40, '处理简历', 6, 'hr', 201, 'PUT', '/v1/application/state/12', '申请审核', '2022-04-10 09:51:25', '2022-04-10 17:51:24', NULL);
INSERT INTO `log` VALUES (41, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 09:51:25', '2022-04-10 17:51:24', NULL);
INSERT INTO `log` VALUES (42, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 09:51:27', '2022-04-10 17:51:27', NULL);
INSERT INTO `log` VALUES (43, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 09:51:29', '2022-04-10 17:51:29', NULL);
INSERT INTO `log` VALUES (44, '更新企业信息', 6, 'hr', 201, 'PUT', '/v1/company/1', '更新企业信息', '2022-04-10 09:51:32', '2022-04-10 17:51:32', NULL);
INSERT INTO `log` VALUES (45, '更新企业认证状态', 6, 'hr', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-10 09:51:32', '2022-04-10 17:51:32', NULL);
INSERT INTO `log` VALUES (46, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 09:52:51', '2022-04-10 17:52:51', NULL);
INSERT INTO `log` VALUES (47, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 09:52:59', '2022-04-10 17:52:58', NULL);
INSERT INTO `log` VALUES (48, '更新企业认证状态', 8, 'admin', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-10 09:53:21', '2022-04-10 17:53:20', NULL);
INSERT INTO `log` VALUES (49, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-10 09:53:29', '2022-04-10 17:53:28', NULL);
INSERT INTO `log` VALUES (50, '更新职位类型', 8, 'admin', 201, 'PUT', '/v1/category/1', '更新分类', '2022-04-10 09:53:31', '2022-04-10 17:53:31', NULL);
INSERT INTO `log` VALUES (51, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-10 09:53:32', '2022-04-10 17:53:31', NULL);
INSERT INTO `log` VALUES (52, '更新职位类型', 8, 'admin', 201, 'PUT', '/v1/category/2', '更新分类', '2022-04-10 09:53:34', '2022-04-10 17:53:33', NULL);
INSERT INTO `log` VALUES (53, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-10 09:53:34', '2022-04-10 17:53:33', NULL);
INSERT INTO `log` VALUES (54, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:21:50', '2022-04-10 18:21:49', NULL);
INSERT INTO `log` VALUES (55, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:21:51', '2022-04-10 18:21:50', NULL);
INSERT INTO `log` VALUES (56, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:22:06', '2022-04-10 18:22:05', NULL);
INSERT INTO `log` VALUES (57, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:22:08', '2022-04-10 18:22:07', NULL);
INSERT INTO `log` VALUES (58, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:22:17', '2022-04-10 18:22:17', NULL);
INSERT INTO `log` VALUES (59, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:22:18', '2022-04-10 18:22:17', NULL);
INSERT INTO `log` VALUES (60, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:22:55', '2022-04-10 18:22:54', NULL);
INSERT INTO `log` VALUES (61, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:23:32', '2022-04-10 18:23:31', NULL);
INSERT INTO `log` VALUES (62, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:23:34', '2022-04-10 18:23:33', NULL);
INSERT INTO `log` VALUES (63, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:23:36', '2022-04-10 18:23:35', NULL);
INSERT INTO `log` VALUES (64, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:30:33', '2022-04-10 18:30:32', NULL);
INSERT INTO `log` VALUES (65, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:30:40', '2022-04-10 18:30:39', NULL);
INSERT INTO `log` VALUES (66, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:30:44', '2022-04-10 18:30:44', NULL);
INSERT INTO `log` VALUES (67, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:31:07', '2022-04-10 18:31:07', NULL);
INSERT INTO `log` VALUES (68, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:31:09', '2022-04-10 18:31:09', NULL);
INSERT INTO `log` VALUES (69, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:31:15', '2022-04-10 18:31:14', NULL);
INSERT INTO `log` VALUES (70, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:31:44', '2022-04-10 18:31:43', NULL);
INSERT INTO `log` VALUES (71, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:32:02', '2022-04-10 18:32:01', NULL);
INSERT INTO `log` VALUES (72, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:32:51', '2022-04-10 18:32:50', NULL);
INSERT INTO `log` VALUES (73, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:34:43', '2022-04-10 18:34:42', NULL);
INSERT INTO `log` VALUES (74, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:35:59', '2022-04-10 18:35:58', NULL);
INSERT INTO `log` VALUES (75, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:36:44', '2022-04-10 18:36:43', NULL);
INSERT INTO `log` VALUES (76, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:37:29', '2022-04-10 18:37:29', NULL);
INSERT INTO `log` VALUES (77, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:37:29', '2022-04-10 18:37:29', NULL);
INSERT INTO `log` VALUES (78, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:37:40', '2022-04-10 18:37:40', NULL);
INSERT INTO `log` VALUES (79, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:37:40', '2022-04-10 18:37:40', NULL);
INSERT INTO `log` VALUES (80, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:37:41', '2022-04-10 18:37:40', NULL);
INSERT INTO `log` VALUES (81, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:37:41', '2022-04-10 18:37:40', NULL);
INSERT INTO `log` VALUES (82, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:37:41', '2022-04-10 18:37:41', NULL);
INSERT INTO `log` VALUES (83, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:37:41', '2022-04-10 18:37:41', NULL);
INSERT INTO `log` VALUES (84, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:37:41', '2022-04-10 18:37:41', NULL);
INSERT INTO `log` VALUES (85, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:37:41', '2022-04-10 18:37:41', NULL);
INSERT INTO `log` VALUES (86, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:37:44', '2022-04-10 18:37:44', NULL);
INSERT INTO `log` VALUES (87, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:37:44', '2022-04-10 18:37:44', NULL);
INSERT INTO `log` VALUES (88, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:37:47', '2022-04-10 18:37:46', NULL);
INSERT INTO `log` VALUES (89, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:37:47', '2022-04-10 18:37:46', NULL);
INSERT INTO `log` VALUES (90, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:37:47', '2022-04-10 18:37:47', NULL);
INSERT INTO `log` VALUES (91, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:37:47', '2022-04-10 18:37:47', NULL);
INSERT INTO `log` VALUES (92, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:37:48', '2022-04-10 18:37:48', NULL);
INSERT INTO `log` VALUES (93, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:37:48', '2022-04-10 18:37:48', NULL);
INSERT INTO `log` VALUES (94, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:38:24', '2022-04-10 18:38:23', NULL);
INSERT INTO `log` VALUES (95, '撤销职位申请', 9, 'user2', 201, 'DELETE', '/v1/application/40', '撤销申请', '2022-04-10 10:38:33', '2022-04-10 18:38:32', NULL);
INSERT INTO `log` VALUES (96, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:38:33', '2022-04-10 18:38:32', NULL);
INSERT INTO `log` VALUES (97, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:38:35', '2022-04-10 18:38:35', NULL);
INSERT INTO `log` VALUES (98, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:38:36', '2022-04-10 18:38:35', NULL);
INSERT INTO `log` VALUES (99, '撤销职位申请', 9, 'user2', 201, 'DELETE', '/v1/application/41', '撤销申请', '2022-04-10 10:38:38', '2022-04-10 18:38:37', NULL);
INSERT INTO `log` VALUES (100, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:38:38', '2022-04-10 18:38:37', NULL);
INSERT INTO `log` VALUES (101, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:38:40', '2022-04-10 18:38:39', NULL);
INSERT INTO `log` VALUES (102, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:38:41', '2022-04-10 18:38:40', NULL);
INSERT INTO `log` VALUES (103, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:39:17', '2022-04-10 18:39:17', NULL);
INSERT INTO `log` VALUES (104, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:39:17', '2022-04-10 18:39:17', NULL);
INSERT INTO `log` VALUES (105, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:44:47', '2022-04-10 18:44:46', NULL);
INSERT INTO `log` VALUES (106, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:44:47', '2022-04-10 18:44:46', NULL);
INSERT INTO `log` VALUES (107, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:44:48', '2022-04-10 18:44:48', NULL);
INSERT INTO `log` VALUES (108, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:44:48', '2022-04-10 18:44:48', NULL);
INSERT INTO `log` VALUES (109, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:44:49', '2022-04-10 18:44:48', NULL);
INSERT INTO `log` VALUES (110, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:44:49', '2022-04-10 18:44:48', NULL);
INSERT INTO `log` VALUES (111, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:44:49', '2022-04-10 18:44:48', NULL);
INSERT INTO `log` VALUES (112, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:44:49', '2022-04-10 18:44:48', NULL);
INSERT INTO `log` VALUES (113, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:45:25', '2022-04-10 18:45:25', NULL);
INSERT INTO `log` VALUES (114, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:45:25', '2022-04-10 18:45:25', NULL);
INSERT INTO `log` VALUES (115, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:45:25', '2022-04-10 18:45:25', NULL);
INSERT INTO `log` VALUES (116, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:45:26', '2022-04-10 18:45:25', NULL);
INSERT INTO `log` VALUES (117, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:45:26', '2022-04-10 18:45:25', NULL);
INSERT INTO `log` VALUES (118, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:45:26', '2022-04-10 18:45:25', NULL);
INSERT INTO `log` VALUES (119, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:45:27', '2022-04-10 18:45:26', NULL);
INSERT INTO `log` VALUES (120, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:45:27', '2022-04-10 18:45:26', NULL);
INSERT INTO `log` VALUES (121, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:45:27', '2022-04-10 18:45:27', NULL);
INSERT INTO `log` VALUES (122, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:45:27', '2022-04-10 18:45:27', NULL);
INSERT INTO `log` VALUES (123, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:45:28', '2022-04-10 18:45:28', NULL);
INSERT INTO `log` VALUES (124, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:45:28', '2022-04-10 18:45:28', NULL);
INSERT INTO `log` VALUES (125, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:45:30', '2022-04-10 18:45:30', NULL);
INSERT INTO `log` VALUES (126, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:45:31', '2022-04-10 18:45:30', NULL);
INSERT INTO `log` VALUES (127, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:45:31', '2022-04-10 18:45:31', NULL);
INSERT INTO `log` VALUES (128, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:45:31', '2022-04-10 18:45:31', NULL);
INSERT INTO `log` VALUES (129, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-10 10:45:32', '2022-04-10 18:45:31', NULL);
INSERT INTO `log` VALUES (130, '投递简历', 9, 'user2', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:45:32', '2022-04-10 18:45:31', NULL);
INSERT INTO `log` VALUES (131, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:35', '2022-04-10 18:45:35', NULL);
INSERT INTO `log` VALUES (132, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:37', '2022-04-10 18:45:37', NULL);
INSERT INTO `log` VALUES (133, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:39', '2022-04-10 18:45:38', NULL);
INSERT INTO `log` VALUES (134, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:40', '2022-04-10 18:45:40', NULL);
INSERT INTO `log` VALUES (135, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:41', '2022-04-10 18:45:40', NULL);
INSERT INTO `log` VALUES (136, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:42', '2022-04-10 18:45:41', NULL);
INSERT INTO `log` VALUES (137, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:45', '2022-04-10 18:45:44', NULL);
INSERT INTO `log` VALUES (138, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:48', '2022-04-10 18:45:47', NULL);
INSERT INTO `log` VALUES (139, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:51', '2022-04-10 18:45:50', NULL);
INSERT INTO `log` VALUES (140, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:51', '2022-04-10 18:45:51', NULL);
INSERT INTO `log` VALUES (141, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:53', '2022-04-10 18:45:53', NULL);
INSERT INTO `log` VALUES (142, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:55', '2022-04-10 18:45:54', NULL);
INSERT INTO `log` VALUES (143, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:56', '2022-04-10 18:45:56', NULL);
INSERT INTO `log` VALUES (144, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:58', '2022-04-10 18:45:57', NULL);
INSERT INTO `log` VALUES (145, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:59', '2022-04-10 18:45:58', NULL);
INSERT INTO `log` VALUES (146, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-10 10:45:59', '2022-04-10 18:45:59', NULL);
INSERT INTO `log` VALUES (147, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-10 10:46:50', '2022-04-10 18:46:49', NULL);
INSERT INTO `log` VALUES (148, '投递简历', 4, 'user', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:46:50', '2022-04-10 18:46:49', NULL);
INSERT INTO `log` VALUES (149, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-10 10:46:50', '2022-04-10 18:46:50', NULL);
INSERT INTO `log` VALUES (150, '投递简历', 4, 'user', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:46:50', '2022-04-10 18:46:50', NULL);
INSERT INTO `log` VALUES (151, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-10 10:46:51', '2022-04-10 18:46:50', NULL);
INSERT INTO `log` VALUES (152, '投递简历', 4, 'user', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:46:51', '2022-04-10 18:46:50', NULL);
INSERT INTO `log` VALUES (153, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-10 10:46:51', '2022-04-10 18:46:51', NULL);
INSERT INTO `log` VALUES (154, '投递简历', 4, 'user', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:46:51', '2022-04-10 18:46:51', NULL);
INSERT INTO `log` VALUES (155, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-10 10:46:52', '2022-04-10 18:46:52', NULL);
INSERT INTO `log` VALUES (156, '投递简历', 4, 'user', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:46:52', '2022-04-10 18:46:52', NULL);
INSERT INTO `log` VALUES (157, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-10 10:46:53', '2022-04-10 18:46:52', NULL);
INSERT INTO `log` VALUES (158, '投递简历', 4, 'user', 201, 'POST', '/v1/application', '投递简历', '2022-04-10 10:46:53', '2022-04-10 18:46:52', NULL);
INSERT INTO `log` VALUES (159, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:47:23', '2022-04-10 18:47:22', NULL);
INSERT INTO `log` VALUES (160, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:48:17', '2022-04-10 18:48:16', NULL);
INSERT INTO `log` VALUES (161, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:48:17', '2022-04-10 18:48:17', NULL);
INSERT INTO `log` VALUES (162, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:48:19', '2022-04-10 18:48:18', NULL);
INSERT INTO `log` VALUES (163, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:48:20', '2022-04-10 18:48:20', NULL);
INSERT INTO `log` VALUES (164, '处理简历', 6, 'hr', 201, 'PUT', '/v1/application/state/47', '申请审核', '2022-04-10 10:48:22', '2022-04-10 18:48:21', NULL);
INSERT INTO `log` VALUES (165, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:48:22', '2022-04-10 18:48:21', NULL);
INSERT INTO `log` VALUES (166, '处理简历', 6, 'hr', 201, 'PUT', '/v1/application/state/59', '申请审核', '2022-04-10 10:48:28', '2022-04-10 18:48:27', NULL);
INSERT INTO `log` VALUES (167, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:48:28', '2022-04-10 18:48:27', NULL);
INSERT INTO `log` VALUES (168, '处理简历', 6, 'hr', 201, 'PUT', '/v1/application/state/64', '申请审核', '2022-04-10 10:48:29', '2022-04-10 18:48:28', NULL);
INSERT INTO `log` VALUES (169, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:48:29', '2022-04-10 18:48:28', NULL);
INSERT INTO `log` VALUES (170, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:48:31', '2022-04-10 18:48:30', NULL);
INSERT INTO `log` VALUES (171, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:49:04', '2022-04-10 18:49:03', NULL);
INSERT INTO `log` VALUES (172, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:49:06', '2022-04-10 18:49:06', NULL);
INSERT INTO `log` VALUES (173, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:49:07', '2022-04-10 18:49:06', NULL);
INSERT INTO `log` VALUES (174, '处理简历', 6, 'hr', 201, 'PUT', '/v1/application/state/63', '申请审核', '2022-04-10 10:49:09', '2022-04-10 18:49:08', NULL);
INSERT INTO `log` VALUES (175, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:49:09', '2022-04-10 18:49:08', NULL);
INSERT INTO `log` VALUES (176, '处理简历', 6, 'hr', 201, 'PUT', '/v1/application/state/58', '申请审核', '2022-04-10 10:49:10', '2022-04-10 18:49:09', NULL);
INSERT INTO `log` VALUES (177, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:49:10', '2022-04-10 18:49:09', NULL);
INSERT INTO `log` VALUES (178, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:49:10', '2022-04-10 18:49:10', NULL);
INSERT INTO `log` VALUES (179, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:49:19', '2022-04-10 18:49:18', NULL);
INSERT INTO `log` VALUES (180, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 10:49:20', '2022-04-10 18:49:20', NULL);
INSERT INTO `log` VALUES (181, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 11:01:32', '2022-04-10 19:01:31', NULL);
INSERT INTO `log` VALUES (182, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 11:03:40', '2022-04-10 19:03:40', NULL);
INSERT INTO `log` VALUES (183, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 11:03:43', '2022-04-10 19:03:43', NULL);
INSERT INTO `log` VALUES (184, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 11:03:47', '2022-04-10 19:03:46', NULL);
INSERT INTO `log` VALUES (185, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 11:04:02', '2022-04-10 19:04:01', NULL);
INSERT INTO `log` VALUES (186, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 11:04:50', '2022-04-10 19:04:49', NULL);
INSERT INTO `log` VALUES (187, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-10 13:12:38', '2022-04-10 21:12:38', NULL);
INSERT INTO `log` VALUES (188, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-10 13:41:44', '2022-04-10 21:41:44', NULL);
INSERT INTO `log` VALUES (189, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-10 13:50:27', '2022-04-10 21:50:27', NULL);
INSERT INTO `log` VALUES (190, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-10 13:57:55', '2022-04-10 21:57:55', NULL);
INSERT INTO `log` VALUES (191, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-10 13:58:07', '2022-04-10 21:58:06', NULL);
INSERT INTO `log` VALUES (192, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-10 14:00:31', '2022-04-10 22:00:31', NULL);
INSERT INTO `log` VALUES (193, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-10 14:00:42', '2022-04-10 22:00:42', NULL);
INSERT INTO `log` VALUES (194, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-10 14:02:06', '2022-04-10 22:02:06', NULL);
INSERT INTO `log` VALUES (195, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 14:04:02', '2022-04-10 22:04:01', NULL);
INSERT INTO `log` VALUES (196, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 14:04:04', '2022-04-10 22:04:04', NULL);
INSERT INTO `log` VALUES (197, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-10 14:04:05', '2022-04-10 22:04:05', NULL);
INSERT INTO `log` VALUES (198, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-10 14:13:27', '2022-04-10 22:13:26', NULL);
INSERT INTO `log` VALUES (199, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-14 02:53:49', '2022-04-14 10:53:49', NULL);
INSERT INTO `log` VALUES (200, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-14 02:54:27', '2022-04-14 10:54:27', NULL);
INSERT INTO `log` VALUES (201, '更新企业信息', 6, 'hr', 201, 'PUT', '/v1/company/1', '更新企业信息', '2022-04-14 02:57:06', '2022-04-14 10:57:06', NULL);
INSERT INTO `log` VALUES (202, '更新企业认证状态', 6, 'hr', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-14 02:57:06', '2022-04-14 10:57:06', NULL);
INSERT INTO `log` VALUES (203, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-14 02:57:23', '2022-04-14 10:57:22', NULL);
INSERT INTO `log` VALUES (204, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-14 02:57:41', '2022-04-14 10:57:41', NULL);
INSERT INTO `log` VALUES (205, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-14 02:57:45', '2022-04-14 10:57:44', NULL);
INSERT INTO `log` VALUES (206, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-14 02:57:55', '2022-04-14 10:57:54', NULL);
INSERT INTO `log` VALUES (207, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-14 02:57:57', '2022-04-14 10:57:56', NULL);
INSERT INTO `log` VALUES (208, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-14 03:10:07', '2022-04-14 11:10:06', NULL);
INSERT INTO `log` VALUES (209, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-14 03:10:09', '2022-04-14 11:10:08', NULL);
INSERT INTO `log` VALUES (210, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-14 03:10:09', '2022-04-14 11:10:09', NULL);
INSERT INTO `log` VALUES (211, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-14 03:10:10', '2022-04-14 11:10:09', NULL);
INSERT INTO `log` VALUES (212, '更新企业认证状态', 8, 'admin', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-14 03:10:46', '2022-04-14 11:10:46', NULL);
INSERT INTO `log` VALUES (213, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-14 03:11:10', '2022-04-14 11:11:09', NULL);
INSERT INTO `log` VALUES (214, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-14 03:11:15', '2022-04-14 11:11:14', NULL);
INSERT INTO `log` VALUES (215, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-14 03:11:21', '2022-04-14 11:11:20', NULL);
INSERT INTO `log` VALUES (216, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-14 03:11:30', '2022-04-14 11:11:29', NULL);
INSERT INTO `log` VALUES (217, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-14 03:16:01', '2022-04-14 11:16:00', NULL);
INSERT INTO `log` VALUES (218, '投递简历', 4, 'user', 201, 'POST', '/v1/application', '投递简历', '2022-04-14 03:16:01', '2022-04-14 11:16:00', NULL);
INSERT INTO `log` VALUES (219, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-14 03:16:19', '2022-04-14 11:16:18', NULL);
INSERT INTO `log` VALUES (220, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-14 03:18:08', '2022-04-14 11:18:08', NULL);
INSERT INTO `log` VALUES (221, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-14 03:18:16', '2022-04-14 11:18:16', NULL);
INSERT INTO `log` VALUES (222, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-14 03:18:33', '2022-04-14 11:18:32', NULL);
INSERT INTO `log` VALUES (223, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-14 03:22:01', '2022-04-14 11:22:01', NULL);
INSERT INTO `log` VALUES (224, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-14 03:22:02', '2022-04-14 11:22:02', NULL);
INSERT INTO `log` VALUES (225, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-22 15:49:40', '2022-04-22 23:49:39', NULL);
INSERT INTO `log` VALUES (226, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 09:20:57', '2022-04-23 17:20:57', NULL);
INSERT INTO `log` VALUES (227, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 09:22:29', '2022-04-23 17:22:28', NULL);
INSERT INTO `log` VALUES (228, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-23 09:22:43', '2022-04-23 17:22:43', NULL);
INSERT INTO `log` VALUES (229, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 09:22:46', '2022-04-23 17:22:45', NULL);
INSERT INTO `log` VALUES (230, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 09:29:15', '2022-04-23 17:29:15', NULL);
INSERT INTO `log` VALUES (231, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-23 09:29:27', '2022-04-23 17:29:26', NULL);
INSERT INTO `log` VALUES (232, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 09:29:30', '2022-04-23 17:29:29', NULL);
INSERT INTO `log` VALUES (233, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 09:31:47', '2022-04-23 17:31:46', NULL);
INSERT INTO `log` VALUES (234, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 09:39:25', '2022-04-23 17:39:24', NULL);
INSERT INTO `log` VALUES (235, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 09:40:33', '2022-04-23 17:40:33', NULL);
INSERT INTO `log` VALUES (236, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 09:40:40', '2022-04-23 17:40:39', NULL);
INSERT INTO `log` VALUES (237, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:41:33', '2022-04-23 17:41:33', NULL);
INSERT INTO `log` VALUES (238, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:41:43', '2022-04-23 17:41:42', NULL);
INSERT INTO `log` VALUES (239, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:41:47', '2022-04-23 17:41:47', NULL);
INSERT INTO `log` VALUES (240, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:41:58', '2022-04-23 17:41:57', NULL);
INSERT INTO `log` VALUES (241, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:42:23', '2022-04-23 17:42:23', NULL);
INSERT INTO `log` VALUES (242, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:44:52', '2022-04-23 17:44:51', NULL);
INSERT INTO `log` VALUES (243, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:45:00', '2022-04-23 17:45:00', NULL);
INSERT INTO `log` VALUES (244, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:45:03', '2022-04-23 17:45:02', NULL);
INSERT INTO `log` VALUES (245, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:45:04', '2022-04-23 17:45:04', NULL);
INSERT INTO `log` VALUES (246, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:45:05', '2022-04-23 17:45:04', NULL);
INSERT INTO `log` VALUES (247, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:46:15', '2022-04-23 17:46:14', NULL);
INSERT INTO `log` VALUES (248, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:46:19', '2022-04-23 17:46:18', NULL);
INSERT INTO `log` VALUES (249, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:46:30', '2022-04-23 17:46:29', NULL);
INSERT INTO `log` VALUES (250, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:46:32', '2022-04-23 17:46:32', NULL);
INSERT INTO `log` VALUES (251, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:51:00', '2022-04-23 17:51:00', NULL);
INSERT INTO `log` VALUES (252, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:51:31', '2022-04-23 17:51:31', NULL);
INSERT INTO `log` VALUES (253, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:51:39', '2022-04-23 17:51:38', NULL);
INSERT INTO `log` VALUES (254, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:51:41', '2022-04-23 17:51:40', NULL);
INSERT INTO `log` VALUES (255, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:51:42', '2022-04-23 17:51:42', NULL);
INSERT INTO `log` VALUES (256, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:51:43', '2022-04-23 17:51:42', NULL);
INSERT INTO `log` VALUES (257, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:51:44', '2022-04-23 17:51:43', NULL);
INSERT INTO `log` VALUES (258, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:52:54', '2022-04-23 17:52:53', NULL);
INSERT INTO `log` VALUES (259, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:53:58', '2022-04-23 17:53:57', NULL);
INSERT INTO `log` VALUES (260, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:58:12', '2022-04-23 17:58:11', NULL);
INSERT INTO `log` VALUES (261, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:58:33', '2022-04-23 17:58:33', NULL);
INSERT INTO `log` VALUES (262, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:58:43', '2022-04-23 17:58:42', NULL);
INSERT INTO `log` VALUES (263, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:58:44', '2022-04-23 17:58:44', NULL);
INSERT INTO `log` VALUES (264, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:58:45', '2022-04-23 17:58:45', NULL);
INSERT INTO `log` VALUES (265, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 09:59:53', '2022-04-23 17:59:53', NULL);
INSERT INTO `log` VALUES (266, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:00:51', '2022-04-23 18:00:50', NULL);
INSERT INTO `log` VALUES (267, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:01:37', '2022-04-23 18:01:36', NULL);
INSERT INTO `log` VALUES (268, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:01:39', '2022-04-23 18:01:38', NULL);
INSERT INTO `log` VALUES (269, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:01:42', '2022-04-23 18:01:42', NULL);
INSERT INTO `log` VALUES (270, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:01:45', '2022-04-23 18:01:44', NULL);
INSERT INTO `log` VALUES (271, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:01:47', '2022-04-23 18:01:46', NULL);
INSERT INTO `log` VALUES (272, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:02:01', '2022-04-23 18:02:01', NULL);
INSERT INTO `log` VALUES (273, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:02:03', '2022-04-23 18:02:02', NULL);
INSERT INTO `log` VALUES (274, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:02:04', '2022-04-23 18:02:03', NULL);
INSERT INTO `log` VALUES (275, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:02:12', '2022-04-23 18:02:12', NULL);
INSERT INTO `log` VALUES (276, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:02:25', '2022-04-23 18:02:24', NULL);
INSERT INTO `log` VALUES (277, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:02:25', '2022-04-23 18:02:25', NULL);
INSERT INTO `log` VALUES (278, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:02:52', '2022-04-23 18:02:51', NULL);
INSERT INTO `log` VALUES (279, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:02:54', '2022-04-23 18:02:53', NULL);
INSERT INTO `log` VALUES (280, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:03:55', '2022-04-23 18:03:55', NULL);
INSERT INTO `log` VALUES (281, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:03:57', '2022-04-23 18:03:57', NULL);
INSERT INTO `log` VALUES (282, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:04:02', '2022-04-23 18:04:01', NULL);
INSERT INTO `log` VALUES (283, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:04:02', '2022-04-23 18:04:02', NULL);
INSERT INTO `log` VALUES (284, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:05:05', '2022-04-23 18:05:05', NULL);
INSERT INTO `log` VALUES (285, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:05:23', '2022-04-23 18:05:23', NULL);
INSERT INTO `log` VALUES (286, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:05:26', '2022-04-23 18:05:26', NULL);
INSERT INTO `log` VALUES (287, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:06:26', '2022-04-23 18:06:25', NULL);
INSERT INTO `log` VALUES (288, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:07:18', '2022-04-23 18:07:17', NULL);
INSERT INTO `log` VALUES (289, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:14:22', '2022-04-23 18:14:22', NULL);
INSERT INTO `log` VALUES (290, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:14:35', '2022-04-23 18:14:34', NULL);
INSERT INTO `log` VALUES (291, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:14:39', '2022-04-23 18:14:39', NULL);
INSERT INTO `log` VALUES (292, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:14:42', '2022-04-23 18:14:41', NULL);
INSERT INTO `log` VALUES (293, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:14:48', '2022-04-23 18:14:48', NULL);
INSERT INTO `log` VALUES (294, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:16:43', '2022-04-23 18:16:42', NULL);
INSERT INTO `log` VALUES (295, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:17:33', '2022-04-23 18:17:33', NULL);
INSERT INTO `log` VALUES (296, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:18:17', '2022-04-23 18:18:16', NULL);
INSERT INTO `log` VALUES (297, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:18:36', '2022-04-23 18:18:36', NULL);
INSERT INTO `log` VALUES (298, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:22:03', '2022-04-23 18:22:02', NULL);
INSERT INTO `log` VALUES (299, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:22:05', '2022-04-23 18:22:04', NULL);
INSERT INTO `log` VALUES (300, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:22:11', '2022-04-23 18:22:11', NULL);
INSERT INTO `log` VALUES (301, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:23:18', '2022-04-23 18:23:18', NULL);
INSERT INTO `log` VALUES (302, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:28:04', '2022-04-23 18:28:03', NULL);
INSERT INTO `log` VALUES (303, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:31:20', '2022-04-23 18:31:19', NULL);
INSERT INTO `log` VALUES (304, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:31:27', '2022-04-23 18:31:26', NULL);
INSERT INTO `log` VALUES (305, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 10:32:20', '2022-04-23 18:32:20', NULL);
INSERT INTO `log` VALUES (306, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-23 10:38:50', '2022-04-23 18:38:50', NULL);
INSERT INTO `log` VALUES (307, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-23 10:39:33', '2022-04-23 18:39:33', NULL);
INSERT INTO `log` VALUES (308, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 15:08:58', '2022-04-23 23:08:58', NULL);
INSERT INTO `log` VALUES (309, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 15:09:05', '2022-04-23 23:09:05', NULL);
INSERT INTO `log` VALUES (310, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 15:09:07', '2022-04-23 23:09:07', NULL);
INSERT INTO `log` VALUES (311, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 15:09:11', '2022-04-23 23:09:10', NULL);
INSERT INTO `log` VALUES (312, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 15:09:25', '2022-04-23 23:09:25', NULL);
INSERT INTO `log` VALUES (313, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-23 15:09:27', '2022-04-23 23:09:27', NULL);
INSERT INTO `log` VALUES (314, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-23 15:27:06', '2022-04-23 23:27:05', NULL);
INSERT INTO `log` VALUES (315, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-23 15:27:31', '2022-04-23 23:27:30', NULL);
INSERT INTO `log` VALUES (316, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-23 15:28:39', '2022-04-23 23:28:39', NULL);
INSERT INTO `log` VALUES (317, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:30:22', '2022-04-23 23:30:21', NULL);
INSERT INTO `log` VALUES (318, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:30:24', '2022-04-23 23:30:24', NULL);
INSERT INTO `log` VALUES (319, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:30:37', '2022-04-23 23:30:36', NULL);
INSERT INTO `log` VALUES (320, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:30:49', '2022-04-23 23:30:49', NULL);
INSERT INTO `log` VALUES (321, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:30:52', '2022-04-23 23:30:51', NULL);
INSERT INTO `log` VALUES (322, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:30:54', '2022-04-23 23:30:53', NULL);
INSERT INTO `log` VALUES (323, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:30:55', '2022-04-23 23:30:54', NULL);
INSERT INTO `log` VALUES (324, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:30:56', '2022-04-23 23:30:55', NULL);
INSERT INTO `log` VALUES (325, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:31:01', '2022-04-23 23:31:00', NULL);
INSERT INTO `log` VALUES (326, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:31:01', '2022-04-23 23:31:01', NULL);
INSERT INTO `log` VALUES (327, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:31:02', '2022-04-23 23:31:01', NULL);
INSERT INTO `log` VALUES (328, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:31:03', '2022-04-23 23:31:03', NULL);
INSERT INTO `log` VALUES (329, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:31:16', '2022-04-23 23:31:15', NULL);
INSERT INTO `log` VALUES (330, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:31:21', '2022-04-23 23:31:21', NULL);
INSERT INTO `log` VALUES (331, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:31:24', '2022-04-23 23:31:24', NULL);
INSERT INTO `log` VALUES (332, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:36:23', '2022-04-23 23:36:23', NULL);
INSERT INTO `log` VALUES (333, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:36:26', '2022-04-23 23:36:25', NULL);
INSERT INTO `log` VALUES (334, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:36:27', '2022-04-23 23:36:26', NULL);
INSERT INTO `log` VALUES (335, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:36:29', '2022-04-23 23:36:28', NULL);
INSERT INTO `log` VALUES (336, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:36:30', '2022-04-23 23:36:30', NULL);
INSERT INTO `log` VALUES (337, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:36:31', '2022-04-23 23:36:30', NULL);
INSERT INTO `log` VALUES (338, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:36:31', '2022-04-23 23:36:31', NULL);
INSERT INTO `log` VALUES (339, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:36:32', '2022-04-23 23:36:31', NULL);
INSERT INTO `log` VALUES (340, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:36:32', '2022-04-23 23:36:32', NULL);
INSERT INTO `log` VALUES (341, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-23 15:36:35', '2022-04-23 23:36:34', NULL);
INSERT INTO `log` VALUES (342, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:36:51', '2022-04-23 23:36:50', NULL);
INSERT INTO `log` VALUES (343, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-23 15:38:32', '2022-04-23 23:38:31', NULL);
INSERT INTO `log` VALUES (344, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:35', '2022-04-23 23:38:35', NULL);
INSERT INTO `log` VALUES (345, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:40', '2022-04-23 23:38:40', NULL);
INSERT INTO `log` VALUES (346, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:41', '2022-04-23 23:38:41', NULL);
INSERT INTO `log` VALUES (347, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:42', '2022-04-23 23:38:42', NULL);
INSERT INTO `log` VALUES (348, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:43', '2022-04-23 23:38:42', NULL);
INSERT INTO `log` VALUES (349, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:44', '2022-04-23 23:38:43', NULL);
INSERT INTO `log` VALUES (350, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:46', '2022-04-23 23:38:45', NULL);
INSERT INTO `log` VALUES (351, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:46', '2022-04-23 23:38:46', NULL);
INSERT INTO `log` VALUES (352, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:48', '2022-04-23 23:38:48', NULL);
INSERT INTO `log` VALUES (353, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:51', '2022-04-23 23:38:50', NULL);
INSERT INTO `log` VALUES (354, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:53', '2022-04-23 23:38:52', NULL);
INSERT INTO `log` VALUES (355, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:54', '2022-04-23 23:38:53', NULL);
INSERT INTO `log` VALUES (356, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:54', '2022-04-23 23:38:54', NULL);
INSERT INTO `log` VALUES (357, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:38:55', '2022-04-23 23:38:55', NULL);
INSERT INTO `log` VALUES (358, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-23 15:39:32', '2022-04-23 23:39:31', NULL);
INSERT INTO `log` VALUES (359, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:39:33', '2022-04-23 23:39:32', NULL);
INSERT INTO `log` VALUES (360, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-23 15:39:37', '2022-04-23 23:39:36', NULL);
INSERT INTO `log` VALUES (361, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:39:38', '2022-04-23 23:39:37', NULL);
INSERT INTO `log` VALUES (362, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:40:03', '2022-04-23 23:40:03', NULL);
INSERT INTO `log` VALUES (363, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:40:05', '2022-04-23 23:40:04', NULL);
INSERT INTO `log` VALUES (364, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:40:05', '2022-04-23 23:40:05', NULL);
INSERT INTO `log` VALUES (365, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:40:06', '2022-04-23 23:40:06', NULL);
INSERT INTO `log` VALUES (366, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:40:07', '2022-04-23 23:40:06', NULL);
INSERT INTO `log` VALUES (367, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:40:07', '2022-04-23 23:40:07', NULL);
INSERT INTO `log` VALUES (368, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:40:13', '2022-04-23 23:40:13', NULL);
INSERT INTO `log` VALUES (369, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:40:14', '2022-04-23 23:40:14', NULL);
INSERT INTO `log` VALUES (370, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:40:46', '2022-04-23 23:40:46', NULL);
INSERT INTO `log` VALUES (371, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:42:17', '2022-04-23 23:42:16', NULL);
INSERT INTO `log` VALUES (372, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:42:24', '2022-04-23 23:42:24', NULL);
INSERT INTO `log` VALUES (373, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:42:26', '2022-04-23 23:42:25', NULL);
INSERT INTO `log` VALUES (374, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:42:27', '2022-04-23 23:42:26', NULL);
INSERT INTO `log` VALUES (375, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:42:28', '2022-04-23 23:42:27', NULL);
INSERT INTO `log` VALUES (376, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:42:29', '2022-04-23 23:42:29', NULL);
INSERT INTO `log` VALUES (377, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:42:31', '2022-04-23 23:42:30', NULL);
INSERT INTO `log` VALUES (378, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:42:31', '2022-04-23 23:42:31', NULL);
INSERT INTO `log` VALUES (379, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:43:02', '2022-04-23 23:43:02', NULL);
INSERT INTO `log` VALUES (380, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:43:05', '2022-04-23 23:43:04', NULL);
INSERT INTO `log` VALUES (381, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:43:07', '2022-04-23 23:43:06', NULL);
INSERT INTO `log` VALUES (382, '查看简历投递状况', 9, 'user2', 200, 'GET', '/v1/application/page/find/9', '我的投递箱', '2022-04-23 15:43:08', '2022-04-23 23:43:07', NULL);
INSERT INTO `log` VALUES (383, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-23 15:43:12', '2022-04-23 23:43:12', NULL);
INSERT INTO `log` VALUES (384, '查看简历', 9, 'user2', 200, 'GET', '/v1/resume/get/9', '查询简历', '2022-04-23 15:43:26', '2022-04-23 23:43:26', NULL);
INSERT INTO `log` VALUES (385, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-24 09:12:39', '2022-04-24 17:12:39', NULL);
INSERT INTO `log` VALUES (386, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:13:23', '2022-04-24 17:13:22', NULL);
INSERT INTO `log` VALUES (387, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:13:27', '2022-04-24 17:13:26', NULL);
INSERT INTO `log` VALUES (388, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:13:52', '2022-04-24 17:13:52', NULL);
INSERT INTO `log` VALUES (389, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:13:54', '2022-04-24 17:13:54', NULL);
INSERT INTO `log` VALUES (390, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-24 09:14:00', '2022-04-24 17:13:59', NULL);
INSERT INTO `log` VALUES (391, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:14:01', '2022-04-24 17:14:01', NULL);
INSERT INTO `log` VALUES (392, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:15:27', '2022-04-24 17:15:26', NULL);
INSERT INTO `log` VALUES (393, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:15:33', '2022-04-24 17:15:33', NULL);
INSERT INTO `log` VALUES (394, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:19:26', '2022-04-24 17:19:26', NULL);
INSERT INTO `log` VALUES (395, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:19:43', '2022-04-24 17:19:43', NULL);
INSERT INTO `log` VALUES (396, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:19:46', '2022-04-24 17:19:46', NULL);
INSERT INTO `log` VALUES (397, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:21:27', '2022-04-24 17:21:27', NULL);
INSERT INTO `log` VALUES (398, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 09:22:19', '2022-04-24 17:22:18', NULL);
INSERT INTO `log` VALUES (399, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 09:24:45', '2022-04-24 17:24:45', NULL);
INSERT INTO `log` VALUES (400, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:25:03', '2022-04-24 17:25:02', NULL);
INSERT INTO `log` VALUES (401, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:25:05', '2022-04-24 17:25:05', NULL);
INSERT INTO `log` VALUES (402, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:25:06', '2022-04-24 17:25:06', NULL);
INSERT INTO `log` VALUES (403, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:25:07', '2022-04-24 17:25:07', NULL);
INSERT INTO `log` VALUES (404, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:25:08', '2022-04-24 17:25:07', NULL);
INSERT INTO `log` VALUES (405, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:25:09', '2022-04-24 17:25:08', NULL);
INSERT INTO `log` VALUES (406, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:25:09', '2022-04-24 17:25:09', NULL);
INSERT INTO `log` VALUES (407, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 09:28:58', '2022-04-24 17:28:58', NULL);
INSERT INTO `log` VALUES (408, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:29:00', '2022-04-24 17:28:59', NULL);
INSERT INTO `log` VALUES (409, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:29:01', '2022-04-24 17:29:00', NULL);
INSERT INTO `log` VALUES (410, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:29:02', '2022-04-24 17:29:01', NULL);
INSERT INTO `log` VALUES (411, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:29:02', '2022-04-24 17:29:02', NULL);
INSERT INTO `log` VALUES (412, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:29:03', '2022-04-24 17:29:02', NULL);
INSERT INTO `log` VALUES (413, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:29:04', '2022-04-24 17:29:03', NULL);
INSERT INTO `log` VALUES (414, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:29:04', '2022-04-24 17:29:04', NULL);
INSERT INTO `log` VALUES (415, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:29:05', '2022-04-24 17:29:04', NULL);
INSERT INTO `log` VALUES (416, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-24 09:29:12', '2022-04-24 17:29:11', NULL);
INSERT INTO `log` VALUES (417, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:29:13', '2022-04-24 17:29:13', NULL);
INSERT INTO `log` VALUES (418, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 09:31:50', '2022-04-24 17:31:50', NULL);
INSERT INTO `log` VALUES (419, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 09:33:55', '2022-04-24 17:33:55', NULL);
INSERT INTO `log` VALUES (420, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:34:18', '2022-04-24 17:34:17', NULL);
INSERT INTO `log` VALUES (421, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:34:21', '2022-04-24 17:34:21', NULL);
INSERT INTO `log` VALUES (422, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:34:23', '2022-04-24 17:34:22', NULL);
INSERT INTO `log` VALUES (423, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:34:57', '2022-04-24 17:34:56', NULL);
INSERT INTO `log` VALUES (424, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:34:58', '2022-04-24 17:34:57', NULL);
INSERT INTO `log` VALUES (425, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 09:35:08', '2022-04-24 17:35:08', NULL);
INSERT INTO `log` VALUES (426, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 09:35:09', '2022-04-24 17:35:09', NULL);
INSERT INTO `log` VALUES (427, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 09:35:10', '2022-04-24 17:35:10', NULL);
INSERT INTO `log` VALUES (428, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:35:16', '2022-04-24 17:35:15', NULL);
INSERT INTO `log` VALUES (429, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:35:31', '2022-04-24 17:35:30', NULL);
INSERT INTO `log` VALUES (430, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 09:35:35', '2022-04-24 17:35:34', NULL);
INSERT INTO `log` VALUES (431, '投递简历', 5, 'user1', 201, 'POST', '/v1/application', '投递简历', '2022-04-24 09:35:35', '2022-04-24 17:35:34', NULL);
INSERT INTO `log` VALUES (432, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 09:35:36', '2022-04-24 17:35:36', NULL);
INSERT INTO `log` VALUES (433, '投递简历', 5, 'user1', 201, 'POST', '/v1/application', '投递简历', '2022-04-24 09:35:36', '2022-04-24 17:35:36', NULL);
INSERT INTO `log` VALUES (434, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 09:35:37', '2022-04-24 17:35:36', NULL);
INSERT INTO `log` VALUES (435, '投递简历', 5, 'user1', 201, 'POST', '/v1/application', '投递简历', '2022-04-24 09:35:37', '2022-04-24 17:35:36', NULL);
INSERT INTO `log` VALUES (436, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 09:35:37', '2022-04-24 17:35:37', NULL);
INSERT INTO `log` VALUES (437, '投递简历', 5, 'user1', 201, 'POST', '/v1/application', '投递简历', '2022-04-24 09:35:37', '2022-04-24 17:35:37', NULL);
INSERT INTO `log` VALUES (438, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 09:35:39', '2022-04-24 17:35:38', NULL);
INSERT INTO `log` VALUES (439, '投递简历', 5, 'user1', 201, 'POST', '/v1/application', '投递简历', '2022-04-24 09:35:39', '2022-04-24 17:35:38', NULL);
INSERT INTO `log` VALUES (440, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 09:35:40', '2022-04-24 17:35:39', NULL);
INSERT INTO `log` VALUES (441, '投递简历', 5, 'user1', 201, 'POST', '/v1/application', '投递简历', '2022-04-24 09:35:40', '2022-04-24 17:35:39', NULL);
INSERT INTO `log` VALUES (442, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 09:35:42', '2022-04-24 17:35:42', NULL);
INSERT INTO `log` VALUES (443, '投递简历', 5, 'user1', 201, 'POST', '/v1/application', '投递简历', '2022-04-24 09:35:43', '2022-04-24 17:35:42', NULL);
INSERT INTO `log` VALUES (444, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 09:35:44', '2022-04-24 17:35:44', NULL);
INSERT INTO `log` VALUES (445, '投递简历', 5, 'user1', 201, 'POST', '/v1/application', '投递简历', '2022-04-24 09:35:44', '2022-04-24 17:35:44', NULL);
INSERT INTO `log` VALUES (446, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:35:45', '2022-04-24 17:35:45', NULL);
INSERT INTO `log` VALUES (447, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:35:47', '2022-04-24 17:35:47', NULL);
INSERT INTO `log` VALUES (448, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:35:51', '2022-04-24 17:35:51', NULL);
INSERT INTO `log` VALUES (449, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:35:53', '2022-04-24 17:35:52', NULL);
INSERT INTO `log` VALUES (450, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:35:53', '2022-04-24 17:35:53', NULL);
INSERT INTO `log` VALUES (451, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:35:59', '2022-04-24 17:35:58', NULL);
INSERT INTO `log` VALUES (452, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:36:04', '2022-04-24 17:36:03', NULL);
INSERT INTO `log` VALUES (453, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:37:34', '2022-04-24 17:37:33', NULL);
INSERT INTO `log` VALUES (454, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:50:07', '2022-04-24 17:50:06', NULL);
INSERT INTO `log` VALUES (455, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:50:09', '2022-04-24 17:50:09', NULL);
INSERT INTO `log` VALUES (456, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:50:11', '2022-04-24 17:50:10', NULL);
INSERT INTO `log` VALUES (457, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:52:06', '2022-04-24 17:52:05', NULL);
INSERT INTO `log` VALUES (458, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:52:07', '2022-04-24 17:52:07', NULL);
INSERT INTO `log` VALUES (459, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 09:52:24', '2022-04-24 17:52:23', NULL);
INSERT INTO `log` VALUES (460, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:52:27', '2022-04-24 17:52:26', NULL);
INSERT INTO `log` VALUES (461, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:55:47', '2022-04-24 17:55:47', NULL);
INSERT INTO `log` VALUES (462, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:59:54', '2022-04-24 17:59:54', NULL);
INSERT INTO `log` VALUES (463, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 09:59:58', '2022-04-24 17:59:58', NULL);
INSERT INTO `log` VALUES (464, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:03:03', '2022-04-24 18:03:02', NULL);
INSERT INTO `log` VALUES (465, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:03:17', '2022-04-24 18:03:16', NULL);
INSERT INTO `log` VALUES (466, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:03:20', '2022-04-24 18:03:19', NULL);
INSERT INTO `log` VALUES (467, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:04:33', '2022-04-24 18:04:32', NULL);
INSERT INTO `log` VALUES (468, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:04:37', '2022-04-24 18:04:36', NULL);
INSERT INTO `log` VALUES (469, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:04:38', '2022-04-24 18:04:37', NULL);
INSERT INTO `log` VALUES (470, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:04:39', '2022-04-24 18:04:38', NULL);
INSERT INTO `log` VALUES (471, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:04:39', '2022-04-24 18:04:39', NULL);
INSERT INTO `log` VALUES (472, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:04:40', '2022-04-24 18:04:40', NULL);
INSERT INTO `log` VALUES (473, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:04:40', '2022-04-24 18:04:40', NULL);
INSERT INTO `log` VALUES (474, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:05:54', '2022-04-24 18:05:54', NULL);
INSERT INTO `log` VALUES (475, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:06:01', '2022-04-24 18:06:00', NULL);
INSERT INTO `log` VALUES (476, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:07:30', '2022-04-24 18:07:30', NULL);
INSERT INTO `log` VALUES (477, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:07:32', '2022-04-24 18:07:32', NULL);
INSERT INTO `log` VALUES (478, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:08:26', '2022-04-24 18:08:26', NULL);
INSERT INTO `log` VALUES (479, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:08:28', '2022-04-24 18:08:27', NULL);
INSERT INTO `log` VALUES (480, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:09:49', '2022-04-24 18:09:49', NULL);
INSERT INTO `log` VALUES (481, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:10:19', '2022-04-24 18:10:18', NULL);
INSERT INTO `log` VALUES (482, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:10:21', '2022-04-24 18:10:20', NULL);
INSERT INTO `log` VALUES (483, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:10:22', '2022-04-24 18:10:22', NULL);
INSERT INTO `log` VALUES (484, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:10:24', '2022-04-24 18:10:23', NULL);
INSERT INTO `log` VALUES (485, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:11:13', '2022-04-24 18:11:13', NULL);
INSERT INTO `log` VALUES (486, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:11:16', '2022-04-24 18:11:16', NULL);
INSERT INTO `log` VALUES (487, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:11:18', '2022-04-24 18:11:18', NULL);
INSERT INTO `log` VALUES (488, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 10:11:27', '2022-04-24 18:11:26', NULL);
INSERT INTO `log` VALUES (489, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:11:30', '2022-04-24 18:11:29', NULL);
INSERT INTO `log` VALUES (490, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:12:59', '2022-04-24 18:12:59', NULL);
INSERT INTO `log` VALUES (491, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 10:13:09', '2022-04-24 18:13:08', NULL);
INSERT INTO `log` VALUES (492, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:13:12', '2022-04-24 18:13:12', NULL);
INSERT INTO `log` VALUES (493, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5/1/12', '我的投递箱', '2022-04-24 10:19:35', '2022-04-24 18:19:35', NULL);
INSERT INTO `log` VALUES (494, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5/1/12', '我的投递箱', '2022-04-24 10:19:37', '2022-04-24 18:19:37', NULL);
INSERT INTO `log` VALUES (495, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5/1/12', '我的投递箱', '2022-04-24 10:19:40', '2022-04-24 18:19:40', NULL);
INSERT INTO `log` VALUES (496, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:19:40', '2022-04-24 18:19:40', NULL);
INSERT INTO `log` VALUES (497, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 10:20:01', '2022-04-24 18:20:00', NULL);
INSERT INTO `log` VALUES (498, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5/1/12', '我的投递箱', '2022-04-24 10:20:03', '2022-04-24 18:20:02', NULL);
INSERT INTO `log` VALUES (499, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5/1/12', '我的投递箱', '2022-04-24 10:21:39', '2022-04-24 18:21:38', NULL);
INSERT INTO `log` VALUES (500, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5/1/12', '我的投递箱', '2022-04-24 10:21:53', '2022-04-24 18:21:53', NULL);
INSERT INTO `log` VALUES (501, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 10:21:57', '2022-04-24 18:21:56', NULL);
INSERT INTO `log` VALUES (502, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5/1/12', '我的投递箱', '2022-04-24 10:21:58', '2022-04-24 18:21:57', NULL);
INSERT INTO `log` VALUES (503, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:23:28', '2022-04-24 18:23:28', NULL);
INSERT INTO `log` VALUES (504, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 10:23:46', '2022-04-24 18:23:46', NULL);
INSERT INTO `log` VALUES (505, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-04-24 10:24:53', '2022-04-24 18:24:53', NULL);
INSERT INTO `log` VALUES (506, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:28:18', '2022-04-24 18:28:18', NULL);
INSERT INTO `log` VALUES (507, '撤销职位申请', 5, 'user1', 201, 'DELETE', '/v1/application/66', '撤销申请', '2022-04-24 10:29:01', '2022-04-24 18:29:00', NULL);
INSERT INTO `log` VALUES (508, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:29:01', '2022-04-24 18:29:00', NULL);
INSERT INTO `log` VALUES (509, '撤销职位申请', 5, 'user1', 201, 'DELETE', '/v1/application/68', '撤销申请', '2022-04-24 10:29:06', '2022-04-24 18:29:06', NULL);
INSERT INTO `log` VALUES (510, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:29:06', '2022-04-24 18:29:06', NULL);
INSERT INTO `log` VALUES (511, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-24 10:29:14', '2022-04-24 18:29:13', NULL);
INSERT INTO `log` VALUES (512, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 10:29:26', '2022-04-24 18:29:26', NULL);
INSERT INTO `log` VALUES (513, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 10:29:32', '2022-04-24 18:29:32', NULL);
INSERT INTO `log` VALUES (514, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 10:30:56', '2022-04-24 18:30:55', NULL);
INSERT INTO `log` VALUES (515, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 10:31:20', '2022-04-24 18:31:19', NULL);
INSERT INTO `log` VALUES (516, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 10:31:24', '2022-04-24 18:31:24', NULL);
INSERT INTO `log` VALUES (517, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 10:31:27', '2022-04-24 18:31:26', NULL);
INSERT INTO `log` VALUES (518, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-24 10:31:39', '2022-04-24 18:31:39', NULL);
INSERT INTO `log` VALUES (519, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-24 10:32:26', '2022-04-24 18:32:25', NULL);
INSERT INTO `log` VALUES (520, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-24 10:35:28', '2022-04-24 18:35:27', NULL);
INSERT INTO `log` VALUES (521, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-24 10:35:29', '2022-04-24 18:35:29', NULL);
INSERT INTO `log` VALUES (522, '更新企业信息', 6, 'hr', 201, 'PUT', '/v1/company/1', '更新企业信息', '2022-04-24 10:35:47', '2022-04-24 18:35:46', NULL);
INSERT INTO `log` VALUES (523, '更新企业认证状态', 6, 'hr', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-24 10:35:47', '2022-04-24 18:35:46', NULL);
INSERT INTO `log` VALUES (524, '更新企业认证状态', 8, 'admin', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-24 10:35:59', '2022-04-24 18:35:59', NULL);
INSERT INTO `log` VALUES (525, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 10:36:09', '2022-04-24 18:36:08', NULL);
INSERT INTO `log` VALUES (526, '更新企业信息', 6, 'hr', 201, 'PUT', '/v1/company/1', '更新企业信息', '2022-04-24 10:36:14', '2022-04-24 18:36:13', NULL);
INSERT INTO `log` VALUES (527, '更新企业认证状态', 6, 'hr', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-24 10:36:14', '2022-04-24 18:36:13', NULL);
INSERT INTO `log` VALUES (528, '更新企业认证状态', 8, 'admin', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-24 10:36:30', '2022-04-24 18:36:29', NULL);
INSERT INTO `log` VALUES (529, '发布职位', 6, 'hr', 201, 'POST', '/v1/position', '发布职位', '2022-04-24 10:38:16', '2022-04-24 18:38:16', NULL);
INSERT INTO `log` VALUES (530, '删除职位', 6, 'hr', 201, 'DELETE', '/v1/position/20', '下架职位', '2022-04-24 10:39:16', '2022-04-24 18:39:16', NULL);
INSERT INTO `log` VALUES (531, '更新职位信息', 6, 'hr', 201, 'PUT', '/v1/position/19', '更新职位', '2022-04-24 10:44:24', '2022-04-24 18:44:24', NULL);
INSERT INTO `log` VALUES (532, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-24 10:50:54', '2022-04-24 18:50:54', NULL);
INSERT INTO `log` VALUES (533, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-24 13:35:02', '2022-04-24 21:35:02', NULL);
INSERT INTO `log` VALUES (534, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-24 13:35:08', '2022-04-24 21:35:07', NULL);
INSERT INTO `log` VALUES (535, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-24 13:35:53', '2022-04-24 21:35:52', NULL);
INSERT INTO `log` VALUES (536, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 13:36:37', '2022-04-24 21:36:36', NULL);
INSERT INTO `log` VALUES (537, '撤销职位申请', 4, 'user', 201, 'DELETE', '/v1/application/61', '撤销申请', '2022-04-24 13:36:45', '2022-04-24 21:36:44', NULL);
INSERT INTO `log` VALUES (538, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-24 13:36:45', '2022-04-24 21:36:44', NULL);
INSERT INTO `log` VALUES (539, '更新企业信息', 6, 'hr', 201, 'PUT', '/v1/company/1', '更新企业信息', '2022-04-24 13:37:47', '2022-04-24 21:37:46', NULL);
INSERT INTO `log` VALUES (540, '更新企业认证状态', 6, 'hr', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-24 13:37:47', '2022-04-24 21:37:46', NULL);
INSERT INTO `log` VALUES (541, '更新企业认证状态', 8, 'admin', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-24 13:38:15', '2022-04-24 21:38:14', NULL);
INSERT INTO `log` VALUES (542, '更新职位信息', 6, 'hr', 201, 'PUT', '/v1/position/19', '更新职位', '2022-04-24 13:38:36', '2022-04-24 21:38:35', NULL);
INSERT INTO `log` VALUES (543, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-24 13:39:18', '2022-04-24 21:39:18', NULL);
INSERT INTO `log` VALUES (544, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 13:39:34', '2022-04-24 21:39:33', NULL);
INSERT INTO `log` VALUES (545, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 13:39:44', '2022-04-24 21:39:44', NULL);
INSERT INTO `log` VALUES (546, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 13:39:47', '2022-04-24 21:39:46', NULL);
INSERT INTO `log` VALUES (547, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-24 13:40:04', '2022-04-24 21:40:04', NULL);
INSERT INTO `log` VALUES (548, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-25 02:43:41', '2022-04-25 10:43:40', NULL);
INSERT INTO `log` VALUES (549, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-25 02:44:16', '2022-04-25 10:44:15', NULL);
INSERT INTO `log` VALUES (550, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-25 02:56:23', '2022-04-25 10:56:22', NULL);
INSERT INTO `log` VALUES (551, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-25 03:57:21', '2022-04-25 11:57:20', NULL);
INSERT INTO `log` VALUES (552, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-25 04:02:23', '2022-04-25 12:02:23', NULL);
INSERT INTO `log` VALUES (553, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-25 04:02:57', '2022-04-25 12:02:57', NULL);
INSERT INTO `log` VALUES (554, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-25 09:59:33', '2022-04-25 17:59:33', NULL);
INSERT INTO `log` VALUES (555, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-25 10:12:06', '2022-04-25 18:12:06', NULL);
INSERT INTO `log` VALUES (556, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-25 14:27:19', '2022-04-25 22:27:18', NULL);
INSERT INTO `log` VALUES (557, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:47:19', '2022-04-26 17:47:18', NULL);
INSERT INTO `log` VALUES (558, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:47:20', '2022-04-26 17:47:20', NULL);
INSERT INTO `log` VALUES (559, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:47:46', '2022-04-26 17:47:45', NULL);
INSERT INTO `log` VALUES (560, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:47:47', '2022-04-26 17:47:46', NULL);
INSERT INTO `log` VALUES (561, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:47:57', '2022-04-26 17:47:56', NULL);
INSERT INTO `log` VALUES (562, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:50:36', '2022-04-26 17:50:35', NULL);
INSERT INTO `log` VALUES (563, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:52:08', '2022-04-26 17:52:08', NULL);
INSERT INTO `log` VALUES (564, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:57:56', '2022-04-26 17:57:56', NULL);
INSERT INTO `log` VALUES (565, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:58:06', '2022-04-26 17:58:06', NULL);
INSERT INTO `log` VALUES (566, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:58:08', '2022-04-26 17:58:08', NULL);
INSERT INTO `log` VALUES (567, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:59:11', '2022-04-26 17:59:10', NULL);
INSERT INTO `log` VALUES (568, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 09:59:49', '2022-04-26 17:59:49', NULL);
INSERT INTO `log` VALUES (569, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:00:51', '2022-04-26 18:00:50', NULL);
INSERT INTO `log` VALUES (570, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:00:52', '2022-04-26 18:00:52', NULL);
INSERT INTO `log` VALUES (571, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:01:35', '2022-04-26 18:01:34', NULL);
INSERT INTO `log` VALUES (572, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:01:51', '2022-04-26 18:01:51', NULL);
INSERT INTO `log` VALUES (573, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:03:02', '2022-04-26 18:03:01', NULL);
INSERT INTO `log` VALUES (574, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:03:23', '2022-04-26 18:03:23', NULL);
INSERT INTO `log` VALUES (575, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:03:31', '2022-04-26 18:03:31', NULL);
INSERT INTO `log` VALUES (576, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:04:03', '2022-04-26 18:04:02', NULL);
INSERT INTO `log` VALUES (577, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:04:28', '2022-04-26 18:04:28', NULL);
INSERT INTO `log` VALUES (578, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:04:44', '2022-04-26 18:04:44', NULL);
INSERT INTO `log` VALUES (579, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:05:51', '2022-04-26 18:05:50', NULL);
INSERT INTO `log` VALUES (580, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:05:54', '2022-04-26 18:05:53', NULL);
INSERT INTO `log` VALUES (581, '投递简历', 4, 'user', 201, 'POST', '/v1/application', '投递简历', '2022-04-26 10:05:54', '2022-04-26 18:05:53', NULL);
INSERT INTO `log` VALUES (582, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:07:07', '2022-04-26 18:07:07', NULL);
INSERT INTO `log` VALUES (583, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-26 10:07:39', '2022-04-26 18:07:38', NULL);
INSERT INTO `log` VALUES (584, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-26 10:08:59', '2022-04-26 18:08:59', NULL);
INSERT INTO `log` VALUES (585, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-26 10:09:22', '2022-04-26 18:09:22', NULL);
INSERT INTO `log` VALUES (586, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-26 10:09:33', '2022-04-26 18:09:32', NULL);
INSERT INTO `log` VALUES (587, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-26 10:09:46', '2022-04-26 18:09:45', NULL);
INSERT INTO `log` VALUES (588, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-26 10:09:48', '2022-04-26 18:09:48', NULL);
INSERT INTO `log` VALUES (589, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-26 10:10:37', '2022-04-26 18:10:36', NULL);
INSERT INTO `log` VALUES (590, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:11:06', '2022-04-26 18:11:05', NULL);
INSERT INTO `log` VALUES (591, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-26 10:11:07', '2022-04-26 18:11:07', NULL);
INSERT INTO `log` VALUES (592, '投递简历', 4, 'user', 201, 'POST', '/v1/application', '投递简历', '2022-04-26 10:11:07', '2022-04-26 18:11:07', NULL);
INSERT INTO `log` VALUES (593, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-26 10:11:39', '2022-04-26 18:11:39', NULL);
INSERT INTO `log` VALUES (594, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-26 10:12:10', '2022-04-26 18:12:10', NULL);
INSERT INTO `log` VALUES (595, '更新职位信息', 6, 'hr', 201, 'PUT', '/v1/position/19', '更新职位', '2022-04-26 10:12:50', '2022-04-26 18:12:50', NULL);
INSERT INTO `log` VALUES (596, '更新企业信息', 6, 'hr', 201, 'PUT', '/v1/company/1', '更新企业信息', '2022-04-26 10:12:52', '2022-04-26 18:12:52', NULL);
INSERT INTO `log` VALUES (597, '更新企业认证状态', 6, 'hr', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-26 10:12:53', '2022-04-26 18:12:52', NULL);
INSERT INTO `log` VALUES (598, '更新企业认证状态', 8, 'admin', 201, 'PUT', '/v1/company/state/1', '更新企业状态', '2022-04-26 10:13:18', '2022-04-26 18:13:17', NULL);
INSERT INTO `log` VALUES (599, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-26 10:13:23', '2022-04-26 18:13:22', NULL);
INSERT INTO `log` VALUES (600, '查看简历', 1, 'root', 200, 'GET', '/v1/resume/get/1', '查询简历', '2022-04-26 10:28:58', '2022-04-26 18:28:57', NULL);
INSERT INTO `log` VALUES (601, '查看简历投递状况', 1, 'root', 200, 'GET', '/v1/application/page/find/1', '我的投递箱', '2022-04-26 10:29:06', '2022-04-26 18:29:06', NULL);
INSERT INTO `log` VALUES (602, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-27 03:51:23', '2022-04-27 11:51:22', NULL);
INSERT INTO `log` VALUES (603, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-04-27 03:51:55', '2022-04-27 11:51:55', NULL);
INSERT INTO `log` VALUES (604, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-27 03:52:23', '2022-04-27 11:52:23', NULL);
INSERT INTO `log` VALUES (605, '处理简历', 6, 'hr', 201, 'PUT', '/v1/application/state/55', '申请审核', '2022-04-27 03:52:28', '2022-04-27 11:52:28', NULL);
INSERT INTO `log` VALUES (606, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-27 03:52:28', '2022-04-27 11:52:28', NULL);
INSERT INTO `log` VALUES (607, '处理简历', 6, 'hr', 201, 'PUT', '/v1/application/state/72', '申请审核', '2022-04-27 03:52:32', '2022-04-27 11:52:31', NULL);
INSERT INTO `log` VALUES (608, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-27 03:52:32', '2022-04-27 11:52:31', NULL);
INSERT INTO `log` VALUES (609, '处理简历', 6, 'hr', 201, 'PUT', '/v1/application/state/74', '申请审核', '2022-04-27 03:52:34', '2022-04-27 11:52:34', NULL);
INSERT INTO `log` VALUES (610, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-04-27 03:52:34', '2022-04-27 11:52:34', NULL);
INSERT INTO `log` VALUES (611, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-04-27 04:00:52', '2022-04-27 12:00:52', NULL);
INSERT INTO `log` VALUES (612, '处理简历', 7, 'hr1', 201, 'PUT', '/v1/application/state/49', '申请审核', '2022-04-27 04:00:59', '2022-04-27 12:00:58', NULL);
INSERT INTO `log` VALUES (613, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-04-27 04:00:59', '2022-04-27 12:00:58', NULL);
INSERT INTO `log` VALUES (614, '处理简历', 7, 'hr1', 201, 'PUT', '/v1/application/state/62', '申请审核', '2022-04-27 04:01:02', '2022-04-27 12:01:01', NULL);
INSERT INTO `log` VALUES (615, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-04-27 04:01:02', '2022-04-27 12:01:01', NULL);
INSERT INTO `log` VALUES (616, '处理简历', 7, 'hr1', 201, 'PUT', '/v1/application/state/70', '申请审核', '2022-04-27 04:01:03', '2022-04-27 12:01:03', NULL);
INSERT INTO `log` VALUES (617, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-04-27 04:01:03', '2022-04-27 12:01:03', NULL);
INSERT INTO `log` VALUES (618, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-28 14:17:21', '2022-04-28 22:17:20', NULL);
INSERT INTO `log` VALUES (619, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-28 14:17:34', '2022-04-28 22:17:34', NULL);
INSERT INTO `log` VALUES (620, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-28 14:18:02', '2022-04-28 22:18:01', NULL);
INSERT INTO `log` VALUES (621, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-28 14:18:27', '2022-04-28 22:18:27', NULL);
INSERT INTO `log` VALUES (622, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-28 14:18:30', '2022-04-28 22:18:30', NULL);
INSERT INTO `log` VALUES (623, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-28 14:19:25', '2022-04-28 22:19:25', NULL);
INSERT INTO `log` VALUES (624, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-28 14:23:06', '2022-04-28 22:23:05', NULL);
INSERT INTO `log` VALUES (625, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-28 14:23:19', '2022-04-28 22:23:19', NULL);
INSERT INTO `log` VALUES (626, '新增职位类型', 8, 'admin', 201, 'POST', '/v1/category', '新增分类', '2022-04-28 14:23:30', '2022-04-28 22:23:29', NULL);
INSERT INTO `log` VALUES (627, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-28 14:23:31', '2022-04-28 22:23:31', NULL);
INSERT INTO `log` VALUES (628, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-28 14:23:33', '2022-04-28 22:23:33', NULL);
INSERT INTO `log` VALUES (629, '更新职位类型', 8, 'admin', 201, 'PUT', '/v1/category/14', '更新分类', '2022-04-28 14:23:39', '2022-04-28 22:23:39', NULL);
INSERT INTO `log` VALUES (630, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-28 14:23:39', '2022-04-28 22:23:39', NULL);
INSERT INTO `log` VALUES (631, '删除职位类型', 8, 'admin', 201, 'DELETE', '/v1/category/14', '删除分类', '2022-04-28 14:23:43', '2022-04-28 22:23:42', NULL);
INSERT INTO `log` VALUES (632, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-04-28 14:23:43', '2022-04-28 22:23:42', NULL);
INSERT INTO `log` VALUES (633, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-28 14:26:12', '2022-04-28 22:26:12', NULL);
INSERT INTO `log` VALUES (634, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-28 14:26:35', '2022-04-28 22:26:34', NULL);
INSERT INTO `log` VALUES (635, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-28 14:27:56', '2022-04-28 22:27:56', NULL);
INSERT INTO `log` VALUES (636, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-28 14:28:19', '2022-04-28 22:28:19', NULL);
INSERT INTO `log` VALUES (637, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-28 14:29:49', '2022-04-28 22:29:49', NULL);
INSERT INTO `log` VALUES (638, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-04-28 14:35:13', '2022-04-28 22:35:13', NULL);
INSERT INTO `log` VALUES (639, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-04-28 14:35:21', '2022-04-28 22:35:20', NULL);
INSERT INTO `log` VALUES (640, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 03:54:47', '2022-05-01 11:54:46', NULL);
INSERT INTO `log` VALUES (641, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 03:57:50', '2022-05-01 11:57:50', NULL);
INSERT INTO `log` VALUES (642, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 03:58:55', '2022-05-01 11:58:55', NULL);
INSERT INTO `log` VALUES (643, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:02:30', '2022-05-01 12:02:29', NULL);
INSERT INTO `log` VALUES (644, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:03:02', '2022-05-01 12:03:02', NULL);
INSERT INTO `log` VALUES (645, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:03:19', '2022-05-01 12:03:19', NULL);
INSERT INTO `log` VALUES (646, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:07:28', '2022-05-01 12:07:27', NULL);
INSERT INTO `log` VALUES (647, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:09:39', '2022-05-01 12:09:39', NULL);
INSERT INTO `log` VALUES (648, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:09:48', '2022-05-01 12:09:47', NULL);
INSERT INTO `log` VALUES (649, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:10:49', '2022-05-01 12:10:48', NULL);
INSERT INTO `log` VALUES (650, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:10:59', '2022-05-01 12:10:59', NULL);
INSERT INTO `log` VALUES (651, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:11:06', '2022-05-01 12:11:05', NULL);
INSERT INTO `log` VALUES (652, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:11:26', '2022-05-01 12:11:26', NULL);
INSERT INTO `log` VALUES (653, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:11:58', '2022-05-01 12:11:58', NULL);
INSERT INTO `log` VALUES (654, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:12:23', '2022-05-01 12:12:22', NULL);
INSERT INTO `log` VALUES (655, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:13:50', '2022-05-01 12:13:50', NULL);
INSERT INTO `log` VALUES (656, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:14:11', '2022-05-01 12:14:10', NULL);
INSERT INTO `log` VALUES (657, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:14:23', '2022-05-01 12:14:22', NULL);
INSERT INTO `log` VALUES (658, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 04:14:25', '2022-05-01 12:14:24', NULL);
INSERT INTO `log` VALUES (659, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:14:30', '2022-05-01 12:14:30', NULL);
INSERT INTO `log` VALUES (660, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:14:35', '2022-05-01 12:14:34', NULL);
INSERT INTO `log` VALUES (661, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 04:14:38', '2022-05-01 12:14:37', NULL);
INSERT INTO `log` VALUES (662, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:14:41', '2022-05-01 12:14:40', NULL);
INSERT INTO `log` VALUES (663, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:16:50', '2022-05-01 12:16:50', NULL);
INSERT INTO `log` VALUES (664, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:17:04', '2022-05-01 12:17:03', NULL);
INSERT INTO `log` VALUES (665, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:17:07', '2022-05-01 12:17:07', NULL);
INSERT INTO `log` VALUES (666, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:17:11', '2022-05-01 12:17:11', NULL);
INSERT INTO `log` VALUES (667, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 04:17:16', '2022-05-01 12:17:16', NULL);
INSERT INTO `log` VALUES (668, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 04:17:46', '2022-05-01 12:17:46', NULL);
INSERT INTO `log` VALUES (669, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:17:48', '2022-05-01 12:17:48', NULL);
INSERT INTO `log` VALUES (670, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 04:17:52', '2022-05-01 12:17:51', NULL);
INSERT INTO `log` VALUES (671, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-05-01 11:06:47', '2022-05-01 19:06:47', NULL);
INSERT INTO `log` VALUES (672, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-05-01 11:06:50', '2022-05-01 19:06:49', NULL);
INSERT INTO `log` VALUES (673, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-05-01 13:47:27', '2022-05-01 21:47:27', NULL);
INSERT INTO `log` VALUES (674, '更新职位类型', 8, 'admin', 201, 'PUT', '/v1/category/1', '更新分类', '2022-05-01 13:47:37', '2022-05-01 21:47:37', NULL);
INSERT INTO `log` VALUES (675, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-05-01 13:47:37', '2022-05-01 21:47:37', NULL);
INSERT INTO `log` VALUES (676, '更新职位类型', 8, 'admin', 201, 'PUT', '/v1/category/2', '更新分类', '2022-05-01 13:47:39', '2022-05-01 21:47:39', NULL);
INSERT INTO `log` VALUES (677, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-05-01 13:47:39', '2022-05-01 21:47:39', NULL);
INSERT INTO `log` VALUES (678, '更新职位类型', 8, 'admin', 201, 'PUT', '/v1/category/3', '更新分类', '2022-05-01 13:47:41', '2022-05-01 21:47:40', NULL);
INSERT INTO `log` VALUES (679, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-05-01 13:47:41', '2022-05-01 21:47:41', NULL);
INSERT INTO `log` VALUES (680, '查看简历', 5, 'user1', 200, 'GET', '/v1/resume/get/5', '查询简历', '2022-05-01 13:48:08', '2022-05-01 21:48:08', NULL);
INSERT INTO `log` VALUES (681, '查看简历投递状况', 5, 'user1', 200, 'GET', '/v1/application/page/find/5', '我的投递箱', '2022-05-01 13:48:20', '2022-05-01 21:48:19', NULL);
INSERT INTO `log` VALUES (682, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 13:49:08', '2022-05-01 21:49:08', NULL);
INSERT INTO `log` VALUES (683, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:30:49', '2022-05-01 22:30:49', NULL);
INSERT INTO `log` VALUES (684, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:32:22', '2022-05-01 22:32:21', NULL);
INSERT INTO `log` VALUES (685, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:33:19', '2022-05-01 22:33:19', NULL);
INSERT INTO `log` VALUES (686, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:33:21', '2022-05-01 22:33:20', NULL);
INSERT INTO `log` VALUES (687, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:33:22', '2022-05-01 22:33:21', NULL);
INSERT INTO `log` VALUES (688, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:33:48', '2022-05-01 22:33:48', NULL);
INSERT INTO `log` VALUES (689, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:35:37', '2022-05-01 22:35:36', NULL);
INSERT INTO `log` VALUES (690, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:35:38', '2022-05-01 22:35:37', NULL);
INSERT INTO `log` VALUES (691, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:36:27', '2022-05-01 22:36:27', NULL);
INSERT INTO `log` VALUES (692, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:36:28', '2022-05-01 22:36:28', NULL);
INSERT INTO `log` VALUES (693, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:36:29', '2022-05-01 22:36:29', NULL);
INSERT INTO `log` VALUES (694, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:36:30', '2022-05-01 22:36:30', NULL);
INSERT INTO `log` VALUES (695, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:36:31', '2022-05-01 22:36:30', NULL);
INSERT INTO `log` VALUES (696, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:36:56', '2022-05-01 22:36:55', NULL);
INSERT INTO `log` VALUES (697, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:36:57', '2022-05-01 22:36:56', NULL);
INSERT INTO `log` VALUES (698, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:37:00', '2022-05-01 22:36:59', NULL);
INSERT INTO `log` VALUES (699, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:39:32', '2022-05-01 22:39:31', NULL);
INSERT INTO `log` VALUES (700, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:44:37', '2022-05-01 22:44:36', NULL);
INSERT INTO `log` VALUES (701, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:44:47', '2022-05-01 22:44:47', NULL);
INSERT INTO `log` VALUES (702, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 14:59:41', '2022-05-01 22:59:41', NULL);
INSERT INTO `log` VALUES (703, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:02:51', '2022-05-01 23:02:51', NULL);
INSERT INTO `log` VALUES (704, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:07:00', '2022-05-01 23:06:59', NULL);
INSERT INTO `log` VALUES (705, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:09:01', '2022-05-01 23:09:01', NULL);
INSERT INTO `log` VALUES (706, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:17:06', '2022-05-01 23:17:05', NULL);
INSERT INTO `log` VALUES (707, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:17:53', '2022-05-01 23:17:52', NULL);
INSERT INTO `log` VALUES (708, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:23:24', '2022-05-01 23:23:24', NULL);
INSERT INTO `log` VALUES (709, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:28:27', '2022-05-01 23:28:26', NULL);
INSERT INTO `log` VALUES (710, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:28:42', '2022-05-01 23:28:42', NULL);
INSERT INTO `log` VALUES (711, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:28:48', '2022-05-01 23:28:47', NULL);
INSERT INTO `log` VALUES (712, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:29:28', '2022-05-01 23:29:27', NULL);
INSERT INTO `log` VALUES (713, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:29:30', '2022-05-01 23:29:30', NULL);
INSERT INTO `log` VALUES (714, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:30:12', '2022-05-01 23:30:11', NULL);
INSERT INTO `log` VALUES (715, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:30:58', '2022-05-01 23:30:57', NULL);
INSERT INTO `log` VALUES (716, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:31:25', '2022-05-01 23:31:25', NULL);
INSERT INTO `log` VALUES (717, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:31:30', '2022-05-01 23:31:29', NULL);
INSERT INTO `log` VALUES (718, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-05-01 15:35:16', '2022-05-01 23:35:15', NULL);
INSERT INTO `log` VALUES (719, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-05-01 15:35:17', '2022-05-01 23:35:16', NULL);
INSERT INTO `log` VALUES (720, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-05-01 15:35:18', '2022-05-01 23:35:17', NULL);
INSERT INTO `log` VALUES (721, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-05-01 15:35:28', '2022-05-01 23:35:27', NULL);
INSERT INTO `log` VALUES (722, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-05-01 15:35:33', '2022-05-01 23:35:32', NULL);
INSERT INTO `log` VALUES (723, '查看应聘简历', 6, 'hr', 200, 'GET', '/v1/application/page/6', '简历管理', '2022-05-01 15:35:37', '2022-05-01 23:35:36', NULL);
INSERT INTO `log` VALUES (724, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:35:45', '2022-05-01 23:35:45', NULL);
INSERT INTO `log` VALUES (725, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-01 15:36:50', '2022-05-01 23:36:50', NULL);
INSERT INTO `log` VALUES (726, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-01 15:36:59', '2022-05-01 23:36:58', NULL);
INSERT INTO `log` VALUES (727, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 08:26:11', '2022-05-03 16:26:10', NULL);
INSERT INTO `log` VALUES (728, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 08:26:25', '2022-05-03 16:26:25', NULL);
INSERT INTO `log` VALUES (729, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 08:28:52', '2022-05-03 16:28:51', NULL);
INSERT INTO `log` VALUES (730, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 08:29:59', '2022-05-03 16:29:59', NULL);
INSERT INTO `log` VALUES (731, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 08:31:28', '2022-05-03 16:31:28', NULL);
INSERT INTO `log` VALUES (732, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 08:36:48', '2022-05-03 16:36:47', NULL);
INSERT INTO `log` VALUES (733, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:00:57', '2022-05-03 17:00:56', NULL);
INSERT INTO `log` VALUES (734, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:02:23', '2022-05-03 17:02:23', NULL);
INSERT INTO `log` VALUES (735, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:08:38', '2022-05-03 17:08:37', NULL);
INSERT INTO `log` VALUES (736, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:09:02', '2022-05-03 17:09:01', NULL);
INSERT INTO `log` VALUES (737, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:10:27', '2022-05-03 17:10:26', NULL);
INSERT INTO `log` VALUES (738, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:10:31', '2022-05-03 17:10:30', NULL);
INSERT INTO `log` VALUES (739, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:11:40', '2022-05-03 17:11:40', NULL);
INSERT INTO `log` VALUES (740, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:11:45', '2022-05-03 17:11:44', NULL);
INSERT INTO `log` VALUES (741, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:13:31', '2022-05-03 17:13:31', NULL);
INSERT INTO `log` VALUES (742, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:14:39', '2022-05-03 17:14:39', NULL);
INSERT INTO `log` VALUES (743, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:15:52', '2022-05-03 17:15:51', NULL);
INSERT INTO `log` VALUES (744, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:19:31', '2022-05-03 17:19:31', NULL);
INSERT INTO `log` VALUES (745, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:19:36', '2022-05-03 17:19:35', NULL);
INSERT INTO `log` VALUES (746, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:19:51', '2022-05-03 17:19:51', NULL);
INSERT INTO `log` VALUES (747, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:20:21', '2022-05-03 17:20:20', NULL);
INSERT INTO `log` VALUES (748, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:21:03', '2022-05-03 17:21:02', NULL);
INSERT INTO `log` VALUES (749, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:23:35', '2022-05-03 17:23:34', NULL);
INSERT INTO `log` VALUES (750, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:25:26', '2022-05-03 17:25:26', NULL);
INSERT INTO `log` VALUES (751, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:37:20', '2022-05-03 17:37:20', NULL);
INSERT INTO `log` VALUES (752, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:37:25', '2022-05-03 17:37:25', NULL);
INSERT INTO `log` VALUES (753, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:37:28', '2022-05-03 17:37:28', NULL);
INSERT INTO `log` VALUES (754, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:38:20', '2022-05-03 17:38:20', NULL);
INSERT INTO `log` VALUES (755, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:42:33', '2022-05-03 17:42:33', NULL);
INSERT INTO `log` VALUES (756, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:44:42', '2022-05-03 17:44:42', NULL);
INSERT INTO `log` VALUES (757, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:47:49', '2022-05-03 17:47:48', NULL);
INSERT INTO `log` VALUES (758, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:50:34', '2022-05-03 17:50:33', NULL);
INSERT INTO `log` VALUES (759, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:55:26', '2022-05-03 17:55:25', NULL);
INSERT INTO `log` VALUES (760, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-03 09:57:27', '2022-05-03 17:57:26', NULL);
INSERT INTO `log` VALUES (761, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 09:58:11', '2022-05-03 17:58:10', NULL);
INSERT INTO `log` VALUES (762, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-03 09:58:13', '2022-05-03 17:58:12', NULL);
INSERT INTO `log` VALUES (763, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-03 10:03:52', '2022-05-03 18:03:52', NULL);
INSERT INTO `log` VALUES (764, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-03 10:05:24', '2022-05-03 18:05:23', NULL);
INSERT INTO `log` VALUES (765, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:09:34', '2022-05-03 18:09:33', NULL);
INSERT INTO `log` VALUES (766, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:09:49', '2022-05-03 18:09:48', NULL);
INSERT INTO `log` VALUES (767, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:10:06', '2022-05-03 18:10:05', NULL);
INSERT INTO `log` VALUES (768, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:10:09', '2022-05-03 18:10:09', NULL);
INSERT INTO `log` VALUES (769, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:10:14', '2022-05-03 18:10:14', NULL);
INSERT INTO `log` VALUES (770, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-03 10:10:19', '2022-05-03 18:10:19', NULL);
INSERT INTO `log` VALUES (771, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-03 10:13:50', '2022-05-03 18:13:50', NULL);
INSERT INTO `log` VALUES (772, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-03 10:13:55', '2022-05-03 18:13:55', NULL);
INSERT INTO `log` VALUES (773, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:13:57', '2022-05-03 18:13:56', NULL);
INSERT INTO `log` VALUES (774, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:14:07', '2022-05-03 18:14:06', NULL);
INSERT INTO `log` VALUES (775, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:14:07', '2022-05-03 18:14:07', NULL);
INSERT INTO `log` VALUES (776, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:14:08', '2022-05-03 18:14:08', NULL);
INSERT INTO `log` VALUES (777, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:14:10', '2022-05-03 18:14:10', NULL);
INSERT INTO `log` VALUES (778, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-03 10:14:29', '2022-05-03 18:14:28', NULL);
INSERT INTO `log` VALUES (779, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:15:12', '2022-05-03 18:15:12', NULL);
INSERT INTO `log` VALUES (780, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:15:17', '2022-05-03 18:15:17', NULL);
INSERT INTO `log` VALUES (781, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:15:19', '2022-05-03 18:15:19', NULL);
INSERT INTO `log` VALUES (782, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:15:20', '2022-05-03 18:15:19', NULL);
INSERT INTO `log` VALUES (783, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:15:33', '2022-05-03 18:15:32', NULL);
INSERT INTO `log` VALUES (784, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-03 10:17:09', '2022-05-03 18:17:08', NULL);
INSERT INTO `log` VALUES (785, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:17:09', '2022-05-03 18:17:08', NULL);
INSERT INTO `log` VALUES (786, '查看简历投递状况', 4, 'user', 200, 'GET', '/v1/application/page/find/4', '我的投递箱', '2022-05-03 10:17:27', '2022-05-03 18:17:26', NULL);
INSERT INTO `log` VALUES (787, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:17:27', '2022-05-03 18:17:26', NULL);
INSERT INTO `log` VALUES (788, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:17:31', '2022-05-03 18:17:31', NULL);
INSERT INTO `log` VALUES (789, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:17:32', '2022-05-03 18:17:32', NULL);
INSERT INTO `log` VALUES (790, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:18:12', '2022-05-03 18:18:12', NULL);
INSERT INTO `log` VALUES (791, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:18:16', '2022-05-03 18:18:15', NULL);
INSERT INTO `log` VALUES (792, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:18:16', '2022-05-03 18:18:16', NULL);
INSERT INTO `log` VALUES (793, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:18:20', '2022-05-03 18:18:19', NULL);
INSERT INTO `log` VALUES (794, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:18:44', '2022-05-03 18:18:43', NULL);
INSERT INTO `log` VALUES (795, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:18:56', '2022-05-03 18:18:56', NULL);
INSERT INTO `log` VALUES (796, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:19:02', '2022-05-03 18:19:01', NULL);
INSERT INTO `log` VALUES (797, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:19:46', '2022-05-03 18:19:46', NULL);
INSERT INTO `log` VALUES (798, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:19:48', '2022-05-03 18:19:47', NULL);
INSERT INTO `log` VALUES (799, '更新企业信息', 7, 'hr1', 201, 'PUT', '/v1/company/2', '更新企业信息', '2022-05-03 10:22:31', '2022-05-03 18:22:31', NULL);
INSERT INTO `log` VALUES (800, '更新企业认证状态', 7, 'hr1', 201, 'PUT', '/v1/company/state/2', '更新企业状态', '2022-05-03 10:22:31', '2022-05-03 18:22:31', NULL);
INSERT INTO `log` VALUES (801, '更新企业认证状态', 8, 'admin', 201, 'PUT', '/v1/company/state/2', '更新企业状态', '2022-05-03 10:22:58', '2022-05-03 18:22:58', NULL);
INSERT INTO `log` VALUES (802, '查看职位类型列表', 8, 'admin', 200, 'GET', '/v1/category/page', '查看分类列表', '2022-05-03 10:23:18', '2022-05-03 18:23:18', NULL);
INSERT INTO `log` VALUES (803, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:34:56', '2022-05-03 18:34:56', NULL);
INSERT INTO `log` VALUES (804, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:36:19', '2022-05-03 18:36:18', NULL);
INSERT INTO `log` VALUES (805, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:37:49', '2022-05-03 18:37:49', NULL);
INSERT INTO `log` VALUES (806, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:38:06', '2022-05-03 18:38:06', NULL);
INSERT INTO `log` VALUES (807, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:39:56', '2022-05-03 18:39:56', NULL);
INSERT INTO `log` VALUES (808, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:40:11', '2022-05-03 18:40:11', NULL);
INSERT INTO `log` VALUES (809, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:41:06', '2022-05-03 18:41:06', NULL);
INSERT INTO `log` VALUES (810, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:41:35', '2022-05-03 18:41:34', NULL);
INSERT INTO `log` VALUES (811, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:41:54', '2022-05-03 18:41:54', NULL);
INSERT INTO `log` VALUES (813, '查看简历', 4, 'user', 200, 'GET', '/v1/resume/get/4', '查询简历', '2022-05-03 10:45:54', '2022-05-03 18:45:54', NULL);
INSERT INTO `log` VALUES (815, '查看应聘简历', 7, 'hr1', 200, 'GET', '/v1/application/page/7', '简历管理', '2022-05-03 10:46:28', '2022-05-03 18:46:28', NULL);
INSERT INTO `log` VALUES (816, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-03 10:53:55', '2022-05-03 18:53:55', NULL);
INSERT INTO `log` VALUES (817, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-03 10:54:09', '2022-05-03 18:54:08', NULL);
INSERT INTO `log` VALUES (818, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-03 10:54:10', '2022-05-03 18:54:10', NULL);
INSERT INTO `log` VALUES (820, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-03 11:00:22', '2022-05-03 19:00:22', NULL);
INSERT INTO `log` VALUES (822, '查看应聘简历', 7, 'hr1', 200, 'GET', '/recruit/application/page/7', '简历管理', '2022-05-03 11:22:13', '2022-05-03 19:22:12', NULL);
INSERT INTO `log` VALUES (823, '查看应聘简历', 7, 'hr1', 200, 'GET', '/recruit/application/page/7', '简历管理', '2022-05-03 11:22:13', '2022-05-03 19:22:13', NULL);
INSERT INTO `log` VALUES (824, '查看应聘简历', 7, 'hr1', 200, 'GET', '/recruit/application/page/7', '简历管理', '2022-05-03 11:22:14', '2022-05-03 19:22:14', NULL);
INSERT INTO `log` VALUES (825, '查看应聘简历', 7, 'hr1', 200, 'GET', '/recruit/application/page/7', '简历管理', '2022-05-03 11:23:22', '2022-05-03 19:23:22', NULL);
INSERT INTO `log` VALUES (826, '处理简历', 7, 'hr1', 201, 'PUT', '/recruit/application/state/73', '申请审核', '2022-05-03 11:23:29', '2022-05-03 19:23:28', NULL);
INSERT INTO `log` VALUES (827, '查看应聘简历', 7, 'hr1', 200, 'GET', '/recruit/application/page/7', '简历管理', '2022-05-03 11:23:29', '2022-05-03 19:23:28', NULL);
INSERT INTO `log` VALUES (828, '处理简历', 7, 'hr1', 201, 'PUT', '/recruit/application/state/56', '申请审核', '2022-05-03 11:23:34', '2022-05-03 19:23:33', NULL);
INSERT INTO `log` VALUES (829, '查看应聘简历', 7, 'hr1', 200, 'GET', '/recruit/application/page/7', '简历管理', '2022-05-03 11:23:34', '2022-05-03 19:23:33', NULL);
INSERT INTO `log` VALUES (830, '更新职位信息', 7, 'hr1', 201, 'PUT', '/recruit/position/5', '更新职位', '2022-05-03 11:23:42', '2022-05-03 19:23:42', NULL);
INSERT INTO `log` VALUES (831, '更新职位信息', 7, 'hr1', 201, 'PUT', '/recruit/position/4', '更新职位', '2022-05-03 11:23:45', '2022-05-03 19:23:45', NULL);
INSERT INTO `log` VALUES (832, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-03 11:30:50', '2022-05-03 19:30:49', NULL);
INSERT INTO `log` VALUES (833, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-03 11:34:52', '2022-05-03 19:34:51', NULL);
INSERT INTO `log` VALUES (834, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-03 11:35:43', '2022-05-03 19:35:43', NULL);
INSERT INTO `log` VALUES (835, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-03 11:38:50', '2022-05-03 19:38:50', NULL);
INSERT INTO `log` VALUES (836, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-03 15:32:03', '2022-05-03 23:32:03', NULL);
INSERT INTO `log` VALUES (837, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-03 15:33:29', '2022-05-03 23:33:28', NULL);
INSERT INTO `log` VALUES (838, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-03 15:34:08', '2022-05-03 23:34:08', NULL);
INSERT INTO `log` VALUES (839, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-03 15:35:00', '2022-05-03 23:34:59', NULL);
INSERT INTO `log` VALUES (840, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 14:24:12', '2022-05-04 22:24:12', NULL);
INSERT INTO `log` VALUES (841, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 14:26:01', '2022-05-04 22:26:00', NULL);
INSERT INTO `log` VALUES (842, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 14:26:10', '2022-05-04 22:26:10', NULL);
INSERT INTO `log` VALUES (843, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 14:26:51', '2022-05-04 22:26:50', NULL);
INSERT INTO `log` VALUES (844, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 14:26:56', '2022-05-04 22:26:55', NULL);
INSERT INTO `log` VALUES (845, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 14:31:45', '2022-05-04 22:31:44', NULL);
INSERT INTO `log` VALUES (846, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 14:32:05', '2022-05-04 22:32:04', NULL);
INSERT INTO `log` VALUES (847, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 14:32:10', '2022-05-04 22:32:09', NULL);
INSERT INTO `log` VALUES (848, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 14:32:44', '2022-05-04 22:32:43', NULL);
INSERT INTO `log` VALUES (849, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 14:32:49', '2022-05-04 22:32:49', NULL);
INSERT INTO `log` VALUES (850, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 14:32:55', '2022-05-04 22:32:54', NULL);
INSERT INTO `log` VALUES (851, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 14:32:57', '2022-05-04 22:32:57', NULL);
INSERT INTO `log` VALUES (852, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 14:33:04', '2022-05-04 22:33:04', NULL);
INSERT INTO `log` VALUES (853, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 14:33:10', '2022-05-04 22:33:09', NULL);
INSERT INTO `log` VALUES (854, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 14:33:12', '2022-05-04 22:33:12', NULL);
INSERT INTO `log` VALUES (855, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 14:50:31', '2022-05-04 22:50:31', NULL);
INSERT INTO `log` VALUES (856, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 14:55:45', '2022-05-04 22:55:45', NULL);
INSERT INTO `log` VALUES (857, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 14:57:52', '2022-05-04 22:57:52', NULL);
INSERT INTO `log` VALUES (858, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 14:57:57', '2022-05-04 22:57:56', NULL);
INSERT INTO `log` VALUES (859, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 15:01:09', '2022-05-04 23:01:09', NULL);
INSERT INTO `log` VALUES (860, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 15:01:13', '2022-05-04 23:01:12', NULL);
INSERT INTO `log` VALUES (861, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 15:04:53', '2022-05-04 23:04:53', NULL);
INSERT INTO `log` VALUES (862, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 15:06:47', '2022-05-04 23:06:47', NULL);
INSERT INTO `log` VALUES (863, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 15:07:01', '2022-05-04 23:07:01', NULL);
INSERT INTO `log` VALUES (864, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 15:09:10', '2022-05-04 23:09:10', NULL);
INSERT INTO `log` VALUES (865, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 15:10:17', '2022-05-04 23:10:17', NULL);
INSERT INTO `log` VALUES (866, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 15:11:33', '2022-05-04 23:11:32', NULL);
INSERT INTO `log` VALUES (867, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 15:11:36', '2022-05-04 23:11:35', NULL);
INSERT INTO `log` VALUES (868, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 15:20:20', '2022-05-04 23:20:20', NULL);
INSERT INTO `log` VALUES (869, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 15:21:41', '2022-05-04 23:21:41', NULL);
INSERT INTO `log` VALUES (870, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 15:23:31', '2022-05-04 23:23:31', NULL);
INSERT INTO `log` VALUES (871, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 15:49:19', '2022-05-04 23:49:19', NULL);
INSERT INTO `log` VALUES (872, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 15:50:07', '2022-05-04 23:50:06', NULL);
INSERT INTO `log` VALUES (873, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:02:08', '2022-05-05 00:02:08', NULL);
INSERT INTO `log` VALUES (874, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:02:43', '2022-05-05 00:02:43', NULL);
INSERT INTO `log` VALUES (875, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:08:52', '2022-05-05 00:08:51', NULL);
INSERT INTO `log` VALUES (876, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:15:24', '2022-05-05 00:15:23', NULL);
INSERT INTO `log` VALUES (877, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-04 16:15:28', '2022-05-05 00:15:28', NULL);
INSERT INTO `log` VALUES (878, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:19:27', '2022-05-05 00:19:27', NULL);
INSERT INTO `log` VALUES (879, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:19:55', '2022-05-05 00:19:55', NULL);
INSERT INTO `log` VALUES (880, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:20:22', '2022-05-05 00:20:22', NULL);
INSERT INTO `log` VALUES (881, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:20:37', '2022-05-05 00:20:37', NULL);
INSERT INTO `log` VALUES (882, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:20:49', '2022-05-05 00:20:49', NULL);
INSERT INTO `log` VALUES (883, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 16:21:20', '2022-05-05 00:21:19', NULL);
INSERT INTO `log` VALUES (884, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-04 16:21:24', '2022-05-05 00:21:24', NULL);
INSERT INTO `log` VALUES (885, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:22:49', '2022-05-05 00:22:49', NULL);
INSERT INTO `log` VALUES (886, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:23:18', '2022-05-05 00:23:18', NULL);
INSERT INTO `log` VALUES (887, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:27:51', '2022-05-05 00:27:50', NULL);
INSERT INTO `log` VALUES (888, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:28:18', '2022-05-05 00:28:18', NULL);
INSERT INTO `log` VALUES (889, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:28:38', '2022-05-05 00:28:37', NULL);
INSERT INTO `log` VALUES (890, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:28:54', '2022-05-05 00:28:54', NULL);
INSERT INTO `log` VALUES (891, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:29:00', '2022-05-05 00:29:00', NULL);
INSERT INTO `log` VALUES (892, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:29:17', '2022-05-05 00:29:17', NULL);
INSERT INTO `log` VALUES (893, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:32:43', '2022-05-05 00:32:42', NULL);
INSERT INTO `log` VALUES (894, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-04 16:36:48', '2022-05-05 00:36:48', NULL);
INSERT INTO `log` VALUES (895, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-05 14:42:01', '2022-05-05 22:42:00', NULL);
INSERT INTO `log` VALUES (896, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-05 14:43:39', '2022-05-05 22:43:39', NULL);
INSERT INTO `log` VALUES (897, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-05 14:43:48', '2022-05-05 22:43:47', NULL);
INSERT INTO `log` VALUES (898, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-05 14:43:49', '2022-05-05 22:43:48', NULL);
INSERT INTO `log` VALUES (899, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-05 14:43:53', '2022-05-05 22:43:53', NULL);
INSERT INTO `log` VALUES (900, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-05 14:43:56', '2022-05-05 22:43:55', NULL);
INSERT INTO `log` VALUES (901, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-05 14:44:58', '2022-05-05 22:44:58', NULL);
INSERT INTO `log` VALUES (902, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-05 14:45:34', '2022-05-05 22:45:33', NULL);
INSERT INTO `log` VALUES (903, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-05 14:46:01', '2022-05-05 22:46:00', NULL);
INSERT INTO `log` VALUES (904, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-05 14:46:13', '2022-05-05 22:46:13', NULL);
INSERT INTO `log` VALUES (905, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-05 14:47:13', '2022-05-05 22:47:13', NULL);
INSERT INTO `log` VALUES (906, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-05 14:47:23', '2022-05-05 22:47:22', NULL);
INSERT INTO `log` VALUES (907, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-05 14:47:56', '2022-05-05 22:47:56', NULL);
INSERT INTO `log` VALUES (908, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-05 14:51:22', '2022-05-05 22:51:22', NULL);
INSERT INTO `log` VALUES (909, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-05 14:51:31', '2022-05-05 22:51:30', NULL);
INSERT INTO `log` VALUES (910, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-05 15:07:56', '2022-05-05 23:07:56', NULL);
INSERT INTO `log` VALUES (911, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-05 15:07:58', '2022-05-05 23:07:57', NULL);
INSERT INTO `log` VALUES (912, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-05 15:08:22', '2022-05-05 23:08:22', NULL);
INSERT INTO `log` VALUES (913, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-06 13:16:38', '2022-05-06 21:16:38', NULL);
INSERT INTO `log` VALUES (914, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-06 13:23:05', '2022-05-06 21:23:04', NULL);
INSERT INTO `log` VALUES (915, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-06 13:25:23', '2022-05-06 21:25:23', NULL);
INSERT INTO `log` VALUES (916, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-06 13:26:33', '2022-05-06 21:26:33', NULL);
INSERT INTO `log` VALUES (917, '更新企业信息', 6, 'hr', 201, 'PUT', '/recruit/company/1', '更新企业信息', '2022-05-06 13:33:41', '2022-05-06 21:33:40', NULL);
INSERT INTO `log` VALUES (918, '更新企业认证状态', 6, 'hr', 201, 'PUT', '/recruit/company/state/1', '更新企业状态', '2022-05-06 13:33:41', '2022-05-06 21:33:40', NULL);
INSERT INTO `log` VALUES (919, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-06 14:03:15', '2022-05-06 22:03:15', NULL);
INSERT INTO `log` VALUES (920, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-06 14:03:24', '2022-05-06 22:03:24', NULL);
INSERT INTO `log` VALUES (921, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-06 14:04:04', '2022-05-06 22:04:04', NULL);
INSERT INTO `log` VALUES (922, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-06 14:04:06', '2022-05-06 22:04:06', NULL);
INSERT INTO `log` VALUES (923, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-06 14:04:53', '2022-05-06 22:04:53', NULL);
INSERT INTO `log` VALUES (924, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-06 14:04:54', '2022-05-06 22:04:54', NULL);
INSERT INTO `log` VALUES (925, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-06 14:04:55', '2022-05-06 22:04:55', NULL);
INSERT INTO `log` VALUES (926, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-06 14:05:35', '2022-05-06 22:05:35', NULL);
INSERT INTO `log` VALUES (927, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:36:50', '2022-05-07 17:36:49', NULL);
INSERT INTO `log` VALUES (928, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:37:05', '2022-05-07 17:37:04', NULL);
INSERT INTO `log` VALUES (929, '取消收藏', 4, 'user', 201, 'DELETE', '/recruit/favor/cancel', '取消收藏', '2022-05-07 09:37:09', '2022-05-07 17:37:08', NULL);
INSERT INTO `log` VALUES (930, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:37:11', '2022-05-07 17:37:11', NULL);
INSERT INTO `log` VALUES (931, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:41:38', '2022-05-07 17:41:37', NULL);
INSERT INTO `log` VALUES (932, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:41:44', '2022-05-07 17:41:44', NULL);
INSERT INTO `log` VALUES (933, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:41:53', '2022-05-07 17:41:52', NULL);
INSERT INTO `log` VALUES (934, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:42:01', '2022-05-07 17:42:00', NULL);
INSERT INTO `log` VALUES (935, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:42:06', '2022-05-07 17:42:05', NULL);
INSERT INTO `log` VALUES (936, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:43:20', '2022-05-07 17:43:20', NULL);
INSERT INTO `log` VALUES (937, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:43:24', '2022-05-07 17:43:23', NULL);
INSERT INTO `log` VALUES (938, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:43:28', '2022-05-07 17:43:27', NULL);
INSERT INTO `log` VALUES (939, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:43:38', '2022-05-07 17:43:38', NULL);
INSERT INTO `log` VALUES (940, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:44:13', '2022-05-07 17:44:13', NULL);
INSERT INTO `log` VALUES (941, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:44:16', '2022-05-07 17:44:16', NULL);
INSERT INTO `log` VALUES (942, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:44:25', '2022-05-07 17:44:24', NULL);
INSERT INTO `log` VALUES (943, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:44:34', '2022-05-07 17:44:34', NULL);
INSERT INTO `log` VALUES (944, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:44:38', '2022-05-07 17:44:38', NULL);
INSERT INTO `log` VALUES (945, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:44:43', '2022-05-07 17:44:43', NULL);
INSERT INTO `log` VALUES (946, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:44:45', '2022-05-07 17:44:44', NULL);
INSERT INTO `log` VALUES (947, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:49:14', '2022-05-07 17:49:13', NULL);
INSERT INTO `log` VALUES (948, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:49:17', '2022-05-07 17:49:16', NULL);
INSERT INTO `log` VALUES (949, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:52:25', '2022-05-07 17:52:24', NULL);
INSERT INTO `log` VALUES (950, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:52:27', '2022-05-07 17:52:26', NULL);
INSERT INTO `log` VALUES (951, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:52:29', '2022-05-07 17:52:28', NULL);
INSERT INTO `log` VALUES (952, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-07 09:55:44', '2022-05-07 17:55:44', NULL);
INSERT INTO `log` VALUES (953, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 09:56:27', '2022-05-07 17:56:27', NULL);
INSERT INTO `log` VALUES (954, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 09:56:57', '2022-05-07 17:56:57', NULL);
INSERT INTO `log` VALUES (955, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 09:57:02', '2022-05-07 17:57:02', NULL);
INSERT INTO `log` VALUES (956, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 09:57:06', '2022-05-07 17:57:05', NULL);
INSERT INTO `log` VALUES (957, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 09:58:10', '2022-05-07 17:58:09', NULL);
INSERT INTO `log` VALUES (958, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 10:03:43', '2022-05-07 18:03:42', NULL);
INSERT INTO `log` VALUES (959, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 10:03:46', '2022-05-07 18:03:45', NULL);
INSERT INTO `log` VALUES (960, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 10:03:56', '2022-05-07 18:03:55', NULL);
INSERT INTO `log` VALUES (961, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 10:03:58', '2022-05-07 18:03:57', NULL);
INSERT INTO `log` VALUES (962, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:05:56', '2022-05-07 18:05:55', NULL);
INSERT INTO `log` VALUES (963, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:06:01', '2022-05-07 18:06:00', NULL);
INSERT INTO `log` VALUES (964, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:10:45', '2022-05-07 18:10:44', NULL);
INSERT INTO `log` VALUES (965, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:10:50', '2022-05-07 18:10:50', NULL);
INSERT INTO `log` VALUES (966, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:10:54', '2022-05-07 18:10:53', NULL);
INSERT INTO `log` VALUES (967, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:10:55', '2022-05-07 18:10:55', NULL);
INSERT INTO `log` VALUES (968, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:28:01', '2022-05-07 18:28:00', NULL);
INSERT INTO `log` VALUES (969, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:28:03', '2022-05-07 18:28:02', NULL);
INSERT INTO `log` VALUES (970, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:28:04', '2022-05-07 18:28:03', NULL);
INSERT INTO `log` VALUES (971, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:28:05', '2022-05-07 18:28:05', NULL);
INSERT INTO `log` VALUES (972, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-07 10:29:49', '2022-05-07 18:29:49', NULL);
INSERT INTO `log` VALUES (973, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-07 10:29:51', '2022-05-07 18:29:51', NULL);
INSERT INTO `log` VALUES (974, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-07 10:30:21', '2022-05-07 18:30:20', NULL);
INSERT INTO `log` VALUES (975, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:30:45', '2022-05-07 18:30:45', NULL);
INSERT INTO `log` VALUES (976, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:30:49', '2022-05-07 18:30:48', NULL);
INSERT INTO `log` VALUES (977, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:30:50', '2022-05-07 18:30:49', NULL);
INSERT INTO `log` VALUES (978, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:30:51', '2022-05-07 18:30:51', NULL);
INSERT INTO `log` VALUES (979, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-07 10:31:06', '2022-05-07 18:31:06', NULL);
INSERT INTO `log` VALUES (980, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-07 10:31:11', '2022-05-07 18:31:11', NULL);
INSERT INTO `log` VALUES (981, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 10:31:17', '2022-05-07 18:31:17', NULL);
INSERT INTO `log` VALUES (982, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 10:32:01', '2022-05-07 18:32:00', NULL);
INSERT INTO `log` VALUES (983, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-07 10:34:49', '2022-05-07 18:34:49', NULL);
INSERT INTO `log` VALUES (984, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-07 10:34:55', '2022-05-07 18:34:54', NULL);
INSERT INTO `log` VALUES (985, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-07 10:34:57', '2022-05-07 18:34:56', NULL);
INSERT INTO `log` VALUES (986, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-07 10:39:16', '2022-05-07 18:39:15', NULL);
INSERT INTO `log` VALUES (987, '更新职位类型', 8, 'admin', 201, 'PUT', '/recruit/category/1', '更新分类', '2022-05-07 10:39:22', '2022-05-07 18:39:21', NULL);
INSERT INTO `log` VALUES (988, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-07 10:39:22', '2022-05-07 18:39:21', NULL);
INSERT INTO `log` VALUES (989, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-07 10:39:29', '2022-05-07 18:39:28', NULL);
INSERT INTO `log` VALUES (990, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-07 10:39:31', '2022-05-07 18:39:30', NULL);
INSERT INTO `log` VALUES (991, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-07 10:39:32', '2022-05-07 18:39:32', NULL);
INSERT INTO `log` VALUES (992, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-07 10:39:36', '2022-05-07 18:39:35', NULL);
INSERT INTO `log` VALUES (993, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-07 10:39:37', '2022-05-07 18:39:36', NULL);
INSERT INTO `log` VALUES (994, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-07 10:40:08', '2022-05-07 18:40:07', NULL);
INSERT INTO `log` VALUES (995, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-07 10:40:09', '2022-05-07 18:40:08', NULL);
INSERT INTO `log` VALUES (996, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:49:15', '2022-05-07 18:49:15', NULL);
INSERT INTO `log` VALUES (997, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-07 10:49:16', '2022-05-07 18:49:15', NULL);
INSERT INTO `log` VALUES (998, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-07 10:50:38', '2022-05-07 18:50:37', NULL);
INSERT INTO `log` VALUES (999, '文件上传', 1, 'root', 200, 'POST', '/recruit/file', '', '2022-05-07 10:58:40', '2022-05-07 18:58:39', NULL);
INSERT INTO `log` VALUES (1000, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-08 08:29:35', '2022-05-08 16:29:34', NULL);
INSERT INTO `log` VALUES (1001, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-08 08:29:58', '2022-05-08 16:29:58', NULL);
INSERT INTO `log` VALUES (1002, '取消收藏', 4, 'user', 201, 'DELETE', '/recruit/favor/cancel', '取消收藏', '2022-05-08 08:30:04', '2022-05-08 16:30:03', NULL);
INSERT INTO `log` VALUES (1003, '取消收藏', 4, 'user', 201, 'DELETE', '/recruit/favor/cancel', '取消收藏', '2022-05-08 08:30:05', '2022-05-08 16:30:05', NULL);
INSERT INTO `log` VALUES (1004, '查看简历', 4, 'user', 200, 'GET', '/recruit/resume/get/4', '查询简历', '2022-05-08 08:30:10', '2022-05-08 16:30:09', NULL);
INSERT INTO `log` VALUES (1005, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-08 08:30:47', '2022-05-08 16:30:46', NULL);
INSERT INTO `log` VALUES (1006, '撤销职位申请', 4, 'user', 201, 'DELETE', '/recruit/application/60', '撤销申请', '2022-05-08 08:31:00', '2022-05-08 16:31:00', NULL);
INSERT INTO `log` VALUES (1007, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-08 08:31:00', '2022-05-08 16:31:00', NULL);
INSERT INTO `log` VALUES (1008, '更新企业信息', 6, 'hr', 201, 'PUT', '/recruit/company/1', '更新企业信息', '2022-05-08 08:31:58', '2022-05-08 16:31:58', NULL);
INSERT INTO `log` VALUES (1009, '更新企业认证状态', 6, 'hr', 201, 'PUT', '/recruit/company/state/1', '更新企业状态', '2022-05-08 08:31:58', '2022-05-08 16:31:58', NULL);
INSERT INTO `log` VALUES (1010, '更新企业认证状态', 8, 'admin', 201, 'PUT', '/recruit/company/state/1', '更新企业状态', '2022-05-08 08:32:24', '2022-05-08 16:32:24', NULL);
INSERT INTO `log` VALUES (1011, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-08 08:32:45', '2022-05-08 16:32:45', NULL);
INSERT INTO `log` VALUES (1012, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-08 08:33:00', '2022-05-08 16:32:59', NULL);
INSERT INTO `log` VALUES (1013, '处理简历', 6, 'hr', 201, 'PUT', '/recruit/application/state/54', '申请审核', '2022-05-08 08:33:05', '2022-05-08 16:33:05', NULL);
INSERT INTO `log` VALUES (1014, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-08 08:33:06', '2022-05-08 16:33:05', NULL);
INSERT INTO `log` VALUES (1015, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-08 08:33:54', '2022-05-08 16:33:53', NULL);
INSERT INTO `log` VALUES (1016, '查看职位类型列表', 8, 'admin', 200, 'GET', '/recruit/category/page', '查看分类列表', '2022-05-08 08:40:26', '2022-05-08 16:40:26', NULL);
INSERT INTO `log` VALUES (1017, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-08 08:44:41', '2022-05-08 16:44:40', NULL);
INSERT INTO `log` VALUES (1018, '查看简历投递状况', 4, 'user', 200, 'GET', '/recruit/application/page/find/4', '我的投递箱', '2022-05-08 08:44:45', '2022-05-08 16:44:44', NULL);
INSERT INTO `log` VALUES (1019, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-08 08:44:58', '2022-05-08 16:44:58', NULL);
INSERT INTO `log` VALUES (1020, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-08 08:45:00', '2022-05-08 16:44:59', NULL);
INSERT INTO `log` VALUES (1021, '查看应聘简历', 6, 'hr', 200, 'GET', '/recruit/application/page/6', '简历管理', '2022-05-08 08:45:10', '2022-05-08 16:45:09', NULL);

-- ----------------------------
-- Table structure for notify
-- ----------------------------
DROP TABLE IF EXISTS `notify`;
CREATE TABLE `notify`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '消息内容',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户名',
  `is_read` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'false' COMMENT '消息是否已读，默认false代表未读',
  `time` datetime(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '通知到达的时间',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notify
-- ----------------------------
INSERT INTO `notify` VALUES (15, '阿里巴巴发布了职位——Java工程师，快去看看吧！', 'user1', 'false', '2022-04-01 21:58:02.000', '2021-04-17 21:58:02.907', '2022-04-01 21:58:02.000', NULL);
INSERT INTO `notify` VALUES (16, '阿里巴巴发布了职位——Java工程师，快去看看吧！', 'user', 'false', '2022-04-17 21:58:02.949', '2021-04-17 21:58:02.949', '2022-04-17 21:58:02.949', NULL);
INSERT INTO `notify` VALUES (17, '阿里巴巴发布了职位——C++开发工程师，快去看看吧！', 'user1', 'false', '2022-04-17 21:58:08.626', '2021-04-17 21:58:08.626', '2022-04-17 21:58:08.626', NULL);
INSERT INTO `notify` VALUES (18, '阿里巴巴发布了职位——C++开发工程师，快去看看吧！', 'user', 'false', '2022-04-17 21:58:08.654', '2021-04-17 21:58:08.654', '2022-04-17 21:58:08.654', NULL);
INSERT INTO `notify` VALUES (19, '阿里巴巴发布了新职位——运维开发工程师，快去看看吧！', 'user1', 'false', '2022-04-17 22:01:12.957', '2021-04-17 22:01:12.957', '2022-04-17 22:01:12.957', NULL);
INSERT INTO `notify` VALUES (20, '阿里巴巴发布了新职位——运维开发工程师，快去看看吧！', 'user', 'false', '2022-04-17 22:01:12.986', '2021-04-17 22:01:12.986', '2022-04-17 22:01:12.986', NULL);
INSERT INTO `notify` VALUES (21, '阿里巴巴发布了职位——运维开发工程师，快去看看吧！', 'user', 'false', '2022-04-17 22:31:15.387', '2021-04-17 22:31:15.387', '2022-04-17 22:31:15.387', NULL);
INSERT INTO `notify` VALUES (22, '阿里巴巴发布了职位——Java工程师，快去看看吧！', 'user', 'false', '2022-04-23 12:26:02.733', '2021-04-23 12:26:02.733', '2022-04-23 12:26:02.733', NULL);
INSERT INTO `notify` VALUES (23, '阿里巴巴发布了职位——C++开发工程师，快去看看吧！', 'user', 'false', '2022-04-23 18:05:49.288', '2021-04-23 18:05:49.288', '2022-04-23 18:05:49.288', NULL);
INSERT INTO `notify` VALUES (24, '阿里巴巴发布了职位——数据挖掘工程师，快去看看吧！', 'user', 'false', '2022-04-30 00:06:07.577', '2021-04-30 00:06:07.577', '2022-04-30 00:06:07.577', NULL);
INSERT INTO `notify` VALUES (25, '阿里巴巴发布了职位——PHP工程师，快去看看吧！', 'user', 'false', '2022-05-03 00:54:08.049', '2021-05-03 00:54:08.049', '2022-05-03 00:54:08.049', NULL);
INSERT INTO `notify` VALUES (27, '阿里巴巴发布了职位——C++工程师，快去看看吧！', 'user', 'false', '2022-05-03 01:27:33.511', '2021-05-03 01:27:33.511', '2022-05-03 01:27:33.511', NULL);
INSERT INTO `notify` VALUES (28, '阿里巴巴发布了职位——Python开发，快去看看吧！', 'user', 'false', '2022-03-19 16:10:29.391', '2022-03-19 16:10:29.391', '2022-03-19 16:10:29.391', NULL);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限名称，例如：访问首页',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限所属模块，例如：人员管理',
  `mount` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0：关闭 1：开启',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (5, '查询简历', '简历', 1, '2021-04-16 00:35:53.728', '2021-04-16 00:35:53.728', NULL);
INSERT INTO `permission` VALUES (6, '创建简历', '简历', 1, '2021-04-16 00:35:53.818', '2021-04-16 00:35:53.818', NULL);
INSERT INTO `permission` VALUES (7, '更新简历', '简历', 1, '2021-04-16 00:35:53.915', '2021-04-16 00:35:53.915', NULL);
INSERT INTO `permission` VALUES (8, '查看简历详情', '简历', 1, '2021-04-16 00:35:54.021', '2021-04-16 00:35:54.021', NULL);
INSERT INTO `permission` VALUES (9, '下架职位', '职位', 1, '2021-04-16 01:34:30.606', '2021-04-16 01:34:30.606', NULL);
INSERT INTO `permission` VALUES (10, '职位审核', '职位', 1, '2021-04-16 01:34:30.746', '2021-04-16 01:34:30.746', NULL);
INSERT INTO `permission` VALUES (11, '更新职位', '职位', 1, '2021-04-16 01:34:30.790', '2021-04-16 01:34:30.790', NULL);
INSERT INTO `permission` VALUES (12, '查看职位详细信息', '职位', 1, '2021-04-16 01:34:30.843', '2021-04-16 01:34:30.843', NULL);
INSERT INTO `permission` VALUES (13, '查看已发布的职位', '职位', 1, '2021-04-16 01:34:30.888', '2021-04-16 01:34:30.888', NULL);
INSERT INTO `permission` VALUES (14, '发布职位', '职位', 1, '2021-04-16 01:34:30.977', '2021-04-16 01:34:30.977', NULL);
INSERT INTO `permission` VALUES (15, '更新企业信息', '公司', 1, '2021-04-16 01:40:34.583', '2021-04-16 01:40:34.583', NULL);
INSERT INTO `permission` VALUES (16, '企业认证', '公司', 1, '2021-04-16 01:40:34.740', '2021-04-16 01:40:34.740', NULL);
INSERT INTO `permission` VALUES (17, '企业审核', '公司', 1, '2021-04-16 01:40:34.825', '2021-04-16 01:40:34.825', NULL);
INSERT INTO `permission` VALUES (18, '更新分类', '职位分类', 1, '2021-04-16 01:48:59.868', '2021-04-16 01:48:59.868', NULL);
INSERT INTO `permission` VALUES (19, '撤销申请', '申请', 1, '2021-04-16 01:49:00.033', '2021-04-16 01:49:00.033', NULL);
INSERT INTO `permission` VALUES (20, '查看我的收藏', '收藏职位', 1, '2021-04-16 01:49:00.072', '2021-04-16 01:49:00.072', NULL);
INSERT INTO `permission` VALUES (21, '删除分类', '职位分类', 1, '2021-04-16 01:49:00.126', '2021-04-16 01:49:00.126', NULL);
INSERT INTO `permission` VALUES (22, '添加收藏', '收藏职位', 1, '2021-04-16 01:49:00.175', '2021-04-16 01:49:00.175', NULL);
INSERT INTO `permission` VALUES (23, '取消关注', '关注公司', 1, '2021-04-16 01:49:00.240', '2021-04-16 01:49:00.240', NULL);
INSERT INTO `permission` VALUES (24, '查看分类列表', '职位分类', 1, '2021-04-16 01:49:00.314', '2021-04-16 01:49:00.314', NULL);
INSERT INTO `permission` VALUES (25, '申请审核', '申请', 1, '2021-04-16 01:49:00.371', '2021-04-16 01:49:00.371', NULL);
INSERT INTO `permission` VALUES (26, '新增关注', '关注公司', 1, '2021-04-16 01:49:00.424', '2021-04-16 01:49:00.424', NULL);
INSERT INTO `permission` VALUES (27, '简历排序', '申请', 1, '2021-04-16 01:49:00.489', '2021-04-16 01:49:00.489', NULL);
INSERT INTO `permission` VALUES (28, '查看我的关注', '关注公司', 1, '2021-04-16 01:49:00.529', '2021-04-16 01:49:00.529', NULL);
INSERT INTO `permission` VALUES (29, '我的投递箱', '申请', 1, '2021-04-16 01:49:00.592', '2021-04-16 01:49:00.592', NULL);
INSERT INTO `permission` VALUES (30, '简历管理', '申请', 1, '2021-04-16 01:49:00.656', '2021-04-16 01:49:00.656', NULL);
INSERT INTO `permission` VALUES (31, '取消收藏', '收藏职位', 1, '2021-04-16 01:49:00.703', '2021-04-16 01:49:00.703', NULL);
INSERT INTO `permission` VALUES (32, '新增分类', '职位分类', 1, '2021-04-16 01:49:00.740', '2021-04-16 01:49:00.740', NULL);
INSERT INTO `permission` VALUES (33, '投递简历', '申请', 1, '2021-04-16 01:49:00.849', '2021-04-16 01:49:00.849', NULL);
INSERT INTO `permission` VALUES (34, '更新职位状态', '职位', 1, '2021-04-16 02:50:43.919', '2021-04-16 02:50:43.919', NULL);
INSERT INTO `permission` VALUES (35, '更新企业状态', '公司', 1, '2021-04-16 02:50:44.012', '2021-04-16 02:50:44.012', NULL);
INSERT INTO `permission` VALUES (36, '查询所有日志', '日志', 1, '2022-03-21 16:09:36.065', '2022-03-21 16:09:36.065', NULL);
INSERT INTO `permission` VALUES (37, '搜索日志', '日志', 1, '2022-03-21 16:09:49.590', '2022-03-21 16:09:49.590', NULL);
INSERT INTO `permission` VALUES (38, '查询日志记录的用户', '日志', 1, '2022-03-21 17:09:59.373', '2022-03-21 17:09:59.373', NULL);
INSERT INTO `permission` VALUES (39, '我的面试', '面试', 1, '2022-03-22 22:12:12.055', '2022-04-10 19:01:22.852', NULL);
INSERT INTO `permission` VALUES (40, '面试管理', '面试', 1, '2022-03-22 22:12:30.361', '2022-04-10 19:01:23.769', NULL);
INSERT INTO `permission` VALUES (41, '查询所有用户', '管理员', 1, '2022-03-22 23:26:50.765', '2022-03-22 23:41:11.316', NULL);
INSERT INTO `permission` VALUES (42, '查询所有可分配的权限', '管理员', 1, '2022-03-22 23:30:08.710', '2022-03-22 23:47:46.468', NULL);
INSERT INTO `permission` VALUES (43, '修改用户密码', '管理员', 1, '2022-03-22 23:48:06.224', '2022-03-22 23:48:06.224', NULL);
INSERT INTO `permission` VALUES (44, '删除用户', '管理员', 1, '2022-03-22 23:48:06.232', '2022-03-22 23:49:07.913', NULL);
INSERT INTO `permission` VALUES (45, '管理员更新用户信息', '管理员', 1, '2022-03-22 23:49:23.707', '2022-03-22 23:49:23.707', NULL);
INSERT INTO `permission` VALUES (46, '查询所有权限组及其权限', '管理员', 1, '2022-03-22 23:49:35.845', '2022-03-22 23:49:35.845', NULL);
INSERT INTO `permission` VALUES (47, '查询所有权限组', '管理员', 1, '2022-03-22 23:49:50.000', '2022-03-22 23:49:50.000', NULL);
INSERT INTO `permission` VALUES (48, '查询一个权限组及其权限', '管理员', 1, '2022-03-22 23:50:02.089', '2022-03-22 23:50:02.089', NULL);
INSERT INTO `permission` VALUES (49, '新建权限组', '管理员', 1, '2022-03-22 23:50:12.015', '2022-03-22 23:50:12.015', NULL);
INSERT INTO `permission` VALUES (50, '更新一个权限组', '管理员', 1, '2022-03-22 23:50:20.611', '2022-03-22 23:50:20.611', NULL);
INSERT INTO `permission` VALUES (51, '删除一个权限组', '管理员', 1, '2022-03-22 23:50:35.067', '2022-03-22 23:50:35.067', NULL);
INSERT INTO `permission` VALUES (52, '分配单个权限', '管理员', 1, '2022-03-22 23:50:45.432', '2022-03-22 23:50:45.432', NULL);
INSERT INTO `permission` VALUES (53, '分配多个权限', '管理员', 1, '2022-03-22 23:50:53.740', '2022-03-22 23:50:53.740', NULL);
INSERT INTO `permission` VALUES (54, '删除多个权限', '管理员', 1, '2022-03-22 23:51:01.241', '2022-03-22 23:51:01.241', NULL);
INSERT INTO `permission` VALUES (55, '用户列表', '管理员', 1, '2022-04-09 23:51:53.107', '2022-04-23 23:56:26.615', NULL);
INSERT INTO `permission` VALUES (56, '管理员', '管理员', 1, '2022-04-09 23:56:39.290', '2022-04-23 23:56:28.185', NULL);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职位名称',
  `edu_back` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '学历要求',
  `requirement` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '职位要求',
  `quantity` int(11) NULL DEFAULT NULL COMMENT '招聘人数',
  `city` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工作地点',
  `salary_down` int(11) NULL DEFAULT NULL COMMENT '最低薪资',
  `salary_up` int(11) NULL DEFAULT NULL COMMENT '最高薪资',
  `release_date` datetime(3) NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '发布时间',
  `state` int(11) NULL DEFAULT 0 COMMENT '职位状态',
  `hits` int(11) NULL DEFAULT 0 COMMENT '职位浏览量',
  `category_id` int(11) NOT NULL COMMENT '职位分类id',
  `hr_id` int(11) NOT NULL COMMENT 'HR id',
  `company_id` int(11) NOT NULL COMMENT '公司id',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  `delete_time` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, 'Java工程师','本科', '熟练使用RPC框架，具备相关的分布式开发经验', 3, '北京市', 3000, 7000, '2021-04-01 00:17:19.000', 1, 335, 1, 6, 1, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (2, 'Java工程师','专科', '接收应届实习生，实习期满应聘上岗', 5, '上海市', 7000, 11000, '2021-04-01 16:17:31.000', 1, 55, 1, 6, 1, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (3, 'Java工程师','专科', '有扎实的java基础，熟悉分布式、缓存、异步消息等原理和应用', 15, '天津市', 13000, 10000, '2021-04-03 00:17:35.000', 1, 187, 1, 7, 2, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (4, 'Java工程师','本科', 'JAVA WEB方向2年+经验', 2, '南京市', 5000, 8000, '2021-04-03 16:17:40.000', 1, 191, 1, 7, 2, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (5, 'C++工程师', '专科','可接收计算机相关专业应届生，表现优秀者加薪转正', 30, '南京市', 5000,8000, '2021-04-04 16:17:44.000', 1, 13, 2, 7, 2, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (6, 'C++工程师', '本科','3-5年工作经验，计算机相关专业毕业', 1, '上海市', 6000, 8000, '2021-04-05 08:17:52.000', 0, 127, 2, 6, 1, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', '2021-05-03 01:27:33.000');
INSERT INTO `position` VALUES (7, 'PHP工程师', '专科','一年以上PHP开发经验 （项目经验丰富的，也可以升级为高级开发工程师）', 10, '上海市', 3000, 7000, '2021-04-05 16:17:58.000', 0, 236, 9, 6, 1, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', '2021-05-03 00:54:07.000');
INSERT INTO `position` VALUES (8, 'PHP工程师', '专科','熟悉LNMP/WNMP开发环境 , 熟练使用Yaf, Yii, ThinkPHP等一种或多种框架.', 5, '上海市', 4000, 7000, '2021-04-07 00:18:06.000', 1, 307, 9, 7, 2, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (9, '.NET工程师','本科', '熟悉WinForm/WPF窗体开发并有实际项目经验', 2, '北京市', 3000, 7000, '2021-03-15 00:18:11.000', 1, 91, 11, 7, 2, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (10, 'Python数据分析','专科', '熟练使用Linux，可以快速上手编写shell、powershell、cmd等操作系统脚本', 2, '北京市', 3000, 8000, '2021-03-16 00:18:21.000', 1, 101, 13, 7, 1, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (11, 'Python开发','专科', '4年以上互联网产品后台研发经验，2年以上后台构架经验', 2, '北京市', 2000, 8000, '2021-03-18 00:18:27.000', 1, 109, 13, 6, 1, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', '2022-03-19 16:10:29.000');
INSERT INTO `position` VALUES (12, 'Python开发','专科', '精通Python，2年或以上Python项目经验', 3, '天津市', 2500, 4000, '2021-03-19 00:18:34.000', 1, 178, 13, 6, 1, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (13, '数据挖掘工程师','专科', '熟悉 Linux平台上的编程环境，精通Java开发，精通 Python/Shell等脚本语言', 12, '天津市', 22000, 15000, '2021-03-20 00:18:40.000', 1, 206, 5, 6, 1, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (14, '数据挖掘工程师','专科', '熟悉Hadoop、Hive、Spark、流式计算、实时计算等大数据相关技术者优先，熟悉时序挖掘、文本挖掘、网络挖掘等优先', 2, '北京市', 32000, 28000, '2021-03-21 00:18:47.000', 1, 215, 5, 6, 1, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (15, '数据挖掘工程师','专科', '精通Python，熟悉PHP/GO/Java/C++/C等语言中的一种或几种', 2, '杭州市', 26000, 14000, '2021-03-22 00:18:54.000', 1, 326, 5, 7, 2, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (16, 'Java工程师','硕士', '熟悉Spring、Freemark、Struts、Hibernate 等开源框架', 13, '杭州市', 18000, 15000, '2021-02-01 00:19:00.000', 1, 309, 1, 7, 2, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (17, 'Java后端开发','专科', '熟练使用Mybatis，SpringMVC，SpringCloud等框架', 5, '杭州市', 21000, 18000, '2021-02-02 16:19:06.000', 1, 28, 1, 6, 1, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (18, 'C++后端开发','本科', '熟练linux系统操作，熟练gcc,gdb,vim, eclipse等开发工具', 5, '北京市', 12000, 9000, '2021-02-16 16:19:12.000', 1, 60, 2, 6, 1, '2021-05-01 18:12:13.409', '2021-05-01 18:12:13.409', NULL);
INSERT INTO `position` VALUES (19, '后端开发','专科', '熟悉后端开发技术', 5, '广东省深圳市', 1500, 12000, '2022-03-21 13:18:05.594', 1, 8, 4, 6, 1, '2022-03-22 21:18:05.594', '2022-03-22 21:18:05.594', NULL);
INSERT INTO `position` VALUES (20, '数据开发工程师','本科', '拥有很多技术', 5, '广东广州', 15000, 12000, '2022-04-24 18:38:16.177', 1, 2, 6, 6, 1, '2022-04-24 18:38:16.177', '2022-04-24 18:38:16.177', '2022-04-24 18:39:16.000');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `resume_id` int(11) NOT NULL COMMENT '简历id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '项目名称',
  `start_time` date NOT NULL COMMENT '开始时间',
  `end_time` date NOT NULL COMMENT '结束时间',
  `performance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项目描述',
  `background` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '项目背景',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, 1, '啥啥啥项目', '2022-02-27', '2022-03-23', '1.熟悉项目需求，了解项目人员安排；\n2.我负责专卖商城PC和后台管理系统功能测试，设计并执行测试用例，提交bug并跟踪处理；\n3.每天例行任务：测主流程，上线前做集成测试和系统测试；\n4.对该项目主要模块进行性能测试，如登录、浏览、下单、支付等。', '该系统是集线上线下于一体的电商平台，主要是在全国专卖和本地超市充值、下单，对应后台系统管理商品和订单，销售结算、提现等功能。');

-- ----------------------------
-- Table structure for resume
-- ----------------------------
DROP TABLE IF EXISTS `resume`;
CREATE TABLE `resume`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `ability` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '专业技能',
  `english` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英语等级',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别（0男 ，1 女）',
  `age` int(3) NULL DEFAULT NULL COMMENT '年龄',
  `home` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '居住地',
  `personal_summary` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人总结',
  `job_intention` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '求职意向',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '创建时间',
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) COMMENT '更新时间',
  `delete_time` datetime(3) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of resume
-- ----------------------------
INSERT INTO `resume` VALUES (1, 4, '熟悉Java编程，掌握常用数据结构与算法，对计算机网络和操作系统有所了解\n\n', '英语四级', 0, 25, '广东中山', '善于沟通，喜欢通过博客来总结学过的知识点', 'Java开发', '2021-05-01 18:28:11.929', '2021-05-01 18:28:11.929', NULL);
INSERT INTO `resume` VALUES (2, 5, '熟悉C++编程，了解数据结构和算法', '英语六级', 1, 23, '广东深圳', '热爱生活、热爱运动、热爱编程', 'C++开发', '2021-05-02 15:21:50.560', '2021-05-02 15:21:50.560', NULL);
INSERT INTO `resume` VALUES (10, 9, '1)C/C++/Java; Linux/Unix Shell编程；  2)Perl/Python/PHP; 网络技术及相应的开发；  3)JavaScript/Html/Ajax；MySql/Oracle及相关数据库技术。', 'CET-4', 0, 26, '广东广州', '1、热爱互联网，对互联网相关业务或技术充满好奇及热情； 2、快速的产品及业务学习能力，敏捷而周到的逻辑思维能力；  3、有责任心，敢于担当，工作积极主动；', '测试工程师', '2022-03-26 18:11:43.014', '2022-03-26 18:11:43.014', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名，唯一',
  `nickname` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户昵称',/
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '头像url',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `tel` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `update_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_del`(`username`, `delete_time`) USING BTREE,
  UNIQUE INDEX `email_del`(`email`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'root', '超级管理员', 'user.png', '2416871211@qq.com', '13538384290', '2021-03-14 14:49:21', '2022-04-26 23:17:16', NULL);
INSERT INTO `user` VALUES (4, 'user', '刘同学', 'user.png', 'user@qq.com', '13766666666', '2021-04-16 02:02:05', '2022-03-25 18:54:25', NULL);
INSERT INTO `user` VALUES (5, 'user1', '李同学', 'user.png', 'user1@qq.com', '13555555555', '2021-04-16 02:02:33', '2022-03-25 21:26:24', NULL);
INSERT INTO `user` VALUES (6, 'hr', '陈经理', 'user.png', 'hr@qq.com', '13090908756', '2021-04-16 02:02:48', '2022-04-26 23:17:06', NULL);
INSERT INTO `user` VALUES (7, 'hr1', '郑经理', 'user.png', 'hr1@qq.com', '13433339999', '2021-04-16 02:03:10', '2022-04-26 23:16:58', NULL);
INSERT INTO `user` VALUES (8, 'admin', '平台管理员', 'user.png', 'admin@qq.com', '13768685959', '2021-04-16 02:03:27', '2022-04-26 23:16:52', NULL);
INSERT INTO `user` VALUES (9, 'user2', '蓝同学', 'user.png', 'user2@qq.com', '13655555555', '2021-05-02 15:28:53', '2022-03-25 21:26:45', NULL);
INSERT INTO `user` VALUES (13, 'sysadmin', '系统管理员', 'user.png', '123@123.com', '13860600000', '2022-03-22 23:28:57', '2022-04-26 18:16:44', NULL);

-- ----------------------------
-- Table structure for user_group
-- ----------------------------
DROP TABLE IF EXISTS `user_group`;
CREATE TABLE `user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '分组id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_group_id`(`user_id`, `group_id`) USING BTREE COMMENT '联合索引'
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_group
-- ----------------------------
INSERT INTO `user_group` VALUES (1, 1, 1);
INSERT INTO `user_group` VALUES (2, 2, 2);
INSERT INTO `user_group` VALUES (3, 3, 3);
INSERT INTO `user_group` VALUES (4, 4, 2);
INSERT INTO `user_group` VALUES (5, 5, 2);
INSERT INTO `user_group` VALUES (6, 6, 3);
INSERT INTO `user_group` VALUES (7, 7, 3);
INSERT INTO `user_group` VALUES (8, 8, 4);
INSERT INTO `user_group` VALUES (9, 9, 2);
INSERT INTO `user_group` VALUES (11, 9, 2);
INSERT INTO `user_group` VALUES (10, 10, 2);
INSERT INTO `user_group` VALUES (12, 10, 2);
INSERT INTO `user_group` VALUES (13, 11, 2);
INSERT INTO `user_group` VALUES (14, 12, 2);
INSERT INTO `user_group` VALUES (22, 13, 5);
INSERT INTO `user_group` VALUES (20, 16, 4);
INSERT INTO `user_group` VALUES (21, 17, 3);

-- ----------------------------
-- Table structure for user_identity
-- ----------------------------
DROP TABLE IF EXISTS `user_identity`;
CREATE TABLE `user_identity`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL COMMENT '用户id',
  `identity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `identifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `credential` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_identity
-- ----------------------------
INSERT INTO `user_identity` VALUES (1, 1, 'USERNAME_PASSWORD', 'root', 'pbkdf2sha256:64000:18:24:n:yUnDokcNRbwILZllmUOItIyo9MnI00QW:6ZcPf+sfzyoygOU8h/GSoirF', '2021-03-14 14:49:20.842', '2021-03-14 14:49:20.842', NULL);
INSERT INTO `user_identity` VALUES (4, 4, 'USERNAME_PASSWORD', 'user', 'pbkdf2sha256:64000:18:24:n:LM9r8Qohq6Cr9ZE8ylO1vGi8dHXvtx1M:l+dKkEY/iYe2Uj9T1o/drG7n', '2021-04-16 02:02:05.498', '2021-04-16 02:02:05.498', NULL);
INSERT INTO `user_identity` VALUES (5, 5, 'USERNAME_PASSWORD', 'user1', 'pbkdf2sha256:64000:18:24:n:itdSrGVHL8V5NNcbe4SuJokpev5zWe3r:tLVd6/oJFjokN9gfRQVS6hs4', '2021-04-16 02:02:33.392', '2021-04-16 02:02:33.392', NULL);
INSERT INTO `user_identity` VALUES (6, 6, 'USERNAME_PASSWORD', 'hr', 'pbkdf2sha256:64000:18:24:n:Nmgyvn43dsxnwkvoLS4KToSPOy1VatEv:5nVP0vb3pzuo5eMi2cLKujyC', '2021-04-16 02:02:47.876', '2021-04-16 02:02:47.876', NULL);
INSERT INTO `user_identity` VALUES (7, 7, 'USERNAME_PASSWORD', 'hr1', 'pbkdf2sha256:64000:18:24:n:DDjeVDVJnlJ8eiQsTukrAwRerugVj3UE:RloPJhjQ9OOCGRBiD80cHOGW', '2021-04-16 02:03:09.896', '2021-04-16 02:03:09.896', NULL);
INSERT INTO `user_identity` VALUES (8, 8, 'USERNAME_PASSWORD', 'admin', 'pbkdf2sha256:64000:18:24:n:Wx1cy1IJb7HpPY21BWpkaIwqIOphaBZF:gjRhsWs3a0VD/nAOgXDJbSia', '2021-04-16 02:03:27.065', '2021-04-16 02:03:27.065', NULL);
INSERT INTO `user_identity` VALUES (11, 9, 'USERNAME_PASSWORD', 'user2', 'pbkdf2sha256:64000:18:24:n:lpJSHOqQVBrcsWRri8THNW1DH769ITfe:RjG6xiH7OEbzAAhZOJWDsoXw', '2021-05-02 15:28:53.553', '2021-05-02 15:28:53.553', NULL);
INSERT INTO `user_identity` VALUES (15, 13, 'USERNAME_PASSWORD', 'sysadmin', 'pbkdf2sha256:64000:18:24:n:XXpG/MH3oWfHTtnCb+nVcfPLzQ/USIMk:z6NYwlMODo93q7GorToL2ynP', '2022-03-22 23:28:56.747', '2022-03-22 23:28:56.747', NULL);
INSERT INTO `user_identity` VALUES (16, 14, 'USERNAME_PASSWORD', 'hr3', 'pbkdf2sha256:64000:18:24:n:0rKlUgVcn4nEXF6FspoLKjXd6vb8nqEx:gIwi1HAjbAyPuN+lzZLx4C0z', '2022-04-25 23:06:05.024', '2022-04-25 23:06:05.024', NULL);
INSERT INTO `user_identity` VALUES (17, 15, 'USERNAME_PASSWORD', 'hr3', 'pbkdf2sha256:64000:18:24:n:IjpclmIpe29rlvCnwXP6acKDsCfTnKJA:ze33GDyVWIDh6VuXg0yimjTU', '2022-04-25 23:24:54.200', '2022-04-25 23:26:34.027', '2022-04-25 23:26:34.000');
INSERT INTO `user_identity` VALUES (18, 16, 'USERNAME_PASSWORD', 'hr3', 'pbkdf2sha256:64000:18:24:n:Dox3HV4NgSZUMnAyjjhOGvVBKkABBJ/1:6YfhM7CiaGRyfuU/Ie2dQWz6', '2022-04-25 23:28:05.944', '2022-04-25 23:28:05.944', NULL);
INSERT INTO `user_identity` VALUES (19, 17, 'USERNAME_PASSWORD', 'hr4', 'pbkdf2sha256:64000:18:24:n:UHYxmClWE07P+RjH6gYdAnJoCuep2vIT:VFdmxiBmDB15g0UoWyzFeSch', '2022-04-25 23:29:43.836', '2022-04-25 23:29:43.836', NULL);

SET FOREIGN_KEY_CHECKS = 1;



DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
    `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
    `content` varchar(255) NOT NULL DEFAULT 0 COMMENT '消息的内容',
    `send_id` varchar(255) NOT NULL DEFAULT 0 COMMENT '发送者id',
    `recv_id` varchar(255) NOT NULL DEFAULT 0 COMMENT '接收者id',
    `self` varchar(255) NOT NULL DEFAULT 0 COMMENT '发送信息者的数据',
    `target` varchar(255) NOT NULL DEFAULT 0 COMMENT '接收信息者的数据',
    `timestamp` varchar(255) NOT NULL DEFAULT 0 COMMENT '发送信息的时间',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

insert into `chat` values(1,'您好，我非常喜欢贵公司，有信心能够胜任这个职位，期待您的回复。','17','4','{"name":"刘同学"}','{"name":"陈经理","icon":"img/94bf413e-7176-4713-bc08-fbfa44ac0f11.ae979d52.png"}','2022/10/4 17:35:11')
