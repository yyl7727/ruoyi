/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 30/04/2021 23:12:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'rearch_info', '', NULL, NULL, 'RearchInfo', 'crud', 'com.ruoyi.system', 'system', 'info', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2021-03-03 15:13:55', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (2, 'task_member', '课题成员表', NULL, NULL, 'TaskMember', 'crud', 'com.ruoyi.system', 'system', 'member', '课题成员', 'ruoyi', '0', '/', NULL, 'admin', '2021-04-28 19:53:17', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'rearch_id', '助研信息id', 'bigint(20)', 'Long', 'rearchId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (2, '1', 'student_id', '学生id', 'varchar(50)', 'String', 'studentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (3, '1', 'student_name', '学生姓名', 'varchar(50)', 'String', 'studentName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (4, '1', 'student_major', '专业', 'varchar(255)', 'String', 'studentMajor', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (5, '1', 'student_phone', NULL, 'varchar(255)', 'String', 'studentPhone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (6, '1', 'student_email', NULL, 'varchar(255)', 'String', 'studentEmail', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (7, '1', 'skill', '学生技术方向', 'varchar(255)', 'String', 'skill', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, '1', 'student_desc', '个人简介', 'varchar(255)', 'String', 'studentDesc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '1', 'status', '状态 0：已发布 1：已申请 2：申请成功 3：申请失败', 'varchar(2)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '1', 'is_delete', '是否删除 0：未删除  1：已删除', 'varchar(2)', 'String', 'isDelete', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '1', 'create_by', NULL, 'varchar(100)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '1', 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '1', 'update_by', NULL, 'varchar(100)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '1', 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-03-03 15:13:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '2', 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-28 19:53:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '2', 'task_id', '课题id', 'bigint(20)', 'Long', 'taskId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-04-28 19:53:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '2', 'student_username', '学生用户名', 'varchar(50)', 'String', 'studentUsername', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-04-28 19:53:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '2', 'status', '状态 0待加入 1已加入', 'varchar(2)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2021-04-28 19:53:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '2', 'is_delete', '是否删除 0未删除 1已删除', 'varchar(2)', 'String', 'isDelete', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-04-28 19:53:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '2', 'create_by', NULL, 'varchar(50)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2021-04-28 19:53:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '2', 'create_time', NULL, 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2021-04-28 19:53:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '2', 'update_by', NULL, 'varchar(50)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2021-04-28 19:53:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '2', 'update_time', NULL, 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-04-28 19:53:17', '', NULL);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', '0/20 * * * * ? *', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001779089FBD078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001780C167E40787074000070707074000131740010302F3230202A202A202A202A203F202A7400122F6E6F746963652F6765744D65737361676574000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000064740018E5AE9AE69C9FE88EB7E58F96E6B688E681AFE9809AE79FA574000131740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001779089FBD078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001779089FBD078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'DESKTOP-AERBHQ91619688061160', 1619795561676, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1619688070000, -1, 5, 'PAUSED', 'CRON', 1619688061000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME100', 'DEFAULT', 'TASK_CLASS_NAME100', 'DEFAULT', NULL, 1619688080000, -1, 5, 'PAUSED', 'CRON', 1619688061000, 0, NULL, -1, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1619688075000, -1, 5, 'PAUSED', 'CRON', 1619688061000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1619688080000, -1, 5, 'PAUSED', 'CRON', 1619688061000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for rearch_info
-- ----------------------------
DROP TABLE IF EXISTS `rearch_info`;
CREATE TABLE `rearch_info`  (
  `rearch_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '助研信息id',
  `student_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生id',
  `student_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `student_major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专业',
  `student_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `skill` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生技术方向',
  `student_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人简介',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 0：已发布 1：已申请 2：申请成功 3：申请失败',
  `is_delete` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否删除 0：未删除  1：已删除',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`rearch_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rearch_info
-- ----------------------------
INSERT INTO `rearch_info` VALUES (7, 'student', '测试学生', '1', '18976789671', '123@qq.com', '0,2,3,4', '这是一条测试助研信息数据这是一条测试助研信息数据这是一条测试助研信息数据', '1', '0', 'student', '2021-04-07 14:59:44', NULL, NULL);
INSERT INTO `rearch_info` VALUES (8, 'student', '测试学生', '1', '18976789671', '123@qq.com', '1,0,2,4', '测试助研信息二', '0', '0', 'student', '2021-04-07 16:44:58', NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-02-11 18:01:38', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-02-11 18:01:38', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-02-11 18:01:38', '', NULL, '深色主题theme-dark，浅色主题theme-light');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '西南林业大学', 0, '西南林业大学', '15888888888', 'xn@qq.com', '0', '0', 'admin', '2021-02-11 18:01:37', 'admin', '2021-02-13 12:17:55');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 118 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-02-11 18:01:38', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '软件开发', '0', 'task_type', NULL, NULL, 'N', '0', 'admin', '2021-02-12 18:09:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '数据库设计', '1', 'task_type', NULL, NULL, 'N', '0', 'admin', '2021-02-12 18:10:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, 'Java', '0', 'student_skill', NULL, NULL, 'N', '0', 'admin', '2021-02-15 21:34:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, 'C#', '1', 'student_skill', NULL, NULL, 'N', '0', 'admin', '2021-02-15 21:34:22', 'admin', '2021-02-15 21:34:46', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 2, 'C++', '2', 'student_skill', NULL, NULL, 'N', '0', 'admin', '2021-02-15 21:34:29', 'admin', '2021-02-15 21:34:52', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 3, 'Python', '3', 'student_skill', NULL, NULL, 'N', '0', 'admin', '2021-02-15 21:34:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 4, 'Oracle', '4', 'student_skill', NULL, NULL, 'N', '0', 'admin', '2021-02-15 21:35:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (107, 5, 'MySQL', '5', 'student_skill', NULL, NULL, 'N', '0', 'admin', '2021-02-15 21:35:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (108, 0, '计算机科学与技术', '1', 'student_major', NULL, NULL, 'N', '0', 'admin', '2021-03-03 15:32:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (109, 1, '物联网应用技术', '2', 'student_major', NULL, NULL, 'N', '0', 'admin', '2021-03-03 15:32:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (110, 2, '软件工程', '3', 'student_major', NULL, NULL, 'N', '0', 'admin', '2021-03-03 15:32:48', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '有效', '0', 'rearch_status', NULL, NULL, 'N', '0', 'admin', '2021-03-05 16:16:11', 'admin', '2021-04-07 10:41:06', NULL);
INSERT INTO `sys_dict_data` VALUES (112, 1, '失效', '1', 'rearch_status', NULL, NULL, 'N', '0', 'admin', '2021-03-05 16:16:30', 'admin', '2021-04-07 10:41:14', NULL);
INSERT INTO `sys_dict_data` VALUES (115, 3, '私信', '3', 'sys_notice_type', NULL, NULL, 'N', '0', 'admin', '2021-03-08 20:26:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 4, '邀请', '4', 'sys_notice_type', NULL, NULL, 'N', '0', 'admin', '2021-03-09 16:31:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (117, 5, '申请', '5', 'sys_notice_type', NULL, NULL, 'N', '0', 'admin', '2021-03-09 16:31:16', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '课题类型', 'task_type', '0', 'admin', '2021-02-12 18:06:49', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '技术方向', 'student_skill', '0', 'admin', '2021-02-15 21:33:48', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '学生专业', 'student_major', '0', 'admin', '2021-03-03 15:31:54', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, '助研信息状态', 'rearch_status', '0', 'admin', '2021-03-05 16:15:53', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-02-11 18:01:38', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-02-11 18:01:38', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-02-11 18:01:38', '', NULL, '');
INSERT INTO `sys_job` VALUES (100, '定期获取消息通知', 'DEFAULT', '/notice/getMessage', '0/20 * * * * ? *', '1', '1', '1', 'admin', '2021-03-07 17:48:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 384 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-02-11 18:02:40');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-11 18:02:43');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-11 18:02:46');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-11 18:04:19');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-11 19:04:12');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-11 21:00:32');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-11 21:31:41');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-12 00:08:33');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-02-12 10:57:53');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-12 10:57:56');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-12 12:25:27');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-12 15:09:45');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-12 16:00:30');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-12 17:24:47');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-12 18:03:52');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-12 19:55:16');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-12 22:11:25');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-13 12:16:46');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-13 12:19:02');
INSERT INTO `sys_logininfor` VALUES (119, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-13 12:19:09');
INSERT INTO `sys_logininfor` VALUES (120, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-13 12:19:33');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-13 12:19:39');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-13 14:05:44');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-15 17:53:11');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-15 19:58:41');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-15 21:33:19');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-15 21:38:00');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-15 21:38:04');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-15 22:43:11');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-16 10:05:41');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-16 11:10:34');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-16 12:41:00');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-16 12:41:07');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-16 13:18:59');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-16 13:22:37');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-16 13:22:55');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-16 13:22:58');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-16 13:29:01');
INSERT INTO `sys_logininfor` VALUES (138, 'ry', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-02-16 13:29:08');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-16 13:29:18');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-16 13:30:23');
INSERT INTO `sys_logininfor` VALUES (141, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-02-16 13:30:28');
INSERT INTO `sys_logininfor` VALUES (142, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-02-16 13:30:31');
INSERT INTO `sys_logininfor` VALUES (143, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-16 13:30:35');
INSERT INTO `sys_logininfor` VALUES (144, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-02-16 13:32:02');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-16 13:32:06');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-17 09:59:33');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-17 10:50:12');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-17 14:38:24');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-02-17 19:54:13');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-03 11:44:34');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-03-03 14:41:26');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-03 14:41:30');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-03 15:13:37');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-04 09:46:20');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-04 16:25:59');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-04 16:29:04');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-05 08:45:41');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-05 14:52:11');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-05 15:25:49');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-05 23:15:17');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-06 09:48:50');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-06 10:21:34');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-06 10:51:38');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-06 11:27:57');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-06 15:03:56');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-06 17:52:44');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-06 19:57:09');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-06 20:08:05');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-06 20:08:11');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-06 21:49:59');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-07 16:35:02');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-07 17:36:05');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-07 20:33:07');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-08 20:25:38');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-08 20:36:27');
INSERT INTO `sys_logininfor` VALUES (176, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-08 20:36:35');
INSERT INTO `sys_logininfor` VALUES (177, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-08 20:37:02');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-08 20:37:05');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-08 20:39:48');
INSERT INTO `sys_logininfor` VALUES (180, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-08 20:39:55');
INSERT INTO `sys_logininfor` VALUES (181, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-08 20:40:02');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-08 20:40:05');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-08 20:41:15');
INSERT INTO `sys_logininfor` VALUES (184, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-08 20:41:24');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-09 16:24:36');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-09 20:28:03');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-09 22:36:16');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-10 09:41:56');
INSERT INTO `sys_logininfor` VALUES (189, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-10 10:53:16');
INSERT INTO `sys_logininfor` VALUES (190, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-10 10:53:37');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-10 10:53:41');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-10 10:54:07');
INSERT INTO `sys_logininfor` VALUES (193, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-10 10:54:16');
INSERT INTO `sys_logininfor` VALUES (194, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-10 10:55:22');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-10 10:55:25');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-10 10:55:56');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-10 10:55:59');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-10 10:56:05');
INSERT INTO `sys_logininfor` VALUES (199, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-10 10:56:13');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-10 14:33:29');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-10 17:00:22');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-10 17:03:35');
INSERT INTO `sys_logininfor` VALUES (203, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-10 17:03:47');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-03-11 08:58:29');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-03-11 08:58:30');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-11 08:58:33');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-12 09:58:41');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-12 09:58:47');
INSERT INTO `sys_logininfor` VALUES (209, 'student', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-12 09:58:58');
INSERT INTO `sys_logininfor` VALUES (210, 'student', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-12 10:27:01');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-12 10:27:05');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-12 10:32:40');
INSERT INTO `sys_logininfor` VALUES (213, 'student', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-12 10:32:49');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-12 15:39:22');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-12 15:39:30');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-12 15:39:35');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-12 15:39:41');
INSERT INTO `sys_logininfor` VALUES (218, 'student', '10.254.72.200', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-12 15:39:50');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-15 15:27:48');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-15 15:28:09');
INSERT INTO `sys_logininfor` VALUES (221, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-15 15:28:16');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-15 16:03:45');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-03-15 16:04:04');
INSERT INTO `sys_logininfor` VALUES (224, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-15 16:04:19');
INSERT INTO `sys_logininfor` VALUES (225, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-03-15 16:41:22');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-04-02 09:35:36');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 09:35:42');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 10:30:20');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 15:04:54');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 15:08:59');
INSERT INTO `sys_logininfor` VALUES (231, 'root', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 15:11:24');
INSERT INTO `sys_logininfor` VALUES (232, 'root', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 15:15:06');
INSERT INTO `sys_logininfor` VALUES (233, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 15:15:14');
INSERT INTO `sys_logininfor` VALUES (234, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 15:15:50');
INSERT INTO `sys_logininfor` VALUES (235, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 15:15:58');
INSERT INTO `sys_logininfor` VALUES (236, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 15:16:25');
INSERT INTO `sys_logininfor` VALUES (237, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 15:16:33');
INSERT INTO `sys_logininfor` VALUES (238, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 15:17:59');
INSERT INTO `sys_logininfor` VALUES (239, 'root', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 15:18:05');
INSERT INTO `sys_logininfor` VALUES (240, 'root', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 15:23:51');
INSERT INTO `sys_logininfor` VALUES (241, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 15:23:58');
INSERT INTO `sys_logininfor` VALUES (242, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 15:25:16');
INSERT INTO `sys_logininfor` VALUES (243, 'root', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 15:57:25');
INSERT INTO `sys_logininfor` VALUES (244, 'root', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 16:00:44');
INSERT INTO `sys_logininfor` VALUES (245, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 16:00:54');
INSERT INTO `sys_logininfor` VALUES (246, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 16:01:36');
INSERT INTO `sys_logininfor` VALUES (247, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 16:01:45');
INSERT INTO `sys_logininfor` VALUES (248, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-02 16:02:30');
INSERT INTO `sys_logininfor` VALUES (249, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-02 16:02:38');
INSERT INTO `sys_logininfor` VALUES (250, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码已失效', '2021-04-07 10:35:29');
INSERT INTO `sys_logininfor` VALUES (251, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 10:35:33');
INSERT INTO `sys_logininfor` VALUES (252, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-07 10:35:58');
INSERT INTO `sys_logininfor` VALUES (253, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 10:36:06');
INSERT INTO `sys_logininfor` VALUES (254, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-07 10:38:52');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 10:39:02');
INSERT INTO `sys_logininfor` VALUES (256, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 14:57:35');
INSERT INTO `sys_logininfor` VALUES (257, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-07 15:02:16');
INSERT INTO `sys_logininfor` VALUES (258, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 15:02:23');
INSERT INTO `sys_logininfor` VALUES (259, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-07 15:02:37');
INSERT INTO `sys_logininfor` VALUES (260, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 15:02:43');
INSERT INTO `sys_logininfor` VALUES (261, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-07 15:03:13');
INSERT INTO `sys_logininfor` VALUES (262, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 15:03:21');
INSERT INTO `sys_logininfor` VALUES (263, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-07 15:24:49');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 15:24:57');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-07 15:25:47');
INSERT INTO `sys_logininfor` VALUES (266, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 15:25:57');
INSERT INTO `sys_logininfor` VALUES (267, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 16:41:41');
INSERT INTO `sys_logininfor` VALUES (268, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-07 16:45:34');
INSERT INTO `sys_logininfor` VALUES (269, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 16:45:42');
INSERT INTO `sys_logininfor` VALUES (270, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-07 16:49:18');
INSERT INTO `sys_logininfor` VALUES (271, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 16:49:27');
INSERT INTO `sys_logininfor` VALUES (272, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-07 16:49:58');
INSERT INTO `sys_logininfor` VALUES (273, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-07 16:50:07');
INSERT INTO `sys_logininfor` VALUES (274, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 14:55:20');
INSERT INTO `sys_logininfor` VALUES (275, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 15:03:30');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 15:03:37');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 15:05:22');
INSERT INTO `sys_logininfor` VALUES (278, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 15:05:30');
INSERT INTO `sys_logininfor` VALUES (279, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 16:08:49');
INSERT INTO `sys_logininfor` VALUES (280, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 16:08:59');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 16:09:08');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 16:09:43');
INSERT INTO `sys_logininfor` VALUES (283, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 16:09:54');
INSERT INTO `sys_logininfor` VALUES (284, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 16:10:24');
INSERT INTO `sys_logininfor` VALUES (285, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 16:10:35');
INSERT INTO `sys_logininfor` VALUES (286, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 16:10:46');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 16:10:57');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 16:11:18');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 16:11:29');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 16:12:06');
INSERT INTO `sys_logininfor` VALUES (291, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 16:12:16');
INSERT INTO `sys_logininfor` VALUES (292, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 16:14:59');
INSERT INTO `sys_logininfor` VALUES (293, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 16:15:06');
INSERT INTO `sys_logininfor` VALUES (294, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-08 16:23:47');
INSERT INTO `sys_logininfor` VALUES (295, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-08 16:23:54');
INSERT INTO `sys_logininfor` VALUES (296, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-09 09:07:05');
INSERT INTO `sys_logininfor` VALUES (297, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-09 09:24:36');
INSERT INTO `sys_logininfor` VALUES (298, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-09 09:24:45');
INSERT INTO `sys_logininfor` VALUES (299, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-09 09:24:58');
INSERT INTO `sys_logininfor` VALUES (300, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-09 09:25:06');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-09 14:15:29');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-09 14:45:07');
INSERT INTO `sys_logininfor` VALUES (303, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-09 14:45:17');
INSERT INTO `sys_logininfor` VALUES (304, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-09 15:24:20');
INSERT INTO `sys_logininfor` VALUES (305, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-09 15:54:04');
INSERT INTO `sys_logininfor` VALUES (306, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-09 15:54:11');
INSERT INTO `sys_logininfor` VALUES (307, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 08:52:27');
INSERT INTO `sys_logininfor` VALUES (308, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-12 09:53:43');
INSERT INTO `sys_logininfor` VALUES (309, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 09:53:56');
INSERT INTO `sys_logininfor` VALUES (310, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-12 09:53:59');
INSERT INTO `sys_logininfor` VALUES (311, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-12 09:54:27');
INSERT INTO `sys_logininfor` VALUES (312, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 09:54:35');
INSERT INTO `sys_logininfor` VALUES (313, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '用户不存在/密码错误', '2021-04-12 09:54:38');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 09:54:47');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 09:54:52');
INSERT INTO `sys_logininfor` VALUES (316, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 09:55:03');
INSERT INTO `sys_logininfor` VALUES (317, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 09:55:53');
INSERT INTO `sys_logininfor` VALUES (318, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2021-04-12 09:56:28');
INSERT INTO `sys_logininfor` VALUES (319, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 09:56:32');
INSERT INTO `sys_logininfor` VALUES (320, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 09:56:43');
INSERT INTO `sys_logininfor` VALUES (321, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 09:56:49');
INSERT INTO `sys_logininfor` VALUES (322, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-12 09:58:58');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-12 09:59:04');
INSERT INTO `sys_logininfor` VALUES (324, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-13 15:17:32');
INSERT INTO `sys_logininfor` VALUES (325, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-13 15:17:46');
INSERT INTO `sys_logininfor` VALUES (326, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-13 15:17:54');
INSERT INTO `sys_logininfor` VALUES (327, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-13 15:22:13');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-13 15:22:20');
INSERT INTO `sys_logininfor` VALUES (329, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-13 15:23:00');
INSERT INTO `sys_logininfor` VALUES (330, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-13 15:23:07');
INSERT INTO `sys_logininfor` VALUES (331, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-13 16:26:17');
INSERT INTO `sys_logininfor` VALUES (332, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-13 16:26:42');
INSERT INTO `sys_logininfor` VALUES (333, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-13 16:26:49');
INSERT INTO `sys_logininfor` VALUES (334, 'teacher', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-13 16:27:01');
INSERT INTO `sys_logininfor` VALUES (335, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-13 16:27:07');
INSERT INTO `sys_logininfor` VALUES (336, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-15 09:19:36');
INSERT INTO `sys_logininfor` VALUES (337, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-15 10:14:16');
INSERT INTO `sys_logininfor` VALUES (338, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-16 17:06:03');
INSERT INTO `sys_logininfor` VALUES (339, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-20 10:00:40');
INSERT INTO `sys_logininfor` VALUES (340, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2021-04-20 10:12:17');
INSERT INTO `sys_logininfor` VALUES (341, 'student', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2021-04-20 10:12:27');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-23 10:33:12');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-23 14:48:38');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-26 15:43:18');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-26 16:26:33');
INSERT INTO `sys_logininfor` VALUES (346, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-26 16:26:41');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-26 20:16:18');
INSERT INTO `sys_logininfor` VALUES (348, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-26 20:16:41');
INSERT INTO `sys_logininfor` VALUES (349, 'student', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-26 20:16:55');
INSERT INTO `sys_logininfor` VALUES (350, 'student', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-26 21:30:53');
INSERT INTO `sys_logininfor` VALUES (351, 'student', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-26 21:31:05');
INSERT INTO `sys_logininfor` VALUES (352, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-26 21:31:15');
INSERT INTO `sys_logininfor` VALUES (353, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-26 21:31:30');
INSERT INTO `sys_logininfor` VALUES (354, 'student', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-26 21:31:36');
INSERT INTO `sys_logininfor` VALUES (355, 'student', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-26 22:14:51');
INSERT INTO `sys_logininfor` VALUES (356, 'student', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-26 22:25:14');
INSERT INTO `sys_logininfor` VALUES (357, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-26 22:25:24');
INSERT INTO `sys_logininfor` VALUES (358, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-26 22:28:16');
INSERT INTO `sys_logininfor` VALUES (359, 'student', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-26 22:28:26');
INSERT INTO `sys_logininfor` VALUES (360, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-27 14:37:08');
INSERT INTO `sys_logininfor` VALUES (361, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-27 14:37:23');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-27 14:37:29');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-27 14:38:20');
INSERT INTO `sys_logininfor` VALUES (364, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-27 14:38:29');
INSERT INTO `sys_logininfor` VALUES (365, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-27 15:52:35');
INSERT INTO `sys_logininfor` VALUES (366, 'student', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-27 17:07:57');
INSERT INTO `sys_logininfor` VALUES (367, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-28 14:54:12');
INSERT INTO `sys_logininfor` VALUES (368, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-28 15:30:07');
INSERT INTO `sys_logininfor` VALUES (369, 'student', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-28 15:30:15');
INSERT INTO `sys_logininfor` VALUES (370, 'student', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-28 15:43:03');
INSERT INTO `sys_logininfor` VALUES (371, 'teacher', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-28 15:43:13');
INSERT INTO `sys_logininfor` VALUES (372, 'teacher', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-28 15:43:23');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-28 15:43:33');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2021-04-28 19:52:03');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-28 19:52:06');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-28 21:40:03');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-04-28 21:40:23');
INSERT INTO `sys_logininfor` VALUES (378, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-28 21:40:32');
INSERT INTO `sys_logininfor` VALUES (379, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2021-04-28 23:29:33');
INSERT INTO `sys_logininfor` VALUES (380, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-28 23:29:37');
INSERT INTO `sys_logininfor` VALUES (381, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-29 09:29:10');
INSERT INTO `sys_logininfor` VALUES (382, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-29 16:42:21');
INSERT INTO `sys_logininfor` VALUES (383, 'teacher1', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-04-29 17:19:54');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-02-11 18:01:37', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-02-11 18:01:37', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-02-11 18:01:37', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-02-11 18:01:37', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-02-11 18:01:37', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-02-11 18:01:37', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-02-11 18:01:37', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-02-11 18:01:37', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-02-11 18:01:37', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-02-11 18:01:37', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-02-11 18:01:37', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-02-11 18:01:37', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-02-11 18:01:37', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-02-11 18:01:37', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-02-11 18:01:37', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-02-11 18:01:37', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-02-11 18:01:37', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-02-11 18:01:37', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-02-11 18:01:37', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-02-11 18:01:37', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-02-11 18:01:37', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-02-11 18:01:37', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-02-11 18:01:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '课题管理', 0, 1, 'task', NULL, 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-02-11 19:07:01', 'admin', '2021-02-11 19:41:34', '');
INSERT INTO `sys_menu` VALUES (2001, '发布课题', 2000, 1, 'task', 'task/index', 1, 0, 'C', '0', '0', '', 'form', 'admin', '2021-02-11 19:09:17', 'admin', '2021-02-11 19:11:36', '');
INSERT INTO `sys_menu` VALUES (2002, '助研信息', 0, 2, 'rearch', NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2021-02-15 19:59:26', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '发布助研信息', 2002, 1, 'rearch', 'rearch/index', 1, 0, 'C', '0', '0', '', 'excel', 'admin', '2021-02-15 20:00:21', 'admin', '2021-02-15 20:00:43', '');
INSERT INTO `sys_menu` VALUES (2004, '助研信息列表', 2002, 2, 'rearchInfo', 'rearch/info', 1, 0, 'C', '0', '0', '', 'button', 'admin', '2021-03-03 15:22:26', 'admin', '2021-03-03 15:24:31', '');
INSERT INTO `sys_menu` VALUES (2005, '同意邀请', 107, 5, '', NULL, 1, 0, 'F', '0', '0', 'system:notice:yes', '#', 'admin', '2021-03-12 10:28:06', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '拒绝邀请', 107, 6, '', NULL, 1, 0, 'F', '0', '0', 'system:notice:no', '#', 'admin', '2021-03-12 10:28:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '课题列表', 2000, 2, 'list', 'task/list', 1, 0, 'C', '0', '0', NULL, 'list', 'admin', '2021-04-08 15:04:47', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2008, '工作日志', 2000, 3, 'workLog', 'task/workLog', 1, 0, 'C', '0', '0', NULL, 'build', 'admin', '2021-04-23 11:02:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '课题成员', 2000, 4, 'taskMember', 'task/taskMember', 1, 0, 'C', '0', '0', NULL, 'peoples', 'admin', '2021-04-28 19:57:15', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `is_read` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否已读（0未读 1已读）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (26, '课题加入申请', '5', 0x73747564656E7420E794B3E8AFB7E58AA0E585A5E4BDA0E79A84E8AFBEE9A298EFBC9AE6B58BE8AF95E69599E5B88831E79A84E8AFBEE9A298, '0', '0', 'student', '2021-04-12 09:55:48', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (27, '课题加入申请', '5', 0x73747564656E7420E794B3E8AFB7E58AA0E585A5E4BDA0E79A84E8AFBEE9A298EFBC9AE6B58BE8AF95E69599E5B88831E79A84E8AFBEE9A298, '1', '1', 'student', '2021-04-12 09:56:38', 'teacher1', '2021-04-16 17:06:43', NULL);
INSERT INTO `sys_notice` VALUES (28, '课题加入申请', '5', 0x73747564656E7420E794B3E8AFB7E58AA0E585A5E4BDA0E79A84E8AFBEE9A298EFBC9AE6B58BE8AF95E69599E5B88831E79A84E8AFBEE9A298, '1', '1', 'student', '2021-04-26 21:31:02', 'teacher1', '2021-04-26 21:31:25', NULL);

-- ----------------------------
-- Table structure for sys_notice_status
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_status`;
CREATE TABLE `sys_notice_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notice_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知id',
  `user_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收件人用户名',
  `task_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课题id',
  `is_read` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否已读',
  `create_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice_status
-- ----------------------------
INSERT INTO `sys_notice_status` VALUES (8, '27', 'teacher1', '12', '1', 'student', '2021-04-12 09:56:38', 'teacher1', '2021-04-16 17:06:36');
INSERT INTO `sys_notice_status` VALUES (9, '28', 'teacher1', '12', '1', 'student', '2021-04-26 21:31:02', 'teacher1', '2021-04-26 21:31:21');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 207 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '操作日志', 9, 'com.ruoyi.web.controller.monitor.SysOperlogController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-12 22:19:00');
INSERT INTO `sys_oper_log` VALUES (2, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"deptName\":\"西南林业大学\",\"leader\":\"西南林业大学\",\"deptId\":100,\"orderNum\":\"0\",\"delFlag\":\"0\",\"params\":{},\"parentId\":0,\"createBy\":\"admin\",\"children\":[],\"createTime\":1613037697000,\"phone\":\"15888888888\",\"updateBy\":\"admin\",\"ancestors\":\"0\",\"email\":\"xn@qq.com\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:17:55');
INSERT INTO `sys_oper_log` VALUES (3, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$v8LlI5/RTthKbnREWs590.7yAvJVNo2b0mXW/3rR5JiKPdm1aNr5u\",\"updateBy\":\"admin\",\"params\":{},\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:18:57');
INSERT INTO `sys_oper_log` VALUES (4, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/101', '127.0.0.1', '内网IP', '{deptId=101}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', 0, NULL, '2021-02-13 12:20:41');
INSERT INTO `sys_oper_log` VALUES (5, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2021-02-13 12:20:46');
INSERT INTO `sys_oper_log` VALUES (6, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":500}', 0, NULL, '2021-02-13 12:20:48');
INSERT INTO `sys_oper_log` VALUES (7, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"15888888888\",\"admin\":true,\"loginDate\":1613037697000,\"remark\":\"管理员\",\"delFlag\":\"0\",\"password\":\"\",\"postIds\":[1],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@163.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"研发部门\",\"leader\":\"若依\",\"deptId\":103,\"orderNum\":\"1\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"admin\",\"userId\":1,\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1613037697000,\"status\":\"0\"}', 'null', 1, '不允许操作超级管理员用户', '2021-02-13 12:21:05');
INSERT INTO `sys_oper_log` VALUES (8, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1613037697000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1613037697000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:22:39');
INSERT INTO `sys_oper_log` VALUES (9, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/101', '127.0.0.1', '内网IP', '{deptId=101}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', 0, NULL, '2021-02-13 12:23:04');
INSERT INTO `sys_oper_log` VALUES (10, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/103', '127.0.0.1', '内网IP', '{deptId=103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:23:09');
INSERT INTO `sys_oper_log` VALUES (11, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/104', '127.0.0.1', '内网IP', '{deptId=104}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:23:11');
INSERT INTO `sys_oper_log` VALUES (12, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/105', '127.0.0.1', '内网IP', '{deptId=105}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:23:13');
INSERT INTO `sys_oper_log` VALUES (13, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/106', '127.0.0.1', '内网IP', '{deptId=106}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:23:15');
INSERT INTO `sys_oper_log` VALUES (14, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/107', '127.0.0.1', '内网IP', '{deptId=107}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:23:17');
INSERT INTO `sys_oper_log` VALUES (15, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/101', '127.0.0.1', '内网IP', '{deptId=101}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:23:21');
INSERT INTO `sys_oper_log` VALUES (16, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/108', '127.0.0.1', '内网IP', '{deptId=108}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:23:24');
INSERT INTO `sys_oper_log` VALUES (17, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/109', '127.0.0.1', '内网IP', '{deptId=109}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:23:26');
INSERT INTO `sys_oper_log` VALUES (18, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dept/102', '127.0.0.1', '内网IP', '{deptId=102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:23:28');
INSERT INTO `sys_oper_log` VALUES (19, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"1\",\"flag\":false,\"remark\":\"\",\"postId\":1,\"params\":{},\"createBy\":\"admin\",\"createTime\":1613037697000,\"updateBy\":\"admin\",\"postName\":\"教师\",\"postCode\":\"teacher\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:26:11');
INSERT INTO `sys_oper_log` VALUES (20, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"2\",\"flag\":false,\"remark\":\"\",\"postId\":2,\"params\":{},\"createBy\":\"admin\",\"createTime\":1613037697000,\"updateBy\":\"admin\",\"postName\":\"课题组长\",\"postCode\":\"se\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:26:26');
INSERT INTO `sys_oper_log` VALUES (21, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"3\",\"flag\":false,\"remark\":\"\",\"postId\":3,\"params\":{},\"createBy\":\"admin\",\"createTime\":1613037697000,\"updateBy\":\"admin\",\"postName\":\"课题成员\",\"postCode\":\"hr\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:26:35');
INSERT INTO `sys_oper_log` VALUES (22, '岗位管理', 3, 'com.ruoyi.web.controller.system.SysPostController.remove()', 'DELETE', 1, 'admin', NULL, '/system/post/4', '127.0.0.1', '内网IP', '{postIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:26:38');
INSERT INTO `sys_oper_log` VALUES (23, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"2\",\"flag\":false,\"remark\":\"\",\"postId\":2,\"params\":{},\"createBy\":\"admin\",\"createTime\":1613037697000,\"updateBy\":\"admin\",\"postName\":\"课题组长\",\"postCode\":\"leader\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:27:08');
INSERT INTO `sys_oper_log` VALUES (24, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.edit()', 'PUT', 1, 'admin', NULL, '/system/post', '127.0.0.1', '内网IP', '{\"postSort\":\"3\",\"flag\":false,\"remark\":\"\",\"postId\":3,\"params\":{},\"createBy\":\"admin\",\"createTime\":1613037697000,\"updateBy\":\"admin\",\"postName\":\"课题成员\",\"postCode\":\"member\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:27:17');
INSERT INTO `sys_oper_log` VALUES (25, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/system/role/dataScope', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":1,\"admin\":true,\"remark\":\"超级管理员\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1613037697000,\"menuCheckStrictly\":true,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"deptIds\":[],\"status\":\"0\"}', 'null', 1, '不允许操作超级管理员角色', '2021-02-13 12:29:13');
INSERT INTO `sys_oper_log` VALUES (26, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"deptIds\":[],\"menuIds\":[2000,2001],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 12:35:26');
INSERT INTO `sys_oper_log` VALUES (27, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-02-13 14:06:16');
INSERT INTO `sys_oper_log` VALUES (28, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1613037697000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 14:06:25');
INSERT INTO `sys_oper_log` VALUES (29, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 14:06:35');
INSERT INTO `sys_oper_log` VALUES (30, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":101,\"admin\":false,\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"leader\",\"roleName\":\"课题组长\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 14:08:20');
INSERT INTO `sys_oper_log` VALUES (31, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1613190926000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"menuIds\":[2000,2001],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 14:08:26');
INSERT INTO `sys_oper_log` VALUES (32, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":102,\"admin\":false,\"params\":{},\"roleSort\":\"5\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"member\",\"roleName\":\"课题成员\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-13 14:08:41');
INSERT INTO `sys_oper_log` VALUES (33, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"documentation\",\"orderNum\":\"2\",\"menuName\":\"助研信息\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"rearch\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 19:59:26');
INSERT INTO `sys_oper_log` VALUES (34, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":\"1\",\"menuName\":\"发布助研信息\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"rearch/index\",\"component\":\"rearch\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 20:00:21');
INSERT INTO `sys_oper_log` VALUES (35, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"excel\",\"orderNum\":\"1\",\"menuName\":\"发布助研信息\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"rearch\",\"component\":\"rearch/index\",\"children\":[],\"createTime\":1613390421000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 20:00:43');
INSERT INTO `sys_oper_log` VALUES (36, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"技术方向\",\"params\":{},\"dictType\":\"student_skill\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 21:33:48');
INSERT INTO `sys_oper_log` VALUES (37, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"student_skill\",\"dictLabel\":\"Java\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 21:34:09');
INSERT INTO `sys_oper_log` VALUES (38, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"student_skill\",\"dictLabel\":\"C#\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 21:34:22');
INSERT INTO `sys_oper_log` VALUES (39, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":0,\"params\":{},\"dictType\":\"student_skill\",\"dictLabel\":\"C++\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 21:34:29');
INSERT INTO `sys_oper_log` VALUES (40, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":3,\"params\":{},\"dictType\":\"student_skill\",\"dictLabel\":\"Python\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 21:34:37');
INSERT INTO `sys_oper_log` VALUES (41, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"params\":{},\"dictType\":\"student_skill\",\"dictLabel\":\"C#\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1613396062000,\"dictCode\":103,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 21:34:46');
INSERT INTO `sys_oper_log` VALUES (42, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":2,\"params\":{},\"dictType\":\"student_skill\",\"dictLabel\":\"C++\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1613396069000,\"dictCode\":104,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 21:34:52');
INSERT INTO `sys_oper_log` VALUES (43, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"dictSort\":4,\"params\":{},\"dictType\":\"student_skill\",\"dictLabel\":\"Oracle\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 21:35:03');
INSERT INTO `sys_oper_log` VALUES (44, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"5\",\"dictSort\":5,\"params\":{},\"dictType\":\"student_skill\",\"dictLabel\":\"MySQL\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-15 21:35:21');
INSERT INTO `sys_oper_log` VALUES (45, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"params\":{},\"createBy\":\"admin\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-15 21:46:03');
INSERT INTO `sys_oper_log` VALUES (46, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentMajor\":\"1\",\"params\":{},\"studentEmail\":\"7727@qq.com\",\"createBy\":\"admin\",\"skill\":\"0,1,3\",\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-15 22:12:22');
INSERT INTO `sys_oper_log` VALUES (47, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentMajor\":1,\"skill\":[\"0\",\"1\",\"3\"],\"studentPhone\":\"18976789671\",\"studentEmail\":\"123@qq.com\",\"studentDesc\":\"123\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-15 22:43:44');
INSERT INTO `sys_oper_log` VALUES (48, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentMajor\":1,\"skill\":[\"0\",\"1\",\"3\"],\"studentPhone\":\"18976789671\",\"studentEmail\":\"123@qq.com\",\"studentDesc\":\"123\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-15 22:45:29');
INSERT INTO `sys_oper_log` VALUES (49, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentMajor\":1,\"skill\":[\"0\",\"1\",\"2\"],\"studentPhone\":\"18976789671\",\"studentEmail\":\"7727\",\"studentDesc\":\"123\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-16 11:10:54');
INSERT INTO `sys_oper_log` VALUES (50, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentMajor\":1,\"skill\":[\"0\",\"2\",\"3\"],\"studentPhone\":\"18976789671\",\"studentEmail\":\"7727\",\"studentDesc\":\"123\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-16 11:11:36');
INSERT INTO `sys_oper_log` VALUES (51, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentMajor\":1,\"skill\":[\"1\",\"2\",\"4\"],\"studentPhone\":\"123\",\"studentEmail\":\"123\",\"studentDesc\":\"123\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-16 11:12:16');
INSERT INTO `sys_oper_log` VALUES (52, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentMajor\":1,\"skill\":\"0,1,2,3\",\"studentPhone\":\"123\",\"studentEmail\":\"123\",\"studentDesc\":\"123\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-16 11:13:31');
INSERT INTO `sys_oper_log` VALUES (53, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentMajor\":1,\"studentPhone\":\"123\",\"studentEmail\":\"123\",\"studentDesc\":\"123\",\"skill\":\"0,2,3\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-16 11:20:51');
INSERT INTO `sys_oper_log` VALUES (54, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentMajor\":1,\"studentPhone\":\"123\",\"studentEmail\":\"123\",\"studentDesc\":\"123\",\"skill\":\"0,1,4\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-16 11:27:15');
INSERT INTO `sys_oper_log` VALUES (55, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentMajor\":1,\"studentPhone\":\"123\",\"studentEmail\":\"123\",\"studentDesc\":\"123\",\"skill\":\"1,3,4\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-16 11:27:56');
INSERT INTO `sys_oper_log` VALUES (56, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"1\",\"3\"],\"studentPhone\":\"123\"}', 'null', 1, '', '2021-02-16 12:43:54');
INSERT INTO `sys_oper_log` VALUES (57, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"772788236@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\",\"4\"],\"studentPhone\":\"18976789671\"}', 'null', 1, '', '2021-02-16 13:19:41');
INSERT INTO `sys_oper_log` VALUES (58, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"772788236@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\",\"4\"],\"studentPhone\":\"18976789671\"}', 'null', 1, '', '2021-02-16 13:20:05');
INSERT INTO `sys_oper_log` VALUES (59, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"772788236@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\",\"4\"],\"studentPhone\":\"18976789671\"}', 'null', 1, '', '2021-02-16 13:22:32');
INSERT INTO `sys_oper_log` VALUES (60, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\",\"4\"],\"studentPhone\":\"18976789671\"}', 'null', 1, '', '2021-02-16 13:26:54');
INSERT INTO `sys_oper_log` VALUES (61, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1613037697000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[3],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"西南林业大学\",\"leader\":\"西南林业大学\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[102],\"createTime\":1613037697000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-16 13:28:35');
INSERT INTO `sys_oper_log` VALUES (62, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1613037697000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[3],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"西南林业大学\",\"leader\":\"西南林业大学\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[102],\"createTime\":1613037697000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-16 13:28:35');
INSERT INTO `sys_oper_log` VALUES (63, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/2', '127.0.0.1', '内网IP', '{roleIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-16 13:28:46');
INSERT INTO `sys_oper_log` VALUES (64, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":102,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"5\",\"deptCheckStrictly\":true,\"createTime\":1613196521000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"member\",\"roleName\":\"课题成员\",\"menuIds\":[2002,2003],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-16 13:28:57');
INSERT INTO `sys_oper_log` VALUES (65, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/2', '127.0.0.1', '内网IP', '{userIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-16 13:29:27');
INSERT INTO `sys_oper_log` VALUES (66, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"phonenumber\":\"18976789671\",\"admin\":false,\"remark\":\"123\",\"password\":\"$2a$10$y60Rg9G81s1mxZeROy3b/.teMrlbV.v2uxMsyBLmNuf.bRETLBLaq\",\"postIds\":[3],\"email\":\"7727@qq.com\",\"nickName\":\"测试学生\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"student\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[102],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-16 13:30:12');
INSERT INTO `sys_oper_log` VALUES (67, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'student', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\"],\"studentPhone\":\"123\"}', 'null', 1, '', '2021-02-16 13:31:00');
INSERT INTO `sys_oper_log` VALUES (68, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'student', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\"],\"studentPhone\":\"123\"}', 'null', 1, '', '2021-02-16 13:31:22');
INSERT INTO `sys_oper_log` VALUES (69, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"切我\",\"studentEmail\":\"234\",\"studentMajor\":\"1\",\"skill\":[\"0\"],\"studentPhone\":\"189\"}', 'null', 1, '', '2021-02-16 13:35:50');
INSERT INTO `sys_oper_log` VALUES (70, '课题管理', 1, 'com.ruoyi.web.controller.task.TaskController.addTask()', 'POST', 1, 'admin', NULL, '/task/add', '127.0.0.1', '内网IP', '{\"params\":{},\"taskDesc\":\"123\",\"createBy\":\"admin\",\"taskType\":\"0\",\"taskName\":\"123\",\"taskNum\":1,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-16 13:36:07');
INSERT INTO `sys_oper_log` VALUES (71, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"切我\",\"studentEmail\":\"234\",\"studentMajor\":\"1\",\"skill\":[\"0\"],\"studentPhone\":\"189\"}', 'null', 1, '', '2021-02-16 13:39:01');
INSERT INTO `sys_oper_log` VALUES (72, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123123\",\"studentEmail\":\"7727@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\"],\"studentPhone\":\"18976789671\"}', 'null', 1, '', '2021-02-17 09:59:55');
INSERT INTO `sys_oper_log` VALUES (73, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123123\",\"studentEmail\":\"7727@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-17 10:02:38');
INSERT INTO `sys_oper_log` VALUES (74, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123123\",\"studentEmail\":\"7727@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-17 10:02:48');
INSERT INTO `sys_oper_log` VALUES (75, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"1\",\"4\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-17 10:03:10');
INSERT INTO `sys_oper_log` VALUES (76, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"1\",\"4\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-17 10:03:16');
INSERT INTO `sys_oper_log` VALUES (77, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"1\",\"4\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-17 10:04:44');
INSERT INTO `sys_oper_log` VALUES (78, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123\",\"studentMajor\":\"1\",\"skill\":[\"1\",\"0\",\"2\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-17 10:50:30');
INSERT INTO `sys_oper_log` VALUES (79, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123\",\"studentMajor\":\"1\",\"skill\":[\"1\",\"0\",\"2\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-17 10:53:37');
INSERT INTO `sys_oper_log` VALUES (80, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123\",\"studentMajor\":\"1\",\"skill\":[\"1\",\"0\",\"2\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-17 10:54:16');
INSERT INTO `sys_oper_log` VALUES (81, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123\",\"studentMajor\":\"1\",\"skill\":[\"1\",\"0\",\"2\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2021-02-17 10:55:48');
INSERT INTO `sys_oper_log` VALUES (82, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123\",\"studentMajor\":\"1\",\"skill\":[\"1\",\"0\",\"2\"],\"studentPhone\":\"18976789671\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Incorrect integer value: \'admin\' for column \'student_id\' at row 1\r\n### The error may exist in file [E:\\JavaProject\\zxy\\ruoyi\\RuoYi-Vue\\ruoyi-system\\target\\classes\\mapper\\rearch\\RearchMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.RearchMapper.addRearch-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into rearch_info(student_id,student_name,student_major,student_phone,student_email,skill,student_desc,status,is_delete,create_by,create_time)         values (?,?,?,?,?,?,?,\'0\',\'0\',?,sysdate())\r\n### Cause: java.sql.SQLException: Incorrect integer value: \'admin\' for column \'student_id\' at row 1\n; uncategorized SQLException; SQL state [HY000]; error code [1366]; Incorrect integer value: \'admin\' for column \'student_id\' at row 1; nested exception is java.sql.SQLException: Incorrect integer value: \'admin\' for column \'student_id\' at row 1', '2021-02-17 10:57:17');
INSERT INTO `sys_oper_log` VALUES (83, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123\",\"studentMajor\":\"1\",\"skill\":[\"1\",\"0\",\"2\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-17 10:58:05');
INSERT INTO `sys_oper_log` VALUES (84, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"189\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"3\",\"4\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-17 11:07:21');
INSERT INTO `sys_oper_log` VALUES (85, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"132\",\"studentEmail\":\"123\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\",\"4\"],\"studentPhone\":\"123\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-17 11:08:07');
INSERT INTO `sys_oper_log` VALUES (86, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123456\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"1\",\"4\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-17 11:10:03');
INSERT INTO `sys_oper_log` VALUES (87, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"132\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\",\"3\",\"4\",\"5\",\"1\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-02-17 11:29:14');
INSERT INTO `sys_oper_log` VALUES (88, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'rearch_info', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-03 15:13:55');
INSERT INTO `sys_oper_log` VALUES (89, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-03-03 15:13:58');
INSERT INTO `sys_oper_log` VALUES (90, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"2\",\"menuName\":\"助研信息列表\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"info\",\"component\":\"rearch/info\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-03 15:22:26');
INSERT INTO `sys_oper_log` VALUES (91, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"2\",\"menuName\":\"助研信息列表\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"rearch\",\"component\":\"rearch/info\",\"children\":[],\"createTime\":1614756146000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2004,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-03 15:22:45');
INSERT INTO `sys_oper_log` VALUES (92, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"2\",\"menuName\":\"助研信息列表\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"rearch/info\",\"component\":\"rearch/info\",\"children\":[],\"createTime\":1614756146000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2004,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-03 15:23:53');
INSERT INTO `sys_oper_log` VALUES (93, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"2\",\"menuName\":\"助研信息列表\",\"params\":{},\"parentId\":2002,\"isCache\":\"0\",\"path\":\"rearchInfo\",\"component\":\"rearch/info\",\"children\":[],\"createTime\":1614756146000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2004,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-03 15:24:31');
INSERT INTO `sys_oper_log` VALUES (94, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"学生专业\",\"params\":{},\"dictType\":\"student_major\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-03 15:31:54');
INSERT INTO `sys_oper_log` VALUES (95, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"student_major\",\"dictLabel\":\"计算机科学与技术\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-03 15:32:24');
INSERT INTO `sys_oper_log` VALUES (96, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":1,\"params\":{},\"dictType\":\"student_major\",\"dictLabel\":\"物联网应用技术\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-03 15:32:34');
INSERT INTO `sys_oper_log` VALUES (97, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":2,\"params\":{},\"dictType\":\"student_major\",\"dictLabel\":\"软件工程\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-03 15:32:48');
INSERT INTO `sys_oper_log` VALUES (98, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentEmail\":\"yyl7727@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"1\",\"2\",\"3\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-05 08:46:18');
INSERT INTO `sys_oper_log` VALUES (99, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'admin', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentEmail\":\"yyl7727@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-05 08:51:54');
INSERT INTO `sys_oper_log` VALUES (100, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"助研信息状态\",\"params\":{},\"dictType\":\"rearch_status\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-05 16:15:53');
INSERT INTO `sys_oper_log` VALUES (101, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"rearch_status\",\"dictLabel\":\"已发布\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-05 16:16:11');
INSERT INTO `sys_oper_log` VALUES (102, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"params\":{},\"dictType\":\"rearch_status\",\"dictLabel\":\"已申请\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-05 16:16:30');
INSERT INTO `sys_oper_log` VALUES (103, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":2,\"params\":{},\"dictType\":\"rearch_status\",\"dictLabel\":\"申请成功\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-05 16:16:49');
INSERT INTO `sys_oper_log` VALUES (104, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":3,\"params\":{},\"dictType\":\"rearch_status\",\"dictLabel\":\"申请失败\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-05 16:17:00');
INSERT INTO `sys_oper_log` VALUES (105, '课题管理', 1, 'com.ruoyi.web.controller.task.TaskController.addTask()', 'POST', 1, 'admin', NULL, '/task/add', '127.0.0.1', '内网IP', '{\"params\":{},\"createBy\":\"admin\",\"taskType\":\"0\",\"taskName\":\"测试课题\",\"taskNum\":10,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-05 23:27:55');
INSERT INTO `sys_oper_log` VALUES (106, '定时任务', 1, 'com.ruoyi.quartz.controller.SysJobController.add()', 'POST', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"jobName\":\"定期获取消息通知\",\"concurrent\":\"1\",\"jobGroup\":\"DEFAULT\",\"params\":{},\"cronExpression\":\"0/20 * * * * ? *\",\"jobId\":100,\"createBy\":\"admin\",\"nextValidTime\":1615110520000,\"invokeTarget\":\"/notice/getMessage\",\"misfirePolicy\":\"1\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-07 17:48:25');
INSERT INTO `sys_oper_log` VALUES (107, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":3,\"params\":{},\"dictType\":\"sys_notice_type\",\"dictLabel\":\"私信\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-08 20:26:21');
INSERT INTO `sys_oper_log` VALUES (108, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeContent\":\"<p>通知系统开始使用</p>\",\"createBy\":\"admin\",\"noticeType\":\"2\",\"params\":{},\"noticeTitle\":\"123\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-08 20:35:36');
INSERT INTO `sys_oper_log` VALUES (109, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$hc3fRMjvWmsTzhGYGUILVe9M9FKmnS08sKYspzo6T1Fgo7n0V9Qs2\",\"updateBy\":\"admin\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-08 20:36:23');
INSERT INTO `sys_oper_log` VALUES (110, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/101,102', '127.0.0.1', '内网IP', '{roleIds=101,102}', 'null', 1, '课题成员已分配,不能删除', '2021-03-08 20:37:33');
INSERT INTO `sys_oper_log` VALUES (111, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":102,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"5\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"member\",\"roleName\":\"课题成员\",\"status\":\"0\"}],\"phonenumber\":\"18976789671\",\"admin\":false,\"remark\":\"123\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"7727@qq.com\",\"nickName\":\"测试学生\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"西南林业大学\",\"leader\":\"西南林业大学\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"student\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1613453412000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-08 20:37:57');
INSERT INTO `sys_oper_log` VALUES (112, '角色管理', 3, 'com.ruoyi.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/system/role/101,102', '127.0.0.1', '内网IP', '{roleIds=101,102}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-08 20:38:07');
INSERT INTO `sys_oper_log` VALUES (113, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"student\",\"roleName\":\"学生\",\"deptIds\":[],\"menuIds\":[1,107,2002,1036,2004],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-08 20:38:54');
INSERT INTO `sys_oper_log` VALUES (114, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[],\"phonenumber\":\"18976789671\",\"admin\":false,\"remark\":\"123\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"7727@qq.com\",\"nickName\":\"测试学生\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"西南林业大学\",\"leader\":\"西南林业大学\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"student\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[103],\"createTime\":1613453412000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-08 20:40:19');
INSERT INTO `sys_oper_log` VALUES (115, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/10', '127.0.0.1', '内网IP', '{noticeIds=10}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-09 16:24:50');
INSERT INTO `sys_oper_log` VALUES (116, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"1\",\"params\":{},\"noticeTitle\":\"1\",\"noticeContent\":\"<p>123</p>\",\"createBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-09 16:24:57');
INSERT INTO `sys_oper_log` VALUES (117, '通知公告', 3, 'com.ruoyi.web.controller.system.SysNoticeController.remove()', 'DELETE', 1, 'admin', NULL, '/system/notice/11', '127.0.0.1', '内网IP', '{noticeIds=11}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-09 16:25:24');
INSERT INTO `sys_oper_log` VALUES (118, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"1\",\"params\":{},\"noticeTitle\":\"123\",\"noticeContent\":\"<p>123</p>\",\"createBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-09 16:28:06');
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"dictSort\":4,\"params\":{},\"dictType\":\"sys_notice_type\",\"dictLabel\":\"邀请\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-09 16:31:04');
INSERT INTO `sys_oper_log` VALUES (120, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"5\",\"dictSort\":5,\"params\":{},\"dictType\":\"sys_notice_type\",\"dictLabel\":\"申请\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-09 16:31:16');
INSERT INTO `sys_oper_log` VALUES (121, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"4\",\"params\":{},\"noticeTitle\":\"123\",\"noticeContent\":\"<p>123</p>\",\"status\":\"0\"}', '{\"msg\":\"只能由对应功能发出申请信息或邀请信息，请选择其他公告类型！\",\"code\":500}', 0, NULL, '2021-03-09 16:36:55');
INSERT INTO `sys_oper_log` VALUES (122, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"createTime\":1615207134000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"student\",\"roleName\":\"学生\",\"menuIds\":[1,107,2002,1036,2003],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-10 10:53:57');
INSERT INTO `sys_oper_log` VALUES (123, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'student', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"我是一个勤奋好学的学生，且展业技术水平十分出色，无论什么任务都能准时完成。\",\"studentEmail\":\"772788236@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"1\",\"2\",\"3\",\"4\",\"5\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-10 10:55:07');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '10.254.72.200', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"同意邀请\",\"params\":{},\"parentId\":107,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:notice:yes\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-12 10:28:06');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '10.254.72.200', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"6\",\"menuName\":\"拒绝邀请\",\"params\":{},\"parentId\":107,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:notice:no\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-12 10:28:40');
INSERT INTO `sys_oper_log` VALUES (126, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '10.254.72.200', '内网IP', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"createTime\":1615207134000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"student\",\"roleName\":\"学生\",\"menuIds\":[1,107,2002,1036,2005,2006,2003],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-03-12 10:29:18');
INSERT INTO `sys_oper_log` VALUES (127, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '10.254.72.200', '内网IP', '{\"updateBy\":\"student\",\"params\":{},\"userId\":\"student\",\"noticeId\":0}', 'null', 1, 'nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'noticeContent\' in \'class com.ruoyi.system.domain.request.SysNoticeRequest\'', '2021-03-12 15:39:58');
INSERT INTO `sys_oper_log` VALUES (128, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '10.254.72.200', '内网IP', '{\"updateBy\":\"student\",\"params\":{},\"userId\":\"student\",\"noticeId\":0}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user_id\' in \'where clause\'\r\n### The error may exist in file [E:\\zxy\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\system\\SysNoticeMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysNoticeMapper.setRead-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_notice          SET update_by = ?,             update_time = sysdate()          where notice_id = ?         and user_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'user_id\' in \'where clause\'', '2021-03-12 15:49:23');
INSERT INTO `sys_oper_log` VALUES (129, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '10.254.72.200', '内网IP', '{\"updateBy\":\"student\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"19\"}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user_id\' in \'where clause\'\r\n### The error may exist in file [E:\\zxy\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\system\\SysNoticeMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysNoticeMapper.setRead-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_notice          SET update_by = ?,             update_time = sysdate()          where notice_id = ?         and user_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: Unknown column \'user_id\' in \'where clause\'\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: Unknown column \'user_id\' in \'where clause\'', '2021-03-12 16:03:19');
INSERT INTO `sys_oper_log` VALUES (130, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '10.254.72.200', '内网IP', '{\"updateBy\":\"student\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"19\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-03-12 16:08:33');
INSERT INTO `sys_oper_log` VALUES (131, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '10.254.72.200', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"19\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-03-12 16:12:40');
INSERT INTO `sys_oper_log` VALUES (132, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '10.254.72.200', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"19\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-03-12 16:14:07');
INSERT INTO `sys_oper_log` VALUES (133, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"19\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-03-15 16:41:59');
INSERT INTO `sys_oper_log` VALUES (134, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"19\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-03-15 16:57:30');
INSERT INTO `sys_oper_log` VALUES (135, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"19\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-03-15 16:57:50');
INSERT INTO `sys_oper_log` VALUES (136, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1613190926000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"menuIds\":[1,107,2002,1036,1037,1038,1039,2000,2001,2004],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:05:45');
INSERT INTO `sys_oper_log` VALUES (137, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"createTime\":1615207134000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"student\",\"roleName\":\"学生\",\"menuIds\":[1,107,2002,1036,2005,2006,2003],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:06:09');
INSERT INTO `sys_oper_log` VALUES (138, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":104,\"admin\":false,\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"root\",\"roleName\":\"管理员\",\"deptIds\":[],\"menuIds\":[1,2,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,107,1036,1037,1038,1039,2005,2006,108,500,1040,1041,1042,501,1043,1044,1045,2000,2001,109,1046,1047,1048,111,112,113,2002,2003,2004],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:06:49');
INSERT INTO `sys_oper_log` VALUES (139, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$E1AyEYIlKxf2eC1GI36sROBt1m20q1Ti8vqZCZs8S9OSQd8UaM6nu\",\"postIds\":[],\"nickName\":\"系统管理员\",\"deptId\":100,\"params\":{},\"userName\":\"root\",\"userId\":101,\"createBy\":\"admin\",\"roleIds\":[104],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:07:19');
INSERT INTO `sys_oper_log` VALUES (140, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$JvhApvOuwlTo90eusecKF.s/205bWKSWwf/dw9cxMAQDV0ZPKFUXS\",\"postIds\":[],\"nickName\":\"测试教师\",\"deptId\":100,\"params\":{},\"userName\":\"teacher\",\"userId\":102,\"createBy\":\"admin\",\"roleIds\":[100],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:07:51');
INSERT INTO `sys_oper_log` VALUES (141, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'root', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"root\",\"params\":{},\"userId\":100,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:11:47');
INSERT INTO `sys_oper_log` VALUES (142, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'root', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"root\",\"params\":{},\"userId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:11:51');
INSERT INTO `sys_oper_log` VALUES (143, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'root', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":103,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"student\",\"roleName\":\"学生\",\"status\":\"0\"}],\"phonenumber\":\"18976789671\",\"admin\":false,\"remark\":\"123\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"root\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"123@qq.com\",\"nickName\":\"测试学生\",\"sex\":\"0\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"西南林业大学\",\"leader\":\"西南林业大学\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"student\",\"userId\":100,\"createBy\":\"admin\",\"roleIds\":[103],\"createTime\":1613453412000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:12:01');
INSERT INTO `sys_oper_log` VALUES (144, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'root', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$I/XdjkthU7kKSg7v6FJlAOMIcy8yg7YgWLaxwHHSVWX1lGpAgnWuC\",\"updateBy\":\"root\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:12:11');
INSERT INTO `sys_oper_log` VALUES (145, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'GET', 1, 'root', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"b2243312-9d9e-4def-948d-f90daf7e7e66_用户数据.xlsx\",\"code\":200}', 0, NULL, '2021-04-02 15:12:21');
INSERT INTO `sys_oper_log` VALUES (146, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'student', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\",\"4\",\"3\"],\"studentPhone\":\"18912345644\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:16:21');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"新增\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"createBy\":\"root\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"task:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:18:34');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'root', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"新增\",\"params\":{},\"parentId\":2001,\"isCache\":\"0\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"task:add\",\"status\":\"0\"}', '{\"msg\":\"新增菜单\'新增\'失败，菜单名称已存在\",\"code\":500}', 0, NULL, '2021-04-02 15:19:21');
INSERT INTO `sys_oper_log` VALUES (149, '课题管理', 3, 'com.ruoyi.web.controller.task.TaskController.deleteTaskByIds()', 'POST', 1, 'teacher', NULL, '/task/deleteByIds', '127.0.0.1', '内网IP', '[10]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:25:01');
INSERT INTO `sys_oper_log` VALUES (150, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'root', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"root\",\"params\":{},\"userId\":100,\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:58:04');
INSERT INTO `sys_oper_log` VALUES (151, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'root', NULL, '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"updateBy\":\"root\",\"params\":{},\"userId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:58:06');
INSERT INTO `sys_oper_log` VALUES (152, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'root', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$KTY20eqna3IgEoPAUEHE6uYyUoopK.tfBnj60evs.Wq3mgO2fN/ju\",\"updateBy\":\"root\",\"params\":{},\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 15:58:14');
INSERT INTO `sys_oper_log` VALUES (153, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'GET', 1, 'root', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"f22e2fae-74f7-40ba-9fda-d446cb53bf3b_用户数据.xlsx\",\"code\":200}', 0, NULL, '2021-04-02 15:58:21');
INSERT INTO `sys_oper_log` VALUES (154, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'root', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"1\",\"params\":{},\"noticeTitle\":\"123\",\"noticeContent\":\"<p>123</p>\",\"createBy\":\"root\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 16:00:19');
INSERT INTO `sys_oper_log` VALUES (155, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'student', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"本次演示的测试助研信息\",\"studentEmail\":\"123@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\",\"3\",\"4\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 16:01:32');
INSERT INTO `sys_oper_log` VALUES (156, '课题管理', 1, 'com.ruoyi.web.controller.task.TaskController.addTask()', 'POST', 1, 'teacher', NULL, '/task/add', '127.0.0.1', '内网IP', '{\"params\":{},\"taskDesc\":\"本次演示的测试课题\",\"createBy\":\"teacher\",\"taskType\":\"0\",\"taskName\":\"本次演示的测试课题\",\"taskNum\":12,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-02 16:02:07');
INSERT INTO `sys_oper_log` VALUES (157, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"21\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-07 10:35:46');
INSERT INTO `sys_oper_log` VALUES (158, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"19\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-07 10:35:49');
INSERT INTO `sys_oper_log` VALUES (159, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/114', '127.0.0.1', '内网IP', '{dictCodes=114}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-07 10:40:45');
INSERT INTO `sys_oper_log` VALUES (160, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"rearch_status\",\"dictLabel\":\"有效\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1614932171000,\"dictCode\":111,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-07 10:41:06');
INSERT INTO `sys_oper_log` VALUES (161, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"params\":{},\"dictType\":\"rearch_status\",\"dictLabel\":\"失效\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1614932190000,\"dictCode\":112,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-07 10:41:14');
INSERT INTO `sys_oper_log` VALUES (162, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/113', '127.0.0.1', '内网IP', '{dictCodes=113}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-07 10:41:18');
INSERT INTO `sys_oper_log` VALUES (163, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.clearCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/clearCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-07 10:41:24');
INSERT INTO `sys_oper_log` VALUES (164, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'student', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"这是一条测试助研信息数据这是一条测试助研信息数据这是一条测试助研信息数据\",\"studentEmail\":\"123@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"2\",\"3\",\"4\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-07 14:59:44');
INSERT INTO `sys_oper_log` VALUES (165, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-07 15:02:49');
INSERT INTO `sys_oper_log` VALUES (166, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-07 15:02:58');
INSERT INTO `sys_oper_log` VALUES (167, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"noticeType\":\"1\",\"params\":{},\"noticeTitle\":\"系统正式使用\",\"noticeContent\":\"<p>从2021/04/07开始系统正式投入使用</p>\",\"createBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-07 15:25:35');
INSERT INTO `sys_oper_log` VALUES (168, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-07 15:27:26');
INSERT INTO `sys_oper_log` VALUES (169, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-07 15:27:29');
INSERT INTO `sys_oper_log` VALUES (170, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-07 15:27:36');
INSERT INTO `sys_oper_log` VALUES (171, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'student', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"测试助研信息二\",\"studentEmail\":\"123@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"1\",\"0\",\"2\",\"4\"],\"studentPhone\":\"18976789671\"}', 'null', 1, '\r\n### Error querying database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') from rearch_info t\n        where t.is_delete = 0 and t.status = 0 and t.studen\' at line 1\r\n### The error may exist in file [E:\\zxy\\ruoyi\\ruoyi-system\\target\\classes\\mapper\\rearch\\RearchMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.RearchMapper.checkExist-Inline\r\n### The error occurred while setting parameters\r\n### SQL: select count() from rearch_info t         where t.is_delete = 0 and t.status = 0 and t.student_id = ?\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') from rearch_info t\n        where t.is_delete = 0 and t.status = 0 and t.studen\' at line 1\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \') from rearch_info t\n        where t.is_delete = 0 and t.status = 0 and t.studen\' at line 1', '2021-04-07 16:42:11');
INSERT INTO `sys_oper_log` VALUES (172, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'student', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"测试助研信息二\",\"studentEmail\":\"123@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"1\",\"0\",\"2\",\"4\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-07 16:44:58');
INSERT INTO `sys_oper_log` VALUES (173, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'student', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"测试测试测试测试测试测试测试测试测试测试\",\"studentEmail\":\"123@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"1\",\"3\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"存在有效的助研信息，无法同时存在多个状态为有效的助研信息！\",\"code\":500}', 0, NULL, '2021-04-07 16:45:18');
INSERT INTO `sys_oper_log` VALUES (174, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'student', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"student\",\"isRead\":\"1\",\"params\":{},\"userId\":\"student\",\"noticeId\":\"24\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-07 16:49:51');
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"list\",\"orderNum\":\"2\",\"menuName\":\"课题列表\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"list\",\"component\":\"task/list\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-08 15:04:47');
INSERT INTO `sys_oper_log` VALUES (176, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"createTime\":1615207134000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"student\",\"roleName\":\"学生\",\"menuIds\":[1,107,2000,2002,1036,2005,2006,2007,2003],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-08 15:05:18');
INSERT INTO `sys_oper_log` VALUES (177, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"password\":\"$2a$10$NL86MvX.oryCevOsDx8iiugBFT3O5uIXzbynYalnsDSjf5RYP4.YG\",\"postIds\":[1],\"nickName\":\"测试教师2\",\"sex\":\"0\",\"deptId\":100,\"params\":{},\"userName\":\"teacher1\",\"userId\":103,\"createBy\":\"admin\",\"roleIds\":[100],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-08 16:09:38');
INSERT INTO `sys_oper_log` VALUES (178, '课题管理', 1, 'com.ruoyi.web.controller.task.TaskController.addTask()', 'POST', 1, 'teacher1', NULL, '/task/add', '127.0.0.1', '内网IP', '{\"params\":{},\"taskDesc\":\"测试教师1的课题\",\"createBy\":\"teacher1\",\"taskType\":\"0\",\"taskName\":\"测试教师1的课题\",\"taskNum\":10,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-08 16:10:15');
INSERT INTO `sys_oper_log` VALUES (179, '助研信息', 1, 'com.ruoyi.web.controller.rearch.RearchController.add()', 'POST', 1, 'student', NULL, '/rearch/add', '127.0.0.1', '内网IP', '{\"studentDesc\":\"123\",\"studentEmail\":\"123@qq.com\",\"studentMajor\":\"1\",\"skill\":[\"0\",\"1\"],\"studentPhone\":\"18976789671\"}', '{\"msg\":\"存在有效的助研信息，无法同时存在多个状态为有效的助研信息！\",\"code\":500}', 0, NULL, '2021-04-08 16:14:55');
INSERT INTO `sys_oper_log` VALUES (180, '课题管理', 2, 'com.ruoyi.web.controller.task.TaskController.changeStatus()', 'PUT', 1, 'teacher', NULL, '/task/changeStatus', '127.0.0.1', '内网IP', '{\"params\":{},\"updateBy\":\"teacher\",\"taskId\":\"11\",\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-09 09:24:54');
INSERT INTO `sys_oper_log` VALUES (181, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'student', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2021/04/09/8a59fdcb-9f8f-4d7e-b105-aab218c9481f.jpeg\",\"code\":200}', 0, NULL, '2021-04-09 09:27:52');
INSERT INTO `sys_oper_log` VALUES (182, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'student', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":103,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"student\",\"roleName\":\"学生\",\"status\":\"0\"}],\"phonenumber\":\"18976789671\",\"admin\":false,\"remark\":\"123\",\"delFlag\":\"0\",\"loginIp\":\"\",\"email\":\"123@qq.com\",\"nickName\":\"测试学生\",\"sex\":\"1\",\"deptId\":100,\"avatar\":\"\",\"dept\":{\"deptName\":\"西南林业大学\",\"leader\":\"西南林业大学\",\"deptId\":100,\"orderNum\":\"0\",\"params\":{},\"parentId\":0,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"student\",\"userId\":100,\"createBy\":\"admin\",\"createTime\":1613453412000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-09 09:28:12');
INSERT INTO `sys_oper_log` VALUES (183, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'teacher1', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"teacher1\",\"isRead\":\"1\",\"params\":{},\"userId\":\"teacher1\",\"noticeId\":\"27\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-12 09:57:12');
INSERT INTO `sys_oper_log` VALUES (184, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1613190926000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"menuIds\":[1,2000,2002,107,1036,1037,1038,1039,2005,2006,2001,2004],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-13 15:22:42');
INSERT INTO `sys_oper_log` VALUES (185, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'teacher1', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"teacher1\",\"isRead\":\"1\",\"params\":{},\"userId\":\"teacher1\",\"noticeId\":\"27\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-13 16:29:16');
INSERT INTO `sys_oper_log` VALUES (186, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'teacher1', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"teacher1\",\"isRead\":\"1\",\"params\":{},\"userId\":\"teacher1\",\"noticeId\":\"27\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-15 09:20:13');
INSERT INTO `sys_oper_log` VALUES (187, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'teacher1', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"teacher1\",\"isRead\":\"1\",\"params\":{},\"userId\":\"teacher1\",\"noticeId\":\"27\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-16 17:06:36');
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"3\",\"menuName\":\"工作日志\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"workLog\",\"component\":\"task/workLog\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-23 11:02:16');
INSERT INTO `sys_oper_log` VALUES (189, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"createTime\":1615207134000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"student\",\"roleName\":\"学生\",\"menuIds\":[1,107,2000,2002,1036,2005,2006,2007,2008,2003],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-26 20:16:35');
INSERT INTO `sys_oper_log` VALUES (190, '通知公告', 2, 'com.ruoyi.web.controller.system.SysNoticeController.setRead()', 'PUT', 1, 'teacher1', NULL, '/system/notice/setRead', '127.0.0.1', '内网IP', '{\"updateBy\":\"teacher1\",\"isRead\":\"1\",\"params\":{},\"userId\":\"teacher1\",\"noticeId\":\"28\"}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":1}', 0, NULL, '2021-04-26 21:31:21');
INSERT INTO `sys_oper_log` VALUES (191, '工作日志', 1, 'com.ruoyi.web.controller.task.WorkLogController.addWorkLog()', 'POST', 1, 'student', NULL, '/workLog/add', '127.0.0.1', '内网IP', '{\"createBy\":\"student\",\"logContent\":\"<p>test</p>\",\"params\":{},\"taskId\":12,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-26 22:52:36');
INSERT INTO `sys_oper_log` VALUES (192, '工作日志', 1, 'com.ruoyi.web.controller.task.WorkLogController.addWorkLog()', 'POST', 1, 'student', NULL, '/workLog/add', '127.0.0.1', '内网IP', '{\"createBy\":\"student\",\"logContent\":\"<p>test222</p>\",\"params\":{},\"taskId\":12,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-26 22:57:25');
INSERT INTO `sys_oper_log` VALUES (193, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1613190926000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"menuIds\":[1,2000,2002,107,1036,1037,1038,1039,2005,2006,2001,2008,2004],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-27 14:38:11');
INSERT INTO `sys_oper_log` VALUES (194, '工作日志', 2, 'com.ruoyi.web.controller.task.WorkLogController.updateWorkLog()', 'PUT', 1, 'student', NULL, '/workLog/update', '127.0.0.1', '内网IP', '{\"createBy\":\"student\",\"createTime\":1619448756000,\"logContent\":\"<p>ttttt</p>\",\"updateBy\":\"student\",\"isDelete\":\"0\",\"params\":{},\"taskId\":12,\"status\":\"0\",\"workLogId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-27 17:08:25');
INSERT INTO `sys_oper_log` VALUES (195, '工作日志', 2, 'com.ruoyi.web.controller.task.WorkLogController.deleteWorkLog()', 'PUT', 1, 'teacher1', NULL, '/workLog/delete', '127.0.0.1', '内网IP', '[\"1\"]', 'null', 1, 'nested exception is org.apache.ibatis.binding.BindingException: Parameter \'array\' not found. Available parameters are [updateBy, ids, param1, param2]', '2021-04-28 15:21:59');
INSERT INTO `sys_oper_log` VALUES (196, '工作日志', 2, 'com.ruoyi.web.controller.task.WorkLogController.deleteWorkLog()', 'PUT', 1, 'teacher1', NULL, '/workLog/delete', '127.0.0.1', '内网IP', '[\"1\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-28 15:23:53');
INSERT INTO `sys_oper_log` VALUES (197, '工作日志', 2, 'com.ruoyi.web.controller.task.WorkLogController.deleteWorkLog()', 'PUT', 1, 'teacher1', NULL, '/workLog/delete', '127.0.0.1', '内网IP', '[\"2\",\"3\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-28 15:23:57');
INSERT INTO `sys_oper_log` VALUES (198, '工作日志', 2, 'com.ruoyi.web.controller.task.WorkLogController.deleteWorkLog()', 'PUT', 1, 'teacher1', NULL, '/workLog/delete', '127.0.0.1', '内网IP', '[\"1\",\"2\",\"3\"]', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-28 15:24:23');
INSERT INTO `sys_oper_log` VALUES (199, '工作日志', 2, 'com.ruoyi.web.controller.task.WorkLogController.updateWorkLog()', 'PUT', 1, 'student', NULL, '/workLog/update', '127.0.0.1', '内网IP', '{\"createBy\":\"student\",\"createTime\":1619449044000,\"logContent\":\"<p>test33333</p>\",\"updateBy\":\"student\",\"isDelete\":\"0\",\"updateTime\":1619594663000,\"params\":{},\"taskId\":12,\"status\":\"1\",\"workLogId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-28 15:40:56');
INSERT INTO `sys_oper_log` VALUES (200, '工作日志', 2, 'com.ruoyi.web.controller.task.WorkLogController.updateWorkLog()', 'PUT', 1, 'student', NULL, '/workLog/update', '127.0.0.1', '内网IP', '{\"createBy\":\"student\",\"createTime\":1619449044000,\"logContent\":\"<p>test33333</p>\",\"updateBy\":\"student\",\"isDelete\":\"0\",\"updateTime\":1619595656000,\"params\":{},\"taskId\":12,\"status\":\"0\",\"workLogId\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-28 15:41:04');
INSERT INTO `sys_oper_log` VALUES (201, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'task_member', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-28 19:53:17');
INSERT INTO `sys_oper_log` VALUES (202, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2021-04-28 19:53:20');
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"peoples\",\"orderNum\":\"4\",\"menuName\":\"课题成员\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"taskMember\",\"component\":\"task/taskMember\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-28 19:57:15');
INSERT INTO `sys_oper_log` VALUES (204, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1613190926000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"teacher\",\"roleName\":\"教师\",\"menuIds\":[1,2000,2002,107,1036,1037,1038,1039,2005,2006,2001,2008,2009,2004],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-28 21:40:19');
INSERT INTO `sys_oper_log` VALUES (205, '课题成员', 1, 'com.ruoyi.web.controller.task.TaskController.addTaskMember()', 'POST', 1, 'teacher1', NULL, '/task/member/add', '127.0.0.1', '内网IP', '{\"createBy\":\"teacher1\",\"studentName\":\"student1\",\"params\":{},\"taskId\":\"12\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-29 17:20:09');
INSERT INTO `sys_oper_log` VALUES (206, '课题成员', 1, 'com.ruoyi.web.controller.task.TaskController.addTaskMember()', 'POST', 1, 'teacher1', NULL, '/task/member/add', '127.0.0.1', '内网IP', '{\"createBy\":\"teacher1\",\"studentName\":\"student2\",\"params\":{},\"taskId\":\"12\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-04-29 17:21:35');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'teacher', '教师', 1, '0', 'admin', '2021-02-11 18:01:37', 'admin', '2021-02-13 12:26:11', '');
INSERT INTO `sys_post` VALUES (2, 'leader', '课题组长', 2, '0', 'admin', '2021-02-11 18:01:37', 'admin', '2021-02-13 12:27:08', '');
INSERT INTO `sys_post` VALUES (3, 'member', '课题成员', 3, '0', 'admin', '2021-02-11 18:01:37', 'admin', '2021-02-13 12:27:17', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-02-11 18:01:37', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2021-02-11 18:01:37', 'admin', '2021-02-13 14:06:25', '普通角色');
INSERT INTO `sys_role` VALUES (100, '教师', 'teacher', 3, '1', 1, 1, '0', '0', 'admin', '2021-02-13 12:35:26', 'admin', '2021-04-28 21:40:19', NULL);
INSERT INTO `sys_role` VALUES (101, '课题组长', 'leader', 4, '1', 1, 1, '0', '2', 'admin', '2021-02-13 14:08:20', '', NULL, NULL);
INSERT INTO `sys_role` VALUES (102, '课题成员', 'member', 5, '1', 1, 1, '0', '2', 'admin', '2021-02-13 14:08:41', 'admin', '2021-02-16 13:28:57', NULL);
INSERT INTO `sys_role` VALUES (103, '学生', 'student', 4, '1', 1, 1, '0', '0', 'admin', '2021-03-08 20:38:54', 'admin', '2021-04-26 20:16:35', NULL);
INSERT INTO `sys_role` VALUES (104, '管理员', 'root', 4, '1', 1, 1, '0', '0', 'admin', '2021-04-02 15:06:49', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 107);
INSERT INTO `sys_role_menu` VALUES (100, 1036);
INSERT INTO `sys_role_menu` VALUES (100, 1037);
INSERT INTO `sys_role_menu` VALUES (100, 1038);
INSERT INTO `sys_role_menu` VALUES (100, 1039);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2004);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2006);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (103, 1);
INSERT INTO `sys_role_menu` VALUES (103, 107);
INSERT INTO `sys_role_menu` VALUES (103, 1036);
INSERT INTO `sys_role_menu` VALUES (103, 2000);
INSERT INTO `sys_role_menu` VALUES (103, 2002);
INSERT INTO `sys_role_menu` VALUES (103, 2003);
INSERT INTO `sys_role_menu` VALUES (103, 2005);
INSERT INTO `sys_role_menu` VALUES (103, 2006);
INSERT INTO `sys_role_menu` VALUES (103, 2007);
INSERT INTO `sys_role_menu` VALUES (103, 2008);
INSERT INTO `sys_role_menu` VALUES (104, 1);
INSERT INTO `sys_role_menu` VALUES (104, 2);
INSERT INTO `sys_role_menu` VALUES (104, 100);
INSERT INTO `sys_role_menu` VALUES (104, 101);
INSERT INTO `sys_role_menu` VALUES (104, 102);
INSERT INTO `sys_role_menu` VALUES (104, 103);
INSERT INTO `sys_role_menu` VALUES (104, 104);
INSERT INTO `sys_role_menu` VALUES (104, 105);
INSERT INTO `sys_role_menu` VALUES (104, 107);
INSERT INTO `sys_role_menu` VALUES (104, 108);
INSERT INTO `sys_role_menu` VALUES (104, 109);
INSERT INTO `sys_role_menu` VALUES (104, 111);
INSERT INTO `sys_role_menu` VALUES (104, 112);
INSERT INTO `sys_role_menu` VALUES (104, 113);
INSERT INTO `sys_role_menu` VALUES (104, 500);
INSERT INTO `sys_role_menu` VALUES (104, 501);
INSERT INTO `sys_role_menu` VALUES (104, 1001);
INSERT INTO `sys_role_menu` VALUES (104, 1002);
INSERT INTO `sys_role_menu` VALUES (104, 1003);
INSERT INTO `sys_role_menu` VALUES (104, 1004);
INSERT INTO `sys_role_menu` VALUES (104, 1005);
INSERT INTO `sys_role_menu` VALUES (104, 1006);
INSERT INTO `sys_role_menu` VALUES (104, 1007);
INSERT INTO `sys_role_menu` VALUES (104, 1008);
INSERT INTO `sys_role_menu` VALUES (104, 1009);
INSERT INTO `sys_role_menu` VALUES (104, 1010);
INSERT INTO `sys_role_menu` VALUES (104, 1011);
INSERT INTO `sys_role_menu` VALUES (104, 1012);
INSERT INTO `sys_role_menu` VALUES (104, 1013);
INSERT INTO `sys_role_menu` VALUES (104, 1014);
INSERT INTO `sys_role_menu` VALUES (104, 1015);
INSERT INTO `sys_role_menu` VALUES (104, 1016);
INSERT INTO `sys_role_menu` VALUES (104, 1017);
INSERT INTO `sys_role_menu` VALUES (104, 1018);
INSERT INTO `sys_role_menu` VALUES (104, 1019);
INSERT INTO `sys_role_menu` VALUES (104, 1020);
INSERT INTO `sys_role_menu` VALUES (104, 1021);
INSERT INTO `sys_role_menu` VALUES (104, 1022);
INSERT INTO `sys_role_menu` VALUES (104, 1023);
INSERT INTO `sys_role_menu` VALUES (104, 1024);
INSERT INTO `sys_role_menu` VALUES (104, 1025);
INSERT INTO `sys_role_menu` VALUES (104, 1026);
INSERT INTO `sys_role_menu` VALUES (104, 1027);
INSERT INTO `sys_role_menu` VALUES (104, 1028);
INSERT INTO `sys_role_menu` VALUES (104, 1029);
INSERT INTO `sys_role_menu` VALUES (104, 1030);
INSERT INTO `sys_role_menu` VALUES (104, 1036);
INSERT INTO `sys_role_menu` VALUES (104, 1037);
INSERT INTO `sys_role_menu` VALUES (104, 1038);
INSERT INTO `sys_role_menu` VALUES (104, 1039);
INSERT INTO `sys_role_menu` VALUES (104, 1040);
INSERT INTO `sys_role_menu` VALUES (104, 1041);
INSERT INTO `sys_role_menu` VALUES (104, 1042);
INSERT INTO `sys_role_menu` VALUES (104, 1043);
INSERT INTO `sys_role_menu` VALUES (104, 1044);
INSERT INTO `sys_role_menu` VALUES (104, 1045);
INSERT INTO `sys_role_menu` VALUES (104, 1046);
INSERT INTO `sys_role_menu` VALUES (104, 1047);
INSERT INTO `sys_role_menu` VALUES (104, 1048);
INSERT INTO `sys_role_menu` VALUES (104, 2000);
INSERT INTO `sys_role_menu` VALUES (104, 2001);
INSERT INTO `sys_role_menu` VALUES (104, 2002);
INSERT INTO `sys_role_menu` VALUES (104, 2003);
INSERT INTO `sys_role_menu` VALUES (104, 2004);
INSERT INTO `sys_role_menu` VALUES (104, 2005);
INSERT INTO `sys_role_menu` VALUES (104, 2006);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-02-11 18:01:37', 'admin', '2021-02-11 18:01:37', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$v8LlI5/RTthKbnREWs590.7yAvJVNo2b0mXW/3rR5JiKPdm1aNr5u', '0', '2', '127.0.0.1', '2021-02-11 18:01:37', 'admin', '2021-02-11 18:01:37', 'admin', '2021-02-16 13:28:35', '测试员');
INSERT INTO `sys_user` VALUES (100, 100, 'student', '测试学生', '00', '123@qq.com', '18976789671', '1', '/profile/avatar/2021/04/09/8a59fdcb-9f8f-4d7e-b105-aab218c9481f.jpeg', '$2a$10$KTY20eqna3IgEoPAUEHE6uYyUoopK.tfBnj60evs.Wq3mgO2fN/ju', '0', '0', '', NULL, 'admin', '2021-02-16 13:30:12', 'root', '2021-04-09 09:28:12', '123');
INSERT INTO `sys_user` VALUES (101, 100, 'root', '系统管理员', '00', '', '', '0', '', '$2a$10$E1AyEYIlKxf2eC1GI36sROBt1m20q1Ti8vqZCZs8S9OSQd8UaM6nu', '0', '0', '', NULL, 'admin', '2021-04-02 15:07:19', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (102, 100, 'teacher', '测试教师', '00', '', '', '0', '', '$2a$10$JvhApvOuwlTo90eusecKF.s/205bWKSWwf/dw9cxMAQDV0ZPKFUXS', '0', '0', '', NULL, 'admin', '2021-04-02 15:07:50', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, 100, 'teacher1', '测试教师2', '00', '', '', '0', '', '$2a$10$NL86MvX.oryCevOsDx8iiugBFT3O5uIXzbynYalnsDSjf5RYP4.YG', '0', '0', '', NULL, 'admin', '2021-04-08 16:09:38', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (103, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (100, 103);
INSERT INTO `sys_user_role` VALUES (101, 104);
INSERT INTO `sys_user_role` VALUES (102, 100);
INSERT INTO `sys_user_role` VALUES (103, 100);

-- ----------------------------
-- Table structure for task_info
-- ----------------------------
DROP TABLE IF EXISTS `task_info`;
CREATE TABLE `task_info`  (
  `task_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课题id',
  `task_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课题名称',
  `task_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课题类型',
  `task_num` int(20) NULL DEFAULT NULL COMMENT '课题人数',
  `task_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课题描述',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '课题状态 0：可选 1：不可选',
  `is_delete` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否删除 0：已删除 1：未删除',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`task_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_info
-- ----------------------------
INSERT INTO `task_info` VALUES (10, '测试课题', '0', 10, NULL, '0', '1', 'admin', '2021-03-05 23:27:55', NULL, NULL);
INSERT INTO `task_info` VALUES (11, '本次演示的测试课题', '0', 12, '本次演示的测试课题', '1', '0', 'teacher', '2021-04-02 16:02:07', 'teacher', '2021-04-09 09:24:53');
INSERT INTO `task_info` VALUES (12, '测试教师1的课题', '0', 10, '测试教师1的课题', '0', '0', 'teacher1', '2021-04-08 16:10:15', NULL, NULL);

-- ----------------------------
-- Table structure for task_member
-- ----------------------------
DROP TABLE IF EXISTS `task_member`;
CREATE TABLE `task_member`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) NOT NULL COMMENT '课题id',
  `student_username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生用户名',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 0待加入 1已加入',
  `is_delete` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否删除 0未删除 1已删除',
  `create_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '课题成员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of task_member
-- ----------------------------
INSERT INTO `task_member` VALUES (2, 12, 'student', '1', '0', 'teacher1', '2021-04-26 21:31:25', NULL, NULL);

-- ----------------------------
-- Table structure for work_log
-- ----------------------------
DROP TABLE IF EXISTS `work_log`;
CREATE TABLE `work_log`  (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `task_id` bigint(20) NULL DEFAULT NULL COMMENT '课题id',
  `log_content` longblob NULL COMMENT '日志内容',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '状态 0有效 1失效',
  `is_delete` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否删除 0未删除 1已删除',
  `create_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of work_log
-- ----------------------------
INSERT INTO `work_log` VALUES (1, 12, '', '0', '0', 'admin', '2021-04-08 16:10:15', 'teacher1', '2021-04-28 15:24:23');
INSERT INTO `work_log` VALUES (2, 12, 0x3C703E74747474743C2F703E, '0', '0', 'student', '2021-04-26 22:52:36', 'teacher1', '2021-04-28 15:24:23');
INSERT INTO `work_log` VALUES (3, 12, 0x3C703E7465737433333333333C2F703E, '0', '0', 'student', '2021-04-26 22:57:24', 'student', '2021-04-28 15:41:04');

SET FOREIGN_KEY_CHECKS = 1;
