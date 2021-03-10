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
    private String noticeId;
    /**
     * 接收人用户名
     */
    private String userId;
    /**
     * 课题编号
     */
    private String taskId;
    /**
     * 是否已读
     */
    private String isRead;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNoticeId() {
        return noticeId;
    }

    public void setNoticeId(String noticeId) {
        this.noticeId = noticeId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getIsRead() {
        return isRead;
    }

    public void setIsRead(String isRead) {
        this.isRead = isRead;
    }
}
