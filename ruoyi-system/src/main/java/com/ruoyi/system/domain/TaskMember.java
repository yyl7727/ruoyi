package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;

public class TaskMember extends BaseEntity {
    /**
     * id
     */
    private String id;
    /**
     * 课题id
     */
    private String taskId;
    /**
     * 学生用户名
     */
    private String studentUserName;
    /**
     * 状态
     */
    private String status;
    /**
     * 是否删除
     */
    private String isDelete;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    public String getStudentUserName() {
        return studentUserName;
    }

    public void setStudentUserName(String studentUserName) {
        this.studentUserName = studentUserName;
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
