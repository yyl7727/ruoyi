package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;

import java.math.BigDecimal;

public class Performant extends BaseEntity {
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
    private String studentName;
    /**
     * 绩效金额
     */
    private BigDecimal performant;
    /**
     * 状态 0：有效 1：失效
     */
    private String status;
    /**
     * 是否删除 0：未删除  1：已删除
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

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public BigDecimal getPerformant() {
        return performant;
    }

    public void setPerformant(BigDecimal performant) {
        this.performant = performant;
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
