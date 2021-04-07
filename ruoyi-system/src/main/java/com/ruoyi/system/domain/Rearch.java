package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 助研信息实体类
 */
public class Rearch extends BaseEntity {
    /**
     * 助研信息id
     */
    private String rearchId;
    /**
     * 助研学生id
     */
    private String studentId;
    /**
     * 助研学生姓名
     */
    private String studentName;
    /**
     * 学生专业
     */
    private String studentMajor;
    /**
     * 手机号码
     */
    private String studentPhone;
    /**
     * 电子邮箱
     */
    private String studentEmail;
    /**
     * 学生技术方向
     */
    private String skill;
    /**
     * 个人简介
     */
    private String studentDesc;
    /**
     * 状态 0：有效 1：失效
     */
    private String status;
    /**
     * 是否删除 0：未删除  1：已删除
     */
    private String isDelete;

    public String getRearchId() {
        return rearchId;
    }

    public void setRearchId(String rearchId) {
        this.rearchId = rearchId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentMajor() {
        return studentMajor;
    }

    public void setStudentMajor(String studentMajor) {
        this.studentMajor = studentMajor;
    }

    public String getStudentPhone() {
        return studentPhone;
    }

    public void setStudentPhone(String studentPhone) {
        this.studentPhone = studentPhone;
    }

    public String getStudentEmail() {
        return studentEmail;
    }

    public void setStudentEmail(String studentEmail) {
        this.studentEmail = studentEmail;
    }

    public String getSkill() {
        return skill;
    }

    public void setSkill(String skill) {
        this.skill = skill;
    }

    public String getStudentDesc() {
        return studentDesc;
    }

    public void setStudentDesc(String studentDesc) {
        this.studentDesc = studentDesc;
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
