package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 通知公告状态 sys_notice_status
 * @author zxy
 */
public class SysNoticeStatus extends BaseEntity {
    private Long id;
    /**
     * 通知id
     */
    private String notice_id;
    /**
     * 接收人用户名
     */
    private String user_id;
    /**
     * 课题编号
     */
    private String task_id;
    /**
     * 是否已读
     */
    private String is_read;
}
