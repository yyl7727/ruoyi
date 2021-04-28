package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class WorkLog extends BaseEntity {
    /**
     * 工作日志id
     */
    private Long workLogId;
    /**
     * 课题id
     */
    private Long taskId;
    /**
     * 工作日志内容
     */
    private String logContent;
    /**
     * 状态 0：有效  1：失效
     */
    private String status;
    /**
     * 是否删除 0:未删除 1:已删除
     */
    private String isDelete;

    public Long getWorkLogId() {
        return workLogId;
    }

    public void setWorkLogId(Long workLogId) {
        this.workLogId = workLogId;
    }

    public Long getTaskId() {
        return taskId;
    }

    public void setTaskId(Long taskId) {
        this.taskId = taskId;
    }

    public String getLogContent() {
        return logContent;
    }

    public void setLogContent(String logContent) {
        this.logContent = logContent;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }
}
