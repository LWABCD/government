/*
 Navicat Premium Data Transfer

 Source Server         : 3
 Source Server Type    : MySQL
 Source Server Version : 50536
 Source Host           : localhost:3306
 Source Schema         : governmentwebsite

 Target Server Type    : MySQL
 Target Server Version : 50536
 File Encoding         : 65001

 Date: 08/04/2020 00:25:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `contenturl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL,
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `updatetime` datetime NULL DEFAULT NULL,
  `readnumber` int(10) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  PRIMARY KEY (`aid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES (14, 'text//f0d9aeb4-9461-47b5-993e-49a3902b259b.txt', '2020-02-03 01:11:54', '宜宾市退役军人事务局', '2020-02-03 00:53:19', 0, '宜宾市退役军人事务局关于市退役军人咨询服务大厅暂停接访的公告');
INSERT INTO `announcement` VALUES (15, 'text//63843039-94de-4147-bd6a-d4711b48b3e3.txt', '2020-02-03 01:11:59', '宜宾市人力资源社会保障局', '2020-02-03 00:59:36', 0, '关于疫情防控期间暂停职业技能鉴定相关工作的通知');
INSERT INTO `announcement` VALUES (16, 'text//7f2e2dac-024d-45dc-af68-993d8208b3ee.txt', '2020-02-03 01:12:02', '宜宾市政务服务和数字化管理局', '2020-02-03 01:00:05', 0, '宜宾市政务服务和数字化管理局 关于暂停公共资源交易活动的公告');
INSERT INTO `announcement` VALUES (25, 'text//73a9a26d-0835-4ed6-84bc-096b214fbdfb.txt', '2020-03-31 17:18:07', '123', '2020-03-31 17:18:07', 3, '123');
INSERT INTO `announcement` VALUES (28, 'text//3cf8852f-8bab-4f9e-8ef9-b555dda7a48d.txt', NULL, '测试修改', '2020-04-06 16:55:09', 0, '网站公告测试修改');

-- ----------------------------
-- Table structure for conveniencephone
-- ----------------------------
DROP TABLE IF EXISTS `conveniencephone`;
CREATE TABLE `conveniencephone`  (
  `cid` int(11) NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for emailreply
-- ----------------------------
DROP TABLE IF EXISTS `emailreply`;
CREATE TABLE `emailreply`  (
  `lerid` int(10) NOT NULL AUTO_INCREMENT,
  `replycontent` longtext CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL,
  `replytime` datetime NULL DEFAULT NULL,
  `leid` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`lerid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of emailreply
-- ----------------------------
INSERT INTO `emailreply` VALUES (11, '尊敬的市民朋友：您好，关于您的建议现回复如下：翠屏区民政局婚姻登记处2020年2月2日实行预约登记，当日登记受理时间为上午9：00－12：00。请于2020年1月23日（春节放假）之前进行预约，另请您提前准备好结婚登记所需证件资料，咨询预约电话0831-8356101。 宜宾市翠屏区民政局 2020年1月16日', '2020-01-29 22:47:07', 1);
INSERT INTO `emailreply` VALUES (12, '尊敬的市民朋友：　　您好！　　你所反映的问题已收悉，我们高度重视，现回复如下：　　智轨走向目前由市上牵头进行规划设计，目前暂未获得明确设计方案的批复。待我局获得正式线路后及时向南溪人民公布。　　感谢您对市自然资源规划局南溪区分局工作的关心和支持，谢谢！', '2020-01-30 00:00:53', 2);
INSERT INTO `emailreply` VALUES (13, NULL, '2020-03-27 14:31:55', NULL);
INSERT INTO `emailreply` VALUES (14, NULL, '2020-03-27 14:37:14', NULL);
INSERT INTO `emailreply` VALUES (15, 'a', '2020-03-27 16:07:17', 4);
INSERT INTO `emailreply` VALUES (16, '', '2020-04-06 17:32:45', 8);

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS `file`;
CREATE TABLE `file`  (
  `fid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `createtime` date NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  PRIMARY KEY (`fid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of file
-- ----------------------------
INSERT INTO `file` VALUES (5, '人口统计表', '2020-01-28', '列出了当地所有人口', 'localhost:8080/governmentfile/file/people.xls');
INSERT INTO `file` VALUES (10, 'word文档', '2020-02-02', 'word文档', 'localhost:8080/governmentfile/file/面向对象.docx');
INSERT INTO `file` VALUES (11, '图片', '2020-02-02', '图片', 'localhost:8080/governmentfile/file/233be503-faba-46ac-8f63-eec84a3904ca.jpg');
INSERT INTO `file` VALUES (12, 'word文档', '2020-04-01', 'word文档1', 'localhost:8080/governmentfile/file/object.docx');
INSERT INTO `file` VALUES (18, 'word文档', '2020-04-05', 'word文档', 'localhost:8080/governmentfile/file/1dafd0f1-0a9e-4a91-b60a-5c632cf464e1.jpg');
INSERT INTO `file` VALUES (19, '文件测试', '2020-04-06', '文件测试', 'localhost:8080/governmentfile/file/45956ff5-7925-4879-a2db-d577f7012330.jpg');

-- ----------------------------
-- Table structure for governmentwebsite
-- ----------------------------
DROP TABLE IF EXISTS `governmentwebsite`;
CREATE TABLE `governmentwebsite`  (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  PRIMARY KEY (`gid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of governmentwebsite
-- ----------------------------
INSERT INTO `governmentwebsite` VALUES (1, '百度', 'http://www.baidu.com');
INSERT INTO `governmentwebsite` VALUES (2, 'CSDN', 'https://blog.csdn.net');
INSERT INTO `governmentwebsite` VALUES (3, '智联招聘', 'https://www.zhaopin.com/');

-- ----------------------------
-- Table structure for leaderemail
-- ----------------------------
DROP TABLE IF EXISTS `leaderemail`;
CREATE TABLE `leaderemail`  (
  `leid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `phone` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL,
  `sendtime` datetime NULL DEFAULT NULL,
  `status` int(5) NULL DEFAULT NULL,
  PRIMARY KEY (`leid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of leaderemail
-- ----------------------------
INSERT INTO `leaderemail` VALUES (1, '张三', '510322200904091234', '12345678904', '1234567894@qq.com', '自贡市富顺县', '关于对结婚登记时间的建议', '尊敬的宜宾市政府工作领导：      您好，感谢恁百忙之中抽空审阅我的建议，我是一个在山区工作的公职人员，福星高照于两年前喜得一恋人，但因工作原因两人异地相恋，因为职业特殊，长期是处于两地工作，四地分居情况。承蒙不弃我与女朋友至今已到谈婚论嫁之年，但苦于工作原因见面时间不多，更没有机会选取到合适的日子。偶然听闻白岩松同志在央视新闻官方抖音上建议地方各级民政部门在千年难遇的对称日（2020年02月02日、当天为周日）开放婚姻登记窗口，更有武汉、成都等城市已率先表明在当日民政部门正常上班，特呈请宜宾市翠屏区民政局于2020年02月02日劳累为广大新人办理登记手续，恳请成全。    万分感谢！\r\n尊敬的宜宾市政府工作领导：      您好，感谢恁百忙之中抽空审阅我的建议，我是一个在山区工作的公职人员，福星高照于两年前喜得一恋人，但因工作原因两人异地相恋，因为职业特殊，长期是处于两地工作，四地分居情况。承蒙不弃我与女朋友至今已到谈婚论嫁之年，但苦于工作原因见面时间不多，更没有机会选取到合适的日子。偶然听闻白岩松同志在央视新闻官方抖音上建议地方各级民政部门在千年难遇的对称日（2020年02月02日、当天为周日）开放婚姻登记窗口，更有武汉、成都等城市已率先表明在当日民政部门正常上班，特呈请宜宾市翠屏区民政局于2020年02月02日劳累为广大新人办理登记手续，恳请成全。    万分感谢！\r\n', '2020-01-04 16:40:57', 1);
INSERT INTO `leaderemail` VALUES (2, '王五', '510322200904091235', '12345678905', '1234567895@qq.com', '自贡市富顺县', '宜宾智轨T4线具体设站', '我是一个家住南岸在南溪上班的人，乘坐城际公交十分不便，昨晚在手机上看到智轨T4线改为智轨产业园站到南溪区政府站这是真的吗？南溪人民和我们在南溪工作但家住市区的人对这条线很期待谢谢', '2020-01-05 23:59:43', 1);
INSERT INTO `leaderemail` VALUES (3, 'abc', '510322199707207714', '12345678903', '1@126.com', 'abc', 'abc', 'abc', NULL, NULL);
INSERT INTO `leaderemail` VALUES (4, 'a', '510322199707207714', '12345678903', '1@126.com', 'a', 'a', 'abc', '2020-03-27 15:31:02', 1);
INSERT INTO `leaderemail` VALUES (5, 'a', '510322199707207714', '12345678903', '1@126.com', 'a', 'a', 'abc', '2020-03-27 15:31:02', 0);
INSERT INTO `leaderemail` VALUES (6, 'a', '510322199707207714', '12345678903', '1@126.com', 'a', 'a', 'a', '2020-03-27 15:32:43', 0);
INSERT INTO `leaderemail` VALUES (7, 'a', '510322199707207714', '12345678903', '1@123.com', '1', '1', '1', '2020-03-27 15:34:08', 0);
INSERT INTO `leaderemail` VALUES (8, 'a', '510322199707207714', '11111111111', '1@126.com', '1', '1', '1', '2020-03-27 15:36:31', 1);

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `mid` int(11) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `createtime` datetime NULL DEFAULT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`mid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL,
  `createtime` datetime NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `updatetime` datetime NULL DEFAULT NULL,
  `origin` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `readnumber` int(40) NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '1月29日，四川省应对新型冠状病毒感染肺炎疫情应急指挥部第三次会议以电视电话会议形式召开，市委副书记、市长杜紫平，市委副书记黄河在宜宾分会场出席会议。\r\n\r\n会议结束后，杜紫平赓即结合省上要求，对全市当前疫情防控工作进行再安排再部署，要求坚决打赢疫情防控这场阻击战、攻坚战、歼灭战。\r\n\r\n杜紫平强调，在市委、市政府的领导下，全市疫情防控工作有力有序推进，但疫情防控的形势依然严峻。要进一步提高政治站位，坚定把思想和行动统一到中省市的部署要求上来，全力以赴抓好各项防控工作，确保部署落实到位。要进一步加强摸底排查，精准掌握近期从疫情高发地区来宜人员，包括来宜途中密切接触的人员，切实做到人人见面、个个筛查、居家隔离，若发现异常情况早报告、早诊断、早治疗;要在交通要道、重点场所开展体温筛查、卫生检疫，对发现的可疑发热病例，严格采取隔离观察措施，确保风险管控到位。要进一步加大宣传力度，充分利用传统媒体、新媒体载体和社会宣传方式，实行最全面的宣传教育，做到家喻户晓、人人皆知，动员全社会积极支持参与疫情防控。要进一步强化督查督办，督促各区县、乡镇(街道)严格落实属地管理责任，切实做到守土有责、守土负责、守土尽责，牢牢把握疫情防控主动权，坚决打好疫情防控这场硬仗，切实保护人民群众生命健康安全。\r\n\r\n市领导赵浩宇、李静、王力平、孙小川、张琦出席。(记者  王宇)', '2020-01-03 19:44:50', '杜紫平对全市疫情防控工作再安排再部署', '2020-01-03 19:45:00', '宜宾日报', 0, 'http://localhost:8080/governmentfile/file/1896454c-977a-44aa-868f-c79c2defca66.jpg,http://localhost:8080/governmentfile/file/500b35dc-9ffc-4d28-9313-ce45a6f02fc7.jpg,http://localhost:8080/governmentfile/file/ccc2a2ce-6a74-4490-bebe-8709de8ada5b.jpg');
INSERT INTO `news` VALUES (2, '1月30日，全市应对新型冠状病毒感染肺炎疫情应急指挥部工作调度会召开。市委副书记、市长杜紫平主持会议并讲话，市委副书记黄河出席会议。\n\n会议以电视电话会议形式召开，会议贯彻全省应对新型冠状病毒感染肺炎疫情应急指挥部工作会议精神，听取全市各区县疫情防控工作推进情况汇报，分析研判全市防控形势，安排部署近期防控工作。\n\n杜紫平强调，要坚定信心不放松，坚决打赢疫情防控阻击战。要在继续落实前期各项工作部署的基础上，进一步提高思想认识，把这次疫情防控工作作为重大政治任务、当前最重要的工作和头等大事来抓，以更高的政治站位、更坚决的态度、更有力的举措，抓牢抓实疫情防控各项工作。\n\n杜紫平强调，要严查严管不放松，坚决落实防控措施。要突出重点管控，采取主动搜索、上门走访、电话联系、群众反映、大数据排查等方式进行全覆盖、拉网式排查，切实做到人人见面、个个筛查，决不允许漏掉一个人;要加强面上管控，进一步强化火车站、客运站、交通要道等重点场所的防控工作，加强村镇、社区、小区、人员密集场所管理管控，暂停各类群体性活动，减少人员流动，严防疫情扩散。要做好数据收集汇总分析，坚决落实好疫情日报告、零报告制度，坚决杜绝晚报瞒报漏报。\n\n杜紫平强调，要全力救治不放松，坚决确保人民群众生命安全。各区县和相关部门单位要按照“集中患者、集中专家、集中资源、集中救治”原则，加强组织协调，统筹辖区内医疗资源，安排最强有力的医疗力量和医疗机构进行医疗救治，最大限度避免出现死亡病例;对确诊病例密切接触者要严格实行医学隔离观察，坚决防止二代病例产生。要强化防控物资统筹保障，多渠道采购各种急需物资，加大储备力度。特别是要加强医疗机构防护设备配置，对医务人员实行最周密的安全防护措施，落实好参与排查人员的防护措施，全力保障医护人员和参与排查人员的生命健康安全。\n\n杜紫平强调，要宣传引导不放松，坚决构筑群防群治的严密防线。要全力做好疫情防控的宣传教育和舆情引导工作，切实构筑人人参与、人人有责、联防联控、群防群治的严密防线。要坚持实事求是、公开透明的原则，依法依规通报疫情态势，依法查处发布虚假信息者和恶意造谣者，并及时向社会澄清真相，回应社会关切，消除恐慌情绪，增强社会信心。要强化物资供应，对生活必需的蔬菜、粮油等物资进行调度安排，切实保障群众正常生活需求;要强化科学防范，引导群众科学认识疫情、理性防范疫情，坚决禁止擅自拦路等影响社会秩序的行为。\n\n杜紫平强调，要落实责任不放松，坚决强化执纪问责。各级各部门要建立疫情防控工作考核机制，把疫情防控工作作为对领导班子和领导干部综合考核评价的重要内容，切实把责任落实到具体工作中。要加强对防控工作的督查和暗访，对责任落实不到位等情况，要从严问责、从严处理。\n\n市领导赵浩宇、李静、王力平、孙小川、张琦出席会议。(记者 王宇)', '2020-03-08 21:43:23', '杜紫平在全市应对新型冠状病毒感染肺炎疫情应急指挥部工作调度会上强调', '2020-03-26 20:02:28', '宜宾日报', 1, 'http://localhost:8080/governmentfile/file/1896454c-977a-44aa-868f-c79c2defca66.jpg,http://localhost:8080/governmentfile/file/500b35dc-9ffc-4d28-9313-ce45a6f02fc7.jpg,http://localhost:8080/governmentfile/file/ccc2a2ce-6a74-4490-bebe-8709de8ada5b.jpg');
INSERT INTO `news` VALUES (5, '123', '2020-03-08 21:46:28', '123', '2020-03-08 21:46:33', '123', 0, 'http://localhost:8080/governmentfile/file/1896454c-977a-44aa-868f-c79c2defca66.jpg,http://localhost:8080/governmentfile/file/500b35dc-9ffc-4d28-9313-ce45a6f02fc7.jpg,http://localhost:8080/governmentfile/file/ccc2a2ce-6a74-4490-bebe-8709de8ada5b.jpg');
INSERT INTO `news` VALUES (6, '123', '2020-03-08 21:47:18', '123', '2020-03-08 21:47:23', '123', 0, 'http://localhost:8080/governmentfile/file/1896454c-977a-44aa-868f-c79c2defca66.jpg,http://localhost:8080/governmentfile/file/500b35dc-9ffc-4d28-9313-ce45a6f02fc7.jpg,http://localhost:8080/governmentfile/file/ccc2a2ce-6a74-4490-bebe-8709de8ada5b.jpg');
INSERT INTO `news` VALUES (7, '123', '2020-03-08 21:47:40', '123', '2020-03-08 21:47:45', '123', 0, 'http://localhost:8080/governmentfile/file/1896454c-977a-44aa-868f-c79c2defca66.jpg,http://localhost:8080/governmentfile/file/500b35dc-9ffc-4d28-9313-ce45a6f02fc7.jpg,http://localhost:8080/governmentfile/file/ccc2a2ce-6a74-4490-bebe-8709de8ada5b.jpg');
INSERT INTO `news` VALUES (8, '123', '2020-03-08 21:48:02', '123', '2020-03-08 21:48:08', '123', 0, 'http://localhost:8080/governmentfile/file/1896454c-977a-44aa-868f-c79c2defca66.jpg,http://localhost:8080/governmentfile/file/500b35dc-9ffc-4d28-9313-ce45a6f02fc7.jpg,http://localhost:8080/governmentfile/file/ccc2a2ce-6a74-4490-bebe-8709de8ada5b.jpg');
INSERT INTO `news` VALUES (3, '123', '2020-03-08 21:45:41', '123', '2020-03-08 21:45:47', '123', 0, 'http://localhost:8080/governmentfile/file/1896454c-977a-44aa-868f-c79c2defca66.jpg,http://localhost:8080/governmentfile/file/500b35dc-9ffc-4d28-9313-ce45a6f02fc7.jpg,http://localhost:8080/governmentfile/file/ccc2a2ce-6a74-4490-bebe-8709de8ada5b.jpg');
INSERT INTO `news` VALUES (4, '123', '2020-03-08 21:46:07', '123', '2020-03-08 21:46:13', '123', 0, 'http://localhost:8080/governmentfile/file/1896454c-977a-44aa-868f-c79c2defca66.jpg,http://localhost:8080/governmentfile/file/500b35dc-9ffc-4d28-9313-ce45a6f02fc7.jpg,http://localhost:8080/governmentfile/file/ccc2a2ce-6a74-4490-bebe-8709de8ada5b.jpg');

-- ----------------------------
-- Table structure for opengovernment
-- ----------------------------
DROP TABLE IF EXISTS `opengovernment`;
CREATE TABLE `opengovernment`  (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL,
  `createtime` datetime NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `readnumber` int(10) NULL DEFAULT NULL,
  `updatetime` datetime NULL DEFAULT NULL,
  `ogtid` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`oid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of opengovernment
-- ----------------------------
INSERT INTO `opengovernment` VALUES (1, '全市各级政协组织、政协各参加单位、广大政协委员，政协机关全体干部职工:\n\n自出现新型冠状病毒感染的肺炎疫情以来，党中央、国务院高度重视，习近平总书记对疫情防控工作作出重要指示，省上全面启动重大突发公共卫生事件一级响应，市委、市政府成立了应对疫情工作领导小组。为深入贯彻落实党中央、省委、市委决策部署，助力全市打赢新型冠状病毒肺炎疫情防控阻击战，现倡议如下:\n\n一、高度重视，带头作为\n\n全市各级政协组织、政协各参加单位和广大政协委员、政协机关干部职工要切实提高政治站位，自觉把思想和行动统一到习近平总书记关于疫情防控的重要指示精神上来，把做好疫情防控工作作为重大政治任务，全力配合党委、政府工作，在党委、政府统一指挥下有序参与疫情防控工作，全力配合做好人员流动管控、返乡人员摸排、各类市场管理、物资商品供应、突发事件处置等工作。要以身作则重视疫情防控，主动带头并动员亲友不聚会、不聚餐，加强自我防护，勤洗手、勤消毒，减少不必要的外出活动，出门佩戴口罩，如出现发热、干咳等不适症状时及时就诊。\n\n二、建言资政，凝聚共识\n\n各级政协组织、广大政协委员要发挥好智力密集、联系广泛的优势，在物资筹集、医卫惠民、疫情处置、联防联控等方面，通过政协平台、所在单位、行业协会等途径积极发声，围绕疫情防控积极建言献策，为打赢疫情阻击战提供及时准确的信息参考。要全力做好释疑解惑、化解矛盾、理顺情绪、增进共识工作，动员社会各界和海内外同胞用真情义举支持防疫攻坚战，结合实际帮助组织急需防疫器械和各类物资，为医疗战线和广大人民群众提供各种形式的帮助，从各个渠道释放正能量，凝聚万众一心抗击疫情正能量，增强全社会战胜疫情的必胜信心。\n\n三、加大宣传，加强引导\n\n全市各级政协组织、政协各参加单位和广大政协委员、政协机关干部职工要充分利用新闻媒体、微信公众号、网站、微信群等深入宣传中央、省、市关于疫情防控的部署要求及工作动态，大力普及疫情防控知识，提高群众防控知识水平。要加强正面引导，着力营造坚决打赢疫情防控硬仗的良好舆论环境，坚决与谣言和不实宣传作斗争。\n\n四、严守纪律，强化担当\n\n各级政协组织、政协各参加单位要严守工作纪律，认真落实值班、带班制度，严格按规定程序和时限报告值班情况。各级政协组织、政协各参加单位以及广大政协委员、政协机关干部职工要保持24小时通讯畅通，确保信息沟通联络及时全面准确。要强化责任担当，在党委、政府和组织需要的时候，务必响应号召，吃苦在前、冲锋在前、负责在前，充分展示新时代政协人的精神风貌。\n\n当前，是疫情防控的关键时期!让我们携起手来，坚定团结在以习近平同志为核心的党中央周围，按照市委、市政府的周密部署，团结一心、众志成城，与全市人民一道共同打赢这场疫情防控阻击战!', NULL, '政协宜宾市委员会关于助力打赢新型冠状病毒肺炎疫情防控阻击战的倡议书', '宜宾日报', 1, '2020-01-30 16:42:18', 1);
INSERT INTO `opengovernment` VALUES (13, '1月16日，市政府新闻办召开新闻发布会，通报全市“春雷行动2020”暨知识产权保护执法行动情况。\r\n\r\n“春雷行动”是四川省市场监管系统在每年元旦、春节和“两会”期间组织开展的为期100天的专项执法行动，今年已经是第八个年头。目的是集中力量打歼灭战，整治扰乱市场秩序的突出问题，保障节日市场稳定，维护消费者的合法权益。之所以选在元旦春节期间开展“春雷行动”，是因为此时节日消费进入旺季，市场主体高度活跃，同时也是春耕生产备耕的关键时期，各种违法行为易发高发，直接影响到群众消费安全和生产、生活安全。\r\n\r\n今年“春雷行动”时间为 2019年12月16日至2020年3月31日。自2019年12月16日省、市、县同步启动“春雷行动2020”以来，全市市场监管系统以“重拳出击治乱象，凝心聚力护民生”为行动主题，在全省统一部署的基础上，在宜宾范围内集中统一开展“知识产权保护”“食品经营安全”“药品安全放心”“价格减负惠民”“油品治理保蓝天”5个执法专项行动。\r\n\r\n截至2020年1月6日，全市系统共出动执法人员2338人（次），检查各类经营企业和个体户2169余户，检查商场、超市及集贸市场等各类市场396个、学校食堂222个，整治重点区域140处、网店、网站159个（次）、网店经营者65个（次），责令整改网站19个（次），捣毁制假售假窝点1个，受理消费者申诉举报690次，为消费者挽回经济损失44.3万余元，开展行政指导、行政约谈33次，开展协作执法39次，发布消费警示、提示15条，办理行政处罚案件154件，涉案总金额为93.08万元，罚没款17.27万元。\r\n\r\n接下来，全市各级市场监管部门将持续保持对市场乱象的高压严打态势，加大监管执法力度，强力整治市场乱象，严厉打击侵犯知识产权、食品违禁添加、价格违法等行为，坚决查处直接涉及公共安全和危害人民生命健康的各类违法经营行为，坚决打击各类经销假冒伪劣商品经营行为，切实解决群众的操心事、烦心事、揪心事，不断增强群众的获得感、幸福感和安全感。通过查处一批违法行为，规范一批市场主体，曝光一批典型案例，震慑一批不法经营者，切实维护良好的市场秩序，确保“春节”“两会”期间安全。（记者 陈忆）', '2020-01-03 17:29:59', '宜宾通报“春雷行动”暨知识产权保护执法行动情况', '宜宾新闻网', 0, '2020-01-03 17:30:05', 3);
INSERT INTO `opengovernment` VALUES (10, '全市文明委各成员单位，各级文明单位、文明村镇、文明校园、文明家庭，广大市民朋友们:\r\n\r\n面对新型冠状病毒感染肺炎疫情加快蔓延的严重形势，党中央、国务院作出重要部署，紧紧依靠人民群众坚决打赢疫情防控阻击战。为切实保障人民群众身体健康和生命安全，群策群力打赢疫情防控阻击战，宜宾市精神文明建设办公室特发出如下倡议:\r\n\r\n一、服务社会，做疫情防控的宣传员。带头落实党中央、国务院和省、市关于防控疫情的工作部署，主动学习防疫知识，增强自我防范意识，积极关注疫情动态，带头不信谣、不传谣、不恐慌，不散布虚假信息，敢于纠正制止谣言，做正面宣传的先锋，做疫情防护的宣传员，共同营造和谐稳定的社会秩序。\r\n\r\n二、担当作为，做疫情防控的践行者。随时关注家人及同事的健康状况，主动劝导、督促家庭成员和单位同事不聚会、少出门、戴口罩、勤洗手、不随地吐痰、拒绝野味;落实好疫情防控有关规定，发现疫情主动报告、主动隔离、主动就诊，筑牢疫情防控的第一防线。\r\n\r\n三、从我做起，做疫情防控的带头人。立足岗位，带头遵守当地党委政府关于疫情防控的各项规定。在岗期间一律戴口罩，见面不握手，尽量网上办公，保持电话微信沟通。配合村(社区)摸排工作，落实群防群控措施，提高防护警惕，有事及时向镇(街道)、村(社区)报告。\r\n\r\n新型冠状病毒感染肺炎可防可控，不必惊慌，只要做好防护措施，定会战胜疫情。感谢您为宜宾市创建全国文明城市，为防控新型冠状病毒感染的肺炎疫情所做出的努力和贡献!\r\n\r\n祝大家春节愉快、阖家欢乐!', '2020-01-03 17:24:17', '宜宾市防范新型冠状病毒感染肺炎疫情防控工作倡议书', '宜宾日报', 0, '2020-01-03 17:24:23', 1);
INSERT INTO `opengovernment` VALUES (11, '全市各级各类志愿服务组织、广大志愿者朋友们:\r\n\r\n当前，新型冠状病毒感染肺炎疫情防控工作正处于关键时期。以习近平同志为核心的党中央对疫情防控作出超强部署，发出坚决打赢疫情防控阻击战的战斗号令，各地各部门协调联动，社会各界齐心协力，正在形成打赢疫情防控阻击战的强大合力。值此关键时刻，宜宾市志愿服务联合会号召广大志愿服务组织和志愿者立即行动起来，按照市委市政府统一部署，用实际行动为疫情防控做出积极贡献。\r\n\r\n一、当好理性对待的宣传员。  全市各级各类志愿服务组织和广大志愿者，要通过微信朋友圈、微信群、QQ群等转发各级党委政府的有关决策部署和卫生健康等主管部门发布的与抗击疫情有关的信息，引导市民群众科学有序应对疫情，不信谣、不传谣，对散播谣言造成群众恐慌等违法违规行为予以坚决抵制和纠正，对疑似病例和相关情况及时向有关部门报告，积极做好疫情防控的监督工作。\r\n\r\n二、当好科学防控的监督员。广大志愿者要带头遵守市委市政府关于疫情防控的各项规定，及时劝导亲属、朋友和身边群众不串门、不集会、不聚餐，积极搞好公共卫生、室内卫生和个人卫生，做好个人防护。不捕杀、贩卖、购买、加工、食用野生动物，遇到特殊情况在第一时间向有关部门报告，为身边亲友作出良好示范。\r\n\r\n三、当好发挥专长的服务员。鼓励有医学专业知识、心理援助和应急救援等技能的志愿者发挥特长，按照有关部门的统一安排，积极投入到联防联控、群防群治、卫生防疫、心理援助、市场监督、舆情控制、应急救援、物资筹集等志愿服务中去，配合做好排查隐患、化解矛盾、协助处置突发事件等工作。\r\n\r\n全市各级各类志愿服务组织和广大志愿者要在市委市政府的统一指挥下，有序参与疫情防控工作，带动千家万户坚定信心、同舟共济、一起行动，为坚决打赢疫情防控阻击战、夺取防控斗争胜利贡献宜宾志愿力量!', '2020-01-03 17:25:31', '致全市志愿服务组织和志愿者的一封公开信', '宜宾日报', 0, '2020-01-03 17:25:34', 1);
INSERT INTO `opengovernment` VALUES (12, '为贯彻落实《四川省人民政府办公厅关于印发四川省职业技能提升行动实施方案（2019—2021年）的通知》（川办发〔2019〕55号）精神，结合我市实际，制定本方案。\r\n\r\n一、总体要求和目标任务\r\n\r\n（一）总体要求。以习近平新时代中国特色社会主义思想为指导，深入贯彻党的十九大和习近平总书记视察四川系列重要讲话精神，实施就业优先战略，把职业技能培训作为提升劳动者就业创业能力和缓解结构性就业矛盾的重要举措，作为经济转型升级和高质量发展的重要支撑，坚持需求导向，聚焦全市“8+2”新兴产业发展，大力推行终身职业技能培训制度，按照“应培尽培、愿培尽培”原则，面向有意愿的全体城乡劳动者大规模开展职业技能培训，加快建设知识型、技能型、创新型劳动者大军，为宜宾加快建成全省经济副中心提供有力的技能人才支撑。\r\n\r\n（二）目标任务。2019年至2021年，持续开展职业技能提升行动，提高培训针对性实效性，全面提升劳动者职业技能水平和就业创业能力，三年共开展各类补贴性职业技能培训10万人次以上，其中2019年培训3.6万人次以上。到2021年底，力争技能劳动者占就业人员总量的比例达到25%以上，高技能人才占技能劳动者的比例达到30%以上。\r\n\r\n二、明确重点分类施训，着力提升职业技能培训针对性\r\n\r\n（三）加强企业职工技能提升和转岗转业培训。助力“8+2”新兴产业发展，组织人工智能、电子信息、装备制造、食品饮料、先进材料、能源化工、数字经济等重点产业在职职工参加岗位技能提升培训。适应新兴产业培育壮大，支持开展人工智能、新能源汽车、现代物流、电子商务、养老健康、医疗卫生等新兴产业急需紧缺技能人才培训。在煤炭、非煤矿山等行业开展化解过剩产能企业分流职工职业培训。全面推行企业新型学徒制和现代学徒制培训，3年至少培训1万学徒，深化校企合作、产教融合，不断提高企业后备技能人才培养质量。实施高危行业领域安全技能提升行动计划，严格执行从业人员安全技能培训合格后上岗制度和国家职业资格准入制度，切实提高企业职工安全生产意识和技能。到2021年，使企业技能岗位有培训意愿的职工参加1次以上培训并力争提升1个技能等级。（责任单位：市人力资源社会保障局、市发展改革委、市教育体育局、市工业军民融合局、市财政局、市商务局、市应急管理局、市国资委、市总工会。列首位的为牵头单位，下同）\r\n\r\n（四）加强重点群体就业技能培训和创业培训。围绕促进农村转移就业劳动者特别是新生代农民工、返乡农民工、高校学生特别是毕业年度高校毕业生、城镇登记失业人员、城乡未继续升学初高中毕业生（以下称“两后生”）、退役军人等重点群体就业创业，大力实施政府补贴性培训或免费培训。针对农村转移就业劳动者，开展农民工“春潮行动”“求学圆梦行动”、新生代农民工职业技能提升计划、返乡创业培训计划和以“酒都阿嫂”“苗家慧嫂”“宜宾燃面”等为代表的劳务品牌培训。针对高校学生、城镇登记失业人员、退役军人，有针对性地开展就业技能培训。针对“两后生”，开展劳动预备培训。围绕乡村振兴战略，实施新型职业农民培育工程和农村实用人才带头人素质提升计划，开展职业农民技能培训。对有创业愿望的开展创业培训，加强创业培训项目开发、创业担保贷款、后续扶持等服务。（责任单位：市人力资源社会保障局、市教育体育局、市退役军人局、市商务局、市总工会、团市委、市妇联、市残联）\r\n\r\n（五）加强贫困劳动力技能扶贫力度。面向有培训意愿的建档立卡贫困劳动力、有劳动能力的残疾人等就业困难群体实施技能脱贫培训、残疾人职业技能提升计划，为其提供免费职业技能培训。其中，重点面向贫困区县有培训意愿的贫困劳动力实施技能培训脱贫行动，每年为其提供1次以上以实用技术为主要内容的免费职业技能培训，深入推进技能脱贫“雨露计划”，对接受技工教育或中等职业教育的建档立卡贫困家庭，在中职助学金的基础上，再给予每生每年1000元的生活补助。推动实现“教育培训一人，就业创业一人，增收致富一户”目标。（责任单位：市人力资源社会保障局、市教育体育局、市财政局、市农业农村局、市扶贫开发局、市残联）\r\n\r\n三、健全多元培训体系，不断激发培训主体积极性\r\n\r\n（六）支持企业兴办职业技能培训。支持各类企业特别是规模以上企业，或者吸纳就业人数较多的企业设立职工培训中心，面向本单位职工和城乡劳动者开展职业技能培训，对符合条件的按规定给予职业培训补贴。鼓励企业与职业院校（含技工院校，下同）共建实训中心、教学工厂等，积极建设培育一批产教融合型企业。支持企业设立高技能人才培训基地和技能大师工作室，政府按规定通过就业补助资金根据建设水平及认定层次予以分级补助，企业可通过职工教育经费安排相应的配套资金。支持高危企业集中的地区建设安全生产和技能实训基地，并优先将其纳入定点培训机构，承担政府补贴性培训。（责任单位：市人力资源社会保障局、市工业军民融合局、市发展改革委、市教育体育局、市科技局、市财政局、市国资委、市总工会、市应急管理局）\r\n\r\n（七）支持职业院校稳步扩大培训规模。支持职业院校在其专业设置和培训课程范围内，面向社会开展各类政府补贴性职业技能培训。在核定职业院校绩效工资总量时，应向承担职业技能培训工作的单位倾斜。允许职业院校将一定比例的职业技能培训收入纳入学校公用经费，学校培训工作量可按一定比例折算成全日制学生培养工作量。在院校内部分配时应向承担职业技能培训工作的一线教师倾斜，保障其合理待遇。（责任单位：市人力资源社会保障局、市教育体育局、市财政局）\r\n\r\n（八）支持社会机构开展职业技能培训和评价工作。鼓励行业、企业、社会组织、个人根据产业结构调整方向及市场需求举办民办职业培训机构，鼓励各类人力资源服务机构开展职业技能培训，在开展校企合作、参与项目建设、政府购买服务、就业信息服务等方面，依法享受与公办职业培训机构同等政策支持，支持培训和评价机构建立同业交流平台，促进行业发展，加强行业自律。完善技能人才职业资格评价、职业技能等级认定、专项职业能力考核等多元化评价体系，严格执行国家职业资格目录制度和职业技能考核鉴定机构备案制度，支持符合条件的企业开展职业技能等级认定工作，面向行业协会、职业院校等开展第三方评价机构遴选认定工作，支持各类评价机构按照国家统一部署，参与新业态、新职业的技能标准开发和评价体系建设。落实工程领域高技能人才与工程技术人才职业发展贯通政策，引导用人单位特别是国有企业建立职业培训、技能提升与岗位使用、待遇落实挂钩机制，推动提高技术工人待遇。（责任单位：市人力资源社会保障局、市教育体育局、市财政局）\r\n\r\n（九）创新拓展培训内容。围绕我市经济社会发展开展人工智能产业、战略性新兴产业、现代服务业以及循环农业、智慧农业、智能建筑、智慧城市建设等新产业的职业培训；围绕市场急需紧缺职业开展家政、养老服务、母婴护理、保安、汽修、电工等就业技能培训；围绕乡村振兴战略及美好乡村建设，实施新型职业农民培育工程、农村实用人才带头人素质提升计划和贫困村创业致富带头人培育工程，开展以特色种养殖为主的农村实用技术培训；围绕振兴宜宾传统技艺和传承民俗文化，组织开展竹雕、竹编、纳染等特色手工艺培训；围绕促进创新创业，开展创业培训和创业指导，拓展创业培训范围，将网络创业培训纳入职业培训补贴范围。加强职业技能、通用职业素质和求职能力等综合性培训，将职业道德、职业规范、工匠精神、质量意识、法律意识和相关法律法规、禁毒防艾、安全环保和健康卫生、就业指导等内容贯穿职业技能培训全过程。（责任单位：市人力资源社会保障局、市发展改革委、市工业军民融合局、市教育体育局、市民政局、市农业农村局、市商务局、市文广旅游局、市卫生健康委、市应急管理局、市司法局、市妇联）\r\n\r\n（十）推进基础能力建设。鼓励有条件的区县，通过项目建设、以奖代补等方式，对企业、院校、培训机构的实训设施设备升级改造予以支持。支持各地整合职业教育培训资源建设职业技能公共实训基地，积极面向社会提供职业技能培训服务。在企业、职业院校、职业培训机构大力推广“工学一体化”“互联网+”等先进培训方式，搭建网络学习平台和移动学习平台。加强师资队伍建设，落实职业院校教师企业实践制度，建立健全职业院校教师和企业师傅互派顶岗交流锻炼机制。建立人力资源社会保障部门牵头、相关部门参与的培训数据共享机制，完善培训统计工作，全面推行劳动者职业培训实名制和补贴性培训实名制信息管理，探索建立劳动者职业培训电子档案，实现培训评价信息与就业社保信息联通共享，提供培训就业一体化服务。（责任单位：市人力资源社会保障局、市工业军民融合局、市教育体育局、市财政局、市国资委）\r\n\r\n四、完善培训补贴政策，不断强化政府引导激励\r\n\r\n（十一）落实现有培训补贴政策。对贫困家庭子女、贫困劳动力、“两后生”、农村转移就业劳动者、下岗失业人员、退役军人、残疾人（以下简称“七类人员”）开展免费职业技能培训行动，对高校毕业生和企业职工按规定给予职业培训补贴。对贫困劳动力、就业困难人员、零就业家庭成员、“两后生”中的农村学员和城市低保家庭学员，在培训期间按规定给予每人每天50元（含交通费）的生活费补贴，符合条件的企业职工参加岗前培训、安全技能培训、转岗转业培训或初级工、中级工、高级工、技师、高级技师培训，按规定给予1000—6000元的职业培训补贴。职工参加企业新型学徒制培训的，按规定给予企业每人每年4500元的职业培训补贴，由企业自主用于学徒培训工作。企业、农民专业合作社和扶贫车间等各类生产经营主体吸纳贫困劳动力就业并开展以工代训，以及参保企业吸纳就业困难人员、零就业家庭成员就业并开展以工代训的，按每人每月200元的标准给予最长不超过6个月的职业培训补贴。（责任单位：市人力资源社会保障局、市工业军民融合局、市财政局、市教育体育局、市退役军人局、市应急管理局、市国资委、市妇联）\r\n\r\n（十二）调整完善职业培训补贴政策。符合条件且年满16周岁、具有劳动能力的劳动者在户籍地、常住地、求职就业地参加培训后取得职业资格证书（或职业技能等级证书、专项职业能力证书、特种作业操作证书、培训合格证书等，下同）的，按规定给予职业培训补贴，原则上每人每年可享受不超过3次，但同一职业同一等级不可重复享受，确有培训需求，不具有按月领取养老金资格的人员，可作为培训对象纳入政策范围。鼓励各区县对贫困劳动力、去产能失业人员、退役军人、残疾人等群体开展项目制培训。项目制培训须由区县公共就业服务管理机构按照政府购买服务相关规定通过公开招标或比选，公开、公平、择优确定项目实施单位开展培训。对企业开展培训或者培训机构开展项目制培训的，可按培训补贴总额的50%先行拨付部分资金。（责任单位：市人力资源社会保障局、市工业军民融合局、市财政局、市退役军人局、市残联）\r\n\r\n（十三）加大资金筹集和支持力度。各区县要加大资金支持和筹集整合力度，将地方人才经费和行业产业发展经费中用于职业技能培训的资金，以及一定比例的就业创业补助资金和失业保险基金结余统筹用于职业技能提升行动。本方案中用于企业职工和“七类人员”职业技能培训所需资金原则上全部从失业保险基金结余中列支，其余工作所需资金按规定从就业创业补助资金等统筹列支。各区县拟用于职业技能提升行动的失业保险基金结余在社会保障基金财政专户中单独建立“职业技能提升行动专账”，实行分账核算、专款专用。企业要按规定足额提取和使用职工教育经费，其中60%以上用于一线职工培训，可用于企业“师带徒”津贴补助。落实将企业职工教育经费税前扣除限额提高至工资薪金总额8%的税收政策，推动企业提取职工教育经费开展自主培训与享受政策开展补贴性培训的有机衔接。（责任单位：市人力资源社会保障局、市财政局、市教育体育局、宜宾市税务局、市总工会）\r\n\r\n（十四）强化资金监督管理。具备培训能力的企业和市级定点培训机构（代为申报培训补贴），可按规定开展职业技能提升培训。要依法加强资金监管，定期向社会公开资金使用情况，加强监督检查和专项审计工作。依托四川公共就业创业服务管理信息系统，实施职业培训补贴实名制管理，各区县公共就业服务机构要将所有政府补贴培训的信息和数据全部纳入系统管理，利用大数据手段强化培训监管，加强廉政风险防控，保障资金安全和效益。按照“谁主管、谁负责”的原则，各区县要加强培训补贴资金的属地管理，完善培训补贴申领、审核、公示、拨付制度，切实履行资金使用管理的主体责任。市级相关部门对以虚假培训等套取、骗取资金的依法依纪严惩，对培训工作中出现的失误和问题要视不同情况区别对待，建立容错机制，保护工作落实层面干事担当的积极性。（责任单位：市财政局、市人力资源社会保障局）\r\n\r\n五、加强组织领导，强化保障措施\r\n\r\n（十五）健全工作机制和工作职责。区县政府要把职业技能提升行动作为重要民生工程，切实承担主体责任，抓紧制定实施方案，建立工作情况月报制度，出台政策措施，明确任务目标，进行任务分解，层层压实责任。市人力资源社会保障局承担政策制定、资源整合、培训机构认定（按宜人社办发〔2017〕37号执行）和管理、质量监管等职责。市财政局要确保就业补助资金等及时足额拨付到位，市发展改革委、市教育体育局、市工业军民融合局、市商务局、市农业农村局、市退役军人局、住房城乡建设局、市应急管理局、市国资委、市司法局、市残联等有关部门和单位要按照各自职能做好职业技能培训工作。支持鼓励工会、共青团、妇联等群团组织以及行业协会参与职业技能培训工作，形成工作合力。\r\n\r\n（十六）推进职业技能培训“放管服”改革。对政府补贴性职业技能培训实施目录清单管理，由相关主管部门定期发布本级培训项目目录、培训评价机构目录，方便劳动者按需选择培训。有条件的区县应采取公开招投标等方式购买培训和评价服务。加强对培训机构和培训质量的监管，健全培训绩效评估体系，采取政府购买服务方式，引入第三方机构对培训情况开展评估，促进培训质量提升。\r\n\r\n（十七）推进职业技能培训与评价有机衔接。在国家职业资格制度整体框架下，完善技能人才职业资格评价、职业技能等级认定、专项职业能力考核等多元化评价方式，为劳动者提供便利的培训与评价服务。从事准入类职业的劳动者必须经培训合格后方可上岗。支持企业按规定自主开展职工职业技能等级评价工作。支持各地结合区域经济发展开发专项职业能力考核规范，实施专项职业能力考核。推动工程领域高技能人才与工程技术人才职业发展贯通，鼓励企业建立高技能人才岗位津贴制度和首席技师、特聘技师等技能带头人制度，并发放一定金额的岗位津贴和职务津贴，推动拓展技能人才发展空间，提高技术工人地位待遇。\r\n\r\n（十八）加强政策解读和舆论宣传。各区县、各有关部门要加大政策宣传力度，提升政策公众知晓度，帮助企业、培训机构和劳动者熟悉了解、用足用好政策，共同促进职业技能培训工作开展。大力弘扬和培育工匠精神，落实提高技术工人待遇的政策措施，加强技能人才激励表彰工作，持续打造宜宾职业技能竞赛品牌，广泛开展各级各类职业技能竞赛、岗位练兵、技术比武以及宜宾工匠、技能大师等技能领军人才进院校、进教案、进课堂、进企业、进车间“五进活动”，进一步增强技能人才的职业荣誉感和自豪感，营造劳动光荣的社会风尚和精益求精的敬业风气。\r\n\r\n本实施方案自印发之日起执行，有效期至2021年12月31日，由市人力资源社会保障局负责解释，我市现行的职业技能培训相关政策规定，凡与本方案不一致的，按本方案执行。', '2020-01-03 17:27:21', '宜宾市职业技能提升行动实施方案\r\n\r\n（2019—2021年）', '宜宾市人民政府办公室', 0, '2020-01-03 17:27:25', 2);
INSERT INTO `opengovernment` VALUES (14, '123', '2020-03-28 17:17:44', '123', '123', 0, '2020-03-28 17:17:44', 1);
INSERT INTO `opengovernment` VALUES (15, '123', '2020-03-28 17:17:50', '123', '123', 0, '2020-03-28 17:17:50', 1);
INSERT INTO `opengovernment` VALUES (16, '123', '2020-03-28 17:17:56', '123', '123', 0, '2020-03-28 17:17:56', 1);
INSERT INTO `opengovernment` VALUES (17, '123', '2020-03-28 17:29:03', '123', '123', 0, '2020-03-28 17:29:03', 1);
INSERT INTO `opengovernment` VALUES (18, '123', '2020-03-28 17:29:19', '123', '123', 0, '2020-03-28 17:29:19', 1);
INSERT INTO `opengovernment` VALUES (19, '123', '2020-03-28 17:29:26', '123', '123', 0, '2020-03-28 17:29:26', 1);
INSERT INTO `opengovernment` VALUES (20, '123', '2020-03-28 17:29:30', '123', '123', 0, '2020-03-28 17:29:30', 1);

-- ----------------------------
-- Table structure for opengovtype
-- ----------------------------
DROP TABLE IF EXISTS `opengovtype`;
CREATE TABLE `opengovtype`  (
  `ogtid` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ogtid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of opengovtype
-- ----------------------------
INSERT INTO `opengovtype` VALUES (1, '基本信息公开');
INSERT INTO `opengovtype` VALUES (2, '政府会议公开');
INSERT INTO `opengovtype` VALUES (3, '经济建设');

-- ----------------------------
-- Table structure for regionalsurvey
-- ----------------------------
DROP TABLE IF EXISTS `regionalsurvey`;
CREATE TABLE `regionalsurvey`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log_login
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_login`;
CREATE TABLE `sys_log_login`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `loginip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `logintime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 460 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log_login
-- ----------------------------
INSERT INTO `sys_log_login` VALUES (123, '小明-xm', '0:0:0:0:0:0:0:1', '2019-10-10 19:55:35');
INSERT INTO `sys_log_login` VALUES (124, '落亦-luoyi', '0:0:0:0:0:0:0:1', '2019-10-10 19:55:51');
INSERT INTO `sys_log_login` VALUES (125, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-11 09:24:28');
INSERT INTO `sys_log_login` VALUES (126, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-11 09:25:43');
INSERT INTO `sys_log_login` VALUES (127, '落亦-luoyi', '0:0:0:0:0:0:0:1', '2019-10-11 20:26:00');
INSERT INTO `sys_log_login` VALUES (128, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-12 08:55:40');
INSERT INTO `sys_log_login` VALUES (257, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 10:14:44');
INSERT INTO `sys_log_login` VALUES (258, '旦素一-dansuyi', '0:0:0:0:0:0:0:1', '2019-10-15 10:18:30');
INSERT INTO `sys_log_login` VALUES (259, '落亦-luoyi', '0:0:0:0:0:0:0:1', '2019-10-15 10:19:05');
INSERT INTO `sys_log_login` VALUES (260, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:08:18');
INSERT INTO `sys_log_login` VALUES (261, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:29:01');
INSERT INTO `sys_log_login` VALUES (262, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:30:54');
INSERT INTO `sys_log_login` VALUES (263, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:31:38');
INSERT INTO `sys_log_login` VALUES (264, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:34:08');
INSERT INTO `sys_log_login` VALUES (265, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:35:40');
INSERT INTO `sys_log_login` VALUES (266, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:36:29');
INSERT INTO `sys_log_login` VALUES (267, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:39:55');
INSERT INTO `sys_log_login` VALUES (268, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:40:48');
INSERT INTO `sys_log_login` VALUES (269, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:42:12');
INSERT INTO `sys_log_login` VALUES (270, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:44:14');
INSERT INTO `sys_log_login` VALUES (271, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:44:49');
INSERT INTO `sys_log_login` VALUES (272, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:45:08');
INSERT INTO `sys_log_login` VALUES (273, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:46:51');
INSERT INTO `sys_log_login` VALUES (274, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:47:33');
INSERT INTO `sys_log_login` VALUES (275, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:47:41');
INSERT INTO `sys_log_login` VALUES (276, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:49:13');
INSERT INTO `sys_log_login` VALUES (277, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:50:10');
INSERT INTO `sys_log_login` VALUES (278, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:50:42');
INSERT INTO `sys_log_login` VALUES (279, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:57:14');
INSERT INTO `sys_log_login` VALUES (280, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 14:59:34');
INSERT INTO `sys_log_login` VALUES (281, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:00:37');
INSERT INTO `sys_log_login` VALUES (282, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:01:48');
INSERT INTO `sys_log_login` VALUES (283, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:03:37');
INSERT INTO `sys_log_login` VALUES (284, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:04:23');
INSERT INTO `sys_log_login` VALUES (285, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:04:45');
INSERT INTO `sys_log_login` VALUES (286, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:05:42');
INSERT INTO `sys_log_login` VALUES (287, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:06:11');
INSERT INTO `sys_log_login` VALUES (288, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:06:33');
INSERT INTO `sys_log_login` VALUES (289, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:08:30');
INSERT INTO `sys_log_login` VALUES (290, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:09:07');
INSERT INTO `sys_log_login` VALUES (291, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:11:48');
INSERT INTO `sys_log_login` VALUES (292, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:11:57');
INSERT INTO `sys_log_login` VALUES (293, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:12:07');
INSERT INTO `sys_log_login` VALUES (294, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:14:55');
INSERT INTO `sys_log_login` VALUES (295, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 15:17:10');
INSERT INTO `sys_log_login` VALUES (296, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 20:02:44');
INSERT INTO `sys_log_login` VALUES (297, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 20:17:10');
INSERT INTO `sys_log_login` VALUES (298, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-15 20:18:24');
INSERT INTO `sys_log_login` VALUES (299, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 22:25:28');
INSERT INTO `sys_log_login` VALUES (300, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 22:33:26');
INSERT INTO `sys_log_login` VALUES (301, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 22:35:47');
INSERT INTO `sys_log_login` VALUES (302, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 23:14:56');
INSERT INTO `sys_log_login` VALUES (303, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 23:15:31');
INSERT INTO `sys_log_login` VALUES (304, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 23:15:58');
INSERT INTO `sys_log_login` VALUES (305, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-18 23:16:42');
INSERT INTO `sys_log_login` VALUES (306, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 11:21:31');
INSERT INTO `sys_log_login` VALUES (307, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 11:26:11');
INSERT INTO `sys_log_login` VALUES (308, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 16:59:47');
INSERT INTO `sys_log_login` VALUES (309, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 17:46:27');
INSERT INTO `sys_log_login` VALUES (310, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 17:46:52');
INSERT INTO `sys_log_login` VALUES (311, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 17:54:29');
INSERT INTO `sys_log_login` VALUES (312, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 17:56:04');
INSERT INTO `sys_log_login` VALUES (313, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 18:02:05');
INSERT INTO `sys_log_login` VALUES (314, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 18:03:16');
INSERT INTO `sys_log_login` VALUES (315, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 21:33:50');
INSERT INTO `sys_log_login` VALUES (316, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 21:37:18');
INSERT INTO `sys_log_login` VALUES (317, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 22:11:25');
INSERT INTO `sys_log_login` VALUES (318, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-19 22:17:45');
INSERT INTO `sys_log_login` VALUES (358, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-23 08:46:49');
INSERT INTO `sys_log_login` VALUES (359, '落亦-luoyi', '0:0:0:0:0:0:0:1', '2019-10-23 08:49:31');
INSERT INTO `sys_log_login` VALUES (360, '旧城-jiucheng', '0:0:0:0:0:0:0:1', '2019-10-23 08:50:39');
INSERT INTO `sys_log_login` VALUES (401, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-27 15:24:51');
INSERT INTO `sys_log_login` VALUES (402, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-27 16:49:00');
INSERT INTO `sys_log_login` VALUES (403, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-28 09:40:42');
INSERT INTO `sys_log_login` VALUES (404, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-28 12:38:24');
INSERT INTO `sys_log_login` VALUES (405, '落亦-luoyi', '0:0:0:0:0:0:0:1', '2019-10-28 13:08:47');
INSERT INTO `sys_log_login` VALUES (406, '超级管理员-admin', '0:0:0:0:0:0:0:1', '2019-10-28 14:10:17');
INSERT INTO `sys_log_login` VALUES (407, 'admin', '127.0.0.1', '2020-03-30 22:06:42');
INSERT INTO `sys_log_login` VALUES (408, 'admin', '127.0.0.1', '2020-03-30 22:08:16');
INSERT INTO `sys_log_login` VALUES (409, 'admin', '127.0.0.1', '2020-03-30 22:10:09');
INSERT INTO `sys_log_login` VALUES (410, 'admin', '127.0.0.1', '2020-03-30 22:14:17');
INSERT INTO `sys_log_login` VALUES (411, 'admin', '127.0.0.1', '2020-03-30 22:46:46');
INSERT INTO `sys_log_login` VALUES (414, 'admin', '127.0.0.1', '2020-03-30 23:05:10');
INSERT INTO `sys_log_login` VALUES (415, 'admin', '127.0.0.1', '2020-03-30 23:36:43');
INSERT INTO `sys_log_login` VALUES (416, 'admin', '127.0.0.1', '2020-03-30 23:38:40');
INSERT INTO `sys_log_login` VALUES (417, 'admin', '127.0.0.1', '2020-03-31 00:04:58');
INSERT INTO `sys_log_login` VALUES (418, 'admin', '127.0.0.1', '2020-03-31 09:43:42');
INSERT INTO `sys_log_login` VALUES (420, 'admin', '127.0.0.1', '2020-03-31 14:08:15');
INSERT INTO `sys_log_login` VALUES (421, 'admin', '127.0.0.1', '2020-03-31 15:38:58');
INSERT INTO `sys_log_login` VALUES (422, 'admin', '127.0.0.1', '2020-03-31 15:46:23');
INSERT INTO `sys_log_login` VALUES (423, 'admin', '127.0.0.1', '2020-03-31 16:40:57');
INSERT INTO `sys_log_login` VALUES (424, 'admin', '127.0.0.1', '2020-03-31 16:44:03');
INSERT INTO `sys_log_login` VALUES (425, 'admin', '127.0.0.1', '2020-03-31 16:48:02');
INSERT INTO `sys_log_login` VALUES (426, 'admin', '127.0.0.1', '2020-03-31 16:59:08');
INSERT INTO `sys_log_login` VALUES (427, 'admin', '127.0.0.1', '2020-03-31 17:08:11');
INSERT INTO `sys_log_login` VALUES (428, 'admin', '127.0.0.1', '2020-03-31 17:11:20');
INSERT INTO `sys_log_login` VALUES (429, 'admin', '127.0.0.1', '2020-03-31 17:16:44');
INSERT INTO `sys_log_login` VALUES (430, 'admin', '127.0.0.1', '2020-03-31 17:38:36');
INSERT INTO `sys_log_login` VALUES (431, 'admin', '127.0.0.1', '2020-03-31 21:39:23');
INSERT INTO `sys_log_login` VALUES (432, 'admin', '127.0.0.1', '2020-04-01 10:58:28');
INSERT INTO `sys_log_login` VALUES (433, 'admin', '127.0.0.1', '2020-04-01 13:53:24');
INSERT INTO `sys_log_login` VALUES (434, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 14:36:10');
INSERT INTO `sys_log_login` VALUES (435, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 15:34:00');
INSERT INTO `sys_log_login` VALUES (436, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 16:16:03');
INSERT INTO `sys_log_login` VALUES (437, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 16:23:54');
INSERT INTO `sys_log_login` VALUES (438, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 16:36:32');
INSERT INTO `sys_log_login` VALUES (439, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 22:20:55');
INSERT INTO `sys_log_login` VALUES (440, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 22:38:37');
INSERT INTO `sys_log_login` VALUES (441, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 23:11:15');
INSERT INTO `sys_log_login` VALUES (442, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 23:23:00');
INSERT INTO `sys_log_login` VALUES (443, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 23:27:25');
INSERT INTO `sys_log_login` VALUES (444, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 23:45:32');
INSERT INTO `sys_log_login` VALUES (445, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 23:47:48');
INSERT INTO `sys_log_login` VALUES (446, 'admin', '0:0:0:0:0:0:0:1', '2020-04-01 23:52:16');
INSERT INTO `sys_log_login` VALUES (447, 'admin', '0:0:0:0:0:0:0:1', '2020-04-05 21:43:52');
INSERT INTO `sys_log_login` VALUES (448, 'admin', '0:0:0:0:0:0:0:1', '2020-04-06 16:33:53');
INSERT INTO `sys_log_login` VALUES (449, 'admin', '0:0:0:0:0:0:0:1', '2020-04-06 22:08:52');
INSERT INTO `sys_log_login` VALUES (450, 'admin', '127.0.0.1', '2020-04-06 23:14:56');
INSERT INTO `sys_log_login` VALUES (451, 'admin', '127.0.0.1', '2020-04-07 10:26:49');
INSERT INTO `sys_log_login` VALUES (452, 'admin', '127.0.0.1', '2020-04-07 10:48:19');
INSERT INTO `sys_log_login` VALUES (453, 'admin', '127.0.0.1', '2020-04-07 15:43:47');
INSERT INTO `sys_log_login` VALUES (454, 'admin', '127.0.0.1', '2020-04-07 23:09:41');
INSERT INTO `sys_log_login` VALUES (455, 'admin', '127.0.0.1', '2020-04-07 23:14:24');
INSERT INTO `sys_log_login` VALUES (456, 'admin', '127.0.0.1', '2020-04-07 23:16:48');
INSERT INTO `sys_log_login` VALUES (457, 'admin', '127.0.0.1', '2020-04-07 23:42:02');
INSERT INTO `sys_log_login` VALUES (458, 'admin', '127.0.0.1', '2020-04-08 00:10:05');
INSERT INTO `sys_log_login` VALUES (459, 'admin', '127.0.0.1', '2020-04-08 00:16:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `href` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `spread` int(255) NULL DEFAULT NULL COMMENT '0不展开1展开',
  `target` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(255) NULL DEFAULT NULL COMMENT '0不可用1可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '政府网站', NULL, 1, NULL, '&#xe68e;', 1);
INSERT INTO `sys_menu` VALUES (2, 1, '修改密码', '', 0, '', '&#xe621;', 1);
INSERT INTO `sys_menu` VALUES (3, 1, '网站公告', '', 0, '', '&#xe663;', 1);
INSERT INTO `sys_menu` VALUES (4, 1, '政府网站', '', 0, '', '&#xe716;', 1);
INSERT INTO `sys_menu` VALUES (5, 1, '领导信箱', NULL, 0, NULL, '&#xe629;', 1);
INSERT INTO `sys_menu` VALUES (6, 1, '文件管理', '', 0, '', '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (7, 1, '政务公开', '', 0, '', '&#xe657;', 1);
INSERT INTO `sys_menu` VALUES (8, 1, '新闻动态', '', 0, '', '&#xe6b2;', 1);
INSERT INTO `sys_menu` VALUES (9, 1, '系统管理', '', 0, '', '&#xe716;', 1);
INSERT INTO `sys_menu` VALUES (10, 1, '日志管理', '', 0, '', '&#xe655;', 1);
INSERT INTO `sys_menu` VALUES (12, 1, '退出系统', '', 0, NULL, '&#xe60f', 1);
INSERT INTO `sys_menu` VALUES (13, 2, '修改密码', '/government/user/tochangepwd', 0, '', '&#xe66f;', 1);
INSERT INTO `sys_menu` VALUES (14, 3, '网站公告', '/government/announcement/toannouncement', 0, '', '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (15, 4, '网站管理', '/government/governmentwebsite/togovernmentwebsite', 0, '', '&#xe655;', 1);
INSERT INTO `sys_menu` VALUES (16, 5, '领导信箱管理', '/government/leaderemail/toleaderemail', 0, '', '&#xe645;', 1);
INSERT INTO `sys_menu` VALUES (17, 6, '文件管理', '/government/file/tofile', 0, '', '&#xe857;', 1);
INSERT INTO `sys_menu` VALUES (18, 7, '政务公开管理', '/government/opengovernment/toopengovernment', 0, NULL, '&#xe629;', 1);
INSERT INTO `sys_menu` VALUES (19, 8, '新闻管理', '/government/news/tonews', 0, '', '&#xe62c;', 1);
INSERT INTO `sys_menu` VALUES (20, 9, '角色管理', '/government/role/toRoleManager', 0, NULL, '&#xe66f;', 1);
INSERT INTO `sys_menu` VALUES (21, 9, '用户管理', '/government/user/toUserManager', 0, NULL, '&#xe770;', 1);
INSERT INTO `sys_menu` VALUES (22, 10, '登陆日志', '/government/logInfo/toLogInfoManager', 0, NULL, '&#xe655;', 1);
INSERT INTO `sys_menu` VALUES (23, 12, '安全退出', '/government/user/logout', 0, NULL, '&#xe62c;', 1);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `roleid` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `roledesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `available` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`roleid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', '拥有所有菜单权限', 1);
INSERT INTO `sys_role` VALUES (2, '业务管理员', '拥有所以业务菜单', 1);
INSERT INTO `sys_role` VALUES (3, '管理员', '管理系统', 1);
INSERT INTO `sys_role` VALUES (4, '数据统计管理员', '数据统计管理员', 1);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `rid` int(11) NOT NULL,
  `mid` int(11) NOT NULL,
  PRIMARY KEY (`rid`, `mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1, 1);
INSERT INTO `sys_role_menu` VALUES (1, 2);
INSERT INTO `sys_role_menu` VALUES (1, 3);
INSERT INTO `sys_role_menu` VALUES (1, 4);
INSERT INTO `sys_role_menu` VALUES (1, 5);
INSERT INTO `sys_role_menu` VALUES (1, 6);
INSERT INTO `sys_role_menu` VALUES (1, 7);
INSERT INTO `sys_role_menu` VALUES (1, 8);
INSERT INTO `sys_role_menu` VALUES (1, 9);
INSERT INTO `sys_role_menu` VALUES (1, 10);
INSERT INTO `sys_role_menu` VALUES (1, 11);
INSERT INTO `sys_role_menu` VALUES (1, 12);
INSERT INTO `sys_role_menu` VALUES (1, 13);
INSERT INTO `sys_role_menu` VALUES (1, 14);
INSERT INTO `sys_role_menu` VALUES (1, 15);
INSERT INTO `sys_role_menu` VALUES (1, 16);
INSERT INTO `sys_role_menu` VALUES (1, 17);
INSERT INTO `sys_role_menu` VALUES (1, 18);
INSERT INTO `sys_role_menu` VALUES (1, 19);
INSERT INTO `sys_role_menu` VALUES (1, 20);
INSERT INTO `sys_role_menu` VALUES (1, 21);
INSERT INTO `sys_role_menu` VALUES (1, 22);
INSERT INTO `sys_role_menu` VALUES (1, 23);
INSERT INTO `sys_role_menu` VALUES (1, 24);
INSERT INTO `sys_role_menu` VALUES (1, 25);
INSERT INTO `sys_role_menu` VALUES (1, 26);
INSERT INTO `sys_role_menu` VALUES (1, 27);
INSERT INTO `sys_role_menu` VALUES (1, 28);
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 6);
INSERT INTO `sys_role_menu` VALUES (2, 7);
INSERT INTO `sys_role_menu` VALUES (2, 8);
INSERT INTO `sys_role_menu` VALUES (2, 9);
INSERT INTO `sys_role_menu` VALUES (2, 10);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 12);
INSERT INTO `sys_role_menu` VALUES (3, 13);
INSERT INTO `sys_role_menu` VALUES (3, 14);
INSERT INTO `sys_role_menu` VALUES (3, 15);
INSERT INTO `sys_role_menu` VALUES (3, 16);
INSERT INTO `sys_role_menu` VALUES (3, 17);
INSERT INTO `sys_role_menu` VALUES (4, 1);
INSERT INTO `sys_role_menu` VALUES (4, 3);
INSERT INTO `sys_role_menu` VALUES (4, 4);
INSERT INTO `sys_role_menu` VALUES (4, 6);
INSERT INTO `sys_role_menu` VALUES (4, 7);
INSERT INTO `sys_role_menu` VALUES (4, 9);
INSERT INTO `sys_role_menu` VALUES (4, 14);
INSERT INTO `sys_role_menu` VALUES (4, 15);
INSERT INTO `sys_role_menu` VALUES (4, 17);
INSERT INTO `sys_role_menu` VALUES (4, 18);
INSERT INTO `sys_role_menu` VALUES (4, 19);
INSERT INTO `sys_role_menu` VALUES (4, 21);

-- ----------------------------
-- Table structure for sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_user`;
CREATE TABLE `sys_role_user`  (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  `urid` int(10) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`urid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_user
-- ----------------------------
INSERT INTO `sys_role_user` VALUES (4, 4, 4);
INSERT INTO `sys_role_user` VALUES (1, 1, 10);
INSERT INTO `sys_role_user` VALUES (2, 2, 11);
INSERT INTO `sys_role_user` VALUES (3, 3, 12);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `loginname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `realname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(255) NULL DEFAULT NULL COMMENT '0女1男',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(255) NULL DEFAULT 2 COMMENT '1，超级管理员,2，系统用户',
  `available` int(255) NULL DEFAULT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 'admin', '4313341334413', '超级管理员', 1, '武汉', '134441331311', 'e10adc3949ba59abbe56e057f20f883e', 'CEO', 1, 1);
INSERT INTO `sys_user` VALUES (3, 'zhangsan', '3413334134131131', '张三', 1, '武汉', '134131313111', 'e10adc3949ba59abbe56e057f20f883e', 'BA', 2, 1);
INSERT INTO `sys_user` VALUES (4, 'ls', '43311341311314341', '李四', 1, '武汉', '1341314113131', 'e10adc3949ba59abbe56e057f20f883e', '扫地的', 2, 1);
INSERT INTO `sys_user` VALUES (5, 'ww', '4313133131331312', '王五', 1, '武汉', '13413131131', 'e10adc3949ba59abbe56e057f20f883e', '领导', 2, 1);
INSERT INTO `sys_user` VALUES (6, 'xm', '45113141331131131', '小明', 1, '武昌', '13451333131', 'e10adc3949ba59abbe56e057f20f883e', '扫地地', 2, 1);
INSERT INTO `sys_user` VALUES (7, 'luoyi', '360421199805241424', '落亦', 1, '九江', '15207895200', 'e10adc3949ba59abbe56e057f20f883e', '学生', 2, 1);
INSERT INTO `sys_user` VALUES (8, 'jiucheng', '360421135820654875', '旧城', 1, '九江', '13614752569', 'e10adc3949ba59abbe56e057f20f883e', '', 2, 1);
INSERT INTO `sys_user` VALUES (9, 'sanpao', '360421198805142414', '三炮', 1, '上海', '13064154936', 'e10adc3949ba59abbe56e057f20f883e', '主席', 2, 1);
INSERT INTO `sys_user` VALUES (10, 'jiashang', '360421199805122014', '佳上', 1, '猎户座旋臂', '15247856322', 'e10adc3949ba59abbe56e057f20f883e', '舰长', 2, 1);
INSERT INTO `sys_user` VALUES (11, 'liyuesu', '360421158902351452', '李约素', 1, '猎户座旋臂', '15219874522', 'e10adc3949ba59abbe56e057f20f883e', '舰长', 2, 1);
INSERT INTO `sys_user` VALUES (12, 'dansuyi', '360421185475452562', '旦素一', 0, '猎户座旋臂', '15279362588', 'e10adc3949ba59abbe56e057f20f883e', '舰长', 2, 1);
INSERT INTO `sys_user` VALUES (13, 'ww', '2131313131', '王五', 1, '武汉', '15279230588', 'e10adc3949ba59abbe56e057f20f883e', '程序员', 2, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_mysql500_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_mysql500_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'e10adc3949ba59abbe56e057f20f883e', '12345678903', 'http://localhost:8080/governmentfile/images/7e92a27f-dd7e-41a3-9bed-7767ad0099b7.jpg', 'admin');
INSERT INTO `user` VALUES (2, 'e10adc3949ba59abbe56e057f20f883e', '12345678903', 'http://localhost:8080/governmentfile\\images\\0d49c59c-2d53-4166-97c9-b637ae7365f8.jpg', 'yewu');
INSERT INTO `user` VALUES (3, 'e10adc3949ba59abbe56e057f20f883e', '12345678903', 'http://localhost:8080/governmentfile\\images\\0d49c59c-2d53-4166-97c9-b637ae7365f8.jpg', 'root');
INSERT INTO `user` VALUES (4, 'e10adc3949ba59abbe56e057f20f883e', '12345678903', 'http://localhost:8080/governmentfile\\images\\0d49c59c-2d53-4166-97c9-b637ae7365f8.jpg', 'data');
INSERT INTO `user` VALUES (9, 'e10adc3949ba59abbe56e057f20f883e', '1234567803', NULL, 'abc');

SET FOREIGN_KEY_CHECKS = 1;
