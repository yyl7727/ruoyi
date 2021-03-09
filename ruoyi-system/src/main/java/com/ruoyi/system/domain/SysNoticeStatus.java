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

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNotice_id() {
        return notice_id;
    }

    public void setNotice_id(String notice_id) {
        this.notice_id = notice_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getTask_id() {
        return task_id;
    }

    public void setTask_id(String task_id) {
        this.task_id = task_id;
    }

    public String getIs_read() {
        return is_read;
    }

    public void setIs_read(String is_read) {
        this.is_read = is_read;
    }
}
