package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import javax.validation.constraints.NotBlank;

public class Task extends BaseEntity {
    /**
     * 课题id
     */
    private String taskId;
    /**
     * 课题名称
     */
    private String taskName;
    /**
     * 课题类型
     */
    private String taskType;
    /**
     * 课题人数
     */
    private Integer taskNum;
    /**
     * 课题说明
     */
    private String taskDesc;

    /** 状态（0可选 1不可选） */
    @Excel(name = "状态", readConverterExp = "0=可选,1=不可选")
    private String status;
    /**
     * 是否删除 0:未删除 1:已删除
     */
    private String isDelete;

    public String getTaskId() {
        return taskId;
    }

    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }

    @NotBlank(message = "课题名称不能为空")
    public String getTaskName() {
        return taskName;
    }

    public void setTaskName(String taskName) {
        this.taskName = taskName;
    }

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    public Integer getTaskNum() {
        return taskNum;
    }

    public void setTaskNum(Integer taskNum) {
        this.taskNum = taskNum;
    }

    public String getTaskDesc() {
        return taskDesc;
    }

    public void setTaskDesc(String taskDesc) {
        this.taskDesc = taskDesc;
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
